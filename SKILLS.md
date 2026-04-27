# Skills Catalog

> 100+ skills installed in this Claude Code setup. Custom-built skills are marked with a star. New plugin-bundled skills come from `expo`, `revenuecat`, `sentry`, `posthog`, `context7`, `huggingface-skills`, and the 4 LSPs (`typescript-lsp`, `pyright-lsp`, `rust-analyzer-lsp`, `swift-lsp`).

## Table of Contents

- [Custom-Built Skills](#custom-built-skills)
- [Security and Auditing](#security-and-auditing)
- [Fuzzing](#fuzzing)
- [Smart Contract Security](#smart-contract-security)
- [Frontend and Design](#frontend-and-design)
- [Code Quality and Testing](#code-quality-and-testing)
- [DevOps and Infrastructure](#devops-and-infrastructure)
- [AI and Research](#ai-and-research)
- [Blockchain Analysis](#blockchain-analysis)
- [Productivity and Content](#productivity-and-content)
- [Personal and Reflection](#personal-and-reflection)
- [Creative AI](#creative-ai)
- [Framework-Specific](#framework-specific)
- [Vercel Platform](#vercel-platform)

---

## Custom-Built Skills

| Skill | Description | Repo |
|---|---|---|
| **russian-text-quality** | Detects Russian-language quality bugs in code: broken i18n pluralization, case-agreement in concatenation, terminology drift, transliterated identifiers, language mixing | [GitHub](https://github.com/Anic888/russian-text-quality) |
| **predeploy-audit** | 9 deterministic security checks for indie Next.js + Supabase + Stripe apps. ~80ms, zero deps | [GitHub](https://github.com/Anic888/predeploy-audit-nextjs) |
| **image-studio** | AI image generation CLI + skill with curated style profiles: 14 designers, 100+ directors, 99 photographers, cinema parameters | local |

---

## Security and Auditing

| Skill | Description |
|---|---|
| **semgrep** | Run Semgrep static analysis scan with parallel subagents |
| **semgrep-rule-creator** | Create custom Semgrep rules for detecting security vulnerabilities and bug patterns |
| **semgrep-rule-variant-creator** | Port Semgrep rules across target languages |
| **codeql** | Interprocedural data flow and taint tracking vulnerability scanning |
| **owasp-security** | Review code for OWASP top 10 vulnerabilities |
| **vibesec-skill** | Write secure web applications with automated security checks |
| **variant-analysis** | Find similar vulnerabilities across codebases using pattern-based analysis |
| **differential-review** | Security-focused differential review of code changes (PRs, commits, diffs) |
| **audit-context-building** | Ultra-granular line-by-line code analysis for vulnerability hunting |
| **audit-prep-assistant** | Prepare codebases for security review using Trail of Bits' checklist |
| **supply-chain-risk-auditor** | Identify dependencies at heightened risk of exploitation or takeover |
| **insecure-defaults** | Detect fail-open insecure defaults (hardcoded secrets, weak auth, permissive security) |
| **sharp-edges** | Identify error-prone APIs, dangerous configurations, and footgun designs |
| **secure-workflow-guide** | Trail of Bits' 5-step secure development workflow |
| **guidelines-advisor** | Smart contract development advisor based on Trail of Bits' best practices |
| **agentic-actions-auditor** | Audit GitHub Actions workflows for security vulnerabilities in AI agent integrations |
| **code-maturity-assessor** | Systematic code maturity assessment using Trail of Bits' 9-category framework |
| **fp-check** | Systematically verify suspected security bugs to eliminate false positives |
| **entry-point-analyzer** | Identify state-changing entry points in smart contracts for security auditing |
| **zeroize-audit** | Detect missing zeroization of sensitive data in source code |
| **constant-time-analysis** | Detect timing side-channel vulnerabilities in cryptographic code |
| **constant-time-testing** | Test cryptographic code for timing side channels |
| **sarif-parsing** | Parse SARIF files from static analysis tools (CodeQL, Semgrep) |
| **yara-rule-authoring** | Author high-quality YARA-X detection rules for malware identification |
| **burpsuite-project-parser** | Search and explore Burp Suite project files from the command line |
| **dimensional-analysis** | Annotate codebases with dimensional analysis comments (units, dimensions, scaling) |
| **firebase-apk-scanner** | Scan Android APKs for Firebase misconfigurations (open DBs, storage buckets, exposed cloud functions) |
| **testing-handbook-generator** | Meta-skill that analyzes the Trail of Bits Testing Handbook and generates Claude Code skills for security testing tools |

---

## Fuzzing

| Skill | Description |
|---|---|
| **aflpp** | AFL++ multi-core fuzzing for C/C++ projects |
| **libfuzzer** | Coverage-guided LLVM fuzzer for C/C++ |
| **cargo-fuzz** | Fuzzing tool for Rust projects using Cargo |
| **atheris** | Coverage-guided Python fuzzer based on libFuzzer |
| **ruzzy** | Coverage-guided Ruby fuzzer by Trail of Bits |
| **libafl** | Modular fuzzing library for building custom fuzzers |
| **ossfuzz** | Set up continuous fuzzing infrastructure for open source |
| **harness-writing** | Write effective fuzzing harnesses across languages |
| **fuzzing-dictionary** | Create domain-specific fuzzing dictionaries for parsers and protocols |
| **fuzzing-obstacles** | Patch code to overcome fuzzing obstacles (checksums, global state) |
| **coverage-analysis** | Measure code coverage during fuzzing to assess harness effectiveness |
| **address-sanitizer** | Detect memory errors (buffer overflows, use-after-free) during fuzzing |
| **wycheproof** | Validate cryptographic implementations with test vectors |

---

## Smart Contract Security

| Skill | Description |
|---|---|
| **solana-vulnerability-scanner** | 6 critical vulnerabilities: arbitrary CPI, improper PDA validation, missing signer |
| **cosmos-vulnerability-scanner** | Consensus-critical vulnerabilities: chain halts, fund loss, state corruption |
| **cairo-vulnerability-scanner** | 6 critical vulnerabilities: felt252 overflow, L1-L2 message manipulation |
| **ton-vulnerability-scanner** | 3 critical vulnerabilities: integer-as-boolean, fake Jetton masters |
| **algorand-vulnerability-scanner** | 11 common vulnerabilities: rekeying attacks, unchecked fees |
| **substrate-vulnerability-scanner** | 7 critical vulnerabilities: arithmetic overflow, panic DoS, incorrect weights |
| **token-integration-analyzer** | Token integration analyzer based on Trail of Bits' checklist |
| **spec-to-code-compliance** | Verify code implements exactly what documentation specifies |
| **property-based-testing** | Property-based testing guidance across multiple languages and smart contracts |

---

## Frontend and Design

| Skill | Description |
|---|---|
| **frontend-design** | Create distinctive, production-grade frontend interfaces |
| **ui-ux-pro-max** | UI/UX design intelligence: 50+ styles, 161 color palettes, 57 font pairings |
| **animate** | Enhance features with purposeful animations and micro-interactions |
| **design-creator** | Generate trend-aware poster SVGs via parallel concept explorers, two-pass critic ranking, automatic layout verification |
| **web-design-guidelines** | Review UI code for Web Interface Guidelines compliance |
| **seo-audit** | Audit, review, and diagnose SEO issues |
| **vercel-react-best-practices** | React and Next.js performance optimization from Vercel Engineering |
| **vercel-composition-patterns** | React composition patterns that scale |
| **vercel-react-native-skills** | React Native and Expo best practices for mobile apps |

---

## Code Quality and Testing

| Skill | Description |
|---|---|
| **debugging-code** | Interactive debugging: breakpoints, step-through, inspect live state |
| **second-opinion** | External LLM code reviews (OpenAI Codex or Google Gemini CLI) |
| **property-based-testing** | Property-based testing across multiple languages |
| **webapp-testing** | Interact with and test local web applications using Playwright |
| **ask-questions-if-underspecified** | Clarify requirements before implementing |
| **avoid-ai-writing** | Audit and rewrite content to remove AI writing patterns |
| **skill-improver** | Iteratively review and fix skill quality issues |
| **designing-workflow-skills** | Design multi-step workflow-based Claude Code skills |

---

## DevOps and Infrastructure

| Skill | Description |
|---|---|
| **devcontainer-setup** | Create devcontainers with Claude Code, language-specific tooling |
| **modern-python** | Configure Python projects with modern tooling (uv, ruff, ty) |
| **seatbelt-sandboxer** | Generate minimal macOS Seatbelt sandbox configurations |
| **gh-cli** | Enforce authenticated `gh` CLI workflows over unauthenticated curl |
| **varlock** | Secure environment variable management |
| **git-cleanup** | Safely categorize and clean up local git branches/worktrees (merged, squash-merged, superseded, active) |

---

## AI and Research

| Skill | Description |
|---|---|
| **deep-research** | Autonomous multi-step research using Google Gemini Deep Research Agent |
| **imagen** | Generate images using Google Gemini's image generation |
| **paper-search** | Search academic papers by keyword (OpenAlex, 250M+ works) |
| **elevenlabs** | Convert documents and text to audio (text-to-speech) |
| **youtube-transcript** | Download YouTube video transcripts |
| **claude-in-chrome-troubleshooting** | Diagnose Claude in Chrome MCP extension issues |

---

## Blockchain Analysis

| Skill | Description |
|---|---|
| **entry-point-analyzer** | Identify state-changing entry points for security auditing |
| **token-integration-analyzer** | Token integration and implementation analysis (Trail of Bits) |
| **spec-to-code-compliance** | Verify code matches specification for blockchain audits |
| **guidelines-advisor** | Smart contract development advisor (Trail of Bits' best practices) |
| **secure-workflow-guide** | Trail of Bits' 5-step secure development workflow |

---

## Productivity and Content

| Skill | Description |
|---|---|
| **marketing-ideas** | Marketing ideas and strategies for SaaS products |
| **product-marketing-context** | Create product marketing context documents |
| **remotion-best-practices** | Video creation in React with Remotion |
| **let-fate-decide** | Draw Tarot cards to inject entropy into planning |
| **interpreting-culture-index** | Interpret Culture Index surveys and behavioral profiles |
| **moltdj** | SoundCloud for AI bots (generate tracks, share on Moltbook) |
| **find-skills** | Discover and install agent skills |

---

## Personal and Reflection

Non-technical skills for self-understanding and meaning-making. Grounded in evidence-based frameworks, not fortune-telling.

| Skill | Description |
|---|---|
| **psychologist** | Evidence-based psychological support for anxiety, relationships, burnout, attachment, boundaries — 12 therapeutic frameworks |
| **astrologer** | Psychological astrology for self-understanding, natal charts, transits, archetypal life themes — explicitly not predictive |
| **cosmic-therapist** | Adaptive dual-lens reasoning agent combining evidence-based psychology with archetypal astrology, three-layer architecture |

---

## Creative AI

| Skill | Description |
|---|---|
| ★ **image-studio** | AI image gen with curated style profiles: 14 designers, 100+ directors, 99 photographers, cinema params |
| **design-creator** | Trend-aware poster SVG generator with 3 parallel concept explorers, adversarial critic ranking, auto layout verification |
| **imagen** | Generate images using Google Gemini's image generation |
| **elevenlabs** | Convert documents and text to audio (text-to-speech) |
| **remotion-best-practices** | Video creation in React with Remotion |
| **moltdj** | SoundCloud for AI bots (generate tracks, share on Moltbook) |

---

## Framework-Specific

| Skill | Description |
|---|---|
| **agent-browser** | Browser automation CLI for AI agents |
| **dwarf-expert** | DWARF debug format analysis (v3-v5) |
| **debug-buttercup** | Debug the Buttercup CRS on Kubernetes |

---

## Vercel Platform

These come bundled with the Vercel plugin but are listed here for completeness:

| Skill | Description |
|---|---|
| **nextjs** | Next.js App Router expert guidance |
| **ai-sdk** | Vercel AI SDK for AI-powered features |
| **ai-gateway** | Multi-provider AI model routing |
| **shadcn** | shadcn/ui component library guidance |
| **vercel-functions** | Serverless, Edge, Fluid Compute, streaming |
| **vercel-storage** | Blob, Edge Config, Marketplace storage |
| **vercel-sandbox** | Sandboxed code execution |
| **workflow** | Vercel Workflow DevKit for durable workflows |
| **turbopack** | Next.js bundler configuration |
| **routing-middleware** | Framework-agnostic request interception |
| **deployments-cicd** | Deployment and CI/CD guidance |
| **marketplace** | Discover and install Vercel Marketplace integrations |
| **bootstrap** | Project bootstrapping with Vercel resources |
| **auth** | Authentication integration (Clerk, Descope, Auth0) |
| **env-vars** | Environment variable management |
| **react-best-practices** | TSX component quality review |
| **next-upgrade** | Next.js version migration |
| **next-forge** | next-forge Turborepo SaaS starter |
| **chat-sdk** | Multi-platform chat bot builder |
| **next-cache-components** | PPR, `use cache`, cacheLife, cacheTag |
| **runtime-cache** | Per-region key-value cache with tag invalidation |
| **verification** | Full-story end-to-end verification |
