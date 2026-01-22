# AIris Framework

**Clear vision for AI-assisted development**

A constraint-first framework for maintaining architectural coherence across AI-assisted development sessions through document-driven structure.

---

## What is This?

AIris is a structured approach to AI-assisted development that prevents common pitfalls like architectural drift, scope creep, and inconsistent technical decisions across sessions. The framework uses a hierarchy of documents that serve as persistent context for stateless AI models.

**Key Innovation:** Like the human iris focuses light to create clear vision, AIris focuses AI on your technical constraints first, ensuring AI suggestions respect your architecture rather than suggesting generic "path of least resistance" solutions.

---

## Framework Structure

```
.airis/
├── FRAMEWORK.md                   # This file - Complete framework guide
│
├── _setup/                        # Reusable components
│   ├── templates/                 # 7 document templates
│   │   ├── 0-PRD.template.md         # Product Requirements (optional)
│   │   ├── 1-scope.template.md       # Vision & boundaries
│   │   ├── 2-requirements.template.md # Detailed functionality
│   │   ├── 3-design.template.md      # Architecture & tech decisions
│   │   ├── 4-tracker.template.md     # Task registry
│   │   ├── 5-todo.template.md        # Session plan
│   │   └── 6-handoff.template.md     # Session state transfer
│   ├── prompts/                   # 6 AI prompts
│   │   ├── 1-discovery.prompt.md      # Generate PRD
│   │   ├── 2-scope.prompt.md          # Generate Scope
│   │   ├── 3-requirements.prompt.md   # Generate Requirements
│   │   ├── 4-design.prompt.md         # Generate Design
│   │   ├── 5-tracker.prompt.md        # Generate/update Tracker
│   │   └── 6-session.prompt.md        # Session lifecycle (3 parts)
│   └── instructions/              # Claude Project instructions
│       ├── airis-integration.instructions.md  # Framework integration guide
│       └── airis-session.instructions.md      # Session management guide
│
├── docs/                          # Strategic documents (your project)
│   ├── design.md                  # Technical architecture & constraints
│   ├── scope.md                   # Project vision & boundaries
│   ├── requirements.md            # Detailed features & user stories
│   └── tracker.md                 # Complete task registry
│
└── session/                       # Session execution & state
    ├── {developer-id}/            # Per-developer workspace
    │   ├── current/
    │   │   ├── todo.md               # Active session plan
    │   │   └── handoff.md            # Personal session state
    │   └── archive/
    │       └── session-XXX_YYYY-MM-DD.md  # Completed sessions
    └── shared/
        └── project-status.md      # Team-wide coordination
```

---

## Document Hierarchy

### Phase 1: Strategic Foundation (Human-Created, Stable)

**Created in this order:**

1. **scope.md** (~8 pages, 4-6 hours)
   - Project vision and goals
   - Success metrics and SLOs
   - In-scope / out-of-scope boundaries
   - Stakeholders and constraints
   - **Template:** `_setup/templates/1-scope.template.md`
   - **AI Helper:** `_setup/prompts/2-scope.prompt.md`

2. **requirements.md** (~30 pages, 6-10 hours)
   - Functional requirements by feature
   - User stories with acceptance criteria
   - Business rules and validation logic
   - Data entities and relationships
   - Integration requirements
   - **Template:** `_setup/templates/2-requirements.template.md`
   - **AI Helper:** `_setup/prompts/3-requirements.prompt.md`

3. **design.md** (~15 pages, 6-10 hours)
   - Architecture patterns and layers
   - Technology stack decisions
   - Development standards and conventions
   - Security and performance guidelines
   - Architecture Decision Records (ADRs)
   - **Template:** `_setup/templates/3-design.template.md`
   - **AI Helper:** `_setup/prompts/4-design.prompt.md`

**Why this order?**
- Scope first: Define boundaries before details
- Requirements second: Know WHAT before deciding HOW
- Design third: Architectural decisions informed by actual requirements

### Phase 2: Tactical Roadmap (AI-Generated, Evolving)

4. **tracker.md** (AI-generated from all strategy docs)
   - Complete task breakdown (T-001, T-002, etc.)
   - Task dependencies and priorities
   - Status tracking (⚪ ⏸️ 🟡 ✅ 🚫)
   - Progress metrics and velocity
   - Updated after each session
   - **Template:** `_setup/templates/4-tracker.template.md`
   - **AI Prompt:** `_setup/prompts/5-tracker.prompt.md`

### Phase 3: Session Execution (Context-Sized, Per-Session)

5. **todo.md** (Subset of tracker, per developer)
   - 1-3 tasks for current session
   - Opening Brief (context + plan)
   - Closing Report (what changed)
   - Session duration: 1-6 hours
   - **Template:** `_setup/templates/5-todo.template.md`
   - **AI Prompt:** `_setup/prompts/6-session.prompt.md`

6. **handoff.md** (Session state transfer, per developer)
   - Current project snapshot
   - Decisions made this session
   - Next recommended steps
   - Replaces completely each session (not accumulated)
   - **Template:** `_setup/templates/6-handoff.template.md`
   - **Generated by:** `_setup/prompts/6-session.prompt.md` (Part 2)

---

## Framework Phases & Prompts

### Phase 1: Construction of Strategic Documents (4 prompts)

**Purpose:** Create the foundation documents that define project vision, requirements, and architecture.

| Prompt | Input | Output | Time |
|--------|-------|--------|------|
| `1-discovery.prompt.md` | Business idea, PRD, or existing codebase | PRD document | 2-4h |
| `2-scope.prompt.md` | PRD or business context | scope.md | 4-6h |
| `3-requirements.prompt.md` | scope.md + PRD | requirements.md | 6-10h |
| `4-design.prompt.md` | requirements.md + scope.md | design.md | 6-10h |

**Adaptability:**
- **New projects:** Generate from scratch with AI assistance
- **Existing projects:** Document AS-IS state, then create TO-BE evolution plan

### Phase 2: Tactical Generation (1 prompt)

**Purpose:** Convert strategic documents into actionable implementation tasks.

| Prompt | Input | Output | Time |
|--------|-------|--------|------|
| `5-tracker.prompt.md` | design.md + scope.md + requirements.md | tracker.md | 1-2h |

**Features:**
- Generates complete task breakdown
- Calculates dependencies automatically
- Adapts to project type (new vs existing)
- Updates after each session

### Phase 3: Session Execution (1 prompt, 3 parts)

**Purpose:** Manage complete session lifecycle from planning to closure.

| Part | Trigger | Action | Output |
|------|---------|--------|--------|
| Part 0 | "Create ToDo for T-XXX" | Generate simple task list | todo.md Phase 1 |
| Part 1 | "Start session" | Read full context, create plan | Opening Brief in todo.md |
| Part 2 | "Session complete" | Generate reports, update state | Closing Report + handoff.md + Tracker updates |

**Single unified prompt:** `6-session.prompt.md` handles all three moments.

---

## The Constraint-First Principle

### The Problem: AI Bias Toward Generic Solutions

When AI reads requirements before understanding technical constraints, it suggests the "path of least resistance" - usually generic, cloud-based solutions that may violate your architectural decisions.

**Example:**
```
❌ Wrong Order:
   AI reads: "Need real-time chat feature" (from requirements)
   AI suggests: "Use Firebase" (easiest solution)
   Your architecture: FastAPI + PostgreSQL (conflict!)

✅ Right Order (The AIris Way):
   AI reads: "Must use FastAPI + PostgreSQL" (from design)
   Then reads: "Need real-time chat feature" (from requirements)
   AI suggests: "Server-Sent Events in FastAPI" (respects constraints)
```

### Two Different Orders

**1. Document CREATION Order (Logical for Humans):**
```
PRD → Scope → Requirements → Design
```
**Rationale:** You cannot decide HOW to build (Design) without knowing WHAT to build (Requirements).

**2. Document PRESENTATION Order (For AI Code Generation):**
```
Design → Scope → Requirements
```
**Rationale:** AI gives more weight to information it reads first. Technical constraints must be non-negotiable.

### The AIris Vision Metaphor

> "Like the human iris controls how much light enters the eye to create clear vision, AIris controls how AI reads your project documents to create clear, coherent software."

**The iris focuses light → AIris focuses AI on constraints**

### How It Works in Practice

When using AI to generate code or implementation plans:

```markdown
"Read these documents in this order:

1. design.md (FIRST - these constraints are non-negotiable)
2. scope.md (SECOND - project boundaries)  
3. requirements.md (THIRD - features to implement)

The technical decisions in design.md override everything else.
Now generate the implementation for [feature]."
```

This is documented in:
- `design.md` template (CRITICAL section at the top)
- All generation prompts (explicit instructions)
- Session prompt Part 1 (reading order enforced)

---

## Getting Started

### For NEW Projects (From Scratch)

**Step 1: Optional - Create PRD (if you don't have one)**
```bash
# Use discovery prompt to structure your idea
# Load: _setup/prompts/1-discovery.prompt.md
# Claude will guide you through creating PRD
```

**Step 2: Create Strategic Documents (IN ORDER)**
```bash
# 2.1 Create scope.md
# Template: _setup/templates/1-scope.template.md
# Or use: _setup/prompts/2-scope.prompt.md with your PRD

# 2.2 Create requirements.md  
# Template: _setup/templates/2-requirements.template.md
# Or use: _setup/prompts/3-requirements.prompt.md with scope.md

# 2.3 Create design.md
# Template: _setup/templates/3-design.template.md
# Or use: _setup/prompts/4-design.prompt.md with requirements.md
```

**Step 3: Generate Tracker**
```bash
# Use: _setup/prompts/5-tracker.prompt.md
# Input: design.md + scope.md + requirements.md
# Output: Complete task breakdown in tracker.md
```

**Step 4: Start First Session**
```bash
# Create your developer folder
mkdir -p session/{your-name}/current
mkdir -p session/{your-name}/archive

# Use: _setup/prompts/6-session.prompt.md
# Part 0: "Create ToDo for T-001, T-002" → generates todo.md
# Part 1: "Start session" → adds Opening Brief
# [Work happens...]
# Part 2: "Session complete" → generates Closing Report + handoff.md
```

### For EXISTING Projects (Adopting AIris)

**Step 1: Document Current State**

Order is flexible since the system already exists:

```bash
# 1.1 Document current architecture
# Create: docs/design.md (AS-IS state)
# Include: Current tech stack, patterns, technical debt analysis

# 1.2 Document current project goals  
# Create: docs/scope.md
# Include: Current vision, boundaries, success metrics

# 1.3 Document existing features
# Create: docs/requirements.md
# Include: What system does today, known requirements for new work
```

**Step 2: Generate Tracker for Remaining Work**
```bash
# Use: _setup/prompts/5-tracker.prompt.md
# Will generate:
# - Feature Development tasks (new functionality)
# - Architecture Improvement tasks (refactoring)
# - Technical Debt tasks (fixes)
# - Migration tasks (if proposing architecture changes)
```

**Step 3: Create Initial Handoff**
```bash
# Manually create: session/{your-name}/current/handoff.md
# Capture: Current project state, recent work, next steps
```

**Step 4: Continue with Session-Based Development**

Same as new projects - use session prompt for all future work.

---

## Multi-Developer Workflow

### Workspace Organization

Each developer maintains independent workspace:

```
session/
├── alice/
│   ├── current/
│   │   ├── todo.md      # Alice's active session
│   │   └── handoff.md   # Alice's context
│   └── archive/         # Alice's completed sessions
├── bob/  
│   ├── current/
│   │   ├── todo.md      # Bob's active session
│   │   └── handoff.md   # Bob's context
│   └── archive/         # Bob's completed sessions
└── shared/
    └── project-status.md  # Team coordination
```

### Session Workflow Per Developer

**1. Session Start (Part 0 & 1)**
```bash
# Alice starts her session
# Reads: docs/ (shared) + tracker.md (shared) + session/alice/handoff.md (personal)
# Creates: session/alice/current/todo.md with Opening Brief
```

**2. Work (Parallel)**
```bash
# Alice works on T-005, T-006 (feature branch: feature/alice-auth)
# Bob works on T-012, T-013 (feature branch: feature/bob-payments)
# Both propose tracker updates in their branches
```

**3. Session Close (Part 2)**
```bash
# Alice completes session
# Generates: Closing Report in todo.md
# Updates: session/alice/current/handoff.md
# Proposes: tracker.md updates (in her branch)
# Archives: Moves todo.md to session/alice/archive/session-005_2026-01-15.md
```

**4. Merge to Main**
```bash
# Alice merges feature branch
# Tracker conflicts expected (different tasks updated)
# Resolution: Keep both updates (merge, don't overwrite)
# Update: shared/project-status.md with consolidated state
```

### Tracker Update Strategy

**During Development (On Feature Branch):**
- AI proposes tracker updates in Closing Report
- Developer approves → AI updates tracker.md in feature branch
- Changes stay isolated until merge

**At Merge Time:**
- Merge conflicts in tracker.md are NORMAL
- Resolution: Keep both updates (Alice's + Bob's tasks)
- Different developers work on different tasks
- Update shared/project-status.md

**Reading Context:**
Each developer reads:
1. `docs/` (shared strategy - stable)
2. `docs/tracker.md` (shared tasks - latest from main)
3. `session/{developer}/handoff.md` (personal context)
4. `session/shared/project-status.md` (team status)

---

## Core Principles

### 1. Separation of Concerns by Time Horizon

- **Strategy** (months) - Stable, human-owned (Scope, Requirements, Design)
- **Tactics** (weeks) - Evolving, AI-generated (Tracker)
- **Execution** (hours) - Bounded by context window (ToDo)
- **Transfer** (each session) - Verified state only (Handoff)

### 2. Stateless AI, Stateful Documents

- AI models have no memory between sessions
- Documents provide persistent context
- Each session reads full context stack
- Handoff captures verified state only

### 3. Constraint-First Methodology

- Design.md establishes technical non-negotiables
- AI reads constraints BEFORE requirements
- Prevents generic "path of least resistance" solutions
- Ensures architectural coherence

### 4. Continuous Verification

- Every session ends with validation
- Only verified work moves to handoff
- Quality gates enforced at each step
- Evidence required (tests, CI, reviews)

### 5. Document Order Matters

**Creation Order (Human Logic):**
- Scope → Requirements → Design
- Cannot decide HOW without knowing WHAT

**Presentation Order (AI Context - The AIris Way):**
- Design → Scope → Requirements
- Technical constraints guide solution space

### 6. The AIris Vision

> "Clear vision comes from focus. Like the iris controls light to create clear sight, AIris controls context to create clear code."

---

## Benefits

- ✅ **Architectural Coherence** - Technical constraints enforced across all AI sessions
- ✅ **Clear Vision** - Like an iris focuses light, AIris focuses AI on what matters
- ✅ **Scope Control** - Clear boundaries prevent feature creep
- ✅ **Auditable Trail** - ADRs document why decisions were made
- ✅ **Consistent Patterns** - Security, quality, and performance standards applied uniformly
- ✅ **Fast Onboarding** - New team members read strategy docs to understand project
- ✅ **AI-Agnostic** - Works with Claude, GPT-4, Gemini, or any LLM
- ✅ **Scalable** - Supports multiple developers working in parallel
- ✅ **Adaptable** - Works for new projects and existing codebases
- ✅ **Context-Efficient** - Session docs stay within LLM context windows

---

## Source & Evolution

### Original Framework

Based on: [From Fast Code to Reliable Software: A Framework for AI-Assisted Development](https://dev.to/stanislav_komarovsky_b478/from-fast-code-to-reliable-software-a-framework-for-ai-assisted-development-2dle) by Stanislav Komarovsky

**Original Equation:**
```
Design.md + Scope.md → Tracker.md → Code
```

### Key Innovations by Phoenix Calibration

#### 1. Requirements.md as Separate Strategy Document

**Problem with original approach:**
- Scope.md mixing boundaries with detailed requirements
- Document size bloat (40+ pages)
- Update frequency mismatch (boundaries rarely change, requirements evolve)
- Context inefficiency for AI

**Our solution:**
- **scope.md** (~8 pages): Vision, boundaries, metrics, constraints
- **requirements.md** (~30 pages): User stories, business rules, data entities, UI/UX
- Proper separation of strategic boundaries vs operational specifications

**Updated equation:**
```
Design.md + Scope.md + Requirements.md → Tracker.md → Code
```

#### 2. Constraint-First Principle (The AIris Way)

**Problem:** AI suggests generic solutions when reading requirements before design.

**Our solution:** Document TWO orders:
- Creation order: Scope → Requirements → Design (human logic)
- Presentation order: Design → Scope → Requirements (AI context)

Documented in templates and prompts to ensure consistent application.

#### 3. Consolidated Prompts

**Evolution:** Reduced from 13+ prompts to 6 adaptive prompts
- Phase 1: 4 prompts (discovery, scope, requirements, design)
- Phase 2: 1 prompt (tracker)
- Phase 3: 1 unified prompt (session with 3 parts)

Each prompt adapts to:
- New vs existing projects
- Different project types
- Team size and workflow

#### 4. Multi-Developer Support

**Addition:** Per-developer workspaces with parallel development
- Independent todo.md and handoff.md per developer
- Shared project-status.md for coordination
- Tracker merge conflict strategy
- Session archiving per developer

#### 5. Unified Session Prompt

**Innovation:** Single prompt manages entire session lifecycle
- Part 0: Create ToDo (lightweight task selection)
- Part 1: Start Session (full context read + Opening Brief)
- Part 2: Close Session (Closing Report + Handoff + Tracker updates)

Eliminates need for separate prompts for each session moment.

#### 6. AIris Branding & Philosophy

**Innovation:** Clear metaphor and branding
- "AIris" = AI + Iris (vision organ)
- Emphasizes focus and clarity in AI-assisted development
- Constraint-first as "focusing the light" before coding
- Architecture-first messaging

### Other Enhancements

- PRD template for projects without formal requirements
- Session archiving strategy
- Business rules as explicit requirement category
- Data entities from functional perspective
- Integration requirements section
- Existing project support with AS-IS + TO-BE documentation

---

## License & Status

**License:** Private - Phoenix Calibration

**Status:** ✅ Production Ready
- All 7 templates complete
- All 6 prompts complete
- Documentation complete
- Multi-developer workflow tested
- Complete AIris branding

**Version:** 1.0 (January 2026)

---

## Quick Reference

### Document Flow
```
PRD (optional) → Scope → Requirements → Design → Tracker → ToDo → Handoff
```

### AI Context Order (The AIris Way)
```
Design (constraints) → Scope (boundaries) → Requirements (features)
```

### File Locations
```
Templates:     .airis/_setup/templates/*.template.md
Prompts:       .airis/_setup/prompts/*.prompt.md
Instructions:  .airis/_setup/instructions/*.instructions.md
Docs:          .airis/docs/*.md
Sessions:      .airis/session/{developer}/current/*.md
```

### Time Estimates
```
PRD:          2-4 hours (optional)
Scope:        4-6 hours
Requirements: 6-10 hours
Design:       6-10 hours
Tracker:      1-2 hours (AI-generated)
Session:      1-6 hours (per session)
```

---

**Ready to start?** Copy `.airis/` to your project and follow the Getting Started guide above.

**See clearly. Build confidently.** 👁️
