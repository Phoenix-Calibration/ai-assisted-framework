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
Then reads: scope.md → "Need chat feature"
AI suggests: "Server-Sent Events in FastAPI" ✅
(Respects your constraints)
```

---

## Framework Structure

After installation, you'll have:

```
.airis/
├── FRAMEWORK.md                   # Complete framework documentation
├── _setup/
│   ├── templates/                 # 6 document templates
│   │   ├── 0-PRD.template.md
│   │   ├── 1-scope.template.md      # Vision, boundaries & features
│   │   ├── 2-design.template.md
│   │   ├── 3-tracker.template.md
│   │   ├── 4-todo.template.md
│   │   └── 5-handoff.template.md
│   ├── prompts/                   # 5 AI prompts
│   │   ├── 1-discovery.prompt.md
│   │   ├── 2-scope.prompt.md        # Generates scope with features
│   │   ├── 3-design.prompt.md
│   │   ├── 4-tracker.prompt.md      # Expands features into detailed tasks
│   │   └── 5-session.prompt.md
│   └── instructions/              # Claude Project instructions
│       ├── airis-integration.instructions.md
│       └── airis-session.instructions.md
├── docs/                          # Placeholder examples
└── session/                       # Session workspace
```

---

## Quick Start

### **Step 1: Install AIris** (see above)

### **Step 2: Read the Docs**
```bash
# Main documentation
.airis/FRAMEWORK.md

# Installation guide
INSTALLATION.md
```

### **Step 3: Create Your Strategy Documents**

**For NEW projects:**
1. Create `docs/scope.md` - Define vision, boundaries, and features (high-level)
2. Create `docs/design.md` - Make technical decisions

**For EXISTING projects:**
1. Document current vision and features in `docs/scope.md`
2. Document current architecture in `docs/design.md`

### **Step 4: Use AI Prompts**

Copy prompts from `.airis/_setup/prompts/` into your AI chat to generate your documents.

📖 **[Complete Guide](.airis/README.md)**

---

## Framework Flow

```
Human Creates Strategy (Scope with features → Design)
             ↓
AI Generates Tactics (Tracker with detailed acceptance criteria)
             ↓
AI Executes Sessions (ToDo → Work → Handoff)
             ↓
          Repeat
```

**The AIris Principle:** AI reads documents in constraint-first order:
1. **Design** (technical constraints - non-negotiable)
2. **Scope** (project boundaries + features)

This ensures AI suggestions respect your architecture.

---

## Key Features

### 👁️ Constraint-First Methodology
- Technical decisions guide AI suggestions
- Prevents generic "path of least resistance" solutions
- Maintains architectural coherence across all sessions

### 📚 Document Hierarchy
- **Strategy** (months) - Scope (with features), Design
- **Tactics** (weeks) - Task Tracker (with detailed criteria)
- **Execution** (hours) - Session ToDo
- **Transfer** (per session) - Handoff state

### 🤖 5 Consolidated Prompts
- Phase 1: 3 prompts for strategic documents
- Phase 2: 1 prompt for tracker generation (expands features into detailed tasks)
- Phase 3: 1 unified prompt for session lifecycle

### 👥 Multi-Developer Support
- Per-developer workspaces
- Parallel development workflows
- Shared team coordination

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
- **[AIris Framework Guide](.airis/FRAMEWORK.md)** - Complete framework documentation
- **[Installation Guide](INSTALLATION.md)** - Detailed setup instructions
- **[Getting Started](.airis/FRAMEWORK.md#getting-started)** - Quick start guide

### Templates & Prompts
- **[Templates](.airis/_setup/templates/)** - All 6 document templates
- **[Prompts](.airis/_setup/prompts/)** - All 5 AI prompts
- **[Instructions](.airis/_setup/instructions/)** - Claude Project integration guides

---

## Philosophy

> "Like the human iris controls how much light enters the eye to create clear vision, AIris controls how AI reads your project documents to create clear, coherent software."

**The AIris Way:**
1. **See clearly** - Architecture and constraints first
2. **Focus precisely** - Boundaries and features defined
3. **Build confidently** - Detailed tasks guide implementation

---

## 🚀 Quick Install

Choose your preferred method:

### **Option 1: Installation Script (Recommended)**

**Windows (PowerShell):**
```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Phoenix-Calibration/ai-assisted-framework/main/install-airis.ps1" -OutFile "install-airis.ps1"
.\install-airis.ps1
```

**Linux/Mac (Bash):**
```bash
curl -O https://raw.githubusercontent.com/Phoenix-Calibration/ai-assisted-framework/main/install-airis.sh
chmod +x install-airis.sh
./install-airis.sh
```

### **Option 2: One-Line Command**

**Windows:**
```powershell
git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis; Copy-Item -Path "temp-airis\.airis" -Destination "." -Recurse; Remove-Item -Path "temp-airis" -Recurse -Force
```

**Linux/Mac:**
```bash
git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis && cp -r temp-airis/.airis . && rm -rf temp-airis
```

### **Option 3: NPM/Node.js Projects**

```bash
# Coming soon - will be available as NPM package
# npx install-airis
```

📖 **[Full Installation Guide](INSTALLATION.md)**

---

## Source & Credits

**Based on:** [From Fast Code to Reliable Software: A Framework for AI-Assisted Development](https://dev.to/stanislav_komarovsky_b478/from-fast-code-to-reliable-software-a-framework-for-ai-assisted-development-2dle) by Stanislav Komarovsky

**Developed by:** Phoenix Calibration Team

**Key Innovations:**
- ✨ Constraint-first methodology (dual document ordering)
- ✨ Scope.md with integrated features section (aligned with original framework)
- ✨ Tracker generates detailed acceptance criteria from features
- ✨ Consolidated prompts (5 vs 13+ original)
- ✨ Multi-developer workspaces
- ✨ Unified session prompt with 3-part lifecycle
- ✨ Architecture-first naming and branding (AIris)

---

## Status

**Version:** 2.0 (February 2026)

**Status:** ✅ Production Ready
- ✅ All 6 templates complete
- ✅ All 5 prompts complete
- ✅ Documentation complete
- ✅ Multi-developer workflow tested
- ✅ Installation scripts ready
- ✅ Simplified structure (aligned with original framework)

---

## Support

### Resources
- **Documentation:** `.airis/FRAMEWORK.md`
- **Installation Help:** `INSTALLATION.md`
- **Templates:** `.airis/_setup/templates/`
- **Prompts:** `.airis/_setup/prompts/`
- **Instructions:** `.airis/_setup/instructions/`

### Issues
Open an issue on GitHub for:
- Bug reports
- Feature requests
- Installation problems
- Documentation improvements

---

## License

**Private** - Phoenix Calibration

---

## Get Started

1. **Install:** Use one of the methods above
2. **Read:** `.airis/FRAMEWORK.md` for complete guide
3. **Create:** Your strategy documents (Scope with features → Design)
4. **Build:** With AI-assisted confidence

**Ready to see clearly?** 👁️ Let AIris guide your AI-assisted development.

---

**See clearly. Build confidently.** 👁️
