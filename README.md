# AI-Assisted Framework

Complete framework for AI-assisted development with document-driven structure.

## What is this?

This repository contains a complete implementation of the AI-Assisted Development Framework, designed to maintain architectural coherence across AI-assisted development sessions.

## Quick Links

- **Framework Documentation:** [.ai-framework/README.md](.ai-framework/README.md)
- **Templates:** [.ai-framework/_setup/templates](.ai-framework/_setup/templates)
- **Prompts:** [.ai-framework/_setup/prompts](.ai-framework/_setup/prompts)

## Repository Structure

```
├── .ai-framework/           # Complete framework structure
│   ├── README.md           # Main framework documentation
│   ├── strategy/           # Strategy documents (human-created)
│   ├── tactics/            # Tactical documents (AI-generated)
│   ├── session/            # Session documents (updated each session)
│   └── _setup/            # Templates and prompts
│       ├── templates/     # Document templates
│       └── prompts/       # AI prompts
└── README.md              # This file
```

## How to Use

### 1. For a New Project

1. Copy the entire `.ai-framework/` folder to your project
2. Follow the Quick Start guide in `.ai-framework/README.md`
3. Fill out the strategy documents (Design, Scope, Requirements)
4. Generate Tracker using AI
5. Start your first development session

### 2. For an Existing Project

1. Copy the `.ai-framework/` folder to your project root
2. Document your current architecture in Design.md
3. Document your project goals in Scope.md
4. Document your requirements in Requirements.md
5. Generate Tracker for remaining work
6. Continue with session-based development

## Framework Flow

```
HUMAN CREATES:
├── design.md      → Architecture & technical decisions
├── scope.md       → Vision, goals & boundaries
└── requirements.md → Detailed functionality
        ↓
AI GENERATES:
└── tracker.md     → Implementation tasks
        ↓
AI EXECUTES:
└── todo.md        → Current session work
        ↓
AI TRANSFERS:
└── handoff.md     → Results for next session
```

## Key Benefits

- ✅ Maintain architectural coherence across AI sessions
- ✅ Prevent scope creep with clear boundaries
- ✅ Auditable decision trail through ADRs
- ✅ Consistent security and quality patterns
- ✅ Fast onboarding for team members
- ✅ Works with any AI model (Claude, GPT-4, Gemini)

## Source

Based on the methodology described in: [From Fast Code to Reliable Software: A Framework for AI-Assisted Development](https://dev.to/stanislav_komarovsky_b478/from-fast-code-to-reliable-software-a-framework-for-ai-assisted-development-2dle)

## License

Private - Phoenix Calibration

## Status

🚧 **In Development** - Framework structure and templates are being created.