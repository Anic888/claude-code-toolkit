# Subagents Catalog

> 19 specialized subagents in `~/.claude/agents/`. The main agent delegates focused tasks to these — lighter than full skills, heavier than inline prompts. ★ marks agents with project-specific customization layers.

## Table of Contents

- [What Are Subagents?](#what-are-subagents)
- [Engineering](#engineering)
- [Marketing](#marketing)
- [Design](#design)
- [Product](#product)
- [Studio Operations](#studio-operations)
- [Source and Customization](#source-and-customization)

---

## What Are Subagents?

A subagent is a Markdown file in `~/.claude/agents/<category>/<name>.md` with frontmatter (name, description, allowed tools) plus a system prompt defining a specialized role. The main agent invokes them via the `Agent` tool with `subagent_type: <name>`.

**When to use a subagent vs a skill:**
- **Skill** — workflow recipe with checklists/steps, often runs in main thread
- **Subagent** — independent role with its own context window and tool restrictions
- **Agent** — generic dispatch wrapper (defaults to `general-purpose`)

Subagents shine for: parallel exploration, code review (independent perspective), specialized domain work where the main agent's context shouldn't be polluted.

---

## Engineering

### ai-engineer

Implements AI/ML features: language model integration, recommendation systems, computer vision, prompt engineering, RAG pipelines, response streaming. Use for "add AI chat", "build a recommender", "implement visual search".

Tools: `Write, Read, MultiEdit, Bash, WebFetch`

---

### mobile-app-builder ★

Native iOS / Android / React Native development. 60fps UI, gesture handling, state restoration, push notifications, biometric auth, deep linking, App Store / Play Store optimization.

**Customization layer (Astralyn / Avara / Amoris):**
- HARD RULE: `astrologer-app/` (iOS) and `astralyn-android/` are isolated working copies — never auto-sync
- Stack: Expo SDK 55, npm only (pnpm breaks Metro on this codebase), 9-locale i18n required
- Build: EAS Cloud only, preview profile for local Pixel tests, production for store
- Auth: native Google Sign-In SDK on Android, web OAuth on iOS, magic-link OTP via Resend
- Storage: plain AsyncStorage (SecureStore fails in simulator unsigned builds)
- Anti-patterns blocked: `qrcode` npm package in RN, `Animated.createAnimatedComponent(G)` for SVG, `expo run:ios --device`
- Carries IDs: ASC App ID, Apple Team ID, Play Console app ID, GCP OAuth project, Supabase ref, RC project, bundle ID, scheme

Tools: `Write, Read, MultiEdit, Bash, Grep`

---

### rapid-prototyper

Scaffolds new applications, MVPs, proof-of-concepts within tight cycles. Integrates trending features fast, builds functional demos for stakeholder presentations or trend validation.

Tools: `Write, MultiEdit, Bash, Read, Glob, Task`

---

## Marketing

### app-store-optimizer

Prepares app store listings: keyword research, metadata optimization, conversion-rate improvements, ASO performance analysis. Maximizes organic discoverability.

Tools: `Write, Read, WebSearch, WebFetch, MultiEdit`

---

### growth-hacker

Identifies viral mechanics, growth loops, retention drivers, monetization strategies. Pairs with mobile apps that have built-in shareability or referral surfaces.

---

### tiktok-strategist

TikTok marketing strategies, viral content ideation, algorithm-aware planning, creator partnerships, app-promo trend hijacking.

Tools: `Write, Read, WebSearch, WebFetch`

---

### instagram-curator

Instagram-native content strategy: feed aesthetic, Stories formats, Reels optimization, hashtag research, creator collabs.

---

### twitter-engager

Twitter/X engagement strategy: thread structure, reply tactics, community building around a brand voice, viral tweet patterns.

---

### reddit-community-builder

Reddit-specific community engagement: subreddit selection, post format per community, AMA strategy, organic acquisition without spam.

---

### content-creator

Cross-channel content: blog posts, newsletters, scripts, captions. Adapts tone per platform while preserving brand voice.

---

## Design

### whimsy-injector ★

PROACTIVELY adds delightful, playful micro-interactions, animations, and personality to UI/UX changes. Triggered automatically after any interface update.

**Customization layer (Astralyn / Avara / Amoris):**
- Brand voice: "mirror not cage", depth-psychology, never deterministic — humor in small doses
- Visual chrome: NO emojis (MaterialCommunityIcons), exception `⚡` on Premium upsell
- Validated patterns to extend: Reanimated `FadeInDown` 50/130/210/290ms cascade, skeleton cards (not ActivityIndicator), Light/Medium haptic feedback, single shared `useState` time tick for batched SVG re-renders
- Anti-patterns blocked: ring-only NatalChart rotation, `Animated.createAnimatedComponent(G)` strobe, confetti spam, mascots, ANY humor in crisis-detection paths
- Locale-aware: 9 locales (en/ru/es/zh/pt/de/fr/ja/ko), word-budget multipliers en=1× / es=1.3× / ru=2× / zh=1.8×

Tools: `Read, Write, MultiEdit, Grep, Glob`

---

### color-research

Live-fetches trending color palettes from Colorhunt.co for specific moods/tags. Returns recent palettes with hex codes, mood tags, designer-style pairings. Used by the `design-creator` skill for trend-aware poster generation.

Tools: `Read, WebFetch, Bash`

---

### concept-explorer

Generates ONE poster concept specification from ONE specific angle (type-forward, image-forward, or trend-aggressive). The `design-creator` skill dispatches 3 of these in parallel for diverse options before ranking.

Tools: `Read, Glob, Grep`

---

### design-critic

Evaluates and ranks 3 poster concept specs from `concept-explorer` subagents using a two-pass adversarial process. Scores 5 dimensions, returns ranked list with winner and improvement suggestions. Forces weak concepts to fail visibly.

Tools: `Read, Grep`

---

### layout-verifier

Runs a Python layout checker on a generated SVG poster, parses JSON issue report, translates problems into human-readable fix instructions. Catches text overflow, element overlap, too-small fonts, line lengths exceeding Bringhurst's 85-char max, fake typographic glyphs.

Tools: `Read, Bash`

---

### periodic-research

Monthly orchestrator that refreshes the design-library research corpus. Triggered automatically on the 1st of each month. Dispatches `color-research` and `research-agent` in parallel, writes time-stamped snapshots, updates synthesis files, commits to GitHub.

Tools: `Task, Read, Write, Bash, Grep`

---

### research-agent

Live-fetches recent poster competition announcements, winner lists, shortlists, and curated contemporary work from Behance / Awwwards / It's Nice That / AIGA / Creative Review. Augments the static archive when a brief mentions a specific competition or trend.

Tools: `Read, WebFetch, Bash, Grep`

---

## Product

### trend-researcher

Identifies market opportunities, analyzes trending topics on TikTok / App Store / social media, validates product concepts against real signals, finds viral mechanics for existing apps.

Tools: `WebSearch, WebFetch, Read, Write, Grep`

---

## Studio Operations

### legal-compliance-checker

Reviews features, content, and product decisions against legal requirements: privacy law (GDPR, CCPA, COPPA), App Store / Play Store policies, accessibility standards, data retention rules. Flags compliance risks before they become App Review rejections.

---

## Source and Customization

13 of the 19 agents come from [contains-studio/agents](https://github.com/contains-studio/agents) (MIT). The 6 design agents (color-research, concept-explorer, design-critic, layout-verifier, periodic-research, research-agent) are part of the local `design-creator` skill — orchestrated together for poster generation.

★ marks agents customized for the maintainer's stack (Astralyn / Avara / Amoris on Expo + Supabase + RevenueCat). The customization is a `## User-specific overrides` section appended to the original prompt — the generic capabilities stay intact, project-specific rules layer on top.

The `install.sh` / `install.ps1` bootstrap downloads only the un-customized originals. Project-specific overrides live locally in `~/.claude/agents/<category>/<name>.md` and are NOT overwritten on re-run (the installer skips existing files).

To customize an agent yourself: edit the file directly, append a `## User-specific overrides` block before the final paragraph. Keep the generic prompt intact so the agent still works in projects outside your specific stack.
