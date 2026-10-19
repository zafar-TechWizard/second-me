# REA Reverse Engineering Workspace
## Claude Code Pipeline for Android App Analysis

This workspace is set up for reverse engineering an Android app using REA agents.
The goal is to **understand** how features work, document them thoroughly, and
then use those findings as a blueprint to build an original implementation from scratch.

---

## Pipeline Overview

```
[APK / Live Device]
        ↓
  [Phase 1: Setup & Extraction]
        ↓
  [Phase 2: Static Analysis]
        ↓
  [Phase 3: Runtime Analysis]
        ↓
  [Phase 4: Feature Documentation]
        ↓
  [Phase 5: Architecture Brainstorm]
        ↓
  [Build Plan — new app from scratch]
```

---

## Directory Structure

```
rea-workspace/
├── CLAUDE.md               ← You are here. Read this first.
├── apk/                    ← Drop target APK files here
├── analysis/
│   ├── decompiled/         ← JADX output, decompiled Java/Kotlin
│   ├── network/            ← HAR captures, traffic dumps
│   ├── screenshots/        ← App UI screenshots via ADB
│   └── notes/              ← Raw agent findings, observations
├── docs/
│   ├── features/           ← One .md file per feature analyzed
│   ├── architecture/       ← App architecture diagrams & notes
│   └── api/                ← API endpoints, payloads, auth flows
├── planning/
│   ├── brainstorm/         ← Ideas, comparisons, alternative approaches
│   └── specs/              ← Feature specs for our own build
├── build/                  ← Our own app code goes here eventually
└── tools/                  ← Helper scripts, configs
```

---

## Phase 1 — Setup & Extraction

**Goal:** Get tools ready, extract the APK, verify ADB connection.

### Checklist
- [ ] REA installed: `npx rea-agents setup` — choose Claude Code
- [ ] Node.js 22+ confirmed: `node --version`
- [ ] JADX installed (headless): confirm `jadx --version`
- [ ] ADB connected: `adb devices` — phone should appear
- [ ] APK pulled from device: `adb shell pm list packages | grep <appname>`
  then: `adb pull $(adb shell pm path <package.name> | cut -d: -f2) apk/target.apk`
- [ ] REA MCP bridge running: `npx rea-agents mcp`

### Commands
```bash
# Pull APK from connected phone
adb devices
adb shell pm list packages | findstr <keyword>
adb shell pm path <full.package.name>
adb pull /data/app/... apk/target.apk

# Verify REA
npx rea-agents --version
```

---

## Phase 2 — Static Analysis

**Goal:** Understand the app structure, classes, manifest, and premium feature gates.

### What to analyze
1. **AndroidManifest.xml** — permissions, activities, services, receivers
2. **Package structure** — identify premium/paywall related classes
3. **Billing / subscription logic** — how does it check for premium?
4. **Feature flags** — are features toggled server-side or locally?
5. **API calls** — endpoints, auth headers, request/response shapes
6. **Data models** — what data structures does the app use?

### REA commands to run
```bash
# Full APK decompile
npx rea-agents analyze-android-apk apk/target.apk --json > analysis/notes/apk-overview.json

# Or via your agent (Claude Code):
# "Use REA to analyze the APK in the apk/ folder and give me a full overview
#  of the package structure, manifest, and any premium/billing related classes"
```

### Output location
- Raw decompiled code → `analysis/decompiled/`
- Feature notes → `docs/features/<feature-name>.md`
- API docs → `docs/api/endpoints.md`

---

## Phase 3 — Runtime Analysis

**Goal:** Observe the app live on device — network traffic, behavior, API calls.

### Steps
1. Connect phone via ADB
2. Capture network traffic (use mitmproxy or REA's ADB tools)
3. Screenshot key UI flows via ADB
4. Observe logcat for debug info

### Commands
```bash
# Live logcat
adb logcat -s <TAG>

# Screenshot
adb shell screencap -p /sdcard/screen.png
adb pull /sdcard/screen.png analysis/screenshots/

# Screen record
adb shell screenrecord /sdcard/record.mp4

# Network via REA + ADB
# (agent prompt) "Use REA ADB tools to observe network traffic
#  while I navigate through the premium features section"
```

---

## Phase 4 — Feature Documentation

**Goal:** For each interesting feature, write a clear understanding doc.

### Template for each feature → `docs/features/<feature>.md`
```markdown
# Feature: <Name>

## What it does (user-facing)
...

## How it works (technical)
...

## Key classes / files
...

## API calls involved
...

## Data flow
...

## Premium gate — how is it enforced?
...

## Notes / unknowns
...
```

### Agent prompt to use
```
For each major premium feature in this app, analyze the relevant
code from analysis/decompiled/ and create a feature doc in docs/features/
following the template in CLAUDE.md Phase 4.
```

---

## Phase 5 — Architecture & Build Planning

**Goal:** Brainstorm our own app architecture based on what we learned.

### Steps
1. List all features we want to replicate (conceptually)
2. Choose our tech stack (React Native? Flutter? Kotlin?)
3. Design our own data models
4. Plan our own API (if needed)
5. Write feature specs in `planning/specs/`

### Agent prompt
```
Based on all the feature docs in docs/features/ and the API docs in docs/api/,
brainstorm an architecture for building our own version of this app from scratch.
Consider: tech stack, state management, backend needs, auth approach.
Write the plan to planning/brainstorm/architecture.md
```

---

## Conventions

- **One file per feature** in `docs/features/`
- **Always note evidence** — link to the class/method that proves it
- **Note unknowns** — things that need runtime confirmation
- **Never paste APK internals** into `build/` — that folder is for our original code only
- **Commit notes regularly** — `git init` in this folder if you want history

---

## Key REA Agent Prompts (copy-paste ready)

### Full initial analysis
```
Use REA to analyze the APK at apk/target.apk. Give me:
1. A full package structure overview
2. The AndroidManifest.xml contents
3. All premium/subscription/billing related classes
4. All network API calls you can find (endpoints, headers, payloads)
5. Any feature flag or A/B testing logic
Save findings to analysis/notes/initial-analysis.md
```

### Feature deep-dive
```
Use REA to deep-dive into the [FEATURE NAME] feature.
Find the relevant classes, trace the data flow, document the API calls,
and explain how the premium gate works.
Save to docs/features/[feature-name].md using the template in CLAUDE.md
```

### Network analysis
```
Use REA ADB tools to observe the app running on my connected device.
Capture all network requests made when I [DO ACTION].
Save the traffic to analysis/network/[action].har
Then document the API calls found to docs/api/endpoints.md
```

---

## Important Notes

- This workspace is for **understanding and learning only**
- All original code we write goes in `build/` and is built from scratch
- We do not copy decompiled code into our build
- Analysis findings are used as **conceptual blueprints**, not copy-paste source
