# AIris

**Clear vision for AI-assisted development**

A constraint-first framework that ensures AI understands your architecture before suggesting code. Like the human iris focuses light to create clear vision, AIris focuses AI on your technical constraints to create coherent, maintainable software.

---

## What is AIris?

AIris is a document-driven framework for AI-assisted development that prevents common pitfalls like architectural drift, scope creep, and inconsistent technical decisions across sessions.

**The Problem:** When AI reads requirements before understanding technical constraints, it suggests generic "path of least resistance" solutions that often violate your architectural decisions.

**The AIris Solution:** Architecture-first AI development. See the structure before writing code.

---

## Key Innovation

**Constraint-First Methodology:** AIris ensures technical decisions guide AI suggestions rather than AI suggesting generic solutions.

```
Traditional AI Development:
User: "I need a chat feature"
AI: "Let's use Firebase!" ❌
(Ignores your FastAPI + PostgreSQL architecture)

With AIris:
AI reads: design.md → "FastAPI + PostgreSQL only"
Then reads: requirements.md → "Need chat feature"
AI suggests: "Server-Sent Events in FastAPI" ✅
(Respects your constraints)
```

---

## Quick Start

**📖 Complete Documentation:** [.airis/README.md](.airis/README.md)

**🎯 Core Concept:** Three phases with six prompts
- **Phase 1:** Construction (4 prompts) - Build strategic documents
- **Phase 2:** Tactical Generation (1 prompt) - Generate task tracker
- **Phase 3:** Session Execution (1 prompt) - Manage development sessions

---

## Repository Structure

```
.airis/
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

- 📖 **[Framework Documentation](.airis/README.md)** - Complete guide
- 📝 **[Templates](.airis/_setup/templates/)** - 7 document templates
- 🤖 **[AI Prompts](.airis/_setup/prompts/)** - 6 generation prompts
- 📊 **[Project Docs](.airis/docs/)** - Example placeholders

---

## How to Use

### For a New Project

1. **Copy AIris** to your project:
   ```bash
   cp -r .airis/ /your-project/
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

1. **Copy AIris** to your project root
2. **Document current state**:
   - `docs/design.md` - Current architecture (AS-IS + TO-BE)
   - `docs/scope.md` - Current vision and goals
   - `docs/requirements.md` - Existing and new features
3. **Generate tracker** for remaining work
4. **Continue** with session-based development

📖 **[See detailed guides](.airis/README.md#getting-started)**

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

**The AIris Principle:** AI reads documents in constraint-first order:
1. **Design** (technical constraints - non-negotiable)
2. **Scope** (project boundaries)
3. **Requirements** (features to implement)

This ensures AI suggestions respect your architecture.

---

## Key Features

### 👁️ Constraint-First Methodology
- Technical decisions guide AI suggestions
- Prevents generic "path of least resistance" solutions
- Maintains architectural coherence across all sessions

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
- ✅ **Clear Vision** - Like an iris focuses light, AIris focuses AI on what matters
- ✅ **Scope Control** - Clear boundaries prevent feature creep
- ✅ **Auditable Trail** - ADRs document all technical decisions
- ✅ **Fast Onboarding** - New team members read strategy docs
- ✅ **AI-Agnostic** - Works with Claude, GPT-4, Gemini, any LLM
- ✅ **Multi-Developer** - Parallel workflows with conflict resolution
- ✅ **Adaptable** - Works for new projects and existing codebases

---

## Documentation

### Main Documentation
- **[AIris Guide](.airis/README.md)** - Complete framework documentation
- **[Getting Started](.airis/README.md#getting-started)** - Setup guides
- **[Constraint-First Principle](.airis/README.md#the-constraint-first-principle)** - Core methodology
- **[Multi-Developer Workflow](.airis/README.md#multi-developer-workflow)** - Team collaboration

### Templates & Prompts
- **[Templates](.airis/_setup/templates/)** - All 7 document templates
- **[Prompts](.airis/_setup/prompts/)** - All 6 AI prompts

### Example Documents
- **[Project Docs](.airis/docs/)** - Placeholder examples
- **[Session Structure](.airis/session/)** - Workspace organization

---

## Source & Credits

**Based on:** [From Fast Code to Reliable Software: A Framework for AI-Assisted Development](https://dev.to/stanislav_komarovsky_b478/from-fast-code-to-reliable-software-a-framework-for-ai-assisted-development-2dle) by Stanislav Komarovsky

**Developed by:** Phoenix Calibration Team

**Key Innovations:**
- ✨ Constraint-first methodology (dual document ordering)
- ✨ Requirements.md as separate strategic document
- ✨ Consolidated prompts (6 vs 13+ original)
- ✨ Multi-developer workspaces
- ✨ Unified session prompt with 3-part lifecycle
- ✨ Architecture-first naming and branding (AIris)

---

## Philosophy

> "Like the human iris controls how much light enters the eye to create clear vision, AIris controls how AI reads your project documents to create clear, coherent software."

**The AIris Way:**
1. **See clearly** - Architecture and constraints first
2. **Focus precisely** - Boundaries and scope defined
3. **Build confidently** - Requirements guide implementation

---

## Status

**Version:** 1.0 (January 2026)

**Status:** ✅ Production Ready
- ✅ All 7 templates complete
- ✅ All 6 prompts complete  
- ✅ Documentation complete
- ✅ Multi-developer workflow tested
- ✅ Full rebranding to AIris

---

## License

**Private** - Phoenix Calibration

---

## Get Started

1. **Read the docs:** [.airis/README.md](.airis/README.md)
2. **Copy to your project:** `cp -r .airis/ /your-project/`
3. **Follow the guide:** [Getting Started](.airis/README.md#getting-started)

**Ready to see clearly?** 👁️ Let AIris guide your AI-assisted development.

---

**Questions?** See the [Quick Reference](.airis/README.md#quick-reference) section.