#!/usr/bin/env bash
# Claude Code Toolkit — bootstrap installer for macOS / Linux / WSL
# Installs all 29 plugins, 13 contains-studio subagents, and clones public custom skills into ~/.claude/

set -euo pipefail

SKILLS_DIR="${HOME}/.claude/skills"
AGENTS_DIR="${HOME}/.claude/agents"
TOOLKIT_DIR="${HOME}/.claude-toolkit-sources"

# Marketplace 1: official Anthropic plugins
OFFICIAL_MP="claude-plugins-official"
OFFICIAL_SRC="anthropics/claude-plugins-official"

OFFICIAL_PLUGINS=(
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
  # Mobile + Native
  expo
  # Billing
  revenuecat
  # Observability + Analytics
  sentry
  posthog
  # Language servers
  typescript-lsp
  pyright-lsp
  rust-analyzer-lsp
  swift-lsp
  # Workflow + Docs + AI/ML
  commit-commands
  context7
  huggingface-skills
)

# Marketplace 2: Trail of Bits security & devops skills
TOB_MP="trailofbits"
TOB_SRC="trailofbits/skills"

TOB_PLUGINS=(
  agentic-actions-auditor
  ask-questions-if-underspecified
  audit-context-building
  burpsuite-project-parser
  claude-in-chrome-troubleshooting
  constant-time-analysis
  culture-index
  debug-buttercup
  devcontainer-setup
  differential-review
  dimensional-analysis
  dwarf-expert
  entry-point-analyzer
  firebase-apk-scanner
  fp-check
  gh-cli
  git-cleanup
  insecure-defaults
  let-fate-decide
  modern-python
  property-based-testing
  seatbelt-sandboxer
  second-opinion
  semgrep-rule-creator
  semgrep-rule-variant-creator
  sharp-edges
  skill-improver
  spec-to-code-compliance
  supply-chain-risk-auditor
  testing-handbook-skills
  variant-analysis
  yara-authoring
  zeroize-audit
)

CUSTOM_SKILLS=(
  "russian-text-quality|https://github.com/Anic888/russian-text-quality.git|."
  "predeploy-audit|https://github.com/Anic888/predeploy-audit-nextjs.git|skill"
)

# Subagents from contains-studio/agents (MIT) — specialized roles main agent delegates to
# Format: category/agent-name
SUBAGENTS=(
  "engineering/ai-engineer"
  "engineering/mobile-app-builder"
  "engineering/rapid-prototyper"
  "marketing/app-store-optimizer"
  "marketing/content-creator"
  "marketing/growth-hacker"
  "marketing/instagram-curator"
  "marketing/reddit-community-builder"
  "marketing/tiktok-strategist"
  "marketing/twitter-engager"
  "product/trend-researcher"
  "studio-operations/legal-compliance-checker"
  "design/whimsy-injector"
)
SUBAGENTS_BASE="https://raw.githubusercontent.com/contains-studio/agents/main"

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

ensure_marketplace() {
  local mp="$1" src="$2"
  color_blue "▶ Ensuring marketplace '${mp}' is registered"
  if ! claude plugin marketplace list 2>/dev/null | grep -q "${mp}"; then
    claude plugin marketplace add "${src}"
  else
    color_green "  already configured"
  fi
}

install_plugins() {
  local mp="$1"; shift
  color_blue "▶ Installing $# plugins from '${mp}'"
  for p in "$@"; do
    printf '  → %s ... ' "$p"
    if claude plugin install "${p}@${mp}" >/dev/null 2>&1; then
      color_green "ok"
    else
      color_yellow "skipped (already installed or unavailable)"
    fi
  done
}

ensure_marketplace "${OFFICIAL_MP}" "${OFFICIAL_SRC}"
install_plugins "${OFFICIAL_MP}" "${OFFICIAL_PLUGINS[@]}"

ensure_marketplace "${TOB_MP}" "${TOB_SRC}"
install_plugins "${TOB_MP}" "${TOB_PLUGINS[@]}"

color_blue "▶ Installing $((${#SUBAGENTS[@]})) subagents from contains-studio/agents"
mkdir -p "${AGENTS_DIR}"
for entry in "${SUBAGENTS[@]}"; do
  category="${entry%%/*}"
  name="${entry##*/}"
  mkdir -p "${AGENTS_DIR}/${category}"
  target="${AGENTS_DIR}/${category}/${name}.md"
  printf '  → %s ... ' "${entry}"
  if [[ -f "${target}" ]]; then
    color_yellow "exists (skipped — preserve any local customizations)"
  elif curl -fsSL "${SUBAGENTS_BASE}/${entry}.md" -o "${target}"; then
    color_green "ok"
  else
    color_yellow "skipped (download failed)"
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
