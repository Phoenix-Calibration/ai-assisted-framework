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
your-project/
├── .airis/                            # Framework files (updated by installer)
│   ├── FRAMEWORK.md                   # Complete framework documentation
│   ├── prompts/                       # 6 AI prompts (tool-agnostic)
│   │   ├── 1-discovery.prompt.md      # Existing project discovery
│   │   ├── 2-scope.prompt.md          # Generate scope.md
│   │   ├── 3-design.prompt.md         # Generate design.md
│   │   ├── 4-tracker.prompt.md        # Generate & manage tracker.md
│   │   ├── 5-session.prompt.md        # Dev session lifecycle
│   │   └── 6-amendment.prompt.md      # Scope & design change management
│   ├── templates/                     # Document templates
│   │   ├── 0-PRD.template.md
│   │   ├── 1-scope.template.md
│   │   ├── 2-design.template.md
│   │   ├── 3-tracker.template.md
│   │   ├── 4-todo.template.md
│   │   ├── 5-handoff.template.md
│   │   └── 6-extraction.template.md   # Generate CLAUDE.md / AGENTS.md
│   └── instructions/
│       └── airis-integration.instructions.md
├── .claude/                           # Claude Code specific
│   └── skills/                        # Auto-triggered skills
│       ├── airis-session              # Session lifecycle (/airis-session)
│       ├── airis-tracker              # Tracker management (/airis-tracker)
│       ├── airis-amendment            # Scope & design changes (/airis-amendment)
│       └── airis-issue                # Bug & issue triage (/airis-issue)
├── .ai-docs/                          # Your strategy documents (you own this)
│   ├── scope.md
│   ├── design.md
│   └── tracker.md
└── .ai-session/                       # Developer workspaces (you own this)
    └── {developer-name}/current/
        ├── todo.md
        └── handoff.md
```

---

## Quick Start

### Step 1: Install AIris

See [Installation](#installation) below.

### Step 2: Create Your Strategy Documents

**For NEW projects:**
1. Load `.airis/prompts/2-scope.prompt.md` → generate `.ai-docs/scope.md`
2. Load `.airis/prompts/3-design.prompt.md` → generate `.ai-docs/design.md`

**For EXISTING projects:**
1. Load `.airis/prompts/1-discovery.prompt.md` → extract current state
2. Load `.airis/prompts/2-scope.prompt.md` → generate `.ai-docs/scope.md`
3. Load `.airis/prompts/3-design.prompt.md` → generate `.ai-docs/design.md`

### Step 3: Generate Your Task Tracker

Load `.airis/prompts/4-tracker.prompt.md` → generates `.ai-docs/tracker.md` with all tasks derived from scope + design.

### Step 4: Run Development Sessions

Each session follows: **Todo → Work → Handoff**

Load `.airis/prompts/5-session.prompt.md` for the complete session lifecycle.

**If using Claude Code**, just use the skills instead:
```
/airis-session     → manage session lifecycle (start, close, hotfix)
/airis-tracker     → generate or update tracker.md
/airis-amendment   → handle scope or design changes
/airis-issue       → triage bugs, hotfixes, maintenance tasks
```

---

## Framework Flow

```
Human Creates Strategy (Scope + Design)
             ↓
AI Generates Tactics (Tracker → detailed tasks with acceptance criteria)
             ↓
AI Executes Sessions (Todo → Work → Handoff)
             ↓
          Repeat
```

**The AIris Principle:** AI reads documents in constraint-first order:
1. **Design** (technical constraints — non-negotiable)
2. **Scope** (project boundaries + features)

This ensures AI suggestions respect your architecture.

---

## Key Features

### Constraint-First Methodology
- Technical decisions guide AI suggestions
- Prevents generic "path of least resistance" solutions
- Maintains architectural coherence across all sessions

### Document Hierarchy
- **Strategy** (months) — Scope, Design
- **Tactics** (weeks) — Task Tracker with acceptance criteria
- **Execution** (hours) — Session Todo
- **Transfer** (per session) — Handoff state

### 6 Prompts + 4 Claude Code Skills
- Tool-agnostic prompts work with any AI (Claude, GPT-4, Gemini, Cursor, Copilot)
- Claude Code skills provide auto-triggered, context-aware commands
- Full session lifecycle: start, work, close, hotfix, onboarding
- Integrated bug & issue management with triage and routing

### Multi-Developer Support
- Per-developer workspaces in `.ai-session/{developer-name}/`
- Parallel development workflows
- Shared team coordination via tracker + handoff

---

## Benefits

- ✅ **Architectural Coherence** — Technical constraints enforced across all sessions
- ✅ **Clear Vision** — Like an iris focuses light, AIris focuses AI on what matters
- ✅ **Scope Control** — Clear boundaries prevent feature creep
- ✅ **Bug Management** — Integrated issue triage with severity routing
- ✅ **Auditable Trail** — ADRs document all technical decisions
- ✅ **Fast Onboarding** — New developers read strategy docs + handoff
- ✅ **AI-Agnostic** — Prompts work with any LLM
- ✅ **Claude Code Native** — Skills provide seamless integration
- ✅ **Multi-Developer** — Parallel workflows with conflict resolution
- ✅ **Adaptable** — Works for new projects and existing codebases

---

## Installation

### Option 1: Installation Script (Recommended)

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

**Node.js:**
```bash
curl -O https://raw.githubusercontent.com/Phoenix-Calibration/ai-assisted-framework/main/install-airis-npm.js
node install-airis-npm.js
```

The installer handles everything:
- Copies `.airis/` (framework files + prompts + templates)
- Copies `.claude/skills/airis-*` (Claude Code skills)
- Creates `.ai-docs/` and `.ai-session/` if they don't exist
- On update: replaces framework files only — your `.ai-docs/` and `.ai-session/` are never touched

### Option 2: Manual (Git)

**Windows:**
```powershell
git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis
Copy-Item -Path "temp-airis\.airis" -Destination "." -Recurse
Copy-Item -Path "temp-airis\.claude\skills\airis-*" -Destination ".claude\skills\" -Recurse
Remove-Item -Path "temp-airis" -Recurse -Force
```

**Linux/Mac:**
```bash
git clone --depth 1 https://github.com/Phoenix-Calibration/ai-assisted-framework.git temp-airis
cp -r temp-airis/.airis .
mkdir -p .claude/skills
cp -r temp-airis/.claude/skills/airis-* .claude/skills/
rm -rf temp-airis
```

---

## Documentation

- **[Framework Guide](.airis/FRAMEWORK.md)** — Complete framework documentation
- **[Prompts](.airis/prompts/)** — All 6 AI prompts
- **[Templates](.airis/templates/)** — All document templates
- **[Claude Code Integration](.airis/instructions/airis-integration.instructions.md)** — Setup guide

---

## Philosophy

> "Like the human iris controls how much light enters the eye to create clear vision, AIris controls how AI reads your project documents to create clear, coherent software."

**The AIris Way:**
1. **See clearly** — Architecture and constraints first
2. **Focus precisely** — Boundaries and features defined
3. **Build confidently** — Detailed tasks guide implementation

---

## Source & Credits

**Based on:** [From Fast Code to Reliable Software: A Framework for AI-Assisted Development](https://dev.to/stanislav_komarovsky_b478/from-fast-code-to-reliable-software-a-framework-for-ai-assisted-development-2dle) by Stanislav Komarovsky

**Developed by:** Phoenix Calibration Team

**Key Innovations:**
- ✨ Constraint-first methodology (dual document ordering)
- ✨ Scope.md with integrated features section
- ✨ Tracker generates detailed acceptance criteria from features
- ✨ 6 consolidated prompts (vs 13+ original)
- ✨ Multi-developer workspaces
- ✨ Unified session prompt with full lifecycle (start, close, hotfix, onboarding)
- ✨ Integrated bug & issue management
- ✨ Claude Code native skills

---

## Status

**Version:** 2.1 (February 2026)

**Status:** ✅ Production Ready
- ✅ 6 prompts (discovery, scope, design, tracker, session, amendment)
- ✅ 7 templates complete
- ✅ 4 Claude Code skills (session, tracker, amendment, issue)
- ✅ Bug & hotfix management integrated
- ✅ Multi-developer workflow supported
- ✅ Installation scripts for Windows, Linux/Mac, Node.js

---

## License

**Private** — Phoenix Calibration

---

**See clearly. Build confidently.** 👁️
