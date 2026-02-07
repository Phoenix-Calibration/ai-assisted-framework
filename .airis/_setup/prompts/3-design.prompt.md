# Design Prompt

> **Role:** AI assists the human in creating design.md by proposing options, identifying gaps, suggesting improvements, and structuring decisions. The human makes all final architectural decisions.

## Purpose

Create **design.md** that defines HOW the system will be built. This document establishes the technical constraints that guide all future AI-assisted development (the AIris Way).

- **New projects:** Decide architecture collaboratively
- **Existing projects:** Document AS-IS state + propose TO-BE improvements

---

## Prerequisites

**Required Input:**
- **scope.md** (complete) - Read the entire document
- **PRD** (optional) - For additional business context

---

## Context Detection

Ask user: **"Is this a NEW project or an EXISTING codebase?"**

Then follow the appropriate flow below.

---

## NEW PROJECT FLOW

### Step 1: Read Strategy Context

Read **scope.md** completely. Pay special attention to:
- Features section - Capabilities to build
- Constraints section - Business and technical limitations
- Success Metrics - Performance expectations

### Step 2: Identify Architectural Drivers

Analyze and discuss with user this or whatever topics are most relevant based on scope.md:

| Driver | Question | Impact on Architecture |
|--------|----------|----------------------|
| **Scale** | How many users? Data volume? | Monolith vs distributed |
| **Complexity** | Simple CRUD or complex domain? | Layered vs DDD/Clean |
| **Integration** | Many external systems? | API patterns, resilience |
| **Team** | Size and skill level? | Framework complexity |
| **Timeline** | MVP timeline? | Build vs buy decisions |
| **Compliance** | Regulatory requirements? | Security, audit patterns |

### Step 3: Propose Architecture Options

Present 2-3 viable options with trade-offs:

```markdown
## Option A: [Pattern Name]

**Stack:** [Technologies]
**Best for:** [When this excels]

| Pros | Cons |
|------|------|
| [Benefit 1] | [Trade-off 1] |
| [Benefit 2] | [Trade-off 2] |

**Recommendation strength:** [Strong/Moderate/Conditional]
```

### Step 4: Recommend and Validate

1. **Recommend** the best option with clear rationale
2. **Validate** against scope.md constraints
3. **Identify risks** and mitigation strategies
4. **Wait for user approval** before proceeding

### Step 5: Pre-Generation Checkpoint

**STOP. Before generating design.md, verify you have sufficient information.**

Present to user a summary of what you know and what's missing:

```markdown
## Information Completeness Check

### ✅ I have clear information about:
- [List items you're confident about]

### ❓ I need clarification on:
- [Question 1 about missing/unclear info]
- [Question 2 about missing/unclear info]

### ⚠️ I'm making these assumptions (please confirm):
- [Assumption 1] - Is this correct?
- [Assumption 2] - Is this correct?
```

Evaluate the information you have: Is it coherent? Complete? Are there gaps or contradictions? Ask what you genuinely need to make sound architectural decisions.

**Limit to 3 questions maximum per interaction.** If you have more questions, prioritize the most critical ones and ask the rest after receiving answers.

**Only proceed to generation when user confirms information is complete.**

### Step 6: Generate design.md

Use the official template: `_setup/templates/2-design.template.md`

**Generation guidance:**
- Use prospective language ("We will use...")
- Document the "why" behind each decision as ADRs
- Be specific about versions and configurations

**Use diagrams to clarify:**
- System architecture and component relationships
- Data flow and integration points
- Complex workflows or state machines
- Layer dependencies and boundaries

Format preference: Mermaid (embedded) > Textual description > External link (draw.io, Lucidchart)

---

## EXISTING PROJECT FLOW

### Step 1: Gather Current State

Ask user to provide:
- **Folder structure** (`tree` output or description)
- **Key config files** (package.json, .csproj, requirements.txt, etc.)
- **Existing documentation** (README, architecture docs)
- **Known pain points** (technical debt, bottlenecks)

### Step 2: Read Strategy Context

Read in order:
1. **Existing design.md** (if any) - Previous decisions
2. **scope.md** (complete) - Current boundaries and future features

### Step 3: Analyze AS-IS Architecture

Document current state across dimensions:

**Tech Stack Analysis:**
- Languages, frameworks, databases (with versions)
- Key dependencies and their purposes
- Infrastructure and deployment

**Architecture Pattern Recognition:**
- Identify pattern (Monolithic, Layered, Microservices, etc.)
- Map folder structure to architectural layers
- Note deviations from standard patterns

**Standards Assessment:**
- Code style and conventions in use
- Testing coverage and approach
- Documentation quality

### Step 4: Gap Analysis

Identify issues with impact assessment:

| Category | Issue | Impact | Effort | Priority |
|----------|-------|--------|--------|----------|
| Architecture | [Issue] | H/M/L | H/M/L | P0/P1/P2 |
| Performance | [Issue] | H/M/L | H/M/L | P0/P1/P2 |
| Security | [Issue] | H/M/L | H/M/L | P0/P1/P2 |
| Maintainability | [Issue] | H/M/L | H/M/L | P0/P1/P2 |
| Scalability | [Issue] | H/M/L | H/M/L | P0/P1/P2 |

### Step 5: Propose TO-BE Improvements

For significant changes, propose evolution path:

```markdown
## Architecture Evolution

Current:  [AS-IS pattern]
    ↓
Target:   [TO-BE pattern]

**Rationale:** [Why this improves the system]

**Migration Strategy:** [Gradual / Big-bang / Strangler Fig]

**Phases:**
1. Foundation (X weeks) - [Key deliverables]
2. Refactoring (X weeks) - [Key deliverables]
3. Migration (X weeks) - [Key deliverables]
4. Optimization (X weeks) - [Key deliverables]
```

### Step 6: Pre-Generation Checkpoint

**STOP. Before generating design.md, verify you have sufficient information.**

Present to user a summary of what you know and what's missing:

```markdown
## Information Completeness Check

### ✅ I have clear information about:
- [List items you're confident about from code analysis]

### ❓ I need clarification on:
- [Question 1 about unclear aspects of current system]
- [Question 2 about future direction/priorities]

### ⚠️ I'm making these assumptions (please confirm):
- [Assumption 1 about current architecture] - Is this correct?
- [Assumption 2 about technical debt priority] - Is this correct?
```

Evaluate the information you have: Is it coherent? Complete? Are there gaps between what you see in code and what you need to know? Ask what you genuinely need to document the architecture accurately.

**Limit to 3 questions maximum per interaction.** If you have more questions, prioritize the most critical ones and ask the rest after receiving answers.

**Only proceed to generation when user confirms information is complete.**

### Step 7: Generate design.md

Use the official template: `_setup/templates/2-design.template.md`

**Use diagrams to clarify:**
- Current architecture (AS-IS) and target architecture (TO-BE)
- Data flow and integration points
- Migration paths between states

Format preference: Mermaid (embedded) > Textual description > External link

**For existing projects, ADD these sections after §11 ADRs:**

```markdown
## 12. TECHNICAL DEBT REGISTRY

| ID | Issue | Category | Impact | Effort | Priority | Notes |
|----|-------|----------|--------|--------|----------|-------|
| TD-001 | [Description] | [Arch/Perf/Sec/etc.] | H/M/L | H/M/L | P0/P1/P2 | [Context] |

## 13. ARCHITECTURE EVOLUTION PLAN

### 13.1 Current vs Target State
[AS-IS → TO-BE comparison]

### 13.2 Migration Phases
[Phased approach with deliverables]

### 13.3 Risk Mitigation
[Identified risks and strategies]
```

---

## AI Assistance Guidelines

Throughout this process, AI should:

**PROPOSE** - Suggest options based on constraints and best practices
**QUESTION** - Ask clarifying questions when information is missing (max 3 per interaction)
**VALIDATE** - Check decisions against scope.md constraints
**WARN** - Flag potential issues, risks, or inconsistencies
**STRUCTURE** - Help organize decisions into the template format
**EXPLAIN** - Provide rationale and trade-offs for recommendations
**CONFIRM** - Always run the Pre-Generation Checkpoint before generating

**AI should NOT:**
- Make final architectural decisions without user approval
- Suggest solutions that violate scope.md constraints
- Over-engineer beyond stated requirements
- Assume constraints not documented in scope.md
- **Invent or fabricate information** - If you don't know, ASK
- Proceed to generation with incomplete or uncertain information
- Fill template sections with placeholder/generic content when specifics are needed
- Ask more than 3 questions at once (prioritize, then follow up)

---

## Template Reference

**Official template location:** `_setup/templates/2-design.template.md`

The template contains 11 required sections:
1. Project Overview
2. Architecture
3. Tech Stack
4. Development Workflow
5. Core Principles
6. Coding Standards
7. Security Guidelines
8. Performance Standards
9. Testing Strategy
10. External Integrations (optional)
11. Architecture Decision Records (ADRs)

**Conditional sections** (add for specific project types):
- §3.6 Mobile Stack - For mobile projects
- §6.4 Accessibility - For UI projects
- §6.5 Internationalization - For multi-language projects
- §10.5 MCP Servers - For AI/MCP integrations

---

## Validation Checklist

**For All Projects:**
- [ ] All 11 required template sections addressed
- [ ] Tech stack fully specified with versions
- [ ] Architecture pattern clearly defined with rationale
- [ ] ADRs document key decisions with alternatives considered
- [ ] Security guidelines address authentication, authorization, data protection
- [ ] Performance targets defined with measurement approach
- [ ] Testing strategy covers unit, integration, and E2E
- [ ] Aligns with scope.md constraints

**For Existing Projects (additional):**
- [ ] AS-IS state accurately documented
- [ ] Technical debt identified and prioritized
- [ ] TO-BE improvements proposed with rationale
- [ ] Migration phases defined with realistic timelines
- [ ] Risks identified with mitigation strategies

---

## Tips for Quality

**For New Projects:**
- Be opinionated but document the reasoning
- Consider future growth without over-engineering
- Start simple, plan for complexity
- Validate every decision against scope.md

**For Existing Projects:**
- Document reality honestly, not aspirationally
- Respect past decisions (they had context you may not know)
- Propose incremental improvements over big rewrites
- Balance new features with technical debt reduction

**For All Projects:**
- Every ADR should answer "why not the alternatives?"
- Include diagrams for complex interactions
- Be specific (versions, configurations, exact patterns)
- Write for the next developer (or AI) reading this

---

## Next Steps

Once design.md is approved:

1. **Generate tracker.md** using `4-tracker.prompt.md`
   - Input: design.md + scope.md
   - Output: Complete task breakdown with acceptance criteria

2. **Begin development sessions** using `5-session.prompt.md`
   - AI reads design.md FIRST (constraint-first principle)
   - All code respects architectural decisions


