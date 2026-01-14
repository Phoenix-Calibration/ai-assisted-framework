# Discovery Folder

> **Purpose:** This folder is where you create your project-specific Product Requirements Document (PRD) before transitioning to the framework's strategy documents.

---

## What Goes Here

**Your completed PRD:**
- Copy `../_setup/templates/0-PRD.template.md` to this folder
- Rename it to `PRD.md` (or `[ProjectName]-PRD.md`)
- Fill it out with your project's specific details
- Get it approved by stakeholders
- Use it to create strategy documents (Scope.md, Requirements.md, Design.md)

**This folder should contain:**
```
discovery/
└── PRD.md  (or [ProjectName]-PRD.md)
```

**This folder is for YOUR work, not templates.**

Templates are in `../_setup/templates/`

---

## Workflow

### Step 1: Copy the PRD Template

```bash
# From your project root
cp .ai-framework/_setup/templates/0-PRD.template.md discovery/PRD.md
```

### Step 2: Fill Out the PRD

Open `discovery/PRD.md` and complete all sections:

1. **Section 2: Problem Statement** - Start here (2-3 hours)
2. **Section 4: Target Users** - Define your personas (1-2 hours)
3. **Section 3: Business Context** - Goals, ROI, competition (2-3 hours)
4. **Section 6: Feature Requirements** - Features, journeys, rules (4-6 hours)
5. **Section 7: Non-Functional Requirements** - Performance, security (2-3 hours)
6. **Sections 8-12**: Constraints, scope, stakeholders, etc. (4-5 hours)
7. **Section 1: Executive Summary** - Write this LAST (30 min)

**Total time:** 16-24 hours (includes research and validation)

### Step 3: Review and Approve

- [ ] Technical feasibility review with engineering
- [ ] Business case approval from stakeholders
- [ ] User validation through interviews/surveys
- [ ] Budget and timeline approval
- [ ] Final sign-off from decision makers

### Step 4: Transition to Framework

Once your PRD is approved, use it to create the three strategy documents:

```bash
# Navigate to strategy folder
cd .ai-framework/strategy/

# Copy templates
cp ../_setup/templates/1-scope.template.md scope.md
cp ../_setup/templates/2-requirements.template.md requirements.md
cp ../_setup/templates/3-design.template.md design.md

# Fill them out using your PRD as source
# See Section 13.2 in the PRD for detailed mapping
```

---

## Why Separate Discovery from Framework?

**Discovery (`discovery/PRD.md`):**
- Business-facing document
- Gets stakeholder buy-in
- Validates problem/solution fit
- Created BEFORE technical work
- May be updated during project

**Framework Strategy Docs (`strategy/*.md`):**
- Technical implementation documents
- Guide AI-assisted development
- Stable foundation for Tracker generation
- Created AFTER PRD approval
- Rarely updated once set

**Separation benefits:**
- PRD can evolve during discovery without affecting framework
- Framework docs remain focused on technical execution
- Clear handoff point between business planning and development
- PRD serves as source-of-truth for "why we're building this"

---

## Example Project Structure

```
your-project/
├── discovery/
│   ├── PRD.md                    ← Your project's PRD (completed)
│   └── research/                 ← Optional: user research, competitive analysis
│
├── .ai-framework/
│   ├── strategy/
│   │   ├── scope.md              ← Created FROM PRD sections 1,3,8,9,10
│   │   ├── requirements.md       ← Created FROM PRD sections 5,6
│   │   └── design.md             ← Created FROM PRD sections 7,8,12
│   │
│   ├── tactics/
│   │   └── tracker.md            ← AI-generated from strategy docs
│   │
│   └── session/
│       └── [developer-id]/
│           ├── current/
│           │   ├── todo.md
│           │   └── handoff.md
│           └── archive/
│
└── src/                          ← Your actual code
```

---

## FAQs

**Q: Do I need to create a PRD for every project?**
A: No. Only if you're starting from scratch without existing requirements documentation. If you have a PRD or BRD already, you can skip this and go directly to creating strategy documents.

**Q: Can I use a different PRD template?**
A: Yes! If your organization has a standard PRD template, use that. The framework's PRD template is just a starting point. What matters is having clear requirements before creating strategy documents.

**Q: What if my PRD changes after I create strategy docs?**
A: Minor changes: Update strategy docs directly. Major changes: Update the PRD first, then propagate changes to strategy docs. Version both to track evolution.

**Q: Should the PRD be in version control?**
A: Yes! Commit your PRD to the repository so the entire team can see the project's rationale and evolution.

---

## Related Documentation

- **PRD Template:** `../_setup/templates/0-PRD.template.md`
- **Main Framework README:** `../README.md`
- **Strategy Templates:** `../_setup/templates/`

---

**Ready to start?**

```bash
cp .ai-framework/_setup/templates/0-PRD.template.md discovery/PRD.md
```

Then open `discovery/PRD.md` and start filling it out!
