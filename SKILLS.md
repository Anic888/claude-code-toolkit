# Skills Catalog

> 180+ skills installed in this Claude Code setup. Custom-built skills are marked with a star. New plugin-bundled skill bundles (Apr 2026): Expo (13), RevenueCat (4), Sentry (30), PostHog (23), Hugging Face (13), Stripe (3), Zapier (3) + slash commands from commit-commands, Sentry, PostHog, and Stripe.

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
- [Mobile (Expo)](#mobile-expo)
- [Subscriptions (RevenueCat)](#subscriptions-revenuecat)
- [Error Tracking (Sentry)](#error-tracking-sentry)
- [Product Analytics (PostHog)](#product-analytics-posthog)
- [AI/ML Hub (Hugging Face)](#aiml-hub-hugging-face)
- [Payments (Stripe)](#payments-stripe)
- [Workflow Automation (Zapier)](#workflow-automation-zapier)
- [Slash Commands](#slash-commands)
- [Language Servers (LSP)](#language-servers-lsp)
- [Documentation Lookup](#documentation-lookup)

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

---

## Mobile (Expo)

Bundled with the `expo` plugin. React Native + Expo SDK 55+ workflows.

| Skill | Description |
|---|---|
| **building-native-ui** | Complete guide for building apps with Expo Router. Fundamentals, styling, components, navigation, animations, native tabs |
| **eas-update-insights** | Health of published EAS Updates: crash rates, install/launch counts, unique users, payload size, embedded vs OTA split per channel |
| **expo-api-routes** | Create API routes in Expo Router with EAS Hosting |
| **expo-cicd-workflows** | Write EAS workflow YAML files for CI/CD in Expo / EAS context |
| **expo-deployment** | Deploy Expo apps to iOS App Store, Android Play Store, web hosting, API routes |
| **expo-dev-client** | Build and distribute Expo development clients locally or via TestFlight |
| **expo-module** | Write Expo native modules and views via Expo Modules API (Swift, Kotlin, TypeScript). DSL, native views, shared objects, config plugins, lifecycle hooks, autolinking |
| **expo-tailwind-setup** | Set up Tailwind CSS v4 in Expo with react-native-css and NativeWind v5 |
| **expo-ui-jetpack-compose** | Use Jetpack Compose Views and modifiers via `@expo/ui/jetpack-compose` |
| **expo-ui-swift-ui** | Use SwiftUI Views and modifiers via `@expo/ui/swift-ui` |
| **native-data-fetching** | Network requests, fetch API, React Query, SWR, error handling, caching, offline support, Expo Router data loaders |
| **upgrading-expo** | Upgrade Expo SDK versions and fix dependency issues |
| **use-dom** | Run web code in webview on native and as-is on web. Migrate web → native incrementally |

---

## Subscriptions (RevenueCat)

Bundled with the `revenuecat` plugin.

| Skill | Description |
|---|---|
| **apikey** | Retrieve public API keys for SDK initialization (iOS, Android, web) |
| **create-app** | Step-by-step setup of an iOS or Android app in RevenueCat |
| **create-product** | Guided product creation: subscriptions, consumables, one-time purchases |
| **status** | Project overview: apps, products, entitlements, offerings, webhooks |

---

## Error Tracking (Sentry)

Bundled with the `sentry` plugin. 30 skills covering every major SDK + meta tools.

### Setup and meta

| Skill | Description |
|---|---|
| **sentry-sdk-setup** | Auto-detect platform and load the right SDK skill |
| **sentry-sdk-skill-creator** | Create a complete Sentry SDK skill bundle for a new platform |
| **sentry-sdk-upgrade** | Upgrade Sentry JavaScript SDK across major versions, fix deprecated APIs |
| **sentry-feature-setup** | Configure features beyond basic SDK setup: AI/LLM monitoring, OpenTelemetry pipelines, alerts |
| **sentry-setup-ai-monitoring** | AI Agent Monitoring (OpenAI, Anthropic, Vercel AI, LangChain, Google GenAI, Pydantic AI) |
| **sentry-create-alert** | Create alerts via workflow engine API (email, Slack, PagerDuty, Discord) |
| **sentry-otel-exporter-setup** | OpenTelemetry Collector with Sentry Exporter for multi-project routing |

### SDK setup per platform

| Skill | Platform |
|---|---|
| **sentry-android-sdk** | Android (Kotlin/Java) — error monitoring, tracing, profiling, session replay, logging |
| **sentry-browser-sdk** | Vanilla JS, jQuery, static sites, WordPress |
| **sentry-cloudflare-sdk** | Workers, Pages, Durable Objects, Queues, Workflows, Hono on Cloudflare |
| **sentry-cocoa-sdk** | iOS, macOS, tvOS, watchOS, visionOS (SwiftUI + UIKit) |
| **sentry-dotnet-sdk** | ASP.NET Core, MAUI, WPF, WinForms, Blazor, Azure Functions |
| **sentry-elixir-sdk** | Phoenix, Plug, LiveView, Oban, Quantum |
| **sentry-flutter-sdk** | Flutter / Dart on Android, iOS, macOS, Linux, Windows, Web |
| **sentry-go-sdk** | net/http, Gin, Echo, Fiber, FastHTTP, Iris, Negroni, gRPC |
| **sentry-nestjs-sdk** | Express + Fastify adapters, GraphQL, microservices, WebSockets, jobs |
| **sentry-nextjs-sdk** | Next.js 13+ App Router and Pages Router |
| **sentry-node-sdk** | Node.js, Bun, Deno servers |
| **sentry-php-sdk** | Plain PHP, Laravel, Symfony |
| **sentry-python-sdk** | Django, Flask, FastAPI, Celery, Starlette, AIOHTTP, Tornado |
| **sentry-react-native-sdk** | Expo managed, Expo bare, vanilla React Native |
| **sentry-react-router-framework-sdk** | React Router v7 framework mode |
| **sentry-react-sdk** | React 16+, Router v5-v7 non-framework, TanStack Router, Redux, Vite, webpack |
| **sentry-ruby-sdk** | Rails, Sinatra, Rack, Sidekiq, Resque (also migration from AppSignal/Honeybadger/Bugsnag/Rollbar/Airbrake) |
| **sentry-svelte-sdk** | Svelte and SvelteKit |
| **sentry-tanstack-start-sdk** | TanStack Start React |

### Triage and PR review

| Skill | Description |
|---|---|
| **sentry-fix-issues** | Find and fix Sentry issues via MCP — analyze stack traces, breadcrumbs, traces, context to identify root causes |
| **sentry-workflow** | Fix production issues and review code with Sentry context |
| **sentry-code-review** | Analyze and resolve Sentry comments on GitHub PRs |
| **sentry-pr-code-review** | Review PRs for issues detected by Seer Bug Prediction |

---

## Product Analytics (PostHog)

Bundled with the `posthog` plugin. Instrumentation, experiments, queries, LLM analytics.

### Instrumentation

| Skill | Description |
|---|---|
| **instrument-product-analytics** | Instrument product analytics events |
| **instrument-feature-flags** | Instrument feature flags |
| **instrument-error-tracking** | Instrument error tracking |
| **instrument-llm-analytics** | Instrument LLM analytics |
| **instrument-logs** | Instrument logs |
| **instrument-integration** | General PostHog SDK integration |

### Experiments and feature flags

| Skill | Description |
|---|---|
| **creating-experiments** | 3-step experiment creation: hypothesis, rollout, analytics |
| **finding-experiments** | Resolve experiment references from natural language to IDs |
| **configuring-experiment-rollout** | Variant splits, rollout percentage, mid-experiment changes |
| **configuring-experiment-analytics** | Exposure criteria, metric types, interpreting results |
| **managing-experiment-lifecycle** | Launch, pause, resume, end, ship, archive, reset, duplicate |
| **analyzing-experiment-session-replays** | Session replay patterns across experiment variants |
| **auditing-experiments-flags** | Audit experiments + flags for config issues, staleness, best-practice violations |
| **cleaning-up-stale-feature-flags** | Find unused/abandoned flags, dependency check, safe removal |

### LLM analytics

| Skill | Description |
|---|---|
| **exploring-llm-clusters** | Investigate LLM analytics clusters: usage patterns, cost/latency, drill into traces |
| **exploring-llm-evaluations** | Explore LLM evaluation results |
| **exploring-llm-traces** | Explore LLM trace data |

### Recordings, autocapture, queries

| Skill | Description |
|---|---|
| **diagnosing-missing-recordings** | Diagnose missing session recordings |
| **exploring-autocapture-events** | Explore autocaptured events |
| **query-examples** | HogQL query reference: trends, funnels, retention, lifecycle, paths, web analytics, error tracking, logs, sessions, LLM traces |
| **signals** | Query `document_embeddings` table for signals data via HogQL (semantic search over signals) |
| **managing-subscriptions** | Manage scheduled email/Slack/webhook deliveries of insight or dashboard snapshots |
| **skills-store** | Skills store browsing |

---

## AI/ML Hub (Hugging Face)

Bundled with the `huggingface-skills` plugin.

| Skill | Description |
|---|---|
| **hf-cli** | Hugging Face Hub CLI (`hf`): auth, cache, buckets, jobs, repos, discussions, PRs, models, datasets, spaces, papers, collections, dataset queries, webhooks, inference endpoints |
| **huggingface-best** | Best practices for Hugging Face workflows |
| **huggingface-community-evals** | Run evaluations using inspect-ai and lighteval on local hardware (vLLM / Transformers / accelerate) |
| **huggingface-datasets** | Dataset Viewer API: subset/split metadata, paginate rows, search text, filters, parquet URLs, statistics |
| **huggingface-gradio** | Build Gradio web UIs and demos in Python — components, event listeners, layouts, chatbots |
| **huggingface-llm-trainer** | Train/fine-tune LLMs using TRL or Unsloth with HF Jobs (SFT, DPO, GRPO, reward modeling, GGUF conversion) |
| **huggingface-local-models** | Run models locally with llama.cpp + GGUF on CPU, Mac Metal, CUDA, ROCm |
| **huggingface-paper-publisher** | Publish/manage research papers on HF Hub: paper pages, links to models/datasets, claim authorship, markdown articles |
| **huggingface-papers** | Look up HF paper pages in markdown, papers API for authors/links/repos. Accepts HF URL, arXiv URL/ID |
| **huggingface-tool-builder** | Build reusable scripts to fetch/enrich/process data via HF API |
| **huggingface-trackio** | Track and visualize ML training: metrics logging (Python API), alerts (CLI), dashboard, HF Space sync |
| **huggingface-vision-trainer** | Train vision models (D-FINE, RT-DETR, DETR, YOLOS, ViT, DINOv3, MobileNet, ResNet, SAM/SAM2) on HF Jobs |
| **transformers-js** | Run ML models in JS/TS — NLP, vision, audio, multimodal, in browsers + Node/Bun/Deno via WebGPU/WASM |

---

## Payments (Stripe)

Bundled with the `stripe` plugin.

| Skill | Description |
|---|---|
| **stripe-best-practices** | Stripe best practices |
| **stripe-projects** | Stripe project setup guidance |
| **upgrade-stripe** | Upgrade Stripe API versions and SDKs |

---

## Workflow Automation (Zapier)

Bundled with the `zapier` plugin.

| Skill | Description |
|---|---|
| **zapier-setup** | Set up Zapier MCP, add tools — diagnostic + branched flow (summary / reconnect / onboarding / config help) |
| **zapier-status** | Check MCP setup health: dashboard view, audit waste/duplicates, diagnose troubleshooting |
| **create-my-tools-profile** | Generate personalized AI skill from configured Zapier MCP tools |

---

## Slash Commands

Plugin-provided slash commands invokable as `/<command>`.

| Command | Plugin | Description |
|---|---|---|
| `/commit` | commit-commands | Create a git commit |
| `/commit-push-pr` | commit-commands | Commit, push, and open a PR |
| `/clean_gone` | commit-commands | Remove local branches marked `[gone]` (deleted on remote) + their worktrees |
| `/seer` | sentry | Natural-language questions about your Sentry environment via Sentry MCP |
| `/llma-cc-setup` | posthog | Set up PostHog LLM Analytics to capture Claude Code sessions |
| `/llma-cc-status` | posthog | Check if Claude Code sessions are being sent to PostHog LLM Analytics |
| `/llma-cc-ingest` | posthog | Manually send a Claude Code session log to PostHog LLM Analytics |
| `/explain-error` | stripe | Explain Stripe error codes with code-example solutions |
| `/test-cards` | stripe | Display Stripe test card numbers for various scenarios |

---

## Language Servers (LSP)

Plugins below register an LSP server. They don't add named skills — they boost Claude Code's semantic code understanding for the language: definitions, references, type info, autocomplete, refactor accuracy.

| Plugin | Language | Notes |
|---|---|---|
| **typescript-lsp** | TypeScript / JavaScript | Strict mode, project references, monorepo support |
| **pyright-lsp** | Python | uv-aware, strict mode, type stubs |
| **rust-analyzer-lsp** | Rust | Cargo workspaces, async/await, macro expansion |
| **swift-lsp** | Swift | SwiftPM, SwiftUI, iOS/macOS targets |

---

## Documentation Lookup

| Plugin | What it does |
|---|---|
| **context7** | Live library documentation fetch via MCP. Replaces stale LLM training data with current docs from React, Next.js, Prisma, Tailwind, Django, and 1000s more. Two MCP tools: `resolve-library-id` (find the right doc set), `query-docs` (fetch current API/config/syntax) |
