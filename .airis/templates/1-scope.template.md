# SCOPE DOCUMENT

> **Purpose:** Strategic foundation defining WHAT we're building and WHY. Feeds into Design.md (HOW).
> **Input:** PRD.md or equivalent discovery output
> **Next step:** Create Design.md

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

### Product Vision
[2-3 paragraphs: What is this product? What problem does it solve? What value does it deliver? What's the desired end state?]

### Problem Statement
- **Current State:** [How things work today — the pain]
- **Desired State:** [How things should work — the outcome]

### Success Criteria
- [ ] [Measurable outcome 1]
- [ ] [Measurable outcome 2]
- [ ] [Measurable outcome 3]

### Strategic Alignment
- [How this supports company/department strategy 1]
- [How this supports company/department strategy 2]

---

## 2. SUCCESS METRICS

| Metric | Target | Timeline | Measurement Method |
|--------|--------|----------|-------------------|
| [Metric 1] | [Target] | Launch | [How measured] |
| [Metric 2] | [Target] | 3 months | [How measured] |
| [Metric 3] | [Target] | 6 months | [How measured] |

---

## 3. ROADMAP

> Phases adapt to your project. Task details are generated in tracker.md.

#### Phase 1: Foundation
- **Goal:** [Establish project base — scaffold, infrastructure, basic UI]
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

#### Backlog
- [Ideas without committed timeline]

### Non-Goals
> What this project will NOT build. Be specific — vague exclusions don't prevent scope creep.

- Do NOT [action/feature]: [Why excluded]
- Do NOT [action/feature]: [Why excluded]
- Do NOT [action/feature]: [Why excluded]

---

## 4. FEATURES (High-Level)

> WHAT the system does, not HOW. Detailed acceptance criteria go to tracker.md.

#### F-001: [Feature Category Name]
- **Description:** [1-2 sentences]
- **Priority:** Must Have / Should Have / Could Have
- **Capabilities:**
  - [Capability 1.1]: [Brief description]
  - [Capability 1.2]: [Brief description]
  - [Capability 1.3]: [Brief description]
- **Business Rules:**
  - [Rule 1]: [Brief description]
  - [Rule 2]: [Brief description]

> Repeat for F-002, F-003, etc.

### Feature Summary

| ID | Feature | Priority | Capabilities | Phase |
|----|---------|----------|--------------|-------|
| F-001 | [Name] | Must Have | [Count] | Phase 1 |
| F-002 | [Name] | Must Have | [Count] | Phase 2 |
| F-003 | [Name] | Should Have | [Count] | Phase 3 |

### Data Entities

> Core business entities. Detailed attributes go in Design.md.

| Entity | Description | Key Relationships |
|--------|-------------|-------------------|
| [Entity 1] | [What it represents] | [Related to Entity 2, 3] |
| [Entity 2] | [What it represents] | [Related to Entity 1] |
| [Entity 3] | [What it represents] | [Related to Entity 1, 2] |

---

## 5. TARGET USERS

### Primary: [Role Name]
- **Count:** [N users]
- **Description:** [1-2 sentences]
- **Key needs:** [Top 3]
- **Usage frequency:** [Daily / Weekly / Monthly]
- **Tech proficiency:** [High / Medium / Low]

> Repeat for additional primary personas (2-3 max).

### Secondary Users
- **[Role]:** [Count] users — [Brief description]

### Non-Users
[Who explicitly will NOT use this system and why]

---

## 6. CONSTRAINTS

| Type | Constraint | Impact/Reason |
|------|------------|---------------|
| **Budget** | [$X total] | [Allocation] |
| **Timeline** | [Hard deadline] | [Why immovable] |
| **Team** | [N developers, N designers] | [Available hours/week] |
| **Technical** | Must use [Technology] | [Why required] |
| **Technical** | Cannot use [Technology] | [Why prohibited] |
| **Integration** | Must integrate with [System] | [Read / Write / Both] |
| **Business** | Cannot change [Process] | [Why immutable] |
| **Compliance** | Must comply with [Standard] | [Requirements] |

### Key Milestones (if applicable)

| Milestone | Date | Dependencies |
|-----------|------|--------------|
| MVP ready | [YYYY-MM-DD] | [List] |
| Beta launch | [YYYY-MM-DD] | [List] |
| GA launch | [YYYY-MM-DD] | [List] |

---

## 7. RISKS

| ID | Risk | Impact | Prob. | Mitigation | Owner | Status |
|----|------|--------|-------|------------|-------|--------|
| R-001 | [Risk description] | H/M/L | H/M/L | [Mitigation plan] | [Role] | Identified |
| R-002 | [Risk description] | H/M/L | H/M/L | [Mitigation plan] | [Role] | Identified |
| R-003 | [Risk description] | H/M/L | H/M/L | [Mitigation plan] | [Role] | Identified |

> Impact: H = project failure / >3mo delay, M = 1-3mo impact, L = minor. Probability: H >60%, M 30-60%, L <30%.

---

## 8. ASSUMPTIONS

| ID | Assumption | Validation Method | Owner | Due Date | Status |
|----|------------|-------------------|-------|----------|--------|
| A-001 | [Assumption] | [How to validate] | [Role] | [Date] | Pending |
| A-002 | [Assumption] | [How to validate] | [Role] | [Date] | Pending |

---

## 9. COMPLIANCE & REGULATIONS

> If no compliance needed: state "No regulatory compliance required" and skip this section.

### Standards
- **[Standard Name]** (e.g., GDPR, HIPAA, SOC 2, ISO 17025)
  - Requirements: [Specific requirements]
  - Validation: [How compliance is verified]

### Data Privacy
- **Data collected:** [Types — PII, health, financial]
- **Storage location:** [Where]
- **Retention period:** [How long]
- **User rights:** [Access, deletion, portability]

---

## NEXT STEPS

1. **Create Design.md** → Read this Scope completely → Define architecture from Features (§4), data models from Entities (§4), tech stack from Constraints (§6)
2. **Generate Tracker.md** → After Design.md → AI expands features into tasks with detailed acceptance criteria

---

## VALIDATION CHECKLIST

Before finalizing, verify:

- [ ] §1 Vision: 2-3 paragraphs + Problem (Current/Desired) + Success Criteria (3-5) + Strategic Alignment
- [ ] §2 Metrics: 3-5 measurable targets with timeline and method
- [ ] §3 Roadmap: 4 phases with Goal + Feature IDs + Target + Non-Goals (2-3 items)
- [ ] §4 Features: 3-5 categories (F-XXX) with Description, Priority, Capabilities, Business Rules + Summary Table + Entities
- [ ] §5 Users: 2-3 primary personas (all fields) + Secondary + Non-Users
- [ ] §6 Constraints: At least 5 constraints covering Budget, Timeline, Team, Technical
- [ ] §7 Risks: 3+ risks with ID, Impact, Probability, Mitigation, Owner
- [ ] §8 Assumptions: 2+ assumptions with validation method
- [ ] §9 Compliance: Standards listed OR explicit "None required"
- [ ] No empty sections — populate or remove optional ones
