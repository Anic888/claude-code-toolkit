#requires -Version 5.1
<#
.SYNOPSIS
  Claude Code Toolkit — bootstrap installer for Windows (PowerShell).

.DESCRIPTION
  Installs the 17 official plugins from the claude-plugins-official marketplace
  and clones the public custom skills into %USERPROFILE%\.claude\skills.

.NOTES
  Requires: claude (Claude Code CLI), git.
  For full parity with the macOS setup, WSL2 + Ubuntu + install.sh is recommended.
#>

$ErrorActionPreference = 'Stop'

$SkillsDir         = Join-Path $env:USERPROFILE '.claude\skills'
$ToolkitDir        = Join-Path $env:USERPROFILE '.claude-toolkit-sources'
$HooksDir          = Join-Path $env:USERPROFILE '.claude\hooks'
$Marketplace       = 'claude-plugins-official'
$MarketplaceSource = 'anthropics/claude-plugins-official'

$Plugins = @(
  'superpowers',
  'frontend-design',
  'code-review',
  'security-guidance',
  'github',
  'gitlab',
  'playwright',
  'ralph-loop',
  'figma',
  'skill-creator',
  'hookify',
  'supabase',
  'stripe',
  'wix',
  'vercel',
  'wordpress.com',
  'zapier'
)

$CustomSkills = @(
  @{ Name = 'russian-text-quality'; Url = 'https://github.com/Anic888/russian-text-quality.git'; SubPath = '' },
  @{ Name = 'predeploy-audit';      Url = 'https://github.com/Anic888/predeploy-audit-nextjs.git'; SubPath = 'skill' }
)

function Write-Step($msg)  { Write-Host "▶ $msg" -ForegroundColor Cyan }
function Write-Ok($msg)    { Write-Host "  $msg" -ForegroundColor Green }
function Write-Warn2($msg) { Write-Host "  $msg" -ForegroundColor Yellow }
function Write-Err($msg)   { Write-Host "  $msg" -ForegroundColor Red }

function Require-Cmd($name) {
  if (-not (Get-Command $name -ErrorAction SilentlyContinue)) {
    Write-Err "Missing required command: $name"
    exit 1
  }
}

Write-Step 'Claude Code Toolkit installer (Windows)'
Require-Cmd 'claude'
Require-Cmd 'git'

Write-Step "Ensuring marketplace '$Marketplace' is registered"
$mp = & claude plugin marketplace list 2>$null
if ($mp -notmatch [regex]::Escape($Marketplace)) {
  & claude plugin marketplace add $MarketplaceSource | Out-Null
  Write-Ok 'added'
} else {
  Write-Ok 'already configured'
}

Write-Step "Installing $($Plugins.Count) plugins"
foreach ($p in $Plugins) {
  Write-Host "  → $p ... " -NoNewline
  try {
    & claude plugin install "$p@$Marketplace" *> $null
    if ($LASTEXITCODE -eq 0) { Write-Ok 'ok' } else { Write-Warn2 'skipped' }
  } catch {
    Write-Warn2 'skipped (already installed or unavailable)'
  }
}

Write-Step "Cloning custom skills into $ToolkitDir"
New-Item -ItemType Directory -Path $ToolkitDir -Force | Out-Null
New-Item -ItemType Directory -Path $SkillsDir  -Force | Out-Null

foreach ($skill in $CustomSkills) {
  $name    = $skill.Name
  $url     = $skill.Url
  $subPath = $skill.SubPath
  $target  = Join-Path $ToolkitDir $name
  $link    = Join-Path $SkillsDir  $name

  if (Test-Path $target) {
    Write-Host "  → $name (pull) ... " -NoNewline
    try {
      git -C $target pull --ff-only --quiet 2>$null
      Write-Ok 'ok'
    } catch {
      Write-Warn2 'skipped'
    }
  } else {
    Write-Host "  → $name (clone) ... " -NoNewline
    git clone --quiet $url $target 2>$null
    Write-Ok 'ok'
  }

  $src = if ($subPath) { Join-Path $target $subPath } else { $target }

  if (Test-Path $link) {
    Write-Warn2 "    skill link $link already exists — leaving as is"
    continue
  }

  # Try symlink first (requires Developer Mode or admin); fall back to junction, then copy.
  $linked = $false
  try {
    New-Item -ItemType SymbolicLink -Path $link -Target $src -ErrorAction Stop | Out-Null
    Write-Ok "    symlinked → $link"
    $linked = $true
  } catch { }

  if (-not $linked) {
    try {
      New-Item -ItemType Junction -Path $link -Target $src -ErrorAction Stop | Out-Null
      Write-Ok "    junction → $link"
      $linked = $true
    } catch { }
  }

  if (-not $linked) {
    Copy-Item -Path $src -Destination $link -Recurse -Force
    Write-Warn2 "    copied (no symlink permission) → $link"
  }
}

Write-Step 'Optional: install pre-deploy audit hook'
$hookSrc = Join-Path $PSScriptRoot 'hooks\predeploy-audit-gate.sh'
$hookDst = Join-Path $HooksDir 'predeploy-audit-gate.sh'
if (Test-Path $hookSrc) {
  New-Item -ItemType Directory -Path $HooksDir -Force | Out-Null
  Copy-Item $hookSrc $hookDst -Force
  Write-Ok "copied to $hookDst"
  Write-Warn2 'this hook is bash — to run it on Windows install WSL and reference it via wsl bash, or port it to PowerShell'
} else {
  Write-Warn2 'hook script not found alongside installer — skipping'
}

Write-Host ''
Write-Host '▶ Done.' -ForegroundColor Green
@'

Next steps (manual):
  1. Restart Claude Code to load newly installed plugins.
  2. Re-authenticate MCP connectors via the claude.ai web UI:
     Canva, Figma, Hugging Face, Supabase, Vercel, Wix.
  3. Local-only custom skills (image-studio, design-creator, astrologer,
     cosmic-therapist, psychologist, firebase-apk-scanner, git-cleanup,
     testing-handbook-generator) are not yet published — copy them from
     your existing %USERPROFILE%\.claude\skills\ folder if you have a
     previous machine.
  4. The predeploy-audit hook is bash; on Windows wrap it via wsl bash
     or use WSL2 for the whole setup.

  Tip: for full parity with the macOS setup, run install.sh inside WSL2
  Ubuntu instead of this PowerShell installer.
'@
