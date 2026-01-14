# AI-Assisted Development Framework

Framework for maintaining architectural coherence across AI-assisted development sessions through document-driven structure.

## Framework Structure

```
.ai-framework/
├── _discovery/           # Optional: Pre-framework research (Phase 0)
│   ├── business-context.md
│   ├── problem-statement.md
│   └── initial-requirements.md
│
├── strategy/              # Strategic documents (human-created, rarely updated)
│   ├── scope.md          # Project vision, goals, boundaries (CREATE FIRST)
│   ├── requirements.md   # Functional requirements, user stories (CREATE SECOND)
│   └── design.md         # Technical architecture, ADRs, patterns (CREATE THIRD)
│
├── tactics/              # Tactical roadmap (AI-generated from strategy)
│   └── tracker.md        # Global task registry
│
├── session/              # Session execution (updated each session)
│   ├── {developer-id}/   # Per-developer session space
│   │   ├── current/
│   │   │   ├── todo.md      # Current session plan
│   │   │   └── handoff.md   # Personal state transfer
│   │   └── archive/
│   │       └── session-XXX_YYYY-MM-DD.md
│   └── shared/
│       └── project-status.md  # Consolidated team status
│
└── _setup/               # Reusable framework components
    ├── templates/        # Empty templates for each document
    ├── prompts/          # AI prompts for generation
    └── README.md         # Setup documentation
```

## Document Hierarchy

### Layer 0: Discovery (Optional, Pre-Framework)
- **business-context.md** - Problem statement, target users, business goals
- **problem-statement.md** - Detailed problem analysis
- **initial-requirements.md** - High-level feature list

### Layer 1: Strategic Foundation (Human-Created)
- **scope.md** - Vision, goals, success metrics, boundaries (~8 pages)
- **requirements.md** - Functional requirements, user stories, business rules, UI/UX (~30 pages)
- **design.md** - Architecture, patterns, tech stack, ADRs (~10 pages)

### Layer 2: Tactical Roadmap (AI-Generated)
- **tracker.md** - All tasks derived from Scope + Requirements + Design

### Layer 3: Session Execution (Context-Sized)
- **todo.md** - Subset of Tracker tasks for current session (per developer)

### Layer 4: Session Continuity (Transfer Mechanism)
- **handoff.md** - Verified state and results from last session (per developer)
- **project-status.md** - Consolidated team status (shared)

## Generation Flow

```
PHASE 0 (Optional): Discovery
└── Business Context + Problem Statement + Initial Requirements
        ↓
PHASE 1: Strategic Foundation (CORRECT ORDER)
├── 1. scope.md         → WHY we're building & boundaries
├── 2. requirements.md  → WHAT we're building (details)
└── 3. design.md        → HOW we're building (architecture)
        ↓
PHASE 2: Tactical Planning
└── tracker.md (AI-generated from Scope + Requirements + Design)
        ↓
PHASE 3: Execution
└── todo.md → Today's work (subset of tracker)
        ↓
PHASE 4: Continuity
└── handoff.md → Verified results for next session
```

## Getting Started

### For NEW Projects (From Scratch)

**Phase 0: Discovery (Outside Framework) - OPTIONAL BUT RECOMMENDED**

Before using this framework, you need basic project clarity. This typically comes from:
- Product Requirements Document (PRD)
- Business Case  
- Discovery workshops
- Stakeholder interviews
- Market research

If you don't have formal documentation, use the optional `_discovery/` templates to capture:
- Problem statement (what problem are we solving?)
- Target users (who will use this?)
- Business goals (why are we building this?)
- High-level features (what are the main capabilities?)
- Constraints (budget, timeline, team size)

**Phase 1: Create Strategy Documents (IN THIS ORDER)**

⚠️ **IMPORTANT:** Follow this sequence - you can't decide HOW to build (Design) before knowing WHAT to build (Scope + Requirements)

**1. Scope.md FIRST** - Define WHAT and WHY
   - Project vision and goals
   - Boundaries (in/out scope)
   - Success metrics and SLOs
   - Stakeholders and constraints
   - **Source:** PRD, business context, discovery notes

**2. Requirements.md SECOND** - Detail the WHAT
   - Functional requirements (features in detail)
   - User stories and acceptance criteria
   - Business rules and validation logic
   - Data entities and relationships
   - UI/UX considerations
   - **Source:** Scope.md + PRD + user research

**3. Design.md THIRD** - Decide HOW
   - Architecture patterns (based on requirements)
   - Tech stack choices (based on constraints from Scope)
   - ADRs documenting why we chose X over Y
   - Coding standards and quality gates
   - Security and performance guidelines
   - **Source:** Scope.md + Requirements.md + technical expertise

**Phase 2: Generate Tactical Plan**

4. Use AI to generate **tracker.md** from the three strategy documents
5. Review and refine the generated tasks

**Phase 3: Start Development Sessions**

6. Create your developer folder: `session/{your-name}/`
7. Create first `todo.md` with initial tasks
8. Begin AI-assisted development

### For EXISTING Projects (Adopting Framework)

Document your current state - order is flexible since the system already exists:

**1. Design.md** - Document current architecture
   - Current tech stack
   - Existing patterns and conventions
   - Document past decisions as ADRs

**2. Scope.md** - Document current goals
   - Current project vision
   - What's in/out of scope NOW
   - Current success metrics

**3. Requirements.md** - Document existing features
   - What the system does today
   - Known requirements for upcoming work
   - Business rules currently implemented

**4. Generate Tracker.md** - For remaining/new work only

**5. Create initial Handoff.md** - Capture current state

**6. Continue with session-based development**

## Multi-Developer Workflow

### Session Organization

Each developer maintains their own workspace:
```
session/
├── alice/
│   ├── current/
│   │   ├── todo.md      (Alice's current tasks)
│   │   └── handoff.md   (Alice's personal context)
│   └── archive/
├── bob/
│   ├── current/
│   │   ├── todo.md      (Bob's current tasks)
│   │   └── handoff.md   (Bob's personal context)
│   └── archive/
└── shared/
    └── project-status.md (Team-wide status, updated at merge)
```

### Tracker Updates

**During development (on feature branch):**
- Each developer's AI proposes tracker updates in their Closing Report
- Developer approves → AI updates tracker.md in their branch
- Changes stay isolated until merge

**At merge time:**
- Merge conflicts in tracker.md are expected and normal
- Resolve by keeping both updates (different tasks)
- Update shared/project-status.md with consolidated info

### Reading Context at Session Start

Each developer reads:
1. **strategy/** documents (shared, stable)
2. **tactics/tracker.md** (shared, latest from main)
3. **session/{developer}/current/handoff.md** (personal context)
4. **session/shared/project-status.md** (team context)

## Core Principles

1. **Separation of Concerns by Time Horizon**
   - Discovery (weeks) - Optional, pre-framework research
   - Strategy (months) - Stable, human-owned (Scope, Requirements, Design)
   - Tactics (weeks) - Evolving, AI-generated (Tracker)
   - Execution (hours) - Bounded by context window (ToDo)
   - Transfer (each session) - Verified state only (Handoff)

2. **Stateless AI, Stateful Documents**
   - AI models have no memory between sessions
   - Documents provide persistent context
   - Each session reads full context stack

3. **Continuous Verification**
   - Every session ends with validation
   - Only verified work moves to handoff
   - Quality gates enforced at each step

4. **Correct Document Creation Order**
   - Scope before Requirements (know boundaries before details)
   - Requirements before Design (know WHAT before deciding HOW)
   - Never start with Design (you can't architect what you don't understand)

## Benefits

- ✅ Architectural coherence across sessions
- ✅ Auditable decision trail (ADRs)
- ✅ Consistent security and quality patterns
- ✅ Fast onboarding for new team members
- ✅ Works with any AI model or platform
- ✅ Complete functional context for task generation
- ✅ Scales to multiple developers working in parallel
- ✅ Clear document creation sequence prevents premature architecture decisions

## Source & Enhancements

### Original Framework

Based on: [From Fast Code to Reliable Software: A Framework for AI-Assisted Development](https://dev.to/stanislav_komarovsky_b478/from-fast-code-to-reliable-software-a-framework-for-ai-assisted-development-2dle)

The original framework uses:
- Design.md + Scope.md → Tracker.md

### Key Enhancements

#### 1. Requirements.md as Separate Strategy Document

**Why we added Requirements.md:**

The original framework implies functional requirements within Scope.md (e.g., "In Scope: Payments, refunds, dispute handling"). Our analysis showed this approach doesn't scale for real-world projects:

**Challenges with requirements in Scope.md:**
- 📄 Document size: Scope + detailed requirements = 40+ pages
- 🔄 Update frequency mismatch: Scope changes rarely (months), requirements evolve frequently (weeks)
- 🧠 Context efficiency: AI must read entire document to find boundaries
- 🗂️ Maintainability: Every requirement change touches the "strategic" Scope document

**Solution: Separate Requirements.md:**
- ✅ **Scope.md stays concise** (~8 pages): Vision, goals, boundaries, metrics
- ✅ **Requirements.md contains details** (~30 pages): User stories, business rules, flows, UI/UX
- ✅ **Proper separation of concerns**: Strategic boundaries vs. operational specifications
- ✅ **Scalability**: Works for both MVPs and enterprise projects
- ✅ **Clear update patterns**: Scope = rare, Requirements = iterative

**Updated generation equation:**
```
Scope.md (why/boundaries) + Requirements.md (what) + Design.md (how) → Tracker.md
```

#### 2. Document Creation Order

**Why order matters:**

The original article doesn't specify document creation order, which can lead to:
- Premature architecture decisions before understanding requirements
- Rework when requirements don't fit chosen architecture
- Unclear scope boundaries affecting design choices

**Our enhancement:**
- Explicit sequence: Scope → Requirements → Design
- Rationale documented in README
- Templates numbered to reinforce order

#### 3. Multi-Developer Support

**Why we added per-developer workspaces:**

The original framework assumes single-developer usage. Real teams need:
- Isolated todo.md and handoff.md per developer
- Shared project-status.md for coordination
- Tracker.md merge conflict resolution strategy

#### 4. Discovery Phase

**Why we added optional _discovery/ folder:**

The original framework assumes you already know what to build. We added optional templates for:
- Teams starting from scratch without formal PRD
- Bridge between business idea and technical framework
- Capturing initial research before committing to strategy documents

### Other Enhancements

- **Session archiving**: Automated commands to archive completed sessions
- **Development workflows**: Environment strategy (dev/test/staging/prod)
- **Project type support**: Frontend, backend, fullstack, integrations
- **Repository strategies**: Monorepo and polyrepo configurations
- **Business rules**: Explicit section for business logic constraints
- **Data entities**: Domain model from functional perspective

All enhancements maintain coherence with the original framework's principles while extending its applicability to real-world software projects.
