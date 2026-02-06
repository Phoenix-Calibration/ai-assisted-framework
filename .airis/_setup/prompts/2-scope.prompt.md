# Scope Prompt

## Purpose
Generate Scope.md from PRD defining vision, boundaries, high-level features, and success metrics. Works for both new and existing projects.

**Key Innovation:** Scope.md includes high-level Features (§4) that Tracker.md will expand into detailed tasks.

---

## Prerequisites

**Input Options (in order of preference):**
1. **PRD.md** (from 1-discovery.prompt.md) - Most complete, recommended
2. **Business document** (proposal, pitch deck, requirements doc) - Can be used directly
3. **Brainstorming notes** (informal ideas, notes, conversation) - Will require more clarifying questions
4. **No formal document** - AI will ask structured questions to gather necessary information

**Note:** Same process for new/existing projects. Existing projects document current state + planned improvements.

---

## Instructions

### Step 1: Read Input Document/Information
- **If PRD.md exists:** Read completely to understand problem, users, solution, metrics, boundaries, features, constraints
- **If other document (brainstorming, proposal, notes):** Extract as much information as possible
- **If no document:** Prepare to ask structured questions in Step 3 to gather necessary information

### Step 2: Read Template Structure
Open `_setup/templates/1-scope.template.md` to understand the 9-section structure you'll populate.

### Step 3: Ask Clarifying Questions (If Needed)

**IMPORTANT:** Ask questions BEFORE starting extraction to ensure complete and accurate information.

**When to ask:**
- Input document is missing critical information for a section
- Information is ambiguous or contradictory
- Unsure how to categorize features/phases/priorities
- Need clarification on constraints, compliance, or technical decisions
- **Working with informal input (brainstorming/notes):** Ask structured questions to fill major gaps

**How to ask:**
- Ask maximum 3 questions at a time (avoid overwhelming the user)
- Be specific about what information is needed and why
- Reference the section that needs clarification
- Suggest options if applicable

**Examples of good questions:**
- "§4 Features: Should 'User Authentication' be Must Have (Phase 1) or Should Have (Phase 2)?"
- "§7 Risks: What's the probability of [specific risk] - High (>60%), Medium (30-60%), or Low (<30%)?"
- "§9 Compliance: Does this system handle PII/health data requiring GDPR/HIPAA compliance?"

**After receiving answers:** Proceed to Step 4 (extraction).

### Step 4: Extract & Map Information

Use the mapping guide and extraction rules below to populate each section with the clarified information.

---

## Input Document → Scope Mapping Guide

**Note:** "Input Source" can be PRD, business document, brainstorming notes, or clarifying question answers.

| Section | Input Source | What to Extract | Output Format |
|---------|------------|-----------------|---------------|
| **METADATA** | Document info | Project name, author, dates, version (1.0), status (Draft) | Key-value metadata block |
| **§1 Vision & Strategy** | Executive Summary, Problem Statement, Goals | Product Vision (2-3 para), Problem (Current/Desired), Success Criteria (3-5 checkboxes), Key Constraints, Strategic Alignment | Subsections with prose + lists |
| **§2 Success Metrics** | Success Metrics, KPIs, SLOs | Measurable targets (3-5) with timeline and measurement method | Table + optional leading indicators |
| **§3 Roadmap** | Timeline, Milestones, Features | Features grouped into 4 phases + Backlog + Non-Goals | Phase blocks with feature IDs |
| **§4 Features (High-Level)** | Requirements, User Stories, Features | Feature categories (F-001+) with description, priority, capabilities (3-5), business rules (2-3) | Feature blocks + summary table + entities table |
| **§5 Target Users** | User Profiles, Personas, Stakeholders | Primary personas (2-3) with 6 fields each, Secondary users, Non-users | Persona cards + lists |
| **§6 Constraints** | Budget, Timeline, Resources, Technical Limits | All constraint types in table (Budget, Timeline, Team, Technical, Integration, Business, Compliance) | Constraint table + optional milestones |
| **§7 Risks** | Risks, Challenges, Threats | Risks (3-5) with ID, Impact (H/M/L), Probability (H/M/L), Mitigation, Owner, Status | Risk register table + scale definitions |
| **§8 Assumptions** | Assumptions, Dependencies | Critical assumptions (2-5) with ID, Validation Method, Owner, Due Date, Status | Assumption tracking table |
| **§9 Compliance & Regulations** | Legal, Compliance, Privacy, Security | Standards/regulations (name, requirements, owner, validation) + data privacy section | Nested structure + data privacy subsection |

---

## Key Extraction Rules

### §1 Vision & Strategy

**Product Vision (2-3 paragraphs):**
- Para 1: What the product is + primary pain point solved
- Para 2: How it transforms current workflow to desired state
- Para 3: Quantified benefits + strategic advantage
- Use PRD Executive Summary/Problem Statement

**Problem Statement:**
- **Current State:** How things work today (pain points)
- **Desired State:** How things should work (solution outcome)

**Success Criteria (3-5 checkboxes):**
- Qualitative goals, not metrics (e.g., "Zero audit failures", "On-time deliveries")
- Different from §2 Success Metrics (these are yes/no outcomes)
- Convert PRD goals into checkboxes

**Key Constraints (top 3):**
- Timeline: Hard deadline + reason for immovability
- Budget: Amount or "No dedicated budget"
- Tech Stack: Required technologies

**Strategic Alignment (2-3 points):**
- How this supports company/department objectives
- Extract from PRD context or business case

### §2 Success Metrics

**Metrics Table (3-5 rows):**
- Each metric: Specific, Measurable target | Timeline | Measurement method
- Examples: "50% time reduction | 3 months | Time tracking system"
- Must have clear measurement method

**Leading Indicators (optional):**
- Metrics that predict future success
- Only include if PRD mentions predictive measures

### §3 Roadmap

**Phase Assignment Criteria:**
- **Phase 1 - Foundation:** Infrastructure, scaffolding, auth, basic UI
- **Phase 2 - Core Features:** Primary workflows, must-have features (MVP)
- **Phase 3 - Enhancement:** Nice-to-haves, optimizations, secondary features
- **Phase 4 - Deploy:** Documentation, monitoring, launch preparation
- **Backlog (Unscheduled):** Features mentioned but not committed to timeline

**Structure per phase:**
- Goal: What this phase establishes
- Features: Feature IDs only (e.g., "F-001, F-002") - DON'T repeat descriptions
- Target: Date or relative timeline

**Non-Goals:**
- Explicitly state what's excluded and why
- Prevents scope creep

### §4 Features (High-Level)

**Feature Organization:**
- Create categories (F-001: User Management, F-002: Reporting, etc.)
- Number sequentially from PRD's feature sections

**Per Feature (F-XXX):**
- **Description:** 1-2 sentences (what it does)
- **Priority:** Must Have (MVP) | Should Have (Phase 2) | Could Have (future)
- **Capabilities:** 3-5 bullet points (high-level what it does)
- **Business Rules:** 2-3 high-level rules (constraints, validations, workflows)

**Priority Assignment:**
- Must Have: Core functionality, blocks other features, MVP requirement
- Should Have: Important but not critical, can be Phase 2
- Could Have: Nice-to-haves, enhancements, can be postponed

**Feature Summary Table:**
- ID | Feature Name | Priority | Capability Count | Phase assignment

**Data Entities Table:**
- Entity Name | Description (1 line) | Key Relationships
- 3-5 core business entities from features
- Keep high-level - detailed attributes go in Design.md

**CRITICAL:** Keep HIGH-LEVEL - detailed acceptance criteria go to Tracker.md

### §5 Target Users

**Primary Personas (2-3 detailed cards):**

Each persona must have these 6 fields:
- **Count:** Number of users (e.g., "~50 technicians")
- **Description:** 1-2 sentences (who they are, role)
- **Key needs:** Top 3 needs this system addresses
- **Usage frequency:** Daily | Weekly | Monthly
- **Tech proficiency:** High | Medium | Low

**Secondary Users (list format):**
- Role: Brief description (1 line each)

**Non-Users:**
- Who explicitly will NOT use this + why

### §6 Constraints

**Constraint Types (all in table):**
- Budget: Total amount + allocation breakdown
- Timeline: Hard deadline + why immovable
- Team: N developers, N designers + hours/week available
- Technical (Must use): Required technology + reason
- Technical (Cannot use): Prohibited technology + reason
- Integration: Must integrate with [System] + Read/Write/Both
- Business: Unchangeable process + why immutable
- Compliance: Must comply with [Standard] + requirements

**Key Milestones (optional table):**
- Only if PRD has specific milestone dates
- Milestone | Date | Dependencies

### §7 Risks

**Risk Identification (3-5 risks):**
- Extract from PRD Risks section
- Add implicit risks (tech, timeline, resource risks)

**Risk Register Table (per risk):**
- **ID:** R-001, R-002, etc.
- **Risk:** Description of threat
- **Impact:** H (>3mo delay/project failure) | M (1-3mo impact) | L (<1mo/minor)
- **Probability:** H (>60% chance) | M (30-60%) | L (<30%)
- **Mitigation:** Strategy to reduce/eliminate
- **Owner:** Role (PM/Tech Lead/DevOps) - use roles, not names unless in PRD
- **Status:** Default "Identified" for new scope

**Include scale definitions** below table (from template)

### §8 Assumptions

**Assumption Identification:**
- Extract explicit assumptions from PRD
- Add implicit assumptions (tech availability, user access, browser support, etc.)

**Assumption Table (per assumption):**
- **ID:** A-001, A-002, etc.
- **Assumption:** What we're assuming is true
- **Validation Method:** How to verify (survey, test, research, prototype)
- **Owner:** Who will validate (PM/Tech Lead/Designer) - use roles
- **Due Date:** Based on roadmap phase dates
- **Status:** Default "Pending" for new scope

### §9 Compliance & Regulations

**Required Compliance (nested structure per standard):**
- **Standard Name** (e.g., GDPR, HIPAA, SOC 2, ISO 17025)
  - Requirements: Specific requirements from that standard
  - Owner: Role responsible for compliance
  - Validation: How compliance is verified

**Data Privacy (separate subsection):**
- Data collected: Types (PII, health, financial, etc.)
- Storage location: Where data is stored
- Retention period: How long kept
- User rights: GDPR/CCPA rights (access, deletion, portability, etc.)

**Compliance Requirements:**
- List 1-3 key requirements as bullets

**If no compliance:** Explicitly state "No regulatory compliance required" with reason

---

## Special Considerations

### Existing Projects
- **§1 Vision:** Balance "current state" with "future improvements"
- **§3 Roadmap:** Show completed phases + remaining phases
- **§4 Features:** Separate "Current Features" (exists) vs "Planned Features" (future)
- **§4 Data Entities:** Document current schema

### New Projects
- **§1 Vision:** Entirely forward-looking
- **§3 Roadmap:** All phases are future
- **§4 Features:** All features are "planned"
- Focus on MVP delivery in Phase 1-2

### Working Without Formal PRD

**If input is brainstorming/informal notes:**
1. Extract whatever information is available (even if incomplete)
2. Ask 3 clarifying questions focusing on the MOST critical gaps:
   - **Priority 1:** §1 Vision (What problem? For whom? Why?)
   - **Priority 2:** §4 Features (What are the must-have capabilities?)
   - **Priority 3:** §6 Constraints (Timeline? Budget? Tech stack?)
3. Make reasonable assumptions for less critical sections (document them in §8 Assumptions)
4. Mark uncertain sections with notes like "(Needs validation)" or "(Assumed - verify)"

**If no input document:**
Ask structured discovery questions in batches of 3:
- **Round 1:** Project vision, target users, core problem
- **Round 2:** Key features, success metrics, constraints
- **Round 3:** Risks, compliance requirements, assumptions

**Example with informal input:**
```
User: "I want to build a task manager for freelancers. Should track time,
       generate invoices, integrate with payment processors."

AI: "I have enough to start. Let me ask 3 clarifying questions:

1. §1 Vision: Who are the primary users - solo freelancers, agencies, or both?
2. §4 Features: Is payment processor integration Must Have (Phase 1) or
   Should Have (Phase 2)?
3. §6 Constraints: Any timeline or budget constraints I should know about?

User: "Solo freelancers, payment integration is Phase 2, 6 month timeline."

AI: "Thanks! Generating Scope.md. Note: I'll document compliance assumptions
     in §8 (assuming no HIPAA/special compliance needed)."
```

---

## Validation Checklist

Before finalizing, verify generated Scope.md has:

**Structure:**
- [ ] All 9 sections populated (no [TBD] or empty sections)
- [ ] NEXT STEPS section present pointing to Design.md

**§1 Vision & Strategy:**
- [ ] Product Vision: 2-3 paragraphs present
- [ ] Problem Statement: Current State + Desired State
- [ ] Success Criteria: 3-5 checkboxes
- [ ] Key Constraints: At least 3 listed
- [ ] Strategic Alignment: 2-3 alignment points

**§2 Success Metrics:**
- [ ] Metrics table: 3-5 rows with targets, timeline, method
- [ ] All metrics are measurable (not vague)

**§3 Roadmap:**
- [ ] 4 phases defined (Foundation, Core, Enhancement, Deploy)
- [ ] Each phase has Goal + Feature IDs + Target date
- [ ] Backlog section present (if applicable)
- [ ] Non-Goals section: 2-3 items listed

**§4 Features (High-Level):**
- [ ] At least 3-5 feature categories (F-001, F-002, etc.)
- [ ] Each feature has: Description, Priority, 3-5 Capabilities, 2-3 Business Rules
- [ ] Feature Summary Table complete
- [ ] Data Entities Table: 3-5 entities with relationships

**§5 Target Users:**
- [ ] Primary Users: 2-3 detailed personas
- [ ] Each persona has all 6 fields (Count, Description, Key needs, Usage frequency, Tech proficiency)
- [ ] Secondary Users listed
- [ ] Non-Users stated

**§6 Constraints:**
- [ ] Constraint table covers all 8 types
- [ ] At least 5 constraints documented

**§7 Risks:**
- [ ] Risk Register: At least 3 risks
- [ ] All risks have ID (R-001+), Impact (H/M/L), Probability (H/M/L), Mitigation, Owner, Status
- [ ] Scale definitions present

**§8 Assumptions:**
- [ ] At least 2 assumptions identified
- [ ] All assumptions have ID (A-001+), Validation Method, Owner, Due Date, Status

**§9 Compliance & Regulations:**
- [ ] At least 1 compliance standard OR explicit "None" stated
- [ ] Data Privacy section populated OR "No PII collected" stated

---

## Example Usage

### Example 1: With Formal PRD

**User:** "I have PRD for a calibration system. Generate Scope.md"

**AI Process:**
1. Read PRD.md completely
2. Read `1-scope.template.md` structure
3. Ask clarifying questions if information is missing/unclear (max 3)
4. Extract information per mapping table + extraction rules
5. Generate complete `docs/scope.md` with all 9 sections

**Example with clarifications:**
```
AI: "I've reviewed the PRD. Before generating Scope.md, I have 3 clarifying questions:

1. §4 Features: Should 'Advanced Reporting Dashboard' be Must Have (Phase 1)
   or Should Have (Phase 2)? The PRD mentions it but doesn't specify priority.

2. §7 Risks: What's the probability of 'Third-party calibration vendor delay'
   - High (>60%), Medium (30-60%), or Low (<30%)?

3. §9 Compliance: Does the system store any PII beyond user emails? This
   affects GDPR data privacy requirements.

User: "1) Should Have for Phase 2, 2) Medium probability, 3) Only emails"

AI: "Thanks! Generating Scope.md with those clarifications..."
```

**Output Summary:**
```
✅ Scope.md created with:
- METADATA: ISO CalManager, v1.0, Draft status
- §1: ISO 17025 compliance vision, Current/Desired problem statement, 5 success criteria
- §2: 3 key metrics (0% audit failures by launch, 50% time reduction in 3mo, 100% on-time by 6mo)
- §3: 4-phase roadmap + backlog + 3 non-goals
  • Foundation: F-001, F-002 (Equipment DB, Basic UI)
  • Core: F-003, F-004 (Scheduling, Certificates)
  • Enhancement: F-005 (Reporting)
  • Deploy: Documentation, monitoring
- §4: 5 features (Must Have: 3, Should Have: 2)
  • F-001: Equipment Management (5 capabilities)
  • F-002: Calibration Scheduling (4 capabilities)
  • F-003: Certificate Generation (3 capabilities)
  • F-004: Audit Trail (2 capabilities)
  • F-005: Reporting Dashboard (4 capabilities)
  • Data Entities: Equipment, Calibration, Certificate, User, Standard
- §5: 2 personas (Technicians, Managers) + 1 secondary (Auditors)
- §6: 7 constraints (Timeline: 6mo, Budget: $50k, Team: 2 devs, Tech: Python+Postgres, etc.)
- §7: 4 risks (R-001 to R-004) with H/M/L ratings + mitigations
- §8: 3 assumptions (A-001 to A-003) with validation methods
- §9: ISO 17025 compliance + GDPR data privacy

Ready for Design.md (use 3-design.prompt.md)
```

### Example 2: With Brainstorming Notes

**User:** "Here are my notes: Task manager for freelancers. Track time, generate invoices, maybe payment integration. Need it in 6 months."

**AI Process:**
1. Read informal notes
2. Read template structure
3. Identify critical gaps → Ask 3 questions
4. Extract + supplement with assumptions
5. Generate Scope.md (with assumptions documented in §8)

**AI Response:**
```
I've reviewed your notes. Before generating Scope.md, I have 3 clarifying questions:

1. §5 Target Users: How many freelancers would use this initially - individual users
   or do you plan for agencies/teams too?

2. §4 Features: Besides time tracking and invoicing, are there other must-have
   features? (e.g., client management, project organization, expense tracking)

3. §9 Compliance: Will you be handling payment information directly or just
   integrating with payment processors? (affects PCI compliance requirements)

User: "Individual freelancers, 100-500 users initially. Add client management
       and project organization. Just integrating with Stripe/PayPal, not
       handling payment info directly."

AI: "Thanks! Generating Scope.md. I'll document assumptions in §8:
     - Assuming solo freelancers only (not agencies)
     - Assuming Phase 2 for payment integration
     - Assuming no PCI compliance needed (third-party processors)
     - Assuming web app (no mobile app mentioned)"

✅ Scope.md created with documented assumptions for validation.
```

---

## Tips for Token Efficiency

1. **§1 Vision:** Use PRD executive summary, don't invent new content
2. **§3 Roadmap:** Reference feature IDs, never repeat descriptions
3. **§4 Features:** High-level only (3-5 capabilities each, not 10+)
4. **§5 Personas:** 2-3 primary max, put rest in Secondary
5. **§6-§9 Tables:** Tables are more token-efficient than prose
6. **Optional sections:** Include Leading Indicators, Key Milestones, Backlog only if relevant
7. **Non-Goals:** Be explicit but brief (1 line per item)

---

## Common Mistakes to Avoid

❌ **Don't put detailed acceptance criteria in §4** (save for Tracker.md)
❌ **Don't duplicate feature descriptions in §3 Roadmap** (use IDs only)
❌ **Don't confuse Success Criteria (§1) with Success Metrics (§2)**
   - Criteria = Qualitative checkboxes (outcomes)
   - Metrics = Quantitative measures (numbers)
❌ **Don't leave optional sections empty** (populate or remove)
❌ **Don't assign specific person names** (use roles: PM, Tech Lead, Designer)
❌ **Don't skip Non-Goals** (critical for preventing scope creep)
❌ **Don't forget Backlog subsection** in §3 if PRD mentions deferred features
❌ **Don't guess or invent information** when PRD is unclear - ASK clarifying questions instead (max 3 at a time)
