# AI-Assisted Development Framework

Framework for maintaining architectural coherence across AI-assisted development sessions through document-driven structure.

## Framework Structure

```
.ai-framework/
├── strategy/              # Strategic documents (human-created, rarely updated)
│   ├── design.md         # Technical architecture, ADRs, patterns
│   ├── scope.md          # Project vision, goals, boundaries
│   └── requirements.md   # Functional requirements, user stories, business rules
│
├── tactics/              # Tactical roadmap (AI-generated from strategy)
│   └── tracker.md        # Global task registry
│
├── session/              # Session execution (updated each session)
│   ├── current/          # Active session files
│   │   ├── todo.md      # Current session plan
│   │   └── handoff.md   # State transfer
│   └── archive/          # Historical sessions
│       └── session-XXX_YYYY-MM-DD.md
│
└── _setup/               # Reusable framework components
    ├── templates/        # Empty templates for each document
    ├── prompts/          # AI prompts for generation
    └── README.md         # Setup documentation
```

## Document Hierarchy

### Layer 1: Strategic Foundation (Human-Created)
- **design.md** - Architecture, patterns, tech stack, ADRs (~10 pages)
- **scope.md** - Vision, goals, success metrics, boundaries (~8 pages)
- **requirements.md** - Functional requirements, user stories, business rules, UI/UX (~30 pages)

### Layer 2: Tactical Roadmap (AI-Generated)
- **tracker.md** - All tasks derived from Design + Scope + Requirements

### Layer 3: Session Execution (Context-Sized)
- **todo.md** - Subset of Tracker tasks for current session

### Layer 4: Session Continuity (Transfer Mechanism)
- **handoff.md** - Verified state and results from last session

## Generation Flow

```
HUMAN CREATES:
├── design.md      → How to build (architecture)
├── scope.md       → Why & boundaries (vision, limits)
└── requirements.md → What to build (detailed functionality)
        ↓
AI GENERATES:
└── tracker.md     → How to implement (specific tasks)
        ↓
AI EXECUTES:
└── todo.md        → Today's work (subset of tracker)
        ↓
AI TRANSFERS:
└── handoff.md     → Verified results for next session
```

## Quick Start

### For New Projects
1. Copy templates from `_setup/templates/` to respective folders
2. Fill out `design.md` (architecture)
3. Fill out `scope.md` (vision & boundaries)
4. Fill out `requirements.md` (functional details)
5. Use AI prompt to generate `tracker.md` from the three strategy documents
6. Start first session with `todo.md`

### For Existing Projects
1. Document current architecture in `design.md`
2. Document current goals in `scope.md`
3. Document existing requirements in `requirements.md`
4. Generate `tracker.md` for remaining work
5. Create `handoff.md` capturing current state
6. Continue with session-based development

## Core Principles

1. **Separation of Concerns by Time Horizon**
   - Strategy (months) - Stable, human-owned (Design, Scope, Requirements)
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

## Benefits

- ✅ Architectural coherence across sessions
- ✅ Auditable decision trail (ADRs)
- ✅ Consistent security and quality patterns
- ✅ Fast onboarding for new team members
- ✅ Works with any AI model or platform
- ✅ Complete functional context for task generation

## Source & Enhancements

### Original Framework

Based on: [From Fast Code to Reliable Software: A Framework for AI-Assisted Development](https://dev.to/stanislav_komarovsky_b478/from-fast-code-to-reliable-software-a-framework-for-ai-assisted-development-2dle)

The original framework uses:
- Design.md + Scope.md → Tracker.md

### Key Enhancement: Requirements.md

**Why we added Requirements.md as a third strategy document:**

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
Design.md (how) + Scope.md (why/boundaries) + Requirements.md (what) → Tracker.md
```

This maintains the framework's core principle of "Stateless AI, Stateful Documents" while providing the detail needed to generate comprehensive, accurate task lists.

### Other Enhancements

- **Session archiving**: Automated commands to archive completed sessions
- **Development workflows**: Environment strategy (dev/test/staging/prod)
- **Project type support**: Frontend, backend, fullstack, integrations
- **Repository strategies**: Monorepo and polyrepo configurations
- **Business rules**: Explicit section for business logic constraints
- **Data entities**: Domain model from functional perspective

All enhancements maintain coherence with the original framework's principles while extending its applicability to real-world software projects.
