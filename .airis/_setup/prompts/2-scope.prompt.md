# Scope Prompt

## Purpose
Create Scope.md that defines the project's vision, goals, boundaries, features, and success metrics. Works for both new and existing projects by extracting key information from the PRD.

**Key Change:** Scope.md now includes high-level Features (§5) that will be expanded into detailed tasks in Tracker.md. There is no separate Requirements.md document.

---

## Prerequisites

**Required Input:**
- PRD.md (created using discovery.prompt.md)

**Note:** Scope.md is the same process for both new and existing projects. The only difference is that for existing projects, the PRD documents current state rather than future plans.

---

## Process

### Step 1: Read the PRD Completely

Read the entire PRD.md to understand:
- The problem being solved
- Target users
- Proposed/current solution
- Success metrics
- Scope boundaries
- Features and capabilities
- Constraints

### Step 2: Extract Information for Each Section

Use the template structure and map PRD content to Scope sections:

#### § 1 PROJECT OVERVIEW
- Extract from PRD Executive Summary
- Condense into 2-3 paragraphs

#### § 2 VISION
- Extract from PRD Problem Statement + Solution
- Focus on the future state / desired outcome

#### § 3 GOALS
- Extract from PRD Success Metrics
- Convert metrics into goal statements
- Use SMART format (Specific, Measurable, Achievable, Relevant, Time-bound)

#### § 4 SCOPE BOUNDARIES
- In Scope: User groups, processes, integrations
- Out of Scope: Explicitly excluded items and why
- Future Phases: What's planned for later

#### § 5 FEATURES (High-Level) - KEY SECTION
- **This replaces the need for a separate Requirements.md**
- Extract features from PRD and organize by category (F-001, F-002, etc.)
- For each feature category, define:
  - Description (1-2 sentences)
  - Priority (Must Have / Should Have / Could Have)
  - Capabilities (list what it does)
  - Business Rules (high-level only)
- Include Feature Summary Table
- Include Data Entities (high-level: name, description, key relationships)
- **Note:** Detailed acceptance criteria will be generated in Tracker.md

#### § 6 TARGET USERS
- Extract from PRD "Users and Stakeholders"
- Create user personas with needs, goals, pain points
- Include technical level

#### § 7 STAKEHOLDERS
- List decision makers, influencers, affected parties
- Note their interests and influence level

#### § 8 CONSTRAINTS
- Time, Budget, Resource, Business constraints
- These are non-negotiable limits

#### § 9 RISKS
- Extract from PRD "Risks" section
- Rate by severity and probability
- Include mitigation strategies

#### § 10 ASSUMPTIONS
- List what we're assuming to be true
- Note which need validation

#### § 11 DEPENDENCIES
- External: APIs, services, vendors
- Internal: Teams, systems, resources
- Note blocking vs non-blocking

#### § 12 COMPLIANCE & REGULATIONS
- Standards that must be met
- Data privacy requirements

#### § 13 OPEN QUESTIONS
- Questions that need answers
- Track owner and status

#### § 14 APPROVAL
- Sign-off from stakeholders

---

## Template to Generate

```markdown
# Scope Document

> **Purpose:** Define project vision, goals, boundaries, features, and success criteria.
> **Created:** YYYY-MM-DD
> **Last Updated:** YYYY-MM-DD
> **Source:** PRD.md
> **Next Document:** Design.md (created after this)

---

## 1. PROJECT OVERVIEW

[2-3 paragraph summary from PRD Executive Summary]

**Project Name:** [Name]
**Project Type:** [Web App / Mobile App / API / Desktop App / Integration / etc.]
**Primary Purpose:** [One-sentence description]

---

## 2. VISION

[Extract from PRD - the desired future state]

Example format:
"We envision a world where [target users] can [desired outcome] without [current pain point], enabling them to [ultimate benefit]."

---

## 3. GOALS

### Primary Goals (Must Achieve)
1. **[Goal 1]:** [Description with target metric]
   - Success Metric: [Specific measurable target]
   - Timeline: [When to achieve]

### Secondary Goals (Should Achieve)
1. **[Goal 2]:** [Description]
   - Success Metric: [Target]

---

## 4. SCOPE BOUNDARIES

### In Scope

**User Groups:**
- [User group 1]
- [User group 2]

**Processes:**
- [Process 1]
- [Process 2]

**Systems/Integrations:**
- [System 1]
- [System 2]

### Out of Scope

**Explicitly Excluded (and why):**
- [Item 1]: [Reason]
- [Item 2]: [Reason]

### Future Phases

**Phase 2** (Target: [Date]):
- [Feature A]
- [Feature B]

---

## 5. FEATURES (High-Level)

> **Note:** This section defines WHAT features the system will have.
> Detailed acceptance criteria will be generated in Tracker.md as task criteria.

### Feature Categories

#### F-001: [Feature Category Name]
**Description:** [1-2 sentences]
**Priority:** Must Have / Should Have / Could Have
**Capabilities:**
- [Capability 1.1]: [Brief description]
- [Capability 1.2]: [Brief description]

**Business Rules (High-Level):**
- [Rule 1]: [Brief description]

---

#### F-002: [Feature Category Name]
**Description:** [1-2 sentences]
**Priority:** Must Have / Should Have / Could Have
**Capabilities:**
- [Capability 2.1]: [Brief description]

**Business Rules (High-Level):**
- [Rule 1]: [Brief description]

---

### Feature Summary Table

| ID | Feature | Priority | Capabilities | Phase |
|----|---------|----------|--------------|-------|
| F-001 | [Name] | Must Have | [Count] | MVP |
| F-002 | [Name] | Should Have | [Count] | Phase 2 |

### Data Entities (High-Level)

| Entity | Description | Key Relationships |
|--------|-------------|-------------------|
| [Entity 1] | [What it represents] | [Related to...] |
| [Entity 2] | [What it represents] | [Related to...] |

---

## 6. TARGET USERS

### Primary User Personas

**Persona 1: [Name/Role]**
- **Description:** [Who they are]
- **Needs:** [What they need]
- **Goals:** [What they want to accomplish]
- **Pain Points:** [Current challenges]
- **Technical Level:** [Beginner / Intermediate / Advanced]

### Secondary Users
- **[Role]:** [Brief description and needs]

---

## 7. STAKEHOLDERS

| Stakeholder | Role | Interest | Influence |
|-------------|------|----------|-----------|
| [Name/Role] | [Position] | [What they care about] | High/Med/Low |

---

## 8. CONSTRAINTS

### Time Constraints
[Timeline requirements]

### Budget Constraints
[Budget limitations]

### Resource Constraints
[Team size, skills available]

### Business Constraints
[Regulatory, compliance, legal requirements]

---

## 9. RISKS

| Risk | Impact | Probability | Mitigation Strategy |
|------|--------|-------------|---------------------|
| [Risk 1] | High/Med/Low | High/Med/Low | [How to mitigate] |

---

## 10. ASSUMPTIONS

1. **[Assumption 1]:** [Description]
   - **Validation needed:** Yes/No

---

## 11. DEPENDENCIES

### External Dependencies
| Dependency | Type | Criticality | Risk |
|------------|------|-------------|------|
| [API/Service] | API | Blocking | [Risk if unavailable] |

### Internal Dependencies
| Dependency | Type | Criticality | Risk |
|------------|------|-------------|------|
| [Team/System] | Resource | Non-blocking | [Risk] |

---

## 12. COMPLIANCE & REGULATIONS

**Standards/Regulations:**
- **[Standard Name]:** [Requirements]

**Data Privacy:**
- Data collected: [Types]
- Retention: [Period]

---

## 13. OPEN QUESTIONS

| ID | Question | Owner | Due Date | Status |
|----|----------|-------|----------|--------|
| Q-001 | [Question]? | [Name] | [Date] | Open |

---

## 14. APPROVAL

| Role | Name | Date | Notes |
|------|------|------|-------|
| Product Manager | | | |
| Engineering Lead | | | |

---

## NEXT STEPS

Once this Scope document is approved:

1. **Create Design.md** (6-10 hours)
   - Read this Scope document completely
   - Define technical architecture based on Features (§5)
   - Document tech stack decisions with ADRs
   - Define data models from Entity list

2. **Generate Tracker.md** (after Design.md is complete)
   - AI generates tasks from Scope + Design
   - Each feature becomes tasks with detailed acceptance criteria

---

## CHANGE LOG

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | [Date] | [Name] | Initial scope definition |
```

---

## Validation Checklist

Before finalizing Scope.md, verify:

- [ ] All sections filled from PRD
- [ ] Vision is clear and inspiring
- [ ] Goals are SMART
- [ ] Features (§5) cover all planned capabilities
- [ ] Data Entities identified
- [ ] Out-of-scope items are explicit
- [ ] User personas are detailed
- [ ] Constraints are documented
- [ ] Risks have mitigation strategies
- [ ] Dependencies are identified

---

## Special Considerations

### For Existing Projects:
- Section 5 (Features) should separate:
  - **Current Features:** What exists today
  - **Planned Features:** What will be added
- Data Entities should document current schema
- Vision should balance current state with future improvements

### For New Projects:
- All features are "planned"
- Vision is entirely forward-looking
- Goals focus on MVP delivery

---

## Tips for Effective Scope Creation

1. **Be Specific:** Vague scope leads to scope creep
2. **Features at Right Level:** High-level capabilities, not detailed user stories
3. **Data Entities Matter:** They inform the Design.md data models
4. **Business Rules Summary:** Just the key rules, details go to Tracker
5. **Think Long-term:** Scope should guide the project for months

---

## Example Output

**User:** "I have this PRD for my calibration management system. Create the Scope.md"

**AI Response:**
```
Reading PRD.md...

Creating Scope.md with:
- §1 Project Overview: ISO 17025 calibration management system
- §2 Vision: Eliminate manual tracking errors and ensure compliance
- §3 Goals: Zero audit failures, 50% time savings, 100% on-time calibrations
- §4 Scope Boundaries: In/Out scope defined
- §5 Features:
  - F-001: Equipment Management (Must Have) - 5 capabilities
  - F-002: Calibration Scheduling (Must Have) - 4 capabilities
  - F-003: Certificate Generation (Must Have) - 3 capabilities
  - F-004: Audit Trail (Must Have) - 2 capabilities
  - Data Entities: Equipment, Calibration, Certificate, User
- §6-14: [All other sections]

Scope.md created successfully!

Next steps:
1. Review and approve this Scope.md
2. Use design.prompt.md to create Design.md
3. Then generate Tracker.md with detailed tasks
```

---

## CHANGE LOG

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-01-15 | Initial prompt created |
| 2.0 | 2026-02-05 | Removed Requirements.md dependency, added Features section |
