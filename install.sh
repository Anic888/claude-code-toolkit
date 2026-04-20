#!/usr/bin/env bash
# Claude Code Toolkit — bootstrap installer for macOS / Linux / WSL
# Installs all 17 plugins and clones public custom skills into ~/.claude/

set -euo pipefail

SKILLS_DIR="${HOME}/.claude/skills"
TOOLKIT_DIR="${HOME}/.claude-toolkit-sources"
MARKETPLACE="claude-plugins-official"
MARKETPLACE_SOURCE="anthropics/claude-plugins-official"

PLUGINS=(
  superpowers
  frontend-design
  code-review
  security-guidance
  github
  gitlab
  playwright
  ralph-loop
  figma
  skill-creator
  hookify
  supabase
  stripe
  wix
  vercel
  wordpress.com
  zapier
)

CUSTOM_SKILLS=(
  "russian-text-quality|https://github.com/Anic888/russian-text-quality.git|."
  "predeploy-audit|https://github.com/Anic888/predeploy-audit-nextjs.git|skill"
)

color_blue() { printf '\033[1;34m%s\033[0m\n' "$*"; }
color_green() { printf '\033[1;32m%s\033[0m\n' "$*"; }
color_yellow() { printf '\033[1;33m%s\033[0m\n' "$*"; }
color_red() { printf '\033[1;31m%s\033[0m\n' "$*" >&2; }

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    color_red "Missing required command: $1"
    exit 1
  fi
}

color_blue "▶ Claude Code Toolkit installer"
require_cmd claude
require_cmd git

color_blue "▶ Ensuring marketplace '${MARKETPLACE}' is registered"
if ! claude plugin marketplace list 2>/dev/null | grep -q "${MARKETPLACE}"; then
  claude plugin marketplace add "${MARKETPLACE_SOURCE}"
else
  color_green "  already configured"
fi

color_blue "▶ Installing ${#PLUGINS[@]} plugins"
for p in "${PLUGINS[@]}"; do
  printf '  → %s ... ' "$p"
  if claude plugin install "${p}@${MARKETPLACE}" >/dev/null 2>&1; then
    color_green "ok"
  else
    color_yellow "skipped (already installed or unavailable)"
  fi
done

color_blue "▶ Cloning custom skills into ${TOOLKIT_DIR}"
mkdir -p "${TOOLKIT_DIR}" "${SKILLS_DIR}"
for entry in "${CUSTOM_SKILLS[@]}"; do
  IFS='|' read -r name url subpath <<<"${entry}"
  target="${TOOLKIT_DIR}/${name}"
  link="${SKILLS_DIR}/${name}"

  if [[ -d "${target}" ]]; then
    printf '  → %s (pull) ... ' "${name}"
    git -C "${target}" pull --ff-only --quiet && color_green "ok" || color_yellow "skipped"
  else
    printf '  → %s (clone) ... ' "${name}"
    git clone --quiet "${url}" "${target}" && color_green "ok"
  fi

  src="${target}/${subpath}"
  if [[ -L "${link}" || -e "${link}" ]]; then
    color_yellow "    skill link ${link} already exists — leaving as is"
  else
    ln -s "${src}" "${link}"
    color_green "    linked → ${link}"
  fi
done

color_blue "▶ Optional: install pre-deploy audit hook"
HOOK_SRC="$(dirname "$0")/hooks/predeploy-audit-gate.sh"
HOOK_DST="${HOME}/.claude/hooks/predeploy-audit-gate.sh"
if [[ -f "${HOOK_SRC}" ]]; then
  mkdir -p "${HOME}/.claude/hooks"
  cp "${HOOK_SRC}" "${HOOK_DST}"
  chmod +x "${HOOK_DST}"
  color_green "  copied to ${HOOK_DST}"
  color_yellow "  add it manually to ~/.claude/settings.json — see README.md"
else
  color_yellow "  hook script not found alongside installer — skipping"
fi

color_green "▶ Done."
cat <<'EOF'

Next steps (manual):
  1. Restart Claude Code to load newly installed plugins.
  2. Re-authenticate MCP connectors via the claude.ai web UI:
     Canva, Figma, Hugging Face, Supabase, Vercel, Wix.
  3. Local-only custom skills (image-studio, design-creator, astrologer,
     cosmic-therapist, psychologist, firebase-apk-scanner, git-cleanup,
     testing-handbook-generator) are not yet published — copy them from
     your existing ~/.claude/skills/ if you have a previous machine.
  4. Add the predeploy-audit hook to ~/.claude/settings.json if you want
     automatic scanning before deploy commands.
EOF
