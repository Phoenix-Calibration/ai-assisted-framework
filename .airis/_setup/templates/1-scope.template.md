# SCOPE DOCUMENT

---

## METADATA

- **Project Name:** [Name]
- **Author:** [Name, Role]
- **Created:** [YYYY-MM-DD]
- **Last Updated:** [YYYY-MM-DD]
- **Version:** [1.0]
- **Status:** [Draft / Approved]

---

## 1. VISION & STRATEGY

> **Purpose:** Quick reference "north star" for the project. Read this first.

### Product Vision
[2-3 paragraphs: What is this product/project? What we're building and why it matters? What problem does it solve? What value does it deliver?]

**Example format:**
"[ProjectName] is a [type of solution] that eliminates [primary pain point] in [target industry/domain]. It transforms [current fragmented workflow] into a [desired state]. The result: [quantified benefit 1], [quantified benefit 2], and [key strategic advantage]."

### Problem Statement
**Current State:** [How things work today - the problem]
**Desired State:** [How things should work - the solution]

### Success Criteria
- [ ] [Measurable outcome 1]
- [ ] [Measurable outcome 2]
- [ ] [Measurable outcome 3]

### Key Constraints
- **Timeline:** [Hard deadline and why]
- **Budget:** [Amount or "No dedicated budget"]
- **Tech Stack:** [Required technologies]

### Strategic Alignment
**How this supports company strategy:**
- [Alignment point 1]
- [Alignment point 2]
- [Alignment point 3]

---

## 2. SUCCESS METRICS

| Metric | Target | Timeline | Measurement Method |
|--------|--------|----------|-------------------|
| [Metric 1] | [Target] | Launch | [How measured] |
| [Metric 2] | [Target] | 3 months | [How measured] |
| [Metric 3] | [Target] | 6 months | [How measured] |
| [User satisfaction] | [Target] | Ongoing | [How measured] |

### Leading Indicators (Optional)
> Metrics that predict future success

- [Indicator 1]: [Why it predicts success]
- [Indicator 2]: [Why it predicts success]

---

## 3. ROADMAP

> **Typical progression:** Foundation → Core Features → Enhancement → Deploy
> Adapt phases to your project. Task details generated in tracker.md.

#### Phase 1: Foundation (Current Scope)
- **Goal:** [Establish project base - scaffold, infrastructure, basic UI]
- **Features:** F-001, F-002 (see §4)
- **Target:** [Date]

#### Phase 2: Core Features
- **Goal:** [Deliver essential functionality]
- **Features:** F-003, F-004
- **Target:** [Date]

#### Phase 3: Enhancement
- **Goal:** [Polish, optimizations, secondary features]
- **Features:** F-005, F-006
- **Target:** [Date]

#### Phase 4: Deploy
- **Goal:** [Production readiness, launch activities]
- **Features:** Documentation, monitoring, launch prep
- **Target:** [Date]

#### Backlog (Unscheduled)
- [Ideas without committed timeline]

---

### Non-Goals
> What this project will NOT pursue or build (strategic exclusions)

- [Non-goal 1]: [Why we're not pursuing this]
- [Non-goal 2]: [Why we're not pursuing this]
- [Non-goal 3]: [Why we're not pursuing this]

---

## 4. FEATURES (High-Level)

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

## 5. TARGET USERS

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

## 6. CONSTRAINTS

| Type | Constraint | Impact/Reason |
|------|------------|---------------|
| **Budget** | [$X total] | [Allocation: Dev $Y, Infra $Z] |
| **Timeline** | [Hard deadline] | [Why immovable] |
| **Team** | [N developers, N designers] | [Available hours/week] |
| **Technical** | Must use [Technology] | [Why required] |
| **Technical** | Cannot use [Technology] | [Why prohibited] |
| **Integration** | Must integrate with [System] | [Read/Write/Both] |
| **Business** | Cannot change [Process] | [Why immutable] |
| **Compliance** | Must comply with [Standard] | [Requirements] |

### Key Milestones (Optional)
| Milestone | Date | Dependencies |
|-----------|------|--------------|
| MVP ready | [YYYY-MM-DD] | [List] |
| Beta launch | [YYYY-MM-DD] | [List] |
| GA launch | [YYYY-MM-DD] | [List] |

---

## 7. RISKS

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

## 8. ASSUMPTIONS

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

## 9. COMPLIANCE & REGULATIONS

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

## NEXT STEPS

Once this Scope document is complete:

1. **Create Design.md** (6-10 hours)
   - Read this Scope document completely
   - Define technical architecture based on Features (§4)
   - Document tech stack decisions with ADRs
   - Define data models from Entity list (§4)
   - Establish coding standards and patterns

2. **Generate Tracker.md** (after Design.md is complete)
   - AI generates tasks from Scope + Design
   - Each feature becomes tasks with detailed acceptance criteria
   - Business rules become validation criteria per task
