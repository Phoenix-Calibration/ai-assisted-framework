# AIris Framework - Integration Guide

**Version:** 1.0  
**Last Updated:** January 2026  
**Purpose:** Guide for integrating AIris framework with AI coding tools

---

## 🤖 How to Use This Guide

### For Humans (Manual Reading)
Navigate to the section relevant to your tool and scenario. Follow the step-by-step instructions.

### For AI Agents (Agent-Assisted Mode) ⭐

**This guide is designed to be loaded into AI agents to provide guided assistance.**

#### Quick Start for Users
1. **Load this file** into your AI agent (Claude, Copilot, etc.)
2. **Tell the agent your goal:**
   - "Help me create AIris documents for a new project"
   - "Guide me through GitHub Copilot integration"  
   - "I have an existing project, help me adopt AIris"
3. **Follow the agent's guidance** - it will navigate this guide for you

#### Instructions for AI Agents

When a user uploads this guide and requests help with AIris:

**Your Role:**
You are an AIris integration consultant. Use this guide to provide step-by-step assistance.

**Your Process:**
1. **Identify the scenario** from user's request (use Quick Scenario Selector below)
2. **Navigate to relevant section** in this guide
3. **Load AIris prompts** from `.airis/_setup/prompts/` when needed
4. **Guide step-by-step** through the process
5. **Track progress** across sessions
6. **Create files** in correct locations
7. **Suggest next steps** based on completion

**When to Reference Framework README:**
If user needs deeper understanding of:
- Complete document hierarchy and relationships
- Full explanation of constraint-first principle
- Detailed time estimates and phases
- Multi-developer workflow details
- Framework philosophy and evolution
- Template structure explanations

Then read or reference: `.airis/README.md` (20KB, comprehensive framework guide)

**Agent Behavior Guidelines:**

✅ **Do:**
- Reference specific sections from this guide by name
- Load AIris prompts from user's `.airis/_setup/prompts/` directory
- Follow constraint-first principle strictly
- Show file content before creating
- Track which phase user is in
- Suggest natural stopping points
- Verify understanding before proceeding
- Adapt to user's experience level
- Reference `.airis/README.md` for framework details when needed

❌ **Don't:**
- Skip ahead without user confirmation
- Create files without showing content first
- Ignore constraint-first ordering (Design → Scope → Requirements)
- Mix different integration approaches
- Overwhelm user with all options at once
- Assume user has read this guide
- Skip framework README when user needs deeper context

**Progress Tracking Template:**
```
Phase 1: Strategic Documents
├── ⚪ scope.md (4-6 hours)
├── ⚪ requirements.md (6-10 hours)
└── ⚪ design.md (6-10 hours)

Phase 2: Tool Integration  
└── ⚪ CLAUDE.md / AGENTS.md extraction

Phase 3: Ready for Development
```

Update this as user progresses. Use ✅ for complete, ⏳ for in-progress, ⚪ for pending.

---

## 🎯 Quick Scenario Selector

**For AI Agents:** Use this decision tree to identify the user's scenario and navigate to the correct section.

**For Humans:** Answer these questions to find your scenario:

### Decision Tree

```
Do you have an existing codebase?
├─ NO → New Project
│   │
│   ├─ What tool will you use?
│   │   ├─ Claude Code → Scenario 1
│   │   ├─ GitHub Copilot CLI → Scenario 2
│   │   └─ Other / Not sure → Scenario 3
│   │
│   └─ Setting up for a team? → Scenario 5
│
└─ YES → Existing Project
    │
    └─ Want to document and improve? → Scenario 4
```

### Scenario Quick Reference

| Scenario | User Type | Tool | Go To Section |
|----------|-----------|------|---------------|
| **Scenario 1** | Solo dev, new project | Claude Code | [New Project + Claude Code](#scenario-1-new-project--claude-code) |
| **Scenario 2** | Solo dev, new project | GitHub Copilot CLI | [New Project + Copilot](#scenario-2-new-project--github-copilot-cli) |
| **Scenario 3** | Solo dev, new project | Generic AI / Not sure | [New Project + Generic](#scenario-3-new-project--generic-ai-tool) |
| **Scenario 4** | Adopting for legacy | Any tool | [Existing Project](#scenario-4-existing-project-adoption) |
| **Scenario 5** | Team lead | Any tool | [Team Setup](#scenario-5-team-setup) |
| **Scenario 6** | Using multiple tools | Multiple | [Multi-Tool Workflow](#scenario-6-multi-tool-workflow) |

---

## 📚 Conceptual Foundation

> **📖 For deeper understanding:** See [.airis/README.md](.airis/README.md) for complete framework documentation, document hierarchy, and core principles.

### What AIris Is (and Is NOT)

**AIris IS:**
- ✅ A **framework** for creating project documentation
- ✅ A **methodology** for constraint-first development
- ✅ A **set of prompts** for specific documentation tasks
- ✅ A **structure** for organizing project knowledge

**AIris is NOT:**
- ❌ A persistent AI agent that runs constantly
- ❌ A plugin or extension for your IDE
- ❌ A tool that "remembers" things across sessions
- ❌ Something that replaces CLAUDE.md or AGENTS.md

**Think of it as:**
```
AIris Framework = Cookbook (methodology)
Your docs/       = Ingredients (project specifics)
CLAUDE.md        = Chef's notes (extracted instructions)
AI Agent         = Chef (uses the notes to cook)
```

**Agent Note:** If user asks about framework details, templates, or prompts structure, refer them to `.airis/README.md` for comprehensive information.

### Relationship: AIris ↔ AI Tools

**The Complete Flow:**

```
Step 1: Copy AIris to Your Project
├─ .airis/ folder in your repository
└─ Contains: templates, prompts, examples

Step 2: Use AIris to CREATE Documents
├─ Use AIris prompts to generate:
│   ├─ scope.md (project vision & boundaries)
│   ├─ requirements.md (features & user stories)
│   └─ design.md (architecture & constraints)
└─ These go in .airis/docs/

Step 3: EXTRACT to Tool-Specific Files
├─ From AIris docs → CLAUDE.md (for Claude Code)
├─ From AIris docs → AGENTS.md (for Copilot CLI)
└─ Extract the essentials, not everything

Step 4: Work Normally
├─ Your AI tool reads CLAUDE.md / AGENTS.md automatically
├─ Your tool respects the constraint-first principle
└─ AIris docs remain as single source of truth

Step 5: Update Cycle
├─ Update AIris docs when architecture changes
├─ Re-extract to CLAUDE.md / AGENTS.md
└─ Keep both in sync
```

**Key Insight:**
AIris doesn't "run" during development. Its RESULTS (the docs) guide your AI tools.

### The Constraint-First Principle

> **📖 Deep dive:** See [.airis/README.md - The Constraint-First Principle](.airis/README.md#the-constraint-first-principle) for comprehensive explanation with examples and rationale.

**The Core Problem:**
When AI reads requirements before understanding technical constraints, it suggests generic "path of least resistance" solutions.

**Example:**
```
❌ Traditional Approach:
User: "I need real-time chat"
AI reads: requirements.md first
AI suggests: "Let's use Firebase!" (easiest)
Reality: Your architecture is FastAPI + PostgreSQL (conflict!)

✅ The AIris Way:
AI reads: design.md FIRST
AI learns: "Must use FastAPI + PostgreSQL"
Then reads: requirements.md
AI suggests: "Server-Sent Events in FastAPI" (respects constraints)
```

**Document Orders:**

**Creation Order (Logical for Humans):**
```
Scope → Requirements → Design
```
Why? You can't decide HOW without knowing WHAT.

**Presentation Order (For AI - The AIris Way):**
```
Design → Scope → Requirements
```
Why? AI prioritizes information it reads first. Constraints must be non-negotiable.

**Implementation in Tools:**

**CLAUDE.md Structure:**
```markdown
# CLAUDE.md

## Technical Constraints (READ FIRST) ⭐
<!-- From design.md -->
This section MUST come first

## Project Context
<!-- From scope.md -->

## Features & Requirements  
<!-- From requirements.md -->
```

**Agent Instruction:**
When creating CLAUDE.md or AGENTS.md, ALWAYS put Technical Constraints first.

---

## 🎬 Integration Scenarios

### Scenario 1: New Project + Claude Code

**Agent Instructions:**
```
User Profile: Solo developer, new project, has Claude Code installed
Goal: Create complete AIris documentation using Claude Code
Time: 3 sessions (16-26 hours total)
Your Role: Guide through all 3 phases

Phase 1: Document Generation (Sessions 1-2)
- Load prompts from .airis/_setup/prompts/
- Guide user through scope.md creation (4-6h)
- Guide user through requirements.md creation (6-10h)  
- Guide user through design.md creation (6-10h)
- Create files in .airis/docs/

Phase 2: CLAUDE.md Extraction (Session 3)
- Read user's generated docs
- Extract key sections
- Create CLAUDE.md following constraint-first template
- Explain how Claude Code will use it

Phase 3: Validation
- Review constraint-first ordering
- Verify completeness
- Suggest tracker.md generation next
```

#### Step-by-Step Process

**Prerequisites:**
- ✅ Claude Code installed
- ✅ `.airis/` folder copied to project root
- ✅ Project repository initialized

> **📖 Template Reference:** All AIris templates are documented in [.airis/README.md - Document Hierarchy](.airis/README.md#document-hierarchy). Each template includes time estimates and detailed structure.

**Phase 1: Create scope.md**

**Time:** 4-6 hours (one work session)

1. **Start Claude Code:**
   ```bash
   cd /your-project
   claude
   ```

2. **Load the scope generation prompt:**
   ```
   Tell Claude: "Please read the file .airis/_setup/prompts/2-scope.prompt.md 
   and help me create scope.md for my project"
   ```

3. **Provide project context:**
   Claude will ask discovery questions. Be prepared with:
   - Project vision and goals
   - Target users
   - Success metrics
   - Key constraints (budget, timeline, team)
   - In-scope vs out-of-scope boundaries

4. **Review and refine:**
   - Claude generates draft scope.md
   - Review each section
   - Iterate until complete

5. **Save the file:**
   ```
   Claude will create: .airis/docs/scope.md
   Commit: git add .airis/docs/scope.md
           git commit -m "docs: Add project scope"
   ```

**Agent Checkpoint:**
```
✅ Phase 1.1 Complete: scope.md created
📋 Next: requirements.md (6-10 hours)
💡 Tip: Take a break. Review scope.md fresh tomorrow.
```

**Phase 2: Create requirements.md**

**Time:** 6-10 hours (one or two work sessions)

1. **Resume Claude Code:**
   ```bash
   claude
   ```

2. **Load requirements prompt:**
   ```
   Tell Claude: "Read .airis/_setup/prompts/3-requirements.prompt.md
   and .airis/docs/scope.md, then help me create requirements.md"
   ```

3. **Work through features:**
   Claude will guide you through:
   - Feature identification
   - User stories with acceptance criteria
   - Business rules
   - Data entities
   - Integration requirements

4. **Save the file:**
   ```
   Claude creates: .airis/docs/requirements.md
   Commit: git add .airis/docs/requirements.md
           git commit -m "docs: Add requirements specification"
   ```

**Agent Checkpoint:**
```
✅ Phase 1.2 Complete: requirements.md created  
📋 Next: design.md (6-10 hours)
💡 Tip: This is the longest document. Consider breaking into 2 sessions.
```

**Phase 3: Create design.md**

**Time:** 6-10 hours (one or two work sessions)

1. **Resume Claude Code:**
   ```bash
   claude
   ```

2. **Load design prompt:**
   ```
   Tell Claude: "Read .airis/_setup/prompts/4-design.prompt.md,
   .airis/docs/scope.md, and .airis/docs/requirements.md,
   then help me create design.md"
   ```

3. **Work through architecture:**
   Claude will guide you through:
   - Architecture patterns and layers
   - Technology stack decisions (with ADRs)
   - Development standards
   - Security guidelines
   - Performance considerations

4. **Save the file:**
   ```
   Claude creates: .airis/docs/design.md
   Commit: git add .airis/docs/design.md
           git commit -m "docs: Add architecture and design decisions"
   ```

**Agent Checkpoint:**
```
✅ Phase 1 Complete: All strategic documents created
📋 Next: Extract to CLAUDE.md
💡 Celebrate! You have comprehensive project documentation.
```

**Phase 4: Extract CLAUDE.md**

**Time:** 1-2 hours

1. **Request extraction:**
   ```
   Tell Claude: "Read my three AIris documents (.airis/docs/*.md)
   and help me create a CLAUDE.md file following the constraint-first
   principle. Extract the key sections that Claude Code needs."
   ```

2. **Review template:**
   Claude will propose CLAUDE.md structure:
   ```markdown
   # CLAUDE.md
   
   ## Technical Constraints (READ FIRST)
   [From design.md: Technology Stack + Architecture]
   
   ## Project Context
   [From scope.md: Vision + Success Metrics + Boundaries]
   
   ## Features & Requirements
   [From requirements.md: Feature summaries]
   
   ## Development Workflow
   [From session templates]
   ```

3. **Review and approve:**
   - Verify constraint-first ordering
   - Ensure conciseness (~10KB target)
   - Check all critical constraints included

4. **Create file:**
   ```
   Claude creates: CLAUDE.md (in project root)
   Commit: git add CLAUDE.md
           git commit -m "docs: Add Claude Code instructions"
   ```

**Agent Final Checkpoint:**
```
🎉 Setup Complete!

What you now have:
✅ .airis/docs/scope.md (comprehensive)
✅ .airis/docs/requirements.md (comprehensive)
✅ .airis/docs/design.md (comprehensive)
✅ CLAUDE.md (extracted essentials)

How Claude Code will use this:
- Automatically reads CLAUDE.md at session start
- Respects technical constraints first
- References full docs when needed

Next steps:
1. Generate tracker.md (use prompt 5-tracker.prompt.md)
2. Start first development session (use prompt 6-session.prompt.md)
3. Begin implementation with constraint-first guidance

Your project now has:
🎯 Clear vision (scope.md)
🎯 Detailed requirements (requirements.md)  
🎯 Solid architecture (design.md)
🎯 AI tool ready (CLAUDE.md)
```

---

### Scenario 2: New Project + GitHub Copilot CLI

**Agent Instructions:**
```
User Profile: Solo developer, new project, uses GitHub ecosystem
Goal: Create AIris docs + GitHub Copilot integration
Time: 3-4 sessions (18-28 hours)
Your Role: Guide through docs + custom agents setup

Phase 1: Document Generation (Same as Scenario 1)
- Use AIris prompts to create scope/requirements/design

Phase 2: AGENTS.md + Custom Agents
- Create AGENTS.md (similar to CLAUDE.md)
- Create custom agents in .github/agents/
- Each agent wraps an AIris prompt

Phase 3: Team Integration
- Show how to share via GitHub
- Explain agent invocation
```

#### Step-by-Step Process

**Prerequisites:**
- ✅ GitHub Copilot CLI installed (`gh copilot`)
- ✅ `.airis/` folder in project
- ✅ GitHub repository configured

**Phase 1: Create Strategic Documents**

**Time:** 16-26 hours (same as Scenario 1)

Follow the same process as Scenario 1 to create:
- ✅ .airis/docs/scope.md
- ✅ .airis/docs/requirements.md
- ✅ .airis/docs/design.md

**You can use ANY AI tool for this phase** (Claude.ai, ChatGPT, etc.)
Just copy/paste the prompts from `.airis/_setup/prompts/`

**Phase 2: Create AGENTS.md**

**Time:** 1-2 hours

1. **Request AGENTS.md creation:**
   ```
   Tell your AI: "Read my AIris documents and create an AGENTS.md
   file for GitHub Copilot CLI, following constraint-first principle"
   ```

2. **Review structure:**
   ```markdown
   # AGENTS.md
   
   ## Technical Constraints (READ FIRST)
   [From design.md]
   
   ## Project Overview
   [From scope.md]
   
   ## Feature Requirements
   [From requirements.md]
   
   ## Build & Test Commands
   [Project-specific]
   ```

3. **Create file:**
   ```bash
   # Create in project root
   touch AGENTS.md
   # Paste content
   git add AGENTS.md
   git commit -m "docs: Add Copilot CLI instructions"
   ```

**Phase 3: Create Custom Agents (Optional but Recommended)**

**Time:** 1-2 hours

Custom agents make AIris prompts easily reusable in GitHub Copilot.

1. **Create agents directory:**
   ```bash
   mkdir -p .github/agents
   ```

2. **Create airis-scope.agent.md:**
   ```yaml
   ---
   name: airis-scope
   description: Create scope.md following AIris constraint-first methodology
   tools: ['read', 'search', 'edit']
   ---
   
   # AIris Scope Generation Agent
   
   You are an AIris-trained agent specializing in creating scope.md documents.
   
   ## Your Role
   Help the user create a comprehensive scope.md following the AIris framework.
   
   ## Process
   [Copy content from .airis/_setup/prompts/2-scope.prompt.md]
   [Adapt to agent format - focus on questions and guidance]
   
   ## Output
   Create .airis/docs/scope.md with all required sections.
   ```

3. **Create airis-requirements.agent.md:**
   ```yaml
   ---
   name: airis-requirements  
   description: Create requirements.md following AIris methodology
   tools: ['read', 'search', 'edit']
   ---
   
   # AIris Requirements Generation Agent
   
   [Similar structure, adapted from 3-requirements.prompt.md]
   ```

4. **Create airis-design.agent.md:**
   ```yaml
   ---
   name: airis-design
   description: Create design.md following AIris constraint-first approach
   tools: ['read', 'search', 'edit']
   ---
   
   # AIris Design Generation Agent
   
   [Similar structure, adapted from 4-design.prompt.md]
   ```

5. **Commit agents:**
   ```bash
   git add .github/agents/
   git commit -m "feat: Add AIris custom agents for Copilot"
   ```

**Using Custom Agents:**

```bash
# Start Copilot CLI
gh copilot

# Your custom agents appear in the agent selector
# Select "airis-scope" and it will guide you through scope.md creation

# Or use inline:
gh copilot --agent airis-scope "Help me create scope.md for an e-commerce platform"
```

**Agent Final Checkpoint:**
```
🎉 GitHub Copilot Setup Complete!

What you now have:
✅ .airis/docs/ (all strategic documents)
✅ AGENTS.md (root-level instructions)
✅ .github/agents/ (custom AIris agents)

How to use:
- AGENTS.md: Auto-loaded by Copilot CLI in this repo
- Custom agents: Select from agent dropdown
- Full docs: Reference when needed

Next steps:
1. Generate tracker.md using airis-tracker agent (create it)
2. Start development with Copilot respecting constraints
3. Team members can use same agents

Sharing with team:
- Commit to repo → Everyone gets AGENTS.md
- Custom agents → Available to all team members
- AIris docs → Single source of truth
```

---

### Scenario 3: New Project + Generic AI Tool

**Agent Instructions:**
```
User Profile: Using ChatGPT, Claude.ai, or other non-code-integrated tool
Goal: Create AIris docs manually
Time: 3-4 sessions (16-26 hours)
Your Role: Guide through manual prompt loading

Key Differences:
- User manually copies prompts
- User manually creates files
- No automatic tool integration
- More manual tracking needed

Process:
1. Guide through each prompt manually
2. Help user create files in correct locations
3. Explain that CLAUDE.md/AGENTS.md are for future tool integration
4. Focus on getting comprehensive docs created
```

#### Step-by-Step Process

**Prerequisites:**
- ✅ Access to any AI chat tool (ChatGPT, Claude.ai, Gemini, etc.)
- ✅ `.airis/` folder in your project
- ✅ Text editor for creating files

**Phase 1: Create scope.md**

**Time:** 4-6 hours

1. **Open the scope prompt:**
   Open `.airis/_setup/prompts/2-scope.prompt.md` in a text editor

2. **Copy to AI tool:**
   - Select all content
   - Copy to your AI tool (ChatGPT, Claude.ai, etc.)
   - Add: "I'm starting a project about [your project description]"

3. **Follow the conversation:**
   - AI will ask questions
   - Provide answers
   - Iterate on sections

4. **Create the file manually:**
   ```bash
   # Create directory if needed
   mkdir -p .airis/docs
   
   # Create file
   nano .airis/docs/scope.md
   # Or use VS Code, etc.
   ```

5. **Paste content:**
   - Copy AI's generated scope.md
   - Paste into your file
   - Save

6. **Commit:**
   ```bash
   git add .airis/docs/scope.md
   git commit -m "docs: Add project scope"
   ```

**Repeat this process for:**
- ✅ requirements.md (load `3-requirements.prompt.md`)
- ✅ design.md (load `4-design.prompt.md`)

**Phase 2: Create Instructions File (Optional for Future)**

Even if you're not using Claude Code or Copilot now, create instructions files for future integration:

1. **Create CLAUDE.md:**
   ```
   Tell your AI: "Based on my AIris documents, create a CLAUDE.md
   file that I can use if I adopt Claude Code later"
   ```

2. **Create AGENTS.md:**
   ```
   Tell your AI: "Create an AGENTS.md file for potential
   GitHub Copilot integration"
   ```

These files will be ready if you switch tools later.

**Agent Final Checkpoint:**
```
✅ Documentation Complete (Manual Method)

What you have:
✅ .airis/docs/scope.md
✅ .airis/docs/requirements.md  
✅ .airis/docs/design.md
✅ CLAUDE.md (prepared for future)
✅ AGENTS.md (prepared for future)

Benefits:
- Comprehensive project documentation
- Clear architectural decisions
- Ready for any AI tool integration
- Constraint-first methodology applied

Next steps:
1. Generate tracker.md (use 5-tracker.prompt.md)
2. Consider adopting Claude Code or Copilot CLI
3. If you switch tools, your CLAUDE.md/AGENTS.md are ready
4. Use docs as reference during development

💡 Tip: Even without tool integration, having these docs
    improves communication and decision-making.
```

---

### Scenario 4: Existing Project Adoption

**Agent Instructions:**
```
User Profile: Has existing codebase, wants to document with AIris
Goal: Document AS-IS state, then create TO-BE plan
Time: 4-5 sessions (20-30 hours)
Your Role: Guide through discovery and documentation

Key Differences from New Project:
- Start with discovery/analysis
- Document AS-IS before TO-BE
- Order is flexible (can start with design.md)
- Include technical debt section
- Migration planning needed

Process:
1. Analyze existing codebase
2. Document current architecture (design.md AS-IS)
3. Document current features (requirements.md AS-IS)
4. Document current goals (scope.md)
5. Add TO-BE sections to each
6. Create migration plan
```

#### Step-by-Step Process

**Prerequisites:**
- ✅ Existing codebase
- ✅ `.airis/` folder copied to project
- ✅ Access to AI tool (Claude Code recommended for code analysis)

**Phase 1: Discovery & Analysis**

**Time:** 4-6 hours

1. **Analyze codebase structure:**
   ```
   Tell your AI: "I have an existing codebase. Please analyze the
   structure and help me understand the current architecture.
   
   Here's my project structure:
   [paste directory tree]
   
   Key files:
   [paste main application files]"
   ```

2. **Use discovery prompt:**
   ```
   Load: .airis/_setup/prompts/1-discovery.prompt.md
   
   Tell AI: "Use this discovery prompt to help me understand
   my existing project. Treat this as an existing system."
   ```

3. **Gather information:**
   AI will ask about:
   - Current technology stack
   - Existing features
   - Known issues and technical debt
   - Team size and processes
   - What works well
   - What needs improvement

**Phase 2: Document AS-IS State**

**Time:** 10-14 hours

**Note:** For existing projects, you can create docs in any order.
Recommended: design.md → requirements.md → scope.md

**2.1 Create design.md (AS-IS + TO-BE)**

**Time:** 6-8 hours

```
Tell your AI: "Based on our analysis, create design.md with:

1. AS-IS Architecture section:
   - Current technology stack
   - Current patterns and layers
   - Current standards (even if inconsistent)
   - Technical debt analysis
   
2. TO-BE Architecture section:
   - Proposed improvements
   - Migration strategy
   - New patterns to adopt
   - Constraints for new development"
```

Create file: `.airis/docs/design.md`

**2.2 Create requirements.md (Current + Future)**

**Time:** 4-6 hours

```
Tell your AI: "Document our requirements.md with:

1. Existing Features section:
   - What the system does today
   - Current user workflows
   - Current business rules
   
2. Planned Features section:
   - New features to build
   - Improvements to existing features
   - User stories with acceptance criteria"
```

Create file: `.airis/docs/requirements.md`

**2.3 Create scope.md (Current + Vision)**

**Time:** 3-4 hours

```
Tell your AI: "Create scope.md documenting:

1. Current State:
   - What we have today
   - Current success metrics
   - Current constraints
   
2. Vision:
   - Where we want to go
   - Future success metrics
   - Strategic goals"
```

Create file: `.airis/docs/scope.md`

**Phase 3: Extract Instructions**

**Time:** 2-3 hours

```
Tell your AI: "Create CLAUDE.md / AGENTS.md that includes:

## Technical Constraints (READ FIRST)
[From design.md TO-BE section - this is what NEW code must follow]

## Current Architecture (AS-IS)
[From design.md AS-IS section - for understanding existing code]

## Technical Debt
[Key issues to be aware of]

## Migration Guidelines
[How to gradually improve]

## Features
[Current and planned]"
```

**Agent Checkpoint:**
```
✅ Existing Project Documented!

What you have:
✅ design.md (AS-IS + TO-BE + Technical Debt)
✅ requirements.md (Current + Planned)
✅ scope.md (Current + Vision)
✅ CLAUDE.md / AGENTS.md (extracted guidelines)

How this helps:
- New developers understand the system
- AI tools know constraints for new code
- Technical debt is tracked
- Migration path is clear
- Decisions are documented (ADRs)

Key insight:
- AI reads TO-BE constraints for NEW code
- AI reads AS-IS architecture to understand EXISTING code
- Gradual improvement over time

Next steps:
1. Generate tracker.md with both maintenance and feature tasks
2. Start sessions with constraint-first for new code
3. Gradually refactor existing code toward TO-BE
```

---

### Scenario 5: Team Setup

**Agent Instructions:**
```
User Profile: Team lead setting up AIris for team
Goal: Standardize documentation and AI tool usage
Time: 1-2 days (8-16 hours)
Your Role: Guide through team-wide setup

Key Considerations:
- Repository structure for team
- Shared vs individual workflows
- Custom agents for common tasks
- Onboarding documentation
- Version control strategy

Process:
1. Set up repository structure
2. Create or adapt existing AIris docs
3. Create team-specific agents/instructions
4. Document team workflow
5. Create onboarding guide
```

#### Step-by-Step Process

**Prerequisites:**
- ✅ Team repository with AIris docs (or create them)
- ✅ Chosen tool: Claude Code, GitHub Copilot, or both
- ✅ Team members have tool access

**Phase 1: Repository Setup**

**Time:** 2-3 hours

1. **Create or verify AIris structure:**
   ```bash
   your-repo/
   ├── .airis/
   │   ├── docs/
   │   │   ├── scope.md          # ✅ Team-shared
   │   │   ├── requirements.md   # ✅ Team-shared
   │   │   └── design.md         # ✅ Team-shared
   │   └── session/
   │       └── shared/
   │           └── project-status.md  # ✅ Team coordination
   │
   ├── CLAUDE.md                  # ✅ If using Claude Code
   ├── AGENTS.md                  # ✅ If using Copilot CLI
   │
   └── .github/
       └── agents/                # ✅ If using Copilot
           ├── code-reviewer.agent.md
           ├── test-writer.agent.md
           └── doc-updater.agent.md
   ```

2. **Create team workflow document:**
   ```bash
   touch .airis/TEAM-WORKFLOW.md
   ```

   Content:
   ```markdown
   # Team Workflow with AIris
   
   ## Daily Development
   1. Pull latest from main (includes updated .airis/docs/)
   2. Read CLAUDE.md / AGENTS.md for project context
   3. Use AI tools with constraint-first principle
   4. Update .airis/docs/ if architecture changes
   
   ## When to Update AIris Docs
   - design.md: Architecture decisions, new ADRs
   - requirements.md: New features, changed user stories
   - scope.md: Project goals or boundaries change
   
   ## How to Update
   1. Create feature branch
   2. Update relevant .airis/docs/ file
   3. Re-extract to CLAUDE.md / AGENTS.md
   4. Submit PR with both changes
   5. Team reviews architectural changes
   
   ## Custom Agents (Copilot Only)
   - code-reviewer: Reviews PRs for standards
   - test-writer: Generates tests for features
   - doc-updater: Keeps docs in sync
   ```

**Phase 2: Create Team-Specific Custom Agents**

**For GitHub Copilot Teams:**

```bash
mkdir -p .github/agents
```

**Create code-reviewer.agent.md:**
```yaml
---
name: code-reviewer
description: Reviews code against our team standards from design.md
tools: ['read', 'search']
---

# Code Review Agent

You are a code reviewer for this project.

## Your Checklist
1. Read .airis/docs/design.md for our architecture standards
2. Verify code follows patterns defined in design.md
3. Check for constraint violations
4. Review test coverage
5. Check for technical debt

## Output Format
- ✅ Follows standards: [list what's good]
- ⚠️ Concerns: [list issues]
- 💡 Suggestions: [improvements]

Always reference specific sections from design.md when giving feedback.
```

**Create test-writer.agent.md:**
```yaml
---
name: test-writer
description: Writes tests following our testing standards
tools: ['read', 'search', 'edit']
---

# Test Writing Agent

## Process
1. Read .airis/docs/design.md for testing standards
2. Read the code to test
3. Generate tests following our patterns
4. Include edge cases
5. Follow our naming conventions

## Test Structure
[Copy from design.md testing section]
```

**Phase 3: Team Onboarding**

**Time:** 2-3 hours

Create `.airis/ONBOARDING.md`:

```markdown
# AIris Onboarding for Team Members

## Welcome!
Our project uses the AIris framework for documentation and AI-assisted development.

## What You Need to Know

### 1. The Documentation (30 min read)
- Read: `.airis/docs/scope.md` - Project vision
- Read: `.airis/docs/requirements.md` - Features
- Read: `.airis/docs/design.md` - Architecture (MOST IMPORTANT)

### 2. AI Tool Setup (30 min)
**If using Claude Code:**
- Install Claude Code
- CLAUDE.md is automatically loaded
- Reference .airis/docs/ when needed

**If using GitHub Copilot:**  
- Install gh copilot
- AGENTS.md is automatically loaded
- Use custom agents: gh copilot --agent [name]

### 3. Daily Workflow (ongoing)
- Always read design.md before starting new features
- Ask AI to follow constraint-first principle
- Reference AIris docs in conversations
- Update docs when making architecture decisions

### 4. Contributing to Docs
- Fork and PR like code
- Architectural changes need team review
- Keep CLAUDE.md / AGENTS.md in sync with .airis/docs/

## Quick Reference

**Starting a Task:**
```
Tell your AI: "Read .airis/docs/design.md for constraints,
then help me implement [feature]"
```

**Architecture Question:**
```
Tell your AI: "What does .airis/docs/design.md say about [topic]?"
```

**Need Help:**
- Ask in #engineering Slack
- Reference this onboarding doc
- Consult team lead
```

**Phase 4: Rollout**

1. **Announce to team:**
   ```
   Subject: New: AIris Framework for Better AI-Assisted Development
   
   Team,
   
   We've adopted the AIris framework to improve how we work with AI tools.
   
   What's changed:
   - Comprehensive project docs in .airis/docs/
   - CLAUDE.md / AGENTS.md for AI tools
   - Constraint-first development approach
   
   What you need to do:
   1. Pull latest main
   2. Read .airis/ONBOARDING.md (1 hour)
   3. Set up your AI tool (30 min)
   4. Start using constraint-first principle
   
   Benefits:
   - AI suggests solutions that match our architecture
   - Consistent code patterns across team
   - Better onboarding for new members
   - Documented architectural decisions
   
   Questions? Let's discuss in standup.
   ```

2. **Monitor adoption:**
   - Check PRs reference design.md
   - Verify new code follows standards
   - Collect feedback
   - Iterate on process

**Agent Final Checkpoint:**
```
🎉 Team Setup Complete!

What the team has:
✅ Shared AIris documentation
✅ CLAUDE.md / AGENTS.md (auto-loaded)
✅ Custom agents (if using Copilot)
✅ TEAM-WORKFLOW.md
✅ ONBOARDING.md
✅ Version-controlled process

Benefits:
- Consistent AI assistance across team
- Architectural coherence maintained
- New members onboard faster
- Decisions are documented
- Less "tribal knowledge"

Success Metrics:
- PRs reference design.md
- Code follows standards
- Architecture discussions use AIris docs
- New members productive faster

Next steps:
1. Schedule team training session
2. Review after 2 weeks
3. Gather feedback
4. Refine process
5. Celebrate consistency!
```

---

### Scenario 6: Multi-Tool Workflow

**Agent Instructions:**
```
User Profile: Uses different tools for different tasks
Goal: Consistent AIris usage across tools
Time: Varies by tools used
Your Role: Guide through multi-tool setup

Example Combinations:
- Claude Code for strategy docs + Copilot for daily coding
- Claude.ai for planning + VS Code Copilot for implementation
- ChatGPT for docs + Cursor for coding

Key Principle:
AIris docs are tool-agnostic. Each tool reads from same source.

Process:
1. Create AIris docs with preferred tool
2. Set up each tool to reference AIris docs
3. Keep AIris docs as single source of truth
4. Update extraction files (CLAUDE.md, AGENTS.md) as needed
```

#### Common Patterns

**Pattern A: Claude Code (Strategy) + Copilot CLI (Coding)**

```
Week 1-2: Use Claude Code + AIris prompts
├── Create scope.md
├── Create requirements.md
└── Create design.md

Week 3: Extract to both tools
├── Create CLAUDE.md (for Claude Code reference)
└── Create AGENTS.md (for Copilot CLI daily use)

Ongoing:
├── Claude Code: For architecture discussions, doc updates
└── Copilot CLI: For daily coding with constraint-first
```

**Pattern B: Claude.ai (Docs) + VS Code Copilot (Code)**

```
Initial Setup: Use Claude.ai to create docs
├── Load AIris prompts manually
├── Generate all .airis/docs/
└── Create AGENTS.md

Daily Work: VS Code with Copilot
├── Copilot reads AGENTS.md automatically
├── Reference .airis/docs/ when needed
└── Use Claude.ai for doc updates only
```

**Pattern C: Rotating Tools**

```
Principle: AIris docs are the source of truth

Whatever tool you use:
1. Read .airis/docs/design.md first (constraint-first!)
2. Tell tool: "Follow the constraints in design.md"
3. Keep AIris docs updated
4. Regenerate CLAUDE.md / AGENTS.md when docs change
```

**Agent Guidance:**
```
When user has multiple tools:

1. Prioritize AIris docs over tool-specific files
2. Tool-specific files (CLAUDE.md, AGENTS.md) are EXTRACTS
3. When docs change, regenerate extracts
4. Each tool reads from same source = consistency

Example instruction for user:
"I work with Claude Code and GitHub Copilot. Keep your .airis/docs/
as the source of truth. When you make architectural changes:
1. Update .airis/docs/design.md
2. Regenerate CLAUDE.md: 'Extract essentials from design.md'
3. Regenerate AGENTS.md: 'Extract essentials from design.md'
4. Both tools now have updated constraints"
```

---

## 📋 Creating Project Instructions

### Extracting CLAUDE.md from AIris Docs

**Agent Instructions:**
```
When user requests CLAUDE.md extraction:

1. Read all three AIris docs:
   - .airis/docs/design.md
   - .airis/docs/scope.md
   - .airis/docs/requirements.md

2. Extract following template (constraint-first order!)

3. Keep concise (~10KB target)
   - Not copying entire docs
   - Extracting essentials only
   - Focus on what AI needs during coding

4. Verify constraint-first ordering

5. Save to project root: CLAUDE.md
```

#### Template Structure

```markdown
# CLAUDE.md

## Technical Constraints (READ FIRST)

**CRITICAL:** Read this section first. All suggestions must respect these constraints.

### Technology Stack
<!-- Extract from design.md: Technology Stack section -->
- **Language:** [e.g., Python 3.11+]
- **Framework:** [e.g., FastAPI]
- **Database:** [e.g., PostgreSQL 14+]
- **Cache:** [e.g., Redis]
- **Required:** [e.g., Type hints, async/await]

### Architecture Patterns
<!-- Extract from design.md: Architecture Patterns section -->
- **Style:** [e.g., Hexagonal Architecture]
- **Layers:** [e.g., Domain, Application, Infrastructure]
- **Design:** [e.g., Domain-Driven Design]
- **CQRS:** [e.g., Separate read/write models]

### Development Standards
<!-- Extract from design.md: Development Standards -->
- **Code Style:** [e.g., Black formatting, PEP 8]
- **Testing:** [e.g., pytest, 80%+ coverage]
- **Documentation:** [e.g., Docstrings required]
- **Commits:** [e.g., Conventional commits]

### Security Guidelines
<!-- Extract from design.md: Security section -->
- [Key security requirements]
- [Authentication/authorization approach]
- [Data protection rules]

---

## Project Context

### Vision
<!-- Extract from scope.md: Vision section -->
[2-3 sentences about what the project is]

### Success Metrics
<!-- Extract from scope.md: Success Metrics -->
- **Platform Success:** [Key metric + target]
- **Operational:** [Key metric + target]
- **Business:** [Key metric + target]

### Key Constraints
<!-- Extract from scope.md: Constraints -->
- **Timeline:** [e.g., MVP by April 2026]
- **Team:** [e.g., 2 developers]
- **Budget:** [if relevant]

### Boundaries
<!-- Extract from scope.md: In-Scope / Out-of-Scope -->
**In Scope:**
- [Key items]

**Out of Scope:**
- [Key items]

---

## Features & Requirements

### MVP Features
<!-- Extract from requirements.md: Feature list -->
1. **F-001:** [Feature name] - [One line description]
2. **F-002:** [Feature name] - [One line description]
3. **F-003:** [Feature name] - [One line description]

### Key Business Rules
<!-- Extract from requirements.md: Business Rules (only most critical) -->
- [Rule 1]
- [Rule 2]

### Data Entities
<!-- Extract from requirements.md: Data entities (only core ones) -->
- **Entity1:** [Brief description]
- **Entity2:** [Brief description]

---

## Development Workflow

### Session-Based Development
We use AIris session-based workflow:
1. Session starts with Opening Brief
2. Work on 1-3 tasks
3. Session ends with Closing Report
4. State captured in handoff.md

### Before Implementing Features
1. Read relevant section of requirements.md
2. Check design.md for constraints
3. Propose approach respecting constraints
4. Implement with tests

### Architecture Decisions
All significant decisions documented as ADRs in design.md.
Check existing ADRs before proposing changes.

---

## Quick Reference

**Technology Stack:** [One-liner]
**Architecture:** [One-liner]
**Testing:** [One-liner]
**Deploy:** [One-liner]

**Key Directories:**
```
src/
├── domain/        # Business logic
├── application/   # Use cases
├── infrastructure/ # Technical implementations
└── interfaces/    # APIs, CLI, etc.
```

**Remember:**
- Constraints in design.md are non-negotiable
- Always propose constraint-respecting solutions
- Reference full docs (.airis/docs/) for details
- Test coverage required for all features
```

**Extraction Tips:**

1. **Be selective:** Don't copy everything, extract essentials
2. **Constraint-first:** Technical constraints MUST be first section
3. **Concise:** Target ~10KB, definitely under 15KB
4. **Actionable:** Include what AI needs during coding
5. **Reference full docs:** Point to .airis/docs/ for details

---

### Extracting AGENTS.md from AIris Docs

**Agent Instructions:**
```
AGENTS.md is similar to CLAUDE.md but for GitHub Copilot ecosystem.

Key differences:
- More emphasis on commands and tools
- Explicit bash commands
- MCP server references (if applicable)
- Nested AGENTS.md support

Same principles:
- Constraint-first ordering
- Extract essentials only
- Keep concise
```

#### Template Structure

```markdown
# AGENTS.md

## Technical Constraints (READ FIRST)

**CRITICAL:** All code must follow these constraints.

### Technology Stack
[Same as CLAUDE.md]

### Architecture Patterns  
[Same as CLAUDE.md]

### Development Standards
[Same as CLAUDE.md]

---

## Project Context
[Same as CLAUDE.md]

---

## Build & Test Commands

### Setup
```bash
# Install dependencies
[command]

# Setup database
[command]

# Run migrations
[command]
```

### Development
```bash
# Run development server
[command]

# Run tests
[command]

# Run specific test
[command]

# Format code
[command]

# Lint code
[command]
```

### Validation
```bash
# Type check
[command]

# Security scan
[command]

# Check coverage
[command]
```

---

## Features & Requirements
[Same as CLAUDE.md]

---

## Common Tasks

### Adding a New Feature
1. Create feature branch
2. Check requirements.md for acceptance criteria
3. Implement following design.md patterns
4. Write tests (80%+ coverage)
5. Update relevant docs if architecture changed
6. Create PR

### Fixing a Bug  
1. Write failing test first
2. Fix the bug
3. Ensure test passes
4. No coverage decrease
5. Document if architectural insight

### Refactoring
1. Check design.md for target patterns
2. Write tests for current behavior
3. Refactor with tests passing
4. Update docs if needed
5. ADR if significant decision

---

## MCP Servers (if applicable)

### Available Tools
- [List MCP servers configured]
- [How to use each]

---

## Quick Reference
[Same as CLAUDE.md]
```

**Key Differences from CLAUDE.md:**

| Aspect | CLAUDE.md | AGENTS.md |
|--------|-----------|-----------|
| **Commands** | Less emphasis | Explicit bash commands |
| **MCP** | Not applicable | MCP server references |
| **Nesting** | Single file | Can have nested AGENTS.md |
| **Tone** | Conversational | More imperative |

---

### Constraint-First Structure Template

**Agent Instruction:**
```
Whether creating CLAUDE.md or AGENTS.md, ALWAYS use this structure:

1. Technical Constraints (FIRST - non-negotiable)
2. Project Context (boundaries and vision)
3. Features (what to build)
4. Workflow (how to work)

This ordering implements the constraint-first principle.
```

**The Golden Rule:**

```
Design (constraints) → Scope (boundaries) → Requirements (features)

NOT:

Requirements (features) → Scope (boundaries) → Design (constraints)
```

**Why This Matters:**

```
AI reads top-to-bottom. 
What it reads first = highest priority.
Constraints first = AI respects architecture.
Features first = AI suggests generic solutions.
```

**Verification Checklist:**

```
✅ "Technical Constraints" is the first content section
✅ Technology stack clearly listed
✅ Architecture patterns explicitly stated
✅ Non-negotiable constraints highlighted
✅ Features come AFTER constraints
✅ File size reasonable (~10-15KB)
✅ References to full docs (.airis/docs/) included
```

---

## 🔧 Advanced Packaging (Optional)

### AIris as Claude Code Skill

**What is a Skill:**
A Claude Code Skill is a directory containing:
- `SKILL.md` with YAML frontmatter
- Instructions for specialized tasks
- Optional scripts and resources

**Why Package AIris as a Skill:**
- ✅ Reusable across multiple projects
- ✅ Claude Code discovers it automatically
- ✅ Progressive disclosure (loads only when needed)
- ✅ Shareable with team/community

**Structure:**

```bash
~/.claude/skills/airis/
├── SKILL.md              # Main skill file
├── prompts/
│   ├── scope.md
│   ├── requirements.md
│   └── design.md
└── templates/
    └── [7 templates]
```

**SKILL.md Example:**

```yaml
---
name: airis-framework
description: Constraint-first framework for creating comprehensive project documentation
---

# AIris Framework Skill

## Purpose
Help developers create well-structured project documentation following the AIris constraint-first methodology.

## When to Use This Skill
Claude should invoke this skill when:
- User mentions "project documentation"
- User asks about "scope", "requirements", or "design" docs
- User mentions "AIris" or "constraint-first"
- User wants to "document project architecture"

## What This Skill Provides

### Strategic Document Generation
1. **scope.md** - Project vision, boundaries, and success metrics
2. **requirements.md** - Features, user stories, and business rules  
3. **design.md** - Architecture, tech stack, and constraints

### The Constraint-First Principle
Always present architecture constraints BEFORE features to AI tools.
Order: Design → Scope → Requirements

## How to Use

### For New Projects
1. Start with scope.md (vision and boundaries)
2. Then requirements.md (features and stories)
3. Then design.md (architecture and constraints)
4. Extract essentials to CLAUDE.md

### For Existing Projects
1. Document current state (AS-IS)
2. Document desired state (TO-BE)
3. Create migration plan

## Progressive Disclosure

**Level 1:** Skill name and description (pre-loaded)
**Level 2:** This overview (loaded when invoked)
**Level 3:** Specific prompts (loaded when needed)

## Available Prompts

### scope.md Generation
Load: `prompts/scope.md`
Time: 4-6 hours
Output: `.airis/docs/scope.md`

### requirements.md Generation  
Load: `prompts/requirements.md`
Time: 6-10 hours
Output: `.airis/docs/requirements.md`

### design.md Generation
Load: `prompts/design.md`
Time: 6-10 hours  
Output: `.airis/docs/design.md`

## Templates

All 7 AIris templates available in `templates/` directory:
- 0-PRD.template.md
- 1-scope.template.md
- 2-requirements.template.md
- 3-design.template.md
- 4-tracker.template.md
- 5-todo.template.md
- 6-handoff.template.md

## Verification

After generating docs, verify:
- ✅ Constraint-first ordering in CLAUDE.md
- ✅ All required sections present
- ✅ ADRs documented in design.md
- ✅ Success metrics in scope.md
- ✅ Acceptance criteria in requirements.md
```

**Installation:**

```bash
# Create skill directory
mkdir -p ~/.claude/skills/airis

# Copy SKILL.md
cp .airis/_setup/SKILL.md ~/.claude/skills/airis/

# Copy prompts
cp -r .airis/_setup/prompts ~/.claude/skills/airis/

# Copy templates
cp -r .airis/_setup/templates ~/.claude/skills/airis/
```

**Usage:**

```bash
$ claude

# Skill is automatically discovered
User: "I need to create project documentation"

Claude: "I can help using the AIris Framework skill. This provides
a constraint-first methodology for creating comprehensive docs.
Would you like to start with scope.md?"
```

---

### AIris as Slash Commands

**What are Slash Commands:**
Saved prompts you invoke by typing `/command-name` in Claude Code.

**Why Use Slash Commands:**
- ✅ Quick invocation (type `/airis-scope`)
- ✅ No need to load full prompts manually
- ✅ Consistent execution
- ✅ Easy to remember

**Structure:**

```bash
~/.claude/commands/        # User-level (all projects)
├── airis-scope.md
├── airis-requirements.md
└── airis-design.md

# OR

.claude/commands/          # Project-level (this project only)
├── airis-scope.md
├── airis-requirements.md
└── airis-design.md
```

**Example: airis-scope.md**

```markdown
---
description: Generate scope.md following AIris methodology
---

# AIris Scope Generation

I'll help you create a comprehensive scope.md document following the AIris framework.

[Copy content from .airis/_setup/prompts/2-scope.prompt.md]

Let's start with the discovery phase...
```

**Usage:**

```bash
$ claude

# Type slash command
User: /airis-scope

Claude: [Loads command and starts scope generation]
```

**Installation:**

```bash
# User-level (available in all projects)
mkdir -p ~/.claude/commands
cp .airis/_setup/prompts/2-scope.prompt.md ~/.claude/commands/airis-scope.md
cp .airis/_setup/prompts/3-requirements.prompt.md ~/.claude/commands/airis-requirements.md
cp .airis/_setup/prompts/4-design.prompt.md ~/.claude/commands/airis-design.md

# Project-level (only this project)
mkdir -p .claude/commands
cp .airis/_setup/prompts/*.prompt.md .claude/commands/
# Rename to remove .prompt extension
```

---

### AIris as Custom Copilot Agents

**What are Custom Agents:**
Specialized agent profiles for GitHub Copilot with specific instructions and tools.

**Why Create AIris Agents:**
- ✅ Team-wide consistency
- ✅ Version-controlled in repo
- ✅ Auto-discovered by Copilot
- ✅ Task-specific specialization

**Structure:**

```bash
.github/agents/
├── airis-scope.agent.md
├── airis-requirements.agent.md
├── airis-design.agent.md
├── airis-tracker.agent.md
└── airis-session.agent.md
```

**Example: airis-scope.agent.md**

```yaml
---
name: airis-scope
description: Create scope.md following AIris constraint-first methodology for defining project vision and boundaries
tools: ['read', 'search', 'edit']
---

# AIris Scope Generation Agent

You are an expert at creating project scope documents following the AIris framework.

## Your Role
Help the developer create a comprehensive scope.md that defines:
- Project vision and goals
- Success metrics
- In-scope / out-of-scope boundaries
- Stakeholders and constraints

## Process

[Adapt content from .airis/_setup/prompts/2-scope.prompt.md to agent format]

### Phase 1: Discovery
Ask about:
1. Project vision - What problem are you solving?
2. Target users - Who will use this?
3. Success metrics - How will you measure success?
4. Constraints - Budget, timeline, team size?

### Phase 2: Documentation
Create structured scope.md with sections:
- Project Overview
- Business Goals
- Success Metrics and SLOs
- Target Users
- In Scope / Out of Scope
- Constraints
- Stakeholders

### Phase 3: Review
- Verify all sections complete
- Check clarity and specificity
- Ensure realistic metrics
- Validate boundaries are clear

## Output
Create `.airis/docs/scope.md` following the AIris scope template.

## Remember
- Be specific with metrics (numbers, percentages, timeframes)
- Clear boundaries prevent scope creep
- Realistic constraints enable planning
- Stakeholder clarity improves communication
```

**Usage:**

```bash
# GitHub Copilot CLI
gh copilot

# Select agent
> Select agent: airis-scope

# Or use directly
gh copilot --agent airis-scope "Help me create scope.md for an e-commerce platform"
```

**Installation:**

```bash
# Create agents directory
mkdir -p .github/agents

# Create agent files
# [Adapt each AIris prompt to agent format]

# Commit to repo
git add .github/agents/
git commit -m "feat: Add AIris custom agents for Copilot"
```

---

## 📊 Reference & Troubleshooting

### Tool Comparison Matrix

| Feature | Claude Code | GitHub Copilot CLI | Generic AI |
|---------|-------------|-------------------|------------|
| **Auto-loads instructions** | ✅ CLAUDE.md | ✅ AGENTS.md | ❌ Manual |
| **Slash commands** | ✅ Yes | ⚠️ Limited | ❌ No |
| **Custom agents** | ✅ Subagents | ✅ .github/agents/ | ❌ No |
| **Skills support** | ✅ Yes | ❌ No | ❌ No |
| **MCP servers** | ✅ Yes | ✅ Yes | ❌ No |
| **Code execution** | ✅ Full | ✅ Full | ❌ No |
| **Multi-project** | ✅ User/project | ✅ Org/repo | ✅ Manual |
| **Best for AIris** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |

**Recommendations:**

- **Solo developer, new to AI tools:** Start with Claude Code
- **Team on GitHub:** Use GitHub Copilot CLI + custom agents
- **Trying AIris first:** Any AI tool works (ChatGPT, Claude.ai, etc.)
- **Best experience:** Claude Code for docs + Copilot for daily coding

---

### Anti-Patterns to Avoid

**Agent Instructions:**
```
When user exhibits these patterns, gently correct:
```

#### Anti-Pattern #1: Treating AIris as a Persistent Agent

**❌ Incorrect:**
> "I want to install the AIris agent that runs all the time"

**✅ Correct:**
> "I want to use AIris to create project docs, then extract instructions for my AI tool"

**Why:** AIris is a framework for creating documents, not an agent itself.

---

#### Anti-Pattern #2: Copying Everything to CLAUDE.md

**❌ Incorrect:**
```markdown
# CLAUDE.md (50 KB)

[Entire scope.md pasted]
[Entire requirements.md pasted]
[Entire design.md pasted]
```

**✅ Correct:**
```markdown
# CLAUDE.md (10 KB)

## Technical Constraints (READ FIRST)
[Key sections from design.md]

## Project Context
[Summary from scope.md]

## Features
[List from requirements.md]

Full details: See .airis/docs/
```

**Why:** Tool-specific files should be concise extracts. Full docs stay in .airis/docs/.

---

#### Anti-Pattern #3: Ignoring Constraint-First Order

**❌ Incorrect:**
```markdown
# CLAUDE.md

## Project Overview
[From scope.md]

## Features
[From requirements.md]

## Technical Stack
[From design.md]
```

**✅ Correct:**
```markdown
# CLAUDE.md

## Technical Constraints (READ FIRST)
[From design.md]

## Project Context
[From scope.md]

## Features
[From requirements.md]
```

**Why:** AI prioritizes information it reads first. Constraints must come first.

---

#### Anti-Pattern #4: Skipping AIris Docs

**❌ Incorrect:**
> "I'll just create CLAUDE.md directly without AIris docs"

**✅ Correct:**
> "I'll use AIris to create comprehensive docs, then extract to CLAUDE.md"

**Why:** AIris docs are single source of truth. CLAUDE.md is an extract.

---

#### Anti-Pattern #5: Not Updating Docs

**❌ Incorrect:**
```
Week 1: Create AIris docs + CLAUDE.md
Week 10: Architecture changed significantly
CLAUDE.md: Still reflects Week 1
```

**✅ Correct:**
```
Week 1: Create AIris docs + CLAUDE.md
Week 10: Update design.md with new architecture
         Re-extract to CLAUDE.md
         Both stay in sync
```

**Why:** Docs drift = AI gives outdated suggestions.

---

### Common Issues & Solutions

#### Issue: "AI keeps suggesting Firebase despite my FastAPI stack"

**Diagnosis:** Constraints not emphasized enough in CLAUDE.md/AGENTS.md

**Solution:**
1. Verify "Technical Constraints (READ FIRST)" is literally first section
2. Make constraints explicit: "Must use FastAPI" not "We use FastAPI"
3. Add emphasis: "CRITICAL: No Firebase, no cloud services, FastAPI only"
4. In conversation: "Read the technical constraints section first"

---

#### Issue: "CLAUDE.md too large, hitting context limits"

**Diagnosis:** Copied too much from AIris docs

**Solution:**
1. Target 10KB for CLAUDE.md (15KB maximum)
2. Extract only essentials:
   - Tech stack: Yes
   - Full technology comparison: No
   - Architecture patterns: Yes
   - Detailed implementation examples: No
3. Reference full docs: "See .airis/docs/design.md section 3.2"

---

#### Issue: "Team members not following constraint-first"

**Diagnosis:** Training or CLAUDE.md structure issue

**Solution:**
1. Verify CLAUDE.md has constraints first
2. Add to TEAM-WORKFLOW.md: "Always read constraints first"
3. Code review checklist: "Respects design.md constraints?"
4. Custom agent for reviews referencing constraints

---

#### Issue: "Don't know which tool to use"

**Diagnosis:** Unfamiliar with tool ecosystem

**Solution:**
1. Start simple: Any AI chat tool works for creating docs
2. For best experience: Claude Code (auto-reads CLAUDE.md)
3. For teams: GitHub Copilot CLI (org-wide agents)
4. Can switch tools later: AIris docs are portable

---

#### Issue: "Existing project too large to document"

**Diagnosis:** Trying to document everything at once

**Solution:**
1. Focus on AS-IS architecture first (design.md)
2. Document current features at high level (requirements.md)
3. Add detail incrementally as you work on areas
4. Prioritize constraint documentation (critical paths)
5. It's OK to have incomplete docs initially

---

#### Issue: "AIris docs out of sync with code"

**Diagnosis:** Docs not updated when architecture changes

**Solution:**
1. Make docs part of PR process:
   - Architecture change → Update design.md
   - New feature → Update requirements.md
   - Goals shift → Update scope.md
2. Add to definition of done: "Docs updated"
3. Quarterly doc review sessions
4. Use ADRs for significant changes

---

## 📁 Examples

Complete examples available in `.airis/examples/`:

### Claude Code Examples
- `examples/claude-code/sample-CLAUDE.md` - Real CLAUDE.md example
- `examples/claude-code/slash-commands/` - Slash command implementations
- `examples/claude-code/skills/` - Full skill package

### GitHub Copilot Examples
- `examples/github-copilot/sample-AGENTS.md` - Real AGENTS.md example
- `examples/github-copilot/custom-agents/` - Complete agent profiles

### Generic AI Examples
- `examples/generic-ai/` - Manual workflow examples

---

## 🎯 Quick Start Checklist

**Agent: Use this when user asks "How do I get started?"**

### For New Users

- [ ] Copy `.airis/` to your project root
- [ ] Choose your tool (Claude Code / Copilot CLI / Other)
- [ ] Read "Conceptual Foundation" section above (10 min)
- [ ] Identify your scenario (use Quick Scenario Selector)
- [ ] Follow step-by-step for your scenario
- [ ] Create scope.md, requirements.md, design.md
- [ ] Extract to CLAUDE.md or AGENTS.md
- [ ] Start development with constraint-first principle

### For Existing Projects

- [ ] Copy `.airis/` to project
- [ ] Use discovery prompt to analyze codebase
- [ ] Document AS-IS state (design.md, requirements.md, scope.md)
- [ ] Add TO-BE sections to each doc
- [ ] Extract to CLAUDE.md or AGENTS.md
- [ ] Start new development following TO-BE constraints

### For Teams

- [ ] Set up AIris docs in repo (or create them)
- [ ] Create TEAM-WORKFLOW.md
- [ ] Create ONBOARDING.md
- [ ] Set up custom agents (if using Copilot)
- [ ] Roll out to team with training
- [ ] Monitor adoption and refine

---

## 📞 Getting Help

**This integration guide is designed to be self-sufficient, but if you need more:**

1. **AIris Framework Documentation** - [.airis/README.md](.airis/README.md)
   - Complete framework explanation
   - Document hierarchy and phases
   - Multi-developer workflows
   - Core principles and philosophy
   
2. **Re-read relevant section** - Most questions answered here

3. **Check examples/** - See real-world implementations

4. **Load this guide into AI** - Let it guide you interactively

5. **AIris Repository** - Check for updates and community discussions

6. **Tool Documentation** - Claude Code, Copilot CLI specific help

**Agent Note:** When user asks about framework concepts, prompt structure, or document relationships, first check if `.airis/README.md` has the answer before attempting to explain from this guide alone.

---

## 📚 Related Documentation

### AIris Framework Core
- **[.airis/README.md](.airis/README.md)** - Complete framework documentation (20KB)
  - Document hierarchy and phases
  - Core principles and philosophy
  - Multi-developer workflows
  - Time estimates and best practices
  - Source and evolution history

### AIris Repository Root
- **[README.md](../README.md)** - Framework overview and quick start (8KB)
  - What is AIris
  - Key innovation (constraint-first)
  - Quick start guide
  - Philosophy and status

### Templates & Prompts
- **[Templates](./_setup/templates/)** - All 7 document templates
  - 0-PRD.template.md
  - 1-scope.template.md
  - 2-requirements.template.md
  - 3-design.template.md
  - 4-tracker.template.md
  - 5-todo.template.md
  - 6-handoff.template.md

- **[Prompts](./_setup/prompts/)** - All 6 AI prompts
  - 1-discovery.prompt.md
  - 2-scope.prompt.md
  - 3-requirements.prompt.md
  - 4-design.prompt.md
  - 5-tracker.prompt.md
  - 6-session.prompt.md

### Agent Note
When answering questions about:
- **Framework structure** → Reference `.airis/README.md`
- **Quick overview** → Reference `../README.md`
- **Template details** → Reference specific template files
- **Prompt usage** → Reference specific prompt files
- **Integration** → Use this guide (INTEGRATION-GUIDE.md)

---

## 🔄 Keeping This Guide Updated

**For maintainers:**

This guide should be updated when:
- New AI tools gain popularity
- AIris framework evolves (check `.airis/README.md` for changes)
- New integration patterns emerge
- Common issues discovered
- Community feedback received

**Version:** 1.0 (January 2026)

---

**Remember:** AIris is a framework for creating excellent documentation that makes AI tools more effective. The integration is about connecting that documentation to your tools, not replacing your development process.

**See clearly. Build confidently.** 👁️
