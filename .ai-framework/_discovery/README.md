# Discovery Templates

> **Phase 0: Optional Pre-Framework Research**

These templates help you capture business context and problem definition **before** creating the framework's strategy documents (Scope, Requirements, Design).

---

## When to Use Discovery Templates

**Use these templates if:**
- ✅ Starting a project from scratch without formal PRD
- ✅ Need to build consensus on problem/solution before technical work
- ✅ Want structured approach to problem analysis
- ✅ Bridging business stakeholders to technical implementation

**Skip these templates if:**
- ⏭️ You already have a formal Product Requirements Document (PRD)
- ⏭️ You're documenting an existing system (use strategy docs directly)
- ⏭️ The problem and solution are already well-defined

---

## Template Overview

### 1. business-context.template.md

**Purpose:** Capture high-level business rationale and context.

**Use when:** You need to answer "Why are we building this?" for stakeholders.

**Key sections:**
- Problem statement (1 paragraph)
- Target users and stakeholders
- Business goals and ROI
- High-level features (bullets)
- Constraints (budget, timeline, team)
- Success metrics

**Time to complete:** 2-4 hours

**Output feeds into:** `scope.md` (vision, goals, boundaries)

---

### 2. problem-statement.template.md

**Purpose:** Deep analysis of the problem being solved.

**Use when:** You need rigorous problem analysis before jumping to solutions.

**Key sections:**
- Detailed problem description
- Current situation (as-is)
- Pain points and root causes
- Quantified impact (financial, time, quality)
- Consequences of inaction
- Success criteria for solution

**Time to complete:** 4-8 hours (includes research)

**Output feeds into:** `scope.md` (problem context), `requirements.md` (solution requirements)

---

### 3. initial-requirements.template.md

**Purpose:** High-level feature list before detailed requirements.

**Use when:** You need to bridge problem definition to functional specifications.

**Key sections:**
- Prioritized feature list (P0/P1/P2)
- Critical user journeys (3-5 flows)
- Key business rules
- Data entities (high-level)
- Integration requirements
- Non-functional requirements

**Time to complete:** 4-8 hours

**Output feeds into:** `requirements.md` (detailed functional specs)

---

## Usage Workflow

### Typical Discovery Process

```
1. BUSINESS CONTEXT (2-4 hours)
   └── business-context.template.md
       ├── Filled by: Product Manager or Business Owner
       ├── Reviewed with: Stakeholders
       └── Result: Clear business case and goals

2. PROBLEM ANALYSIS (4-8 hours)
   └── problem-statement.template.md
       ├── Filled by: Product Manager or Business Analyst
       ├── Validated with: Users, data, stakeholder interviews
       └── Result: Quantified problem and validated solution direction

3. INITIAL REQUIREMENTS (4-8 hours)
   └── initial-requirements.template.md
       ├── Filled by: Product Manager or Technical Lead
       ├── Reviewed with: Development team, stakeholders
       └── Result: Prioritized feature list and clear scope

TOTAL TIME: 10-20 hours
```

### Then Proceed to Framework

Once discovery is complete:

```
4. CREATE STRATEGY DOCUMENTS (in this order)
   ├── scope.md (use business-context + problem-statement)
   ├── requirements.md (use initial-requirements + expand details)
   └── design.md (use requirements to inform architecture)

5. GENERATE TACTICAL PLAN
   └── tracker.md (AI-generated from strategy documents)

6. START DEVELOPMENT SESSIONS
   └── todo.md + handoff.md (per-developer execution)
```

---

## Filling Out the Templates

### Step 1: Copy Templates

```bash
# Create your discovery folder
mkdir -p discovery/

# Copy templates
cp .ai-framework/_discovery/business-context.template.md discovery/business-context.md
cp .ai-framework/_discovery/problem-statement.template.md discovery/problem-statement.md
cp .ai-framework/_discovery/initial-requirements.template.md discovery/initial-requirements.md
```

### Step 2: Fill Out in Order

1. **Start with business-context.md** (2-4 hours)
   - Answer the business "why"
   - Define high-level goals
   - Identify stakeholders and constraints

2. **Then problem-statement.md** (4-8 hours)
   - Deep dive into the problem
   - Quantify impact
   - Validate with data and user research

3. **Finally initial-requirements.md** (4-8 hours)
   - List features by priority
   - Define user journeys
   - Capture business rules

### Step 3: Review and Validate

- [ ] Stakeholders approve business context
- [ ] Problem validated with users and data
- [ ] Technical team confirms initial requirements are feasible
- [ ] Budget and timeline approved

### Step 4: Transition to Framework

Use your completed discovery docs to create:

1. **scope.md**
   - Vision → from business-context section 1
   - Goals → from business-context section 3
   - Scope boundaries → from initial-requirements section 9
   - Success metrics → from business-context section 8

2. **requirements.md**
   - Functional requirements → expand initial-requirements section 1
   - User stories → from initial-requirements section 2
   - Business rules → from initial-requirements section 3
   - Data entities → expand initial-requirements section 4

3. **design.md**
   - Tech constraints → from problem-statement section 7
   - Non-functional → from initial-requirements section 7
   - Architecture decisions → based on requirements

---

## Tips for Effective Discovery

**Do's:**
- ✅ Involve actual users in problem validation
- ✅ Quantify problems with data when possible
- ✅ Get stakeholder buy-in before moving to implementation
- ✅ Be explicit about what's out of scope
- ✅ Validate assumptions early

**Don'ts:**
- ❌ Skip problem validation and jump to solutions
- ❌ Over-engineer discovery docs (they're meant to be lightweight)
- ❌ Treat discovery as one-time (iterate based on feedback)
- ❌ Forget to document decisions and rationale
- ❌ Mix business context with technical architecture

---

## Examples

### When Discovery Prevents Wasted Effort

**Scenario:** Team wants to build mobile app for field technicians.

**Without discovery:**
- Team builds iOS and Android apps (6 months)
- After launch: Technicians already use company tablets with web browsers
- Result: Apps unused, 6 months wasted

**With discovery:**
- business-context.md reveals: "Technicians use company-issued tablets"
- problem-statement.md shows: "Web-based solution would work"
- initial-requirements.md prioritizes: "Responsive web app, not native apps"
- Result: Correct solution built, 3 months saved

---

## FAQ

**Q: Do I need all three templates?**
A: No. Use what makes sense. For small projects, business-context.md might be enough. For complex projects, all three add value.

**Q: Can I skip discovery if I have a PRD?**
A: Yes. If you have a formal PRD, go directly to creating scope.md, requirements.md, and design.md.

**Q: How detailed should discovery docs be?**
A: Lightweight but complete. Aim for clarity, not length. Each template should take 2-8 hours to fill, not days.

**Q: Who owns these documents?**
A: Typically Product Manager or Technical Lead. Should be reviewed with stakeholders and development team.

**Q: What if requirements change during discovery?**
A: That's the point! Discovery is meant to surface issues before committing to technical work. Update docs as you learn.

---

## Related Documentation

- **Main Framework README:** `../_setup/README.md`
- **Strategy Templates:** `../_setup/templates/`
- **Getting Started Guide:** `../README.md`

---

**Questions or feedback?** These templates are meant to be practical. Adapt them to your team's needs.
