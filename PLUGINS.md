# Plugins and MCP Servers

> Full details on the 29 plugins and 15+ MCP servers powering this Claude Code setup.

## Table of Contents

- [Plugins](#plugins)
  - [Workflow and Productivity](#workflow-and-productivity)
  - [Design and Frontend](#design-and-frontend)
  - [Platform Integrations](#platform-integrations)
  - [Mobile and Native](#mobile-and-native)
  - [Billing and Subscriptions](#billing-and-subscriptions)
  - [Observability and Analytics](#observability-and-analytics)
  - [Language Servers (LSP)](#language-servers-lsp)
  - [Documentation and AI/ML](#documentation-and-aiml)
  - [Security and Quality](#security-and-quality)
  - [Testing](#testing)
- [MCP Servers](#mcp-servers)
  - [Design Tools](#design-tools)
  - [Cloud Platforms](#cloud-platforms)
  - [AI and ML](#ai-and-ml)
  - [Observability](#observability)
  - [Billing](#billing)
  - [Documentation](#documentation)
  - [Browser Automation](#browser-automation)
  - [Scheduling](#scheduling)

---

## Plugins

All plugins are from the `claude-plugins-official` registry.

### Workflow and Productivity

#### superpowers (v5.0.7)

The backbone of advanced Claude Code workflows.

| Skill | What it does |
|---|---|
| `writing-plans` | Design implementation plans before touching code |
| `executing-plans` | Execute plans with review checkpoints |
| `brainstorming` | Creative exploration before building |
| `test-driven-development` | TDD workflow enforcement |
| `dispatching-parallel-agents` | Run independent tasks in parallel |
| `subagent-driven-development` | Execute independent tasks via subagents |
| `systematic-debugging` | Structured debugging before proposing fixes |
| `verification-before-completion` | Run verification before claiming work is done |
| `requesting-code-review` | Review work before merging |
| `receiving-code-review` | Handle code review feedback |
| `writing-skills` | Create and verify custom skills |
| `using-git-worktrees` | Feature isolation with git worktrees |
| `finishing-a-development-branch` | Guide branch completion and integration |

#### ralph-loop (v1.0.0)

Run prompts or commands on a recurring interval within a session.

```
/ralph-loop 5m "check deployment status"
```

#### hookify

Create Claude Code hooks from conversation analysis or explicit instructions. Detects behaviors worth preventing and generates hook configurations.

#### skill-creator

Create new skills, modify existing skills, and measure skill performance.

#### commit-commands

Git commit workflows. Conventional commits, scoped commits, multi-line bodies with proper attribution. Useful when standardizing commit hygiene across a team or solo workflow.

---

### Design and Frontend

#### frontend-design

Create distinctive, production-grade frontend interfaces with high design quality. Includes 50+ styles, 161 color palettes, 57 font pairings.

#### figma (v2.1.3)

| Skill | What it does |
|---|---|
| `figma-use` | Mandatory prerequisite before every `use_figma` call |
| `figma-implement-design` | Translate Figma designs into production code with 1:1 fidelity |
| `figma-generate-design` | Capture app pages into Figma |
| `figma-generate-library` | Build design systems in Figma from code |
| `figma-code-connect` | Map Figma components to code via Code Connect |
| `figma-create-design-system-rules` | Generate design system rules for your repo |

---

### Platform Integrations

#### vercel (v0.32.4)

Full Vercel platform integration with 20+ specialized skills covering Next.js, AI SDK, shadcn/ui, deployment, storage, functions, and more.

#### supabase

Database management, migrations, edge functions, TypeScript type generation, advisory checks.

#### wix (v1.0.0)

Site management, REST API access, CLI app development, site builder.

#### wordpress.com (v0.0.1)

Site building, theme design, preview generation.

#### github

PR workflows, issue management, GitHub Actions integration.

#### gitlab

GitLab integration for repos, MRs, and CI/CD.

#### stripe

Payment integrations, webhook handling, Stripe API.

#### zapier

Workflow automation connecting 5000+ apps.

---

### Mobile and Native

#### expo

React Native + Expo development. SDK 55+ workflows, EAS Build (preview / production / development profiles), config plugins, Expo Router, native module integration. Critical for cross-platform mobile builds with EAS-managed signing.

| Capability | What it covers |
|---|---|
| EAS Build | Profile configuration, env var push, .easignore tuning |
| Expo Router | File-based routing, deep linking, modal stacks |
| Native modules | Plugin entries in app.json, prebuild flow |
| OTA updates | EAS Update channel management |
| Doctor | `expo-doctor` pre-build checks |

---

### Billing and Subscriptions

#### revenuecat

Subscription management for iOS/Android in-app purchases. Webhooks → backend sync, entitlement resolution, customer state queries, paywall configuration.

| Capability | What it covers |
|---|---|
| Customer state | Active entitlements, subscription tier, expiry |
| Webhook integration | RC events → backend (Supabase edge function pattern) |
| Offering management | Packages, monthly/annual pricing, trial introductory offers |
| Cross-platform | Match Play Store + App Store product IDs to one entitlement |

(stripe and zapier already covered above under Platform Integrations)

---

### Observability and Analytics

#### sentry

Error tracking and performance monitoring. Project queries, issue triage, release tracking, source map integration, performance traces.

#### posthog

Product analytics, feature flags, session replay. Event tracking, funnel analysis, cohort queries, A/B test setup, replay search.

---

### Language Servers (LSP)

LSP plugins provide semantic code understanding (definitions, references, type info, autocomplete) — much more accurate than grep for navigation and refactoring.

| Plugin | Language | Notes |
|---|---|---|
| **typescript-lsp** | TypeScript / JavaScript | Strict mode, project references, monorepo support |
| **pyright-lsp** | Python | uv-aware, strict mode, type stubs |
| **rust-analyzer-lsp** | Rust | Cargo workspaces, async/await, macro expansion |
| **swift-lsp** | Swift | SwiftPM, SwiftUI, iOS/macOS targets |

---

### Documentation and AI/ML

#### context7

Live library documentation lookup. Replaces stale LLM training data with current docs from React, Next.js, Prisma, Tailwind, Django, and 1000s more. Use whenever working with a third-party library/SDK/CLI — even well-known ones, as APIs change.

#### huggingface-skills

Hugging Face Hub integration. Model search, Space invocation, paper search (250M+ via OpenAlex), doc fetch. Useful for ML-adjacent prototypes (image-gen, text-classification, embeddings).

---

### Security and Quality

#### security-guidance

Security-aware coding guidance across OWASP categories. Includes:
- Semgrep, CodeQL, variant analysis
- Smart contract scanners (Solana, Cosmos, Cairo, TON, Algorand, Substrate)
- Supply chain risk auditing
- Fuzzing tools (AFL++, libFuzzer, cargo-fuzz, Atheris, Ruzzy)

#### code-review

Structured code review workflows for PRs and diffs.

---

### Testing

#### playwright

Browser testing automation with Playwright integration.

---

## MCP Servers

Model Context Protocol servers that extend Claude Code with external service access.

### Design Tools

#### Canva

Full design platform integration.

| Capability | Tools |
|---|---|
| Design generation | `generate-design`, `generate-design-structured` |
| Design editing | `start-editing-transaction`, `perform-editing-operations`, `commit-editing-transaction` |
| Content access | `get-design-content`, `get-design-pages`, `get-presenter-notes` |
| Asset management | `upload-asset-from-url`, `get-assets` |
| Export | `export-design` (PDF, PNG, JPG, GIF, PPTX, MP4) |
| Organization | `search-designs`, `search-folders`, `create-folder`, `move-item-to-folder` |
| Collaboration | `comment-on-design`, `list-comments`, `reply-to-comment` |
| Page operations | `merge-designs`, `resize-design` |
| Presentations | `request-outline-review` workflow |

#### Figma

Design-to-code bridge with full Plugin API access.

| Capability | Tools |
|---|---|
| Design context | `get_design_context` (code + screenshot + metadata) |
| Code generation | `use_figma` (execute Plugin API JavaScript) |
| Diagrams | `generate_diagram` (Mermaid.js to FigJam) |
| Design system | `search_design_system`, `get_variable_defs` |
| Code Connect | `get_code_connect_suggestions`, `add_code_connect_map` |
| Screenshots | `get_screenshot` |

---

### Cloud Platforms

#### Supabase

| Capability | Tools |
|---|---|
| Database | `execute_sql`, `list_tables`, `generate_typescript_types` |
| Migrations | `apply_migration`, `list_migrations` |
| Edge Functions | `deploy_edge_function`, `get_edge_function` |
| Branching | `create_branch`, `merge_branch`, `rebase_branch` |
| Monitoring | `get_logs`, `get_advisors` (security + performance) |
| Project mgmt | `create_project`, `list_projects`, `list_organizations` |

#### Vercel

| Capability | Tools |
|---|---|
| Deployments | `deploy_to_vercel`, `list_deployments`, `get_deployment` |
| Logs | `get_deployment_build_logs`, `get_runtime_logs` |
| Projects | `list_projects`, `get_project` |
| Domains | `check_domain_availability_and_price` |
| Comments | `list_toolbar_threads`, `reply_to_toolbar_thread` |
| Docs | `search_vercel_documentation` |

#### Wix

| Capability | Tools |
|---|---|
| Site management | `ListWixSites`, `ManageWixSite`, `WixSiteBuilder` |
| API access | `CallWixSiteAPI` (full REST API) |
| Documentation | `SearchWixRESTDocumentation`, `BrowseWixRESTDocsMenu` |
| CLI | `SearchWixCLIDocumentation` |

---

### AI and ML

#### Hugging Face

| Capability | Tools |
|---|---|
| Hub search | `hub_repo_search`, `hub_repo_details` |
| Paper search | `paper_search` (250M+ works via OpenAlex) |
| Spaces | `space_search`, `dynamic_space` (invoke ML tasks) |
| Docs | `hf_doc_search`, `hf_doc_fetch` |

---

### Observability

#### PostHog

Product analytics queries from inside Claude Code. Event search, funnel analysis, feature flag state, cohort lookups, session replay search.

#### Sentry

Error and performance issue queries. Search by project / release / environment, get stack traces, link to source, triage by impact.

---

### Billing

#### RevenueCat

Subscription state from inside Claude Code. Customer lookups by app user ID, active entitlements, subscription history, refund queries.

#### Stripe

Payment, customer, subscription, invoice management. Search by email/customer ID, refund flow, webhook event lookup.

---

### Documentation

#### Context7

Live documentation fetch for libraries/frameworks. `resolve-library-id` finds the right doc set, `query-docs` fetches current API/config/syntax. Replaces stale LLM training data — critical for Next.js, React, Tailwind, Prisma, etc.

---

### Browser Automation

#### Claude in Chrome

Full browser control via Chrome extension.

| Capability | Tools |
|---|---|
| Navigation | `navigate`, `tabs_context_mcp`, `tabs_create_mcp` |
| Interaction | `computer` (click, type, scroll, screenshot) |
| DOM access | `read_page`, `find`, `get_page_text` |
| Forms | `form_input`, `file_upload` |
| Debugging | `read_console_messages`, `read_network_requests` |
| Recording | `gif_creator` (animated GIF export) |
| JavaScript | `javascript_tool` (execute in page context) |

#### Claude Preview

Dev server management and verification.

| Capability | Tools |
|---|---|
| Server control | `preview_start`, `preview_stop`, `preview_list` |
| Inspection | `preview_snapshot`, `preview_screenshot`, `preview_inspect` |
| Interaction | `preview_click`, `preview_fill`, `preview_eval` |
| Debugging | `preview_console_logs`, `preview_logs`, `preview_network` |
| Responsive | `preview_resize` (mobile, tablet, desktop, dark mode) |

---

### Scheduling

#### Scheduled Tasks

Create and manage recurring or one-shot automated agents.

| Capability | Tools |
|---|---|
| Create | `create_scheduled_task` (cron or one-time) |
| Manage | `update_scheduled_task`, `list_scheduled_tasks` |

Supports standard 5-field cron expressions in local timezone. Tasks auto-expire after 7 days.
