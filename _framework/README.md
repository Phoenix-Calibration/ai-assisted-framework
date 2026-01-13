# AI-Assisted Development Framework

Framework for maintaining architectural coherence across AI-assisted development sessions through document-driven structure.

## Framework Structure

```
_framework/
├── strategy/              # Strategic documents (human-created, rarely updated)
│   ├── design.md         # Technical architecture, ADRs, patterns
│   └── scope.md          # Project vision, goals, boundaries
│
├── tactics/              # Tactical roadmap (AI-generated from strategy)
│   └── tracker.md        # Global task registry
│
├── session/              # Session execution (updated each session)
│   ├── todo.md          # Current session plan
│   └── handoff.md       # State transfer between sessions
│
└── _setup/               # Reusable framework components
    ├── templates/        # Empty templates for each document
    ├── prompts/          # AI prompts for generation
    └── README.md         # Setup documentation
```

## Document Hierarchy

### Layer 1: Strategic Foundation (Human-Created)
- **design.md** - Architecture, patterns, tech stack, ADRs
- **scope.md** - Vision, goals, success metrics, boundaries

### Layer 2: Tactical Roadmap (AI-Generated)
- **tracker.md** - All tasks derived from Design + Scope

### Layer 3: Session Execution (Context-Sized)
- **todo.md** - Subset of Tracker tasks for current session

### Layer 4: Session Continuity (Transfer Mechanism)
- **handoff.md** - Verified state and results from last session

## Quick Start

### For New Projects
1. Copy templates from `_setup/templates/` to respective folders
2. Fill out `design.md` and `scope.md`
3. Use prompts to generate `tracker.md`
4. Start first session with `todo.md`

### For Existing Projects
1. Document current architecture in `design.md`
2. Document current goals in `scope.md`
3. Generate `tracker.md` for remaining work
4. Create `handoff.md` capturing current state
5. Continue with session-based development

## Core Principles

1. **Separation of Concerns by Time Horizon**
   - Strategy (months) - Stable, human-owned
   - Tactics (weeks) - Evolving, AI-generated
   - Execution (hours) - Bounded by context window
   - Transfer (each session) - Verified state only

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

## Source

Based on: [From Fast Code to Reliable Software: A Framework for AI-Assisted Development](https://dev.to/stanislav_komarovsky_b478/from-fast-code-to-reliable-software-a-framework-for-ai-assisted-development-2dle)
