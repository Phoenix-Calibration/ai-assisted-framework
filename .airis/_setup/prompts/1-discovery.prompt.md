# Discovery Prompt

## Purpose
Create a Product Requirements Document (PRD) that serves as the foundation for the strategy layer. This prompt adapts to either help structure a new idea into a formal PRD, or document an existing project retrospectively.

---

## Context Detection

Adapt your approach based on what the user provides:

### IF user provides: "I have an idea..." OR describes a problem/solution
→ **New Project Flow**: Guide discovery conversation
→ Output: PRD with vision and initial requirements

### IF user provides: "I have existing code/project..." OR shares repository
→ **Existing Project Flow**: Reverse engineer the WHY
→ Output: Retrospective PRD documenting current state

### IF user provides: "I have a PRD already..."
→ **Refinement Flow**: Validate and structure it
→ Output: Well-structured PRD ready for Scope generation

---

## NEW PROJECT FLOW: Guide Discovery

### Step 1: Understand the Problem

Ask these questions to understand the core problem:

**Problem Space:**
- What problem are you trying to solve?
- Who experiences this problem?
- How do they currently solve it (if at all)?
- Why is the current solution inadequate?

**Impact:**
- How big is this problem? (number of people affected)
- What are the consequences of NOT solving it?
- What would success look like?

### Step 2: Understand the Solution

Ask these questions to understand the proposed solution:

**Solution Space:**
- What solution are you proposing?
- How does it solve the problem differently?
- What makes this solution better than alternatives?

**Users:**
- Who will use this solution?
- What are their characteristics? (technical level, context, goals)
- Are there different user types/personas?

**Project Scope:**
- What is this project/product? (high-level explanation)
- If multi-repo: What does THIS specific repository contain?
- What are the main building blocks/components?

### Step 3: Understand Scope and Constraints

Ask these questions to understand boundaries:

**Scope:**
- What features/capabilities are essential? (MVP)
- What features are nice-to-have but not critical?
- What is explicitly OUT of scope?
- What will be addressed in future phases?

**Constraints:**
- Timeline: When do you need this?
- Budget: Any budget limitations?
- Team: How many people? What skills?
- Technical: Any required technologies/platforms?
- Business: Any regulatory/compliance requirements?

### Step 4: Generate PRD

Based on the discovery conversation, generate a PRD with this structure:

```markdown
# Product Requirements Document

## METADATA

- **Project Name:** [Name]
- **What is [PROJECT_NAME]:** [1-2 sentence explanation of what this project/product is]
- **This Repository:** [What this specific repository/codebase contains - specify if multi-repo]
- **Author:** [Name, Role]
- **Date:** [YYYY-MM-DD]
- **Status:** Draft

---

## 1. Executive Summary

**Problem:**  
[What problem are we solving?]

**Solution:**  
[What are we building?]

**Scope of This Project:**  
[What's included in THIS project vs what's future work - clarify MVP boundaries]

**Key Components:**  
1. [Component 1]: [Brief description of main building block]
2. [Component 2]: [Brief description of main building block]
3. [Component 3]: [Brief description of main building block]
[Add more as needed - typically 3-5 components]

**Users:**  
[Who will use this?]

**Goal:**  
[Why are we building this?]

**Success Metric:**  
[How will we measure success?]

**Timeline:**  
[When will this launch?]

**Budget:**  
[$X total]

---

## 2. Problem Statement

### The Problem
[Detailed description of the problem]

### Who Has This Problem
[Target users/audience]

### Current Solutions
[How people solve this today and their limitations]

### Impact
[Scale and consequences of the problem]

---

## 3. Proposed Solution

### Overview
[High-level description of the solution]

### Key Features
1. [Feature 1]: [Brief description]
2. [Feature 2]: [Brief description]
3. [Feature 3]: [Brief description]

### Differentiation
[What makes this solution unique/better]

---

## 4. Users and Stakeholders

### Primary Users
- **[User Type 1]:** [Description, needs, goals]
- **[User Type 2]:** [Description, needs, goals]

### Stakeholders
- [Stakeholder 1]: [Role and interest]
- [Stakeholder 2]: [Role and interest]

---

## 5. Success Metrics

### Business Metrics
- [Metric 1]: [Target]
- [Metric 2]: [Target]

### User Metrics
- [Metric 1]: [Target]
- [Metric 2]: [Target]

### Technical Metrics
- [Metric 1]: [Target]

---

## 6. Scope

### In Scope (MVP)
- [Feature/capability 1]
- [Feature/capability 2]
- [Feature/capability 3]

### Future Scope (Post-MVP)
- [Feature/capability that can wait]
- [Enhancement for later]

### Out of Scope
- [Explicitly not doing this]
- [Not part of this project]

---

## 7. Constraints

### Timeline
[When is this needed? Any key dates?]

### Budget
[Any budget limitations?]

### Team
[Team size, skills available]

### Technical
[Required technologies, platforms, integrations]

### Business
[Regulatory, compliance, legal requirements]

---

## 8. Assumptions and Dependencies

### Assumptions
- [Assumption 1]
- [Assumption 2]

### Dependencies
- [External dependency 1]
- [External dependency 2]

---

## 9. Risks

### High Risk
- [Risk 1]: [Mitigation strategy]

### Medium Risk
- [Risk 2]: [Mitigation strategy]

---

## 10. Next Steps

Once this PRD is approved:
1. Create Scope.md using scope.prompt.md
2. Create Requirements.md using requirements.prompt.md
3. Create Design.md using design.prompt.md
```

---

## EXISTING PROJECT FLOW: Document Current State

### Step 1: Understand What Exists

Ask these questions about the current project:

**Current State:**
- What does this project do today?
- Who uses it currently?
- How long has it been in operation?
- What problem was it built to solve?

**Project Context:**
- What is this project/product? (high-level explanation)
- If multi-repo: What does THIS specific repository contain?
- What are the main components/building blocks?

**Technical Context:**
- What technologies/frameworks are used?
- What's the current architecture? (share folder structure)
- How is it deployed?
- Any existing documentation?

### Step 2: Reverse Engineer the WHY

Ask questions to understand the original intent:

**Original Problem:**
- What problem was this built to solve?
- Who were the target users?
- What was the business case?

**Evolution:**
- How has it changed since launch?
- What features were added later?
- What problems have you discovered?

### Step 3: Document Current Scope and Future Vision

**Current Scope:**
- What features exist today?
- What does it NOT do?
- What are the boundaries?

**Future Vision:**
- What improvements are needed?
- What new features are planned?
- What technical debt needs addressing?

### Step 4: Generate Retrospective PRD

Generate a PRD that documents the current state AS IF it were written originally:

```markdown
# Product Requirements Document (Retrospective)

## METADATA

- **Project Name:** [Name]
- **What is [PROJECT_NAME]:** [1-2 sentence explanation of what this project/product is]
- **This Repository:** [What this specific repository/codebase contains - specify if multi-repo]
- **Author:** [Name, Role]
- **Date:** [YYYY-MM-DD] (Documented)
- **Original Launch:** [YYYY-MM-DD] (if known)
- **Status:** Retrospective Documentation

---

## 1. Executive Summary

**Problem:**  
[The problem this system solves]

**Solution:**  
[Current solution description]

**Scope of This Project:**  
[What THIS project covers vs what's separate/future - clarify current boundaries]

**Key Components:**  
1. [Component 1]: [Brief description of main building block]
2. [Component 2]: [Brief description of main building block]
3. [Component 3]: [Brief description of main building block]
[Document actual architecture components - typically 3-5]

**Users:**  
[Current users]

**Goal:**  
[Original/current goal]

**Success Metric:**  
[How success is measured]

**Timeline:**  
[Original timeline or current milestones]

**Budget:**  
[If known]

---

## 2. Problem Statement

### The Problem
[The problem this system solves]

### Who Has This Problem
[Current users]

### How We Solve It
[Current solution description]

---

## 3. Current Solution

### Overview
[High-level description of what exists]

### Key Features (Current)
1. [Feature 1]: [What it does]
2. [Feature 2]: [What it does]
3. [Feature 3]: [What it does]

### Known Limitations
[What the current system doesn't do well]

---

## 4. Users and Stakeholders

### Current Users
- **[User Type 1]:** [Description and how they use it]
- **[User Type 2]:** [Description and how they use it]

### Stakeholders
- [Stakeholder 1]: [Role]
- [Stakeholder 2]: [Role]

---

## 5. Success Metrics (Current)

### Business Metrics
- [Metric 1]: [Current status]
- [Metric 2]: [Current status]

### User Metrics
- [Metric 1]: [Current status]

### Technical Metrics
- [Metric 1]: [Current status]

---

## 6. Current Scope

### What Exists Today
- [Feature/capability 1]
- [Feature/capability 2]
- [Feature/capability 3]

### Planned Additions
- [New feature 1]
- [New feature 2]

### Out of Scope
- [Not doing this]
- [Intentionally excluded]

---

## 7. Technical Context

### Current Stack
- Language: [e.g., C#, Python, TypeScript]
- Framework: [e.g., .NET 8, FastAPI, Next.js]
- Database: [e.g., PostgreSQL, MongoDB]
- Deployment: [e.g., Azure, AWS, Docker]

### Architecture
[Brief description - will be detailed in Design.md]

---

## 8. Known Issues and Technical Debt

### High Priority Issues
- [Issue 1]
- [Issue 2]

### Technical Debt
- [Debt item 1]
- [Debt item 2]

---

## 9. Future Vision

### Improvements Needed
- [Improvement 1]
- [Improvement 2]

### New Features Planned
- [Feature 1]
- [Feature 2]

---

## 10. Next Steps

Now that we've documented the current state:
1. Create Scope.md (documenting current boundaries and goals)
2. Create Requirements.md (documenting current + new functionality)
3. Create Design.md (AS-IS architecture + TO-BE improvements)
```

---

## REFINEMENT FLOW: Validate Existing PRD

### Step 1: Review Provided PRD

Read the PRD provided by the user and check for:

**Completeness:**
- [ ] Project name and explanation clear?
- [ ] Repository scope clarified (if multi-repo)?
- [ ] Problem statement clear?
- [ ] Target users identified?
- [ ] Solution described?
- [ ] Project scope boundaries set?
- [ ] Key components identified?
- [ ] Success metrics defined?
- [ ] Constraints documented?

### Step 2: Identify Gaps

Point out missing sections:
- "Your PRD is missing [section]. Let me ask you about..."
- "The [section] needs more detail. Can you clarify..."
- "For multi-repo projects, we need to clarify what THIS repository contains..."
- "Can you list the main components/building blocks?"

### Step 3: Restructure if Needed

If the PRD structure is different from our template:
- Extract information from their format
- Reorganize into our standard template
- Add the new METADATA fields (What is, This Repository)
- Add the new Executive Summary subsections (Scope of This Project, Key Components)
- Preserve all their content, just restructure

### Step 4: Output Refined PRD

Generate the PRD in our standard format, incorporating all their information.

---

## Output Format

All flows produce a PRD following the template structure above.

**File to create:** `PRD.md` in the project documentation folder

---

## Validation Checklist

Before finalizing the PRD, verify:

- [ ] METADATA complete (including "What is" and "This Repository")
- [ ] Executive Summary includes "Scope of This Project"
- [ ] Executive Summary includes "Key Components" (3-5 items)
- [ ] Problem is clearly articulated
- [ ] Target users are identified
- [ ] Solution approach is described
- [ ] Success metrics are defined
- [ ] Scope is bounded (in/out)
- [ ] Constraints are documented
- [ ] Next steps are clear

---

## Tips for Effective Discovery

### For New Projects:
- Ask open-ended questions first
- Don't assume - clarify everything
- Ask explicitly: "What is this project/product?" to get concise explanation
- For multi-repo: Ask "What does THIS repository contain?"
- Ask "What are the main building blocks?" to identify key components
- Challenge assumptions politely
- Help user think through edge cases
- Be realistic about scope (MVP first)

### For Existing Projects:
- Focus on documenting current state accurately
- Ask "What is this project?" even if name seems obvious
- Clarify repository boundaries in multi-repo scenarios
- Identify actual architectural components, not aspirational
- Don't judge past decisions
- Identify gaps between intent and reality
- Document both successes and challenges
- Look forward (improvement opportunities)

### For Refinement:
- Respect their existing work
- Check for new required fields (What is, This Repository, Scope of This Project, Key Components)
- Suggest improvements diplomatically
- Add missing pieces, don't replace
- Ensure consistency across sections

---

## Example Interaction

**User:** "I have an idea for a calibration management system for ISO 17025 labs"

**AI Response:**
```
Great! Let me help you structure this into a formal PRD. 

First, let's understand the project:

1. Can you describe in 1-2 sentences what this calibration management system is?
2. What specific problem are calibration labs facing that your system will solve?
3. Who in the lab would use this system? (Lab managers, technicians, quality officers?)
4. How do labs currently handle calibration management?
5. What are the main components/building blocks you envision? (e.g., equipment tracking, scheduling, reporting?)

Take your time - the more detail you provide, the better PRD we can create.
```

**[After discovery conversation]**

**AI Response:**
```
Based on our discussion, I've created a comprehensive PRD for your Calibration Management System.

The PRD documents:

METADATA:
- What it is: ISO 17025-compliant platform for automated calibration lifecycle management
- Repository scope: Full-stack application (single repo)

EXECUTIVE SUMMARY:
- Problem: Manual tracking causes compliance issues and audit failures
- Solution: Automated calibration tracking with ISO 17025 compliance
- Scope: Core platform MVP - equipment tracking, scheduling, certificate generation
- Key Components: Equipment Registry, Calibration Scheduler, Certificate Generator, Audit Trail, Compliance Dashboard
- Users: Quality managers, technicians, lab administrators  
- Success Metrics: Zero audit failures, 50% time savings

Next steps:
1. Review and approve this PRD
2. Use scope.prompt.md to create Scope.md
3. Use requirements.prompt.md to create detailed Requirements.md
4. Use design.prompt.md to create technical Design.md

Would you like to proceed with creating Scope.md?
```

---

## CHANGE LOG

| Version | Date | Changes |
|---------|------|----------|
| 1.0 | 2026-01-15 | Initial prompt created |
| 1.1 | 2026-01-21 | Added 4 Priority 1 improvements from validation: "What is [PROJECT_NAME]", "This Repository", "Scope of This Project", "Key Components" |
