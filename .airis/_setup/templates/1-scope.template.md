# SCOPE DOCUMENT

> **Purpose:** Define project vision, goals, boundaries, features, and success criteria.
> **Created from:** PRD (if exists) + additional research and stakeholder input
> **Time to complete:** 4-6 hours
> **Next step:** Create Design.md (defines HOW to build)

---

## METADATA

- **Project Name:** [Name]
- **Author:** [Name, Role]
- **Created:** [YYYY-MM-DD]
- **Last Updated:** [YYYY-MM-DD]
- **Version:** [1.0]
- **Status:** [Draft / Approved]

---

## 1. VISION

### Product Vision
[2-3 paragraphs: What is this product/project? What problem does it solve? What value does it deliver?]

**Example format:**
"[ProjectName] is a [type of solution] that eliminates [primary pain point] in [target industry/domain]. It transforms [current fragmented workflow] into a [desired state]. The result: [quantified benefit 1], [quantified benefit 2], and [key strategic advantage]."

---

### Strategic Alignment
**How this supports company strategy:**
- [Alignment point 1]
- [Alignment point 2]
- [Alignment point 3]

---

## 2. GOALS

### Business Goals

**Primary Goal:**  
[One sentence: The main business objective]

**Secondary Goals:**
1. [Goal 1]
2. [Goal 2]
3. [Goal 3]

---

### User Goals

**For [User Type 1]:**
- [Goal 1]
- [Goal 2]

**For [User Type 2]:**
- [Goal 1]
- [Goal 2]

---

## 3. SUCCESS METRICS

### Key Performance Indicators (KPIs)

**Launch Success (Day 1):**
| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| [Metric 1] | [Target] | [How measured] |
| [Metric 2] | [Target] | [How measured] |

**Adoption Success (3 months):**
| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| [Metric 1] | [Target] | [How measured] |
| [Metric 2] | [Target] | [How measured] |

**Business Impact (6-12 months):**
| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| [Metric 1] | [Target] | [How measured] |
| [Metric 2] | [Target] | [How measured] |

**User Satisfaction:**
| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| [Metric 1] | [Target] | [How measured] |

---

### Leading vs Lagging Indicators

**Leading Indicators** (predict future success):
- [Indicator 1]: [Why it matters]
- [Indicator 2]: [Why it matters]

**Lagging Indicators** (measure past performance):
- [Indicator 1]: [Why it matters]
- [Indicator 2]: [Why it matters]

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

---

### Out of Scope

**Explicitly Excluded (and why):**
- [Feature X]: [Reason - e.g., "Requires third-party API not available until Q3"]
- [Feature Y]: [Reason - e.g., "Low user demand based on research"]
- [Feature Z]: [Reason - e.g., "Technical complexity exceeds budget"]

---

### Future Phases

**Phase 2** (Target: [Date/Quarter]):
- [Feature A]
- [Feature B]

**Phase 3** (Target: [Date/Quarter]):
- [Feature C]
- [Feature D]

**Backlog** (No date set):
- [Feature E]
- [Feature F]

---

## 5. FEATURES (High-Level)

> **Note:** This section defines WHAT features the system will have at a high level.
> Detailed acceptance criteria and business rules will be generated in tracker.md as task criteria.
> Focus on capabilities, not implementation details.

### Feature Categories

#### F-001: [Feature Category Name]
**Description:** [1-2 sentences describing this feature area]
**Priority:** Must Have / Should Have / Could Have
**Capabilities:**
- [Capability 1.1]: [Brief description]
- [Capability 1.2]: [Brief description]
- [Capability 1.3]: [Brief description]

**Business Rules (High-Level):**
- [Rule 1]: [Brief description]
- [Rule 2]: [Brief description]

---

#### F-002: [Feature Category Name]
**Description:** [1-2 sentences describing this feature area]
**Priority:** Must Have / Should Have / Could Have
**Capabilities:**
- [Capability 2.1]: [Brief description]
- [Capability 2.2]: [Brief description]

**Business Rules (High-Level):**
- [Rule 1]: [Brief description]

---

#### F-003: [Feature Category Name]
**Description:** [1-2 sentences describing this feature area]
**Priority:** Must Have / Should Have / Could Have
**Capabilities:**
- [Capability 3.1]: [Brief description]
- [Capability 3.2]: [Brief description]

**Business Rules (High-Level):**
- [Rule 1]: [Brief description]

---

### Feature Summary Table

| ID | Feature | Priority | Capabilities | Phase |
|----|---------|----------|--------------|-------|
| F-001 | [Name] | Must Have | [Count] | MVP |
| F-002 | [Name] | Must Have | [Count] | MVP |
| F-003 | [Name] | Should Have | [Count] | Phase 2 |

---

### Data Entities (High-Level)

> **Note:** Define the core business entities. Detailed attributes will be defined in Design.md.

| Entity | Description | Key Relationships |
|--------|-------------|-------------------|
| [Entity 1] | [What it represents] | [Related to Entity 2, Entity 3] |
| [Entity 2] | [What it represents] | [Related to Entity 1] |
| [Entity 3] | [What it represents] | [Related to Entity 1, Entity 2] |

**Example:**
| Entity | Description | Key Relationships |
|--------|-------------|-------------------|
| User | System user with account | Has Orders, has Profile |
| Order | Customer purchase transaction | Belongs to User, has OrderItems |
| Product | Item available for sale | In OrderItems, has Categories |

---

## 6. TARGET USERS

### Primary Users

**User Persona 1: [Name/Role]**
- **Count:** [N users]
- **Description:** [1-2 sentences]
- **Key needs:** [Top 3]
- **Usage frequency:** [Daily/Weekly/Monthly]
- **Tech proficiency:** [High/Medium/Low]

**User Persona 2: [Name/Role]**
- **Count:**
- **Description:**
- **Key needs:**
- **Usage frequency:**
- **Tech proficiency:**

---

### Secondary Users
- **[Role]:** [Count] users - [Brief description]
- **[Role]:** [Count] users - [Brief description]

---

### Non-Users
[Who explicitly will NOT use this system and why]

---

## 7. STAKEHOLDERS

### Stakeholder Map

| Name | Role | Interest | Influence | Engagement Strategy |
|------|------|----------|-----------|-------------------|
| [Name] | [Role] | High/Med/Low | High/Med/Low | [How to engage] |
| [Name] | [Role] | High/Med/Low | High/Med/Low | [How to engage] |

---

### RACI Matrix

| Activity | Responsible | Accountable | Consulted | Informed |
|----------|-------------|-------------|-----------|----------|
| [Activity 1] | [Name] | [Name] | [Names] | [Names] |
| [Activity 2] | [Name] | [Name] | [Names] | [Names] |

---

### Communication Plan

**Status Updates:**
- **Frequency:** [Weekly/Biweekly/Monthly]
- **Format:** [Email/Meeting/Dashboard]
- **Attendees:** [List]
- **Content:** [What's covered]

**Decision Points:**
- [Decision type]: [Who decides] - [Process]

**Escalation Path:**
1. **Level 1:** [Person/Role] - [Issues handled]
2. **Level 2:** [Person/Role] - [Issues handled]
3. **Level 3:** [Person/Role] - [Issues handled]

---

## 8. CONSTRAINTS

### Budget
- **Total project budget:** [$X]
- **Development:** [$Y]
- **Infrastructure (Year 1):** [$Z]
- **Operations (Year 1):** [$A]
- **Maintenance (Year 1):** [$B]

**Budget allocation breakdown:**
| Category | Amount | % of Total |
|----------|--------|------------|
| Development | [$X] | [Y%] |
| Infrastructure | [$Z] | [A%] |
| Operations | [$B] | [C%] |

---

### Timeline

**Key Milestones:**
| Milestone | Date | Dependencies |
|-----------|------|--------------|
| Kickoff | [YYYY-MM-DD] | [None / List] |
| Discovery complete | [YYYY-MM-DD] | [List] |
| Design complete | [YYYY-MM-DD] | [List] |
| MVP ready | [YYYY-MM-DD] | [List] |
| Beta launch | [YYYY-MM-DD] | [List] |
| GA launch | [YYYY-MM-DD] | [List] |

**Hard Deadlines:**
- [Event/Date]: [Why this is immovable]

---

### Team & Resources

**Team Composition:**
| Role | Count | Allocation % | Skills Required |
|------|-------|--------------|-----------------|
| Developers | [N] | [X%] | [List] |
| Designers | [N] | [X%] | [List] |
| QA | [N] | [X%] | [List] |
| DevOps | [N] | [X%] | [List] |

**Capacity:**
- Total team hours/week: [X hours]
- Adjusted for meetings/overhead: [Y hours] available for development

**Skill Gaps:**
- [Skill 1]: [Need to hire/train]
- [Skill 2]: [Need to hire/train]

---

### Technical Constraints

**Must Use:**
- [Technology/Platform]: [Why required]
- [Technology/Platform]: [Why required]

**Must Integrate With:**
- [System 1]: [Integration type - Read/Write/Both]
- [System 2]: [Integration type - Read/Write/Both]

**Cannot Use:**
- [Technology]: [Why prohibited]
- [Technology]: [Why prohibited]

**Must Comply With:**
- [Standard/Regulation]: [Requirements]
- [Standard/Regulation]: [Requirements]

---

### Business Constraints

**Processes We Cannot Change:**
- [Process 1]: [Why immutable]
- [Process 2]: [Why immutable]

**Operations We Cannot Disrupt:**
- [Operation 1]: [Why critical]
- [Operation 2]: [Why critical]

**Backward Compatibility:**
- [System/Data]: [Compatibility requirements]

---

## 9. RISKS

### Risk Register

| ID | Risk | Impact | Probability | Mitigation | Owner | Status |
|----|------|--------|-------------|------------|-------|--------|
| R-001 | [Risk description] | H/M/L | H/M/L | [Mitigation plan] | [Name] | [Status] |
| R-002 | [Risk description] | H/M/L | H/M/L | [Mitigation plan] | [Name] | [Status] |
| R-003 | [Risk description] | H/M/L | H/M/L | [Mitigation plan] | [Name] | [Status] |

**Impact Scale:**
- **High:** Project failure or major delay (>3 months)
- **Medium:** Significant scope/timeline impact (1-3 months)
- **Low:** Minor issues, manageable workarounds

**Probability Scale:**
- **High:** >60% chance of occurring
- **Medium:** 30-60% chance
- **Low:** <30% chance

---

## 10. ASSUMPTIONS

### Critical Assumptions

**Assumptions to Validate:**

| ID | Assumption | Validation Method | Owner | Due Date | Status |
|----|------------|-------------------|-------|----------|--------|
| A-001 | [Assumption] | [How to validate] | [Name] | [Date] | [Status] |
| A-002 | [Assumption] | [How to validate] | [Name] | [Date] | [Status] |
| A-003 | [Assumption] | [How to validate] | [Name] | [Date] | [Status] |

**Example:**
"A-001: Users have Chrome browser v90+ | Validation: Survey existing user base | Owner: PM | Due: 2025-02-01 | Status: In Progress"

---

## 11. DEPENDENCIES

### External Dependencies

| ID | Dependency | Owner | Required By | Status | Risk |
|----|------------|-------|-------------|--------|------|
| D-001 | [System/Team/Vendor] | [Name] | [Date] | [Status] | H/M/L |
| D-002 | [System/Team/Vendor] | [Name] | [Date] | [Status] | H/M/L |

**Dependency Status:**
- ✅ **Confirmed:** Committed and on track
- ⚠️ **At Risk:** Potential delays or issues
- ❌ **Blocked:** Not available, needs escalation

---

## 12. COMPLIANCE & REGULATIONS

### Required Compliance

**Standards/Regulations:**
- **[Standard Name]** (e.g., GDPR, HIPAA, SOC 2)
  - Requirements: [Specific requirements]
  - Owner: [Name]
  - Validation: [How compliance is verified]

- **[Standard Name]**
  - Requirements:
  - Owner:
  - Validation:

---

### Data Privacy

**Personal Data Handling:**
- Data collected: [Types]
- Storage location: [Where]
- Retention period: [How long]
- User rights: [GDPR rights, etc.]

**Compliance Requirements:**
- [Requirement 1]
- [Requirement 2]

---

## 13. OPEN QUESTIONS

### Questions to Resolve

| ID | Question | Owner | Due Date | Status | Resolution |
|----|----------|-------|----------|--------|------------|
| Q-001 | [Question]? | [Name] | [Date] | Open | - |
| Q-002 | [Question]? | [Name] | [Date] | Resolved | [Answer] |

**Status:**
- **Open:** Not yet answered
- **In Progress:** Being investigated
- **Resolved:** Answer documented
- **Blocked:** Cannot answer yet (dependency)

---

## 14. APPROVAL

### Sign-Off

| Role | Name | Signature | Date | Notes |
|------|------|-----------|------|-------|
| Product Manager | | | | |
| Engineering Lead | | | | |
| Business Owner | | | | |
| [Stakeholder] | | | | |

---

## NEXT STEPS

Once this Scope document is approved:

1. **Create Design.md** (6-10 hours)
   - Read this Scope document completely
   - Define technical architecture based on Features (§5)
   - Document tech stack decisions with ADRs
   - Define data models from Entity list (§5)
   - Establish coding standards and patterns

2. **Generate Tracker.md** (after Design.md is complete)
   - AI generates tasks from Scope + Design
   - Each feature becomes tasks with detailed acceptance criteria
   - Business rules become validation criteria per task

---

## CHANGE LOG

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | [Date] | [Name] | Initial version |
| 1.1 | [Date] | [Name] | [Description of changes] |
