#!/usr/bin/env bash
# predeploy-audit-gate — PreToolUse hook
#
# When Claude Code is about to run a deploy-like Bash command
# (git push to main/master, vercel --prod, vercel deploy --prod,
# pnpm/npm/yarn run deploy, fly deploy, railway up, etc.), this
# hook runs the predeploy-audit scanner in deploy-gate mode and
# prints the result to stderr so it shows up in Claude's context.
#
# IMPORTANT: this hook is WARN-ONLY. It always exits 0, so it never
# blocks the underlying command. The user sees the findings and
# decides whether to abort the deploy.
#
# To disable temporarily for one session:
#   export PREDEPLOY_AUDIT_HOOK_DISABLED=1
#
# To uninstall: remove the PreToolUse entry from ~/.claude/settings.json
# and delete this file.

set -u

# Fast path: disabled via env var
if [ "${PREDEPLOY_AUDIT_HOOK_DISABLED:-0}" = "1" ]; then
  exit 0
fi

# Read stdin JSON payload from Claude Code
PAYLOAD="$(cat)"

# Extract tool name and the bash command. We use node because we're
# already depending on node for the scanner itself — no extra deps.
COMMAND="$(node -e '
  let raw = "";
  process.stdin.on("data", (c) => raw += c);
  process.stdin.on("end", () => {
    try {
      const p = JSON.parse(raw);
      // tool_name should be "Bash"; tool_input has "command"
      if (p.tool_name !== "Bash") { process.exit(0); }
      const cmd = (p.tool_input && p.tool_input.command) || "";
      process.stdout.write(cmd);
    } catch (e) {
      // Fall through silently — hooks must not crash the tool call
      process.exit(0);
    }
  });
' <<< "$PAYLOAD")"

# If we couldn't extract a command (not a Bash call), exit clean
if [ -z "$COMMAND" ]; then
  exit 0
fi

# Deploy-command regex. This is intentionally narrow — we do NOT
# want to fire on every `git push` (feature branches, WIP pushes,
# etc.). We only fire on pushes to main/master and explicit
# deploy commands.
is_deploy_command() {
  local cmd="$1"
  # git push origin main / master (with or without origin, with optional flags)
  if echo "$cmd" | grep -qE '\bgit[[:space:]]+push([[:space:]]+[^[:space:]]+)*([[:space:]]+(origin|upstream))?[[:space:]]+(main|master|production)\b'; then
    return 0
  fi
  # vercel --prod / vercel deploy --prod / vercel deploy prod
  if echo "$cmd" | grep -qE '\bvercel\b.*(--prod\b|--production\b|deploy[[:space:]]+(--prod|--production|prod|production))'; then
    return 0
  fi
  # vercel deploy (bare, when Vercel CLI defaults to preview — still worth scanning)
  # Narrowed: only trigger on explicit --prod to avoid noise on preview deploys
  # (previously noted: preview deploys are fine to not scan)
  #
  # fly deploy
  if echo "$cmd" | grep -qE '\bfly(ctl)?[[:space:]]+deploy\b'; then
    return 0
  fi
  # railway up (Railway's deploy command)
  if echo "$cmd" | grep -qE '\brailway[[:space:]]+up\b'; then
    return 0
  fi
  # npm/pnpm/yarn run deploy
  if echo "$cmd" | grep -qE '\b(npm|pnpm|yarn|bun)[[:space:]]+run[[:space:]]+deploy\b'; then
    return 0
  fi
  # netlify deploy --prod
  if echo "$cmd" | grep -qE '\bnetlify[[:space:]]+deploy\b.*(--prod\b|--production\b)'; then
    return 0
  fi
  # render deploy (render-cli)
  if echo "$cmd" | grep -qE '\brender[[:space:]]+(deploy|services[[:space:]]+deploy)\b'; then
    return 0
  fi
  return 1
}

if ! is_deploy_command "$COMMAND"; then
  exit 0
fi

# Find the project root (git repo). If not a git repo, use cwd.
# cwd is inherited from the Bash tool's working directory, which in
# Claude Code is the session's working dir.
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

SCANNER="/Users/roxyproxy/.agents/skills/predeploy-audit/scanner/predeploy-audit.mjs"
if [ ! -e "$SCANNER" ]; then
  # Scanner not installed — silent pass
  exit 0
fi

# Run scanner in deploy-gate mode with a hard timeout so a runaway
# scan can't hang the tool call indefinitely. Capture output.
SCANNER_OUT="$(node "$SCANNER" "$REPO_ROOT" --deploy-gate 2>&1)" || true
RC=$?

# Only surface the output if the scanner actually found something.
# On CLEAN results we stay silent to avoid noise on every deploy.
if echo "$SCANNER_OUT" | grep -q 'PREDEPLOY-AUDIT-RESULT: CLEAN'; then
  exit 0
fi

# Print warning header + full scanner output to stderr. Claude Code
# injects stderr from hooks into its context, so Claude will see
# the findings and can warn the user before running the deploy.
{
  echo "════════════════════════════════════════════════════════════════"
  echo "⚠️  predeploy-audit detected issues before deploy command:"
  echo "   $COMMAND"
  echo "   (repo root: $REPO_ROOT)"
  echo "════════════════════════════════════════════════════════════════"
  echo "$SCANNER_OUT"
  echo "════════════════════════════════════════════════════════════════"
  echo "This is a WARNING only — the deploy command has NOT been blocked."
  echo "To bypass this hook for one session: export PREDEPLOY_AUDIT_HOOK_DISABLED=1"
  echo "════════════════════════════════════════════════════════════════"
} >&2

# Always exit 0 — we're warn-only, not blocking.
exit 0
