# AIris Framework

**Clear vision for AI-assisted development**

A constraint-first framework for maintaining architectural coherence across AI-assisted development sessions through document-driven structure.

---

## Start Here — 30-Minute Setup

**New project:**
```
1. Create .ai-docs/scope.md    → use prompts/2-scope.prompt.md
2. Create .ai-docs/design.md   → use prompts/3-design.prompt.md
3. Create .ai-docs/tracker.md  → use prompts/4-tracker.prompt.md
4. Start coding                → use prompts/5-session.prompt.md
```

**Existing project:** Same steps — document AS-IS state in scope.md and design.md, then generate tracker. See [For EXISTING Projects](#for-existing-projects) below.

**Scope or design changed mid-project?** → use `prompts/6-amendment.prompt.md`
**Bug, hotfix, or maintenance task?** → use `prompts/4-tracker.prompt.md` Register Issue Mode (see [Handling Bugs, Hotfixes & Improvements](#handling-bugs-hotfixes--improvements))

Optional: `prompts/1-discovery.prompt.md` helps you think through a new idea before writing scope.md.
Optional: `templates/6-extraction.template.md` generates a CLAUDE.md or AGENTS.md for your AI tool.

---

## What is This?

AIris is a structured approach to AI-assisted development that prevents common pitfalls like architectural drift, scope creep, and inconsistent technical decisions across sessions. The framework uses a hierarchy of documents that serve as persistent context for stateless AI models.

**Key Innovation:** Like the human iris focuses light to create clear vision, AIris focuses AI on your technical constraints first, ensuring AI suggestions respect your architecture rather than suggesting generic "path of least resistance" solutions.

---

## Framework Structure

Three folders are installed at the root of your project:

```
your-project/
├── .airis/                            # Framework core (reusable across projects)
│   ├── FRAMEWORK.md                      # This file - Complete framework guide
│   ├── templates/                        # Document templates
│   │   ├── 0-PRD.template.md               # Product Requirements (optional)
│   │   ├── 1-scope.template.md             # Vision, boundaries & features
│   │   ├── 2-design.template.md            # Architecture & tech decisions
│   │   ├── 3-tracker.template.md           # Task registry
│   │   ├── 4-todo.template.md              # Session plan
│   │   ├── 5-handoff.template.md           # Session state transfer
│   │   └── 6-extraction.template.md        # CLAUDE.md / AGENTS.md extraction prompt
│   ├── prompts/                          # AI prompts
│   │   ├── 1-discovery.prompt.md           # Generate PRD
│   │   ├── 2-scope.prompt.md               # Generate Scope (with features)
│   │   ├── 3-design.prompt.md              # Generate Design
│   │   ├── 4-tracker.prompt.md             # Generate/update Tracker
│   │   ├── 5-session.prompt.md             # Session lifecycle (3 parts)
│   │   └── 6-amendment.prompt.md           # Scope/design change management
│   └── instructions/                     # Claude Project instructions
│       └── airis-integration.instructions.md  # Framework integration guide (setup assistant)
│
├── .ai-docs/                          # Strategic documents (your project)
│   ├── scope.md                          # Project vision, boundaries & features
│   ├── design.md                         # Technical architecture & constraints
│   └── tracker.md                        # Complete task registry
│
└── .ai-session/                       # Session execution & state
    └── {developer-id}/                   # Per-developer workspace
        ├── current/
        │   ├── todo.md                      # Active session plan
        │   └── handoff.md                   # Personal session state
        └── archive/
            └── session-XXX_YYYY-MM-DD.md    # Completed sessions
```

---

## Documents & Prompts

### Phase 1: Strategic Foundation (Human-Created, Stable)

Created in this order — Scope first (WHAT to build), then Design (HOW to build):

| Document | Description | Prompt | Template |
|----------|-------------|--------|----------|
| **scope.md** | Vision, goals, metrics, boundaries, **features (high-level)** | `2-scope.prompt.md` | `1-scope.template.md` |
| **design.md** | Architecture, tech stack, standards, security, ADRs | `3-design.prompt.md` | `2-design.template.md` |

Optional: Use `1-discovery.prompt.md` to generate a PRD as input for scope.md.

**When scope or design changes mid-project:** Use `6-amendment.prompt.md` — it analyzes impact, updates scope.md and design.md in the correct order, and proposes tracker changes. Do not edit strategy docs manually without impact analysis.

**Note:** Detailed requirements (user stories, validation rules) are generated as acceptance criteria in tracker.md.

### Phase 2: Tactical Roadmap (AI-Generated, Evolving)

| Document | Description | Prompt | Template |
|----------|-------------|--------|----------|
| **tracker.md** | Task breakdown (T-001...), detailed acceptance criteria, dependencies, status tracking, velocity | `4-tracker.prompt.md` | `3-tracker.template.md` |

Generated from scope.md + design.md. Updated after each session. Expands high-level features into testable criteria. Adapts to new vs existing projects.

### Phase 3: Session Execution (Context-Sized, Per-Session)

All managed by a single prompt: `5-session.prompt.md`

| Document | Description | Trigger | Template |
|----------|-------------|---------|----------|
| **todo.md** | 1 task per session (PR-ready vertical slice), Opening Brief, Closing Report (1-6h sessions) | Part 0: "Create ToDo for T-XXX" / Part 1: "Start session" | `4-todo.template.md` |
| **handoff.md** | 8-section canonical schema: context snapshot, active tasks, decisions with rationale, file changes, validation & evidence, risks, next steps, status metrics. Replaced each session. | Part 2: "Session complete" | `5-handoff.template.md` |

### Tool-Specific Extraction (Optional)

Extract concise instruction files from `.ai-docs/` for AI tool integration. Re-extract whenever `.ai-docs/` change.

| Output | Description | Template |
|--------|-------------|----------|
| **CLAUDE.md** | Claude Code project instructions — auto-loaded at session start | `6-extraction.template.md` |
| **AGENTS.md** | GitHub Copilot CLI instructions — auto-loaded from project root | `6-extraction.template.md` |

**Rule:** Technical constraints (design.md) MUST appear before features (scope.md) in all extracted files.

---

## The Constraint-First Principle

When AI reads scope before understanding technical constraints, it suggests the "path of least resistance" — generic solutions that may violate your architecture.

**Example:**
```
❌ Wrong Order:
   AI reads: "Need real-time chat feature" (from scope)
   AI suggests: "Use Firebase" (easiest solution)
   Your architecture: FastAPI + PostgreSQL (conflict!)

✅ Right Order (The AIris Way):
   AI reads: "Must use FastAPI + PostgreSQL" (from design)
   Then reads: "Need real-time chat feature" (from scope)
   AI suggests: "Server-Sent Events in FastAPI" (respects constraints)
```

Enforced in: `design.md` template (CRITICAL section), all generation prompts, session prompt Part 1.
In standard sessions, handoff.md carries forward active constraints (see Reading Context Order).

---

## Getting Started

### For NEW Projects

**Step 1: Optional - Create PRD (if you don't have one)**
```bash
# Load: .airis/prompts/1-discovery.prompt.md
```

**Step 2: Create Strategic Documents (IN ORDER)**
```bash
# 2.1 Create scope.md
# Template: .airis/templates/1-scope.template.md
# Or use: .airis/prompts/2-scope.prompt.md with your PRD

# 2.2 Create design.md
# Template: .airis/templates/2-design.template.md
# Or use: .airis/prompts/3-design.prompt.md with scope.md
```

**Step 3: Generate Tracker**
```bash
# Use: .airis/prompts/4-tracker.prompt.md
# Input: design.md + scope.md
# Output: .ai-docs/tracker.md with detailed acceptance criteria
```

**Step 3.5: Optional — Extract Tool-Specific Instructions**
```bash
# Use: .airis/templates/6-extraction.template.md
# Input: .ai-docs/design.md + .ai-docs/scope.md
# Output: CLAUDE.md and/or AGENTS.md in project root
# Note: Re-extract whenever .ai-docs/ change
```

**Step 4: Start First Session**
```bash
# Create your developer folder
mkdir -p .ai-session/{your-name}/current
mkdir -p .ai-session/{your-name}/archive

# Use: .airis/prompts/5-session.prompt.md
# Part 0: "Create ToDo for T-001" → generates todo.md (1 task per session)
# Part 1: "Start session" → adds Opening Brief
# [Work happens...]
# Part 2: "Session complete" → generates Closing Report + handoff.md
```

### For EXISTING Projects

Existing codebases carry implicit knowledge that AI cannot infer from code alone: unwritten conventions, informal dependencies, accumulated technical debt, and architectural decisions whose rationale lives only in people's heads. Documenting the AS-IS state captures this context so AI works *with* your system instead of against it.

**Step 1: Document Current State**
```bash
# 1.1 Create: .ai-docs/scope.md (vision, boundaries, metrics, existing + planned features)
# 1.2 Create: .ai-docs/design.md (AS-IS tech stack, patterns, technical debt)
```

**Step 2: Generate Tracker**
```bash
# Use: .airis/prompts/4-tracker.prompt.md
# Generates: Feature, Architecture, Technical Debt, and Migration tasks
```

**Step 2.5: Optional — Extract Tool-Specific Instructions**
```bash
# Use: .airis/templates/6-extraction.template.md
# Input: .ai-docs/design.md + .ai-docs/scope.md
# Output: CLAUDE.md and/or AGENTS.md in project root
```

**Step 3: Create Initial Handoff**
```bash
# Create: .ai-session/{your-name}/current/handoff.md
# Use 5-session.prompt.md or follow 8-section schema from 5-handoff.template.md
# Sections without prior session data: mark as "N/A - initial handoff"
```

**Step 4:** Continue with session-based development (same as new projects).

---

## Session Execution Loop

Each session follows this loop. Each developer maintains an independent workspace under `.ai-session/{developer-id}/`.

### Session Workflow

**1. Session Start (Part 0 & 1)**
- [Human] Selects tasks from tracker, creates/adjusts ToDo
- [AI] Reads context stack, produces Opening Brief (7 elements):
  - Context: current project state and where we left off
  - Assumptions: what the AI is taking as given
  - Dependencies: components, tasks, or external factors involved
  - Edge cases: identified boundary conditions and how they'll be handled
  - Risks: what could go wrong, with mitigation
  - Success criteria: measurable conditions that define "done"
  - Plan: approach and implementation steps (informed by all of the above)
- [Human] Reviews Opening Brief, approves or adjusts before work begins
- [Human + AI] If plan is rejected, AI revises until approved — no work begins without approval

**2. Work (Collaboration)**
- [AI] Implements current step from the plan
- [Human] Runs, tests, pastes output
- [AI + Human] Validate output against acceptance criteria:
  - ✅ Criteria met → move to next step
  - ❌ Criteria not met → diagnose root cause, adjust approach, re-implement
  - 🚫 Blocked → document blocker, flag to human, skip or re-scope

**3. Session Close (Part 2)**
- [AI] Produces Closing Report in todo.md + updated handoff.md
- [AI] Proposes tracker.md updates (in feature branch)
- [Human] Verifies results with concrete evidence (test counts, CI status, links) before committing
- [Human + AI] If blocked or tests fail: document in Closing Report, mark task as 🟡/🚫 in tracker
- [Human] Archives todo.md to `.ai-session/{dev}/archive/session-XXX_YYYY-MM-DD.md`

**4. Merge to Main** (team workflow)
- [Human] Merges feature branch — tracker conflicts are expected, keep both updates

### Reading Context Order

**With existing handoff (standard):**
1. `.ai-session/{dev}/current/handoff.md` — Historical context: prior decisions, pending work, active constraints
2. `.ai-docs/design.md` — Technical context: architecture constraints, patterns, standards
3. `.ai-session/{dev}/current/todo.md` — Execution context: current tasks, acceptance criteria, session scope
4. `.ai-docs/tracker.md` — Roadmap context: dependencies, priorities, upcoming work (on-demand)
5. `.ai-docs/scope.md` — Business context: goals, boundaries, success metrics (on-demand)

**First session (no handoff exists):**
1. `.ai-docs/design.md` — Technical context: architecture constraints, patterns, standards (full read)
2. `.ai-docs/scope.md` — Business context: goals, boundaries, success metrics (on-demand)
3. `.ai-docs/tracker.md` — Roadmap context: dependencies, priorities, upcoming work
4. `.ai-session/{dev}/current/todo.md` — Execution context: current tasks, acceptance criteria, session scope

---

## Core Principles

1. **Separation of Concerns by Time Horizon**
   - **Strategy** (months) — Stable, human-owned (Scope, Design)
   - **Tactics** (weeks) — Evolving, AI-generated (Tracker)
   - **Execution** (hours) — Bounded by context window (ToDo)
   - **Transfer** (each session) — Verified state only (Handoff)

2. **Stateless AI, Stateful Documents**
   - AI models have no memory between sessions
   - Documents provide persistent context
   - Handoff captures verified state only

3. **Continuous Verification**
   - Every session ends with validation
   - Only verified work moves to handoff
   - Evidence required (tests, CI, reviews)

4. **Vertical Slice Tasks**
   - Each task crosses all necessary layers (API, service, data) + includes its own tests
   - One task = one session = one PR — atomic, deployable, reviewable
   - Anti-pattern: horizontal decomposition (model task → service task → endpoint task → tests task). Instead: one task that delivers a complete capability end-to-end.

---

## Handling Bugs, Hotfixes & Improvements

Not all work comes from the planned roadmap. Use this decision tree when something unexpected arrives:

```
Issue reported (bug / improvement / maintenance need)
        ↓
Is it production-critical (users blocked right now)?
  Yes → Register as HOT in tracker (prompts/4-tracker.prompt.md Register Issue Mode)
        → Use Hotfix Mode in session prompt: "Hotfix for T-XXX"
  No  ↓
Does fixing it change behavior documented in design.md or scope.md?
  Yes → Route to prompts/6-amendment.prompt.md first
        → Amendment updates strategy docs + proposes tracker task
        → Then use standard session flow
  No  ↓
Classify:
  Broken implementation    → BUG task → standard session
  Dependency update/patch  → MAINT task → standard session
  Design shortcut to repay → DEBT task → standard session
  New small capability     → FEAT task → standard session (if within existing scope)
                                       → amendment.prompt.md (if scope change needed)
```

**Entry point:** Always start with `prompts/4-tracker.prompt.md` Register Issue Mode — it runs the triage, assigns the type, and routes you to the right prompt.

**Key rule:** A bug that exposes a design flaw is two things — fix the symptom in a BUG session, document the design gap as a DEBT task (or amendment if it changes documented behavior).

---

## Benefits

- **Architectural Coherence** — Technical constraints enforced across all AI sessions
- **Scope Control** — Clear boundaries prevent feature creep
- **Auditable Trail** — ADRs document why decisions were made
- **Consistent Patterns** — Security, quality, and performance standards applied uniformly
- **Fast Onboarding** — New team members read strategy docs to understand project
- **AI-Agnostic** — Works with Claude, GPT-4, Gemini, or any LLM
- **Scalable** — Supports multiple developers working in parallel
- **Context-Efficient** — Session docs stay within LLM context windows


---

**Ready to start?** Copy `.airis/`, `.ai-docs/`, and `.ai-session/` to your project root and follow the Getting Started guide above.

**See clearly. Build confidently.**
