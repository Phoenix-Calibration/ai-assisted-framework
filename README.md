# AI-Assisted Development Framework

A structured approach to AI-assisted development that prevents architectural drift, scope creep, and inconsistent technical decisions across sessions.

**Key Innovation:** Constraint-first methodology that ensures technical decisions guide AI suggestions rather than AI suggesting generic "path of least resistance" solutions.

---

## What is This?

This repository contains a complete implementation of the AI-Assisted Development Framework - a document-driven system that maintains architectural coherence across AI-assisted development sessions.

The framework separates:
- **What humans decide**: Architecture, boundaries, requirements
- **What AI generates**: Task breakdown, implementation plans  
- **What AI executes**: Session-based development work

---

## Quick Start

**📖 Complete Documentation:** [.ai-framework/README.md](.ai-framework/README.md)

**🎯 Core Concept:** Three phases with six prompts
- **Phase 1:** Construction (4 prompts) - Build strategic documents
- **Phase 2:** Tactical Generation (1 prompt) - Generate task tracker
- **Phase 3:** Session Execution (1 prompt) - Manage development sessions

---

## Repository Structure

```
.ai-framework/
├── README.md              # 📖 Complete framework documentation
│
├── _setup/                # Reusable components
│   ├── templates/         # 7 document templates
│   └── prompts/           # 6 AI prompts
│
├── docs/                  # Your project's strategy documents
│   ├── design.md          # Architecture & constraints
│   ├── scope.md           # Vision & boundaries
│   ├── requirements.md    # Features & user stories
│   └── tracker.md         # Task registry
│
└── session/               # Development sessions
    ├── {developer}/       # Per-developer workspace
    └── shared/            # Team coordination
```

---

## Quick Links

- 📖 **[Framework Documentation](.ai-framework/README.md)** - Complete guide
- 📝 **[Templates](.ai-framework/_setup/templates/)** - 7 document templates
- 🤖 **[AI Prompts](.ai-framework/_setup/prompts/)** - 6 generation prompts
- 📊 **[Project Docs](.ai-framework/docs/)** - Example placeholders

---

## How to Use

### For a New Project

1. **Copy framework** to your project:
   ```bash
   cp -r .ai-framework/ /your-project/
   ```

2. **Create strategic documents** (in order):
   - `docs/scope.md` - Define vision and boundaries
   - `docs/requirements.md` - Detail features and stories
   - `docs/design.md` - Make technical decisions

3. **Generate tracker**:
   - Use AI prompt: `5-tracker.prompt.md`
   - Get complete task breakdown

4. **Start developing**:
   - Use AI prompt: `6-session.prompt.md`
   - Work in session-based cycles

### For an Existing Project

1. **Copy framework** to your project root
2. **Document current state**:
   - `docs/design.md` - Current architecture (AS-IS + TO-BE)
   - `docs/scope.md` - Current vision and goals
   - `docs/requirements.md` - Existing and new features
3. **Generate tracker** for remaining work
4. **Continue** with session-based development

📖 **[See detailed guides](.ai-framework/README.md#getting-started)**

---

## Framework Flow

```
Human Creates Strategy (Scope → Requirements → Design)
             ↓
AI Generates Tactics (Tracker with all tasks)
             ↓
AI Executes Sessions (ToDo → Work → Handoff)
             ↓
          Repeat
```

**Key Principle:** AI reads documents in constraint-first order:
1. Design (technical constraints) 
2. Scope (boundaries)
3. Requirements (features)

This prevents AI from suggesting solutions that violate your architecture.

---

## Key Features

### 🎯 Constraint-First Methodology
- Technical decisions guide AI suggestions
- Prevents generic "path of least resistance" solutions
- Maintains architectural coherence

### 📚 Document Hierarchy
- **Strategy** (months) - Scope, Requirements, Design
- **Tactics** (weeks) - Task Tracker
- **Execution** (hours) - Session ToDo
- **Transfer** (per session) - Handoff state

### 🤖 6 Consolidated Prompts
- Phase 1: 4 prompts for strategic documents
- Phase 2: 1 prompt for tracker generation
- Phase 3: 1 unified prompt for session lifecycle

### 👥 Multi-Developer Support
- Per-developer workspaces
- Parallel development workflows
- Shared team coordination

### 🔄 Session Lifecycle
- **Part 0:** Create ToDo (task selection)
- **Part 1:** Start Session (context read + planning)
- **Part 2:** Close Session (reports + state transfer)

---

## Benefits

- ✅ **Architectural Coherence** - Technical constraints enforced across all sessions
- ✅ **Scope Control** - Clear boundaries prevent feature creep
- ✅ **Auditable Trail** - ADRs document all technical decisions
- ✅ **Fast Onboarding** - New team members read strategy docs
- ✅ **AI-Agnostic** - Works with Claude, GPT-4, Gemini, any LLM
- ✅ **Multi-Developer** - Parallel workflows with conflict resolution
- ✅ **Adaptable** - Works for new projects and existing codebases

---

## Documentation

### Main Documentation
- **[Framework Guide](.ai-framework/README.md)** - Complete documentation
- **[Getting Started](.ai-framework/README.md#getting-started)** - Setup guides
- **[Constraint-First Principle](.ai-framework/README.md#the-constraint-first-principle)** - Core methodology
- **[Multi-Developer Workflow](.ai-framework/README.md#multi-developer-workflow)** - Team collaboration

### Templates & Prompts
- **[Templates](.ai-framework/_setup/templates/)** - All 7 document templates
- **[Prompts](.ai-framework/_setup/prompts/)** - All 6 AI prompts

### Example Documents
- **[Project Docs](.ai-framework/docs/)** - Placeholder examples
- **[Session Structure](.ai-framework/session/)** - Workspace organization

---

## Source & Credits

**Based on:** [From Fast Code to Reliable Software: A Framework for AI-Assisted Development](https://dev.to/stanislav_komarovsky_b478/from-fast-code-to-reliable-software-a-framework-for-ai-assisted-development-2dle) by Stanislav Komarovsky

**Enhanced by:** Phoenix Calibration Team

**Key Enhancements:**
- Requirements.md as separate strategic document
- Constraint-first methodology (dual document ordering)
- Consolidated prompts (6 vs 13+ original)
- Multi-developer workspaces
- Unified session prompt with 3-part lifecycle

---

## Status

**Version:** 1.0 (January 2026)

**Status:** ✅ Production Ready
- ✅ All 7 templates complete
- ✅ All 6 prompts complete  
- ✅ Documentation complete
- ✅ Multi-developer workflow tested

---

## License

**Private** - Phoenix Calibration

---

## Get Started

1. **Read the docs:** [.ai-framework/README.md](.ai-framework/README.md)
2. **Copy to your project:** `cp -r .ai-framework/ /your-project/`
3. **Follow the guide:** [Getting Started](.ai-framework/README.md#getting-started)

**Questions?** See the [Quick Reference](.ai-framework/README.md#quick-reference) section.
