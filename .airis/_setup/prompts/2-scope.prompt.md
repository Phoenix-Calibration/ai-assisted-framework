# Scope Prompt

## Purpose
Create Scope.md that defines the project's vision, goals, boundaries, and success metrics. Works for both new and existing projects by extracting key information from the PRD.

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

#### § 4 IN-SCOPE FEATURES
- Extract from PRD "In Scope (MVP)" section
- List features that WILL be included
- For existing projects: features that EXIST today + planned additions

#### § 5 OUT-OF-SCOPE
- Extract from PRD "Out of Scope" section
- List features explicitly NOT included
- Helps prevent scope creep

#### § 6 SUCCESS METRICS
- Extract from PRD "Success Metrics"
- Organize by category: Business, User, Technical
- Define specific targets

#### § 7 TARGET USERS
- Extract from PRD "Users and Stakeholders"
- Create user personas or descriptions
- Include their needs and goals

#### § 8 STAKEHOLDERS
- Extract from PRD "Users and Stakeholders"
- List decision makers, influencers, affected parties
- Note their interests

#### § 9 ASSUMPTIONS
- Extract from PRD "Assumptions and Dependencies"
- List what we're assuming to be true
- These may need validation

#### § 10 CONSTRAINTS
- Extract from PRD "Constraints" section
- Organize by: Time, Budget, Technical, Resources, Business
- These are non-negotiable limits

#### § 11 TECHNICAL CONSTRAINTS
- Extract from PRD "Technical" constraints
- List required technologies, platforms
- List integration requirements
- List performance/security requirements

#### § 12 RISKS
- Extract from PRD "Risks" section
- Rate by severity: High, Medium, Low
- Include mitigation strategies

#### § 13 DEPENDENCIES
- Extract from PRD "Dependencies" section
- External: APIs, services, vendors
- Internal: Teams, systems, resources
- Note blocking vs non-blocking

---

## Template to Generate

```markdown
# Scope Document

> **Purpose:** Define project vision, goals, boundaries, and success criteria.  
> **Created:** YYYY-MM-DD  
> **Last Updated:** YYYY-MM-DD  
> **Source:** PRD.md  
> **Next Document:** Requirements.md (created after this)

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

[Extract from PRD Success Metrics and convert to goal statements]

### Primary Goals (Must Achieve)
1. **[Goal 1]:** [Description with target metric]
   - Success Metric: [Specific measurable target]
   - Timeline: [When to achieve]

2. **[Goal 2]:** [Description with target metric]
   - Success Metric: [Specific measurable target]
   - Timeline: [When to achieve]

### Secondary Goals (Should Achieve)
1. **[Goal 3]:** [Description]
   - Success Metric: [Target]

---

## 4. IN-SCOPE FEATURES

[Extract from PRD "In Scope" section]

### Core Features (MVP)
- **[Feature 1]:** [Brief description]
- **[Feature 2]:** [Brief description]
- **[Feature 3]:** [Brief description]

### Additional Features (Phase 2)
- **[Feature 4]:** [Brief description]
- **[Feature 5]:** [Brief description]

**Note:** For existing projects, separate into:
- **Existing Features:** [What exists today]
- **Planned Features:** [What will be added]

---

## 5. OUT-OF-SCOPE

[Extract from PRD "Out of Scope" section]

The following are explicitly OUT of scope for this project:

- **[Item 1]:** [Why it's out of scope]
- **[Item 2]:** [Why it's out of scope]
- **[Item 3]:** [Why it's out of scope]

---

## 6. SUCCESS METRICS

[Extract from PRD Success Metrics section]

### 6.1 Business Metrics

| Metric | Target | Measurement Method | Timeline |
|--------|--------|-------------------|----------|
| [Metric 1] | [Target] | [How to measure] | [When] |
| [Metric 2] | [Target] | [How to measure] | [When] |

### 6.2 User Metrics

| Metric | Target | Measurement Method | Timeline |
|--------|--------|-------------------|----------|
| [Metric 1] | [Target] | [How to measure] | [When] |
| [Metric 2] | [Target] | [How to measure] | [When] |

### 6.3 Technical Metrics (SLOs)

| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| Availability | [e.g., 99.9%] | [Monitoring tool] |
| Response Time | [e.g., < 200ms] | [APM tool] |
| Error Rate | [e.g., < 0.1%] | [Logging] |

---

## 7. TARGET USERS

[Extract from PRD "Users and Stakeholders" - Primary Users section]

### 7.1 Primary User Personas

**Persona 1: [Name/Role]**
- **Description:** [Who they are]
- **Needs:** [What they need from the system]
- **Goals:** [What they want to accomplish]
- **Pain Points:** [Current challenges]
- **Technical Level:** [Beginner / Intermediate / Advanced]

**Persona 2: [Name/Role]**
- **Description:** [Who they are]
- **Needs:** [What they need]
- **Goals:** [What they want to accomplish]
- **Pain Points:** [Current challenges]
- **Technical Level:** [Skill level]

### 7.2 Secondary Users (if applicable)

- **[Role]:** [Brief description and needs]

---

## 8. STAKEHOLDERS

[Extract from PRD "Users and Stakeholders" - Stakeholders section]

| Stakeholder | Role | Interest | Influence |
|-------------|------|----------|-----------|
| [Name/Role] | [Position] | [What they care about] | [High/Medium/Low] |
| [Name/Role] | [Position] | [What they care about] | [High/Medium/Low] |

---

## 9. ASSUMPTIONS

[Extract from PRD "Assumptions" section]

We are proceeding based on these assumptions:

1. **[Assumption 1]:** [Description]
   - **Validation needed:** [Yes/No - how to validate]

2. **[Assumption 2]:** [Description]
   - **Validation needed:** [Yes/No - how to validate]

**Note:** If assumptions prove false, scope may need revision.

---

## 10. CONSTRAINTS

[Extract from PRD "Constraints" section]

### 10.1 Time Constraints
[Timeline requirements from PRD]

### 10.2 Budget Constraints
[Budget limitations from PRD]

### 10.3 Resource Constraints
[Team size, skills available from PRD]

### 10.4 Business Constraints
[Regulatory, compliance, legal requirements from PRD]

---

## 11. TECHNICAL CONSTRAINTS

[Extract from PRD "Technical" constraints]

### 11.1 Required Technologies
[Technologies that MUST be used]
- [Technology 1]: [Reason]
- [Technology 2]: [Reason]

### 11.2 Integration Requirements
[External systems to integrate with]
- [System 1]: [Purpose]
- [System 2]: [Purpose]

### 11.3 Platform Requirements
[Platforms that must be supported]
- [Platform 1]: [e.g., Web, iOS, Android, Windows]

### 11.4 Performance Requirements
[Non-negotiable performance targets]
- [Requirement 1]: [e.g., Support 10,000 concurrent users]
- [Requirement 2]: [e.g., Response time < 200ms]

### 11.5 Security Requirements
[Security standards that must be met]
- [Requirement 1]: [e.g., SOC 2 compliance]
- [Requirement 2]: [e.g., Data encryption at rest and in transit]

---

## 12. RISKS

[Extract from PRD "Risks" section]

### 12.1 High-Priority Risks

| Risk | Impact | Probability | Mitigation Strategy |
|------|--------|-------------|---------------------|
| [Risk 1] | [High/Med/Low] | [High/Med/Low] | [How to mitigate] |

### 12.2 Medium-Priority Risks

| Risk | Impact | Probability | Mitigation Strategy |
|------|--------|-------------|---------------------|
| [Risk 2] | [High/Med/Low] | [High/Med/Low] | [How to mitigate] |

### 12.3 Low-Priority Risks

| Risk | Impact | Probability | Mitigation Strategy |
|------|--------|-------------|---------------------|
| [Risk 3] | [High/Med/Low] | [High/Med/Low] | [How to mitigate] |

---

## 13. DEPENDENCIES

[Extract from PRD "Dependencies" section]

### 13.1 External Dependencies

| Dependency | Type | Criticality | Owner | Risk |
|------------|------|-------------|-------|------|
| [External API] | API | Blocking | [Vendor] | [Risk if unavailable] |
| [Third-party service] | Service | Non-blocking | [Vendor] | [Risk if unavailable] |

### 13.2 Internal Dependencies

| Dependency | Type | Criticality | Owner | Risk |
|------------|------|-------------|-------|------|
| [Internal team] | Resource | Blocking | [Team name] | [Risk if unavailable] |
| [Internal system] | System | Non-blocking | [Team name] | [Risk if unavailable] |

---

## NEXT STEPS

Once this Scope document is approved:

1. **Create Requirements.md** (6-10 hours)
   - Use requirements.prompt.md
   - Read this Scope document completely first
   - Expand §4 (In-Scope Features) into detailed requirements

2. **Continue to Design.md** (after Requirements.md is complete)

---

## CHANGE LOG

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | [Date] | [Name] | Initial scope definition from PRD |
```

---

## Validation Checklist

Before finalizing Scope.md, verify:

- [ ] All sections filled from PRD
- [ ] Vision is clear and inspiring
- [ ] Goals are SMART (Specific, Measurable, Achievable, Relevant, Time-bound)
- [ ] In-scope features align with goals
- [ ] Out-of-scope items are explicit
- [ ] Success metrics are measurable
- [ ] User personas are detailed
- [ ] Constraints are clearly documented
- [ ] Risks have mitigation strategies
- [ ] Dependencies are identified

---

## Special Considerations

### For Existing Projects:
- Section 4 (In-Scope) should separate:
  - **Current Features:** What exists today
  - **Planned Features:** What will be added
- Vision should balance current state with future improvements
- Goals should include both maintenance and new development

### For New Projects:
- All features are "planned"
- Vision is entirely forward-looking
- Goals focus on MVP delivery

---

## Tips for Effective Scope Creation

1. **Be Specific:** Vague scope leads to scope creep
2. **Be Realistic:** Don't over-promise in goals
3. **Be Clear on Boundaries:** Out-of-scope is as important as in-scope
4. **Reference PRD:** Always trace back to the PRD
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
- §4 In-Scope: Equipment tracking, scheduling, certificate generation, audit trails
- §5 Out-of-Scope: Financial management, HR functions, inventory beyond equipment
- §6-13: [All other sections extracted from PRD]

Scope.md created successfully!

Next steps:
1. Review and approve this Scope.md
2. Use requirements.prompt.md to create detailed Requirements.md

Ready to create Requirements.md?
```

---

## CHANGE LOG

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-01-15 | Initial prompt created |
