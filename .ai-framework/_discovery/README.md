# Discovery Template - Product Requirements Document (PRD)

> **Phase 0: Optional Pre-Framework Research**

This unified PRD template helps you capture business context, problem analysis, and high-level requirements **before** creating the framework's strategy documents (Scope, Requirements, Design).

---

## When to Use This Template

**Use the PRD template if:**
- ✅ Starting a project from scratch without formal documentation
- ✅ Need to build consensus on problem/solution before technical work
- ✅ Want structured approach to discovery and requirements gathering
- ✅ Bridging business stakeholders to technical implementation
- ✅ Need comprehensive documentation for stakeholder approval

**Skip the PRD template if:**
- ⏭️ You already have formal product requirements documentation
- ⏭️ You're documenting an existing system (go directly to strategy docs)
- ⏭️ The problem and solution are already well-defined and approved
- ⏭️ You're doing a small proof-of-concept or prototype

---

## What's in the PRD Template

The PRD consolidates everything you need for discovery into one comprehensive document:

### Section Overview

| Section | Content | Time | Feeds Into |
|---------|---------|------|------------|
| **1. Executive Summary** | One-page overview | 30 min | All strategy docs |
| **2. Problem Statement** | Current state, pain points, root causes | 2-3 hours | scope.md, requirements.md |
| **3. Business Context** | Goals, ROI, success metrics, competition | 2-3 hours | scope.md |
| **4. Target Users** | Personas, research findings | 1-2 hours | scope.md, requirements.md |
| **5. High-Level Solution** | Solution concept, key capabilities | 1 hour | requirements.md |
| **6. Feature Requirements** | Features, user journeys, business rules, data, integrations, UI/UX | 4-6 hours | requirements.md |
| **7. Non-Functional Req** | Performance, security, compliance, scalability | 2-3 hours | design.md |
| **8. Constraints & Assumptions** | Budget, timeline, team, technical, risks | 1-2 hours | scope.md, design.md |
| **9. Scope Definition** | In/out of scope, future phases | 1 hour | scope.md |
| **10. Stakeholders** | Who's involved, communication plan | 1 hour | scope.md |
| **11. Open Questions** | What needs to be resolved | 30 min | All |
| **12. Alternatives Considered** | Why this approach vs others | 1 hour | design.md (ADRs) |
| **13. Next Steps** | Validation checklist, transition plan | 30 min | Process |

**Total Time:** 16-24 hours (includes research, writing, and stakeholder validation)

---

## How to Use the PRD Template

### Step 1: Copy the Template

```bash
# Create your discovery folder (outside the framework)
mkdir -p discovery/

# Copy the template
cp .ai-framework/_discovery/PRD.template.md discovery/PRD.md
```

### Step 2: Fill Out the PRD

**Recommended approach:**

1. **Start with Section 2 (Problem Statement)** - 2-3 hours
   - Define the current state and pain points
   - Quantify the impact
   - Identify root causes
   - This is the foundation everything else builds on

2. **Then Section 4 (Target Users)** - 1-2 hours
   - Define who will use the solution
   - Capture user research findings
   - Create personas

3. **Then Section 3 (Business Context)** - 2-3 hours
   - Define business goals and ROI
   - Analyze competitive landscape
   - Set success metrics

4. **Then Section 6 (Feature Requirements)** - 4-6 hours
   - List features by priority
   - Define user journeys
   - Capture business rules
   - Define data entities

5. **Then Section 7 (Non-Functional Requirements)** - 2-3 hours
   - Performance targets
   - Security requirements
   - Compliance needs

6. **Then Sections 8-12** (Constraints, Scope, Stakeholders, etc.) - 4-5 hours
   - Define boundaries
   - Document assumptions and risks
   - Get stakeholder buy-in

7. **Finally Section 1 (Executive Summary)** - 30 min
   - Write this LAST after all other sections are complete
   - One-page summary of the entire PRD

### Step 3: Review and Validate

- [ ] **Technical feasibility review** with engineering team
- [ ] **Business case approval** from stakeholders
- [ ] **User validation** through interviews or surveys
- [ ] **Budget approval** from finance
- [ ] **Timeline agreement** with all parties
- [ ] **Final approval** from all decision makers

### Step 4: Transition to Framework

Once your PRD is approved, use it to create the three strategy documents:

**1. Create scope.md**
- Use PRD sections: 1, 3, 8, 9, 10
- Focus on: Vision, goals, boundaries, stakeholders, constraints

**2. Create requirements.md**
- Use PRD sections: 5, 6
- Expand features into detailed functional specifications
- Add more user stories if needed

**3. Create design.md**
- Use PRD sections: 7, 8, 12
- Make technical architecture decisions
- Document as ADRs (Architecture Decision Records)

**See Section 13.2 in the PRD template for detailed mapping.**

---

## PRD Template Features

### ✅ Comprehensive

- Covers all aspects of product discovery
- From problem to solution to execution
- Business + technical + user perspectives

### ✅ Structured

- 13 major sections with subsections
- Clear numbering and hierarchy
- Easy to navigate and reference

### ✅ Practical

- Fill-in-the-blank format
- Examples throughout
- Tables for structured data
- Checklists for tracking

### ✅ Flexible

- Skip sections that don't apply
- Expand sections as needed
- Adapt to your team's needs

### ✅ Actionable

- Clear next steps
- Validation checklists
- Transition plan to framework

---

## Tips for Effective PRD Writing

**Do's:**
- ✅ Involve actual users in problem validation
- ✅ Quantify problems with real data when possible
- ✅ Get stakeholder buy-in throughout the process (don't wait until the end)
- ✅ Be explicit about what's out of scope
- ✅ Validate assumptions early
- ✅ Update the PRD as you learn new information
- ✅ Use concrete examples throughout

**Don'ts:**
- ❌ Skip problem validation and jump to solutions
- ❌ Write the PRD in isolation without stakeholder input
- ❌ Treat the PRD as unchangeable once written
- ❌ Include technical implementation details (those go in design.md later)
- ❌ Forget to document decisions and their rationale
- ❌ Mix business requirements with technical architecture

---

## Example: When a PRD Prevents Wasted Effort

**Scenario:** Team wants to build a mobile app for field technicians.

**Without PRD:**
- Team assumes native apps are needed
- Builds iOS and Android apps (6 months, $200K)
- After launch: Technicians use company-issued tablets with Chrome
- Apps are unused, money and time wasted

**With PRD:**
- Section 4 (Target Users) reveals: "Technicians use company tablets"
- Section 7 (Non-Functional) shows: Browser compatibility is critical
- Section 12 (Alternatives) compares: Native app vs responsive web vs PWA
- **Decision:** Build responsive web app instead
- **Result:** Same functionality, 3 months, $80K, actually used

The PRD saves 3 months and $120K by preventing wrong solution.

---

## FAQ

**Q: How detailed should the PRD be?**
A: Detailed enough to make informed decisions, but not so detailed you're doing design work. Aim for clarity over comprehensiveness. The PRD should take 16-24 hours total, not weeks.

**Q: Who writes the PRD?**
A: Typically Product Manager or Technical Lead, but with input from:
- Stakeholders (business context)
- Users (problem validation)
- Engineering (technical feasibility)
- Design (user experience)

**Q: Can I use the PRD for stakeholder presentation?**
A: Yes! Section 1 (Executive Summary) is designed to be a standalone deck. You can also extract key sections for different audiences.

**Q: What if requirements change while writing the PRD?**
A: That's good! Discovery should surface issues early. Update the PRD as you learn. Version it properly (see change log at end of template).

**Q: Do I need all 13 sections?**
A: No. Skip sections that don't apply to your project. The template is comprehensive to cover different types of projects. Adapt it to your needs.

**Q: How is this different from a Business Requirements Document (BRD)?**
A: A PRD is more product-focused and includes user journeys, features, and solution concepts. A BRD is more business-focused and stops at high-level requirements. This PRD combines both.

---

## Relationship to the Framework

```
┌─────────────────────────────────────────────┐
│  DISCOVERY PHASE (Optional)                 │
│  PRD.md                                     │
│  • Problem & solution definition            │
│  • Stakeholder alignment                    │
│  • Initial requirements                     │
└─────────────────┬───────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────┐
│  STRATEGY DOCUMENTS (Framework Layer 1)     │
│  1. scope.md    ← Uses PRD sections 1,3,8,9 │
│  2. requirements.md ← Uses PRD sections 5,6 │
│  3. design.md   ← Uses PRD sections 7,8,12  │
└─────────────────┬───────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────┐
│  TACTICAL PLAN (Framework Layer 2)          │
│  tracker.md ← AI generates from strategy    │
└─────────────────┬───────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────┐
│  EXECUTION (Framework Layers 3-4)           │
│  todo.md + handoff.md ← Daily development   │
└─────────────────────────────────────────────┘
```

The PRD bridges the gap between business idea and technical implementation.

---

## Related Documentation

- **Main Framework README:** `../README.md`
- **Strategy Templates:** `../_setup/templates/`
- **PRD Template:** `PRD.template.md`

---

## Getting Help

**Questions about the PRD template?**
- Open an issue in the framework repository
- Or adapt it to your team's needs - it's a template, not a rigid requirement

**Remember:** The goal of discovery is to prevent wasted effort and align stakeholders. If the PRD helps you do that, it's working. If it feels like busywork, skip sections or simplify.
