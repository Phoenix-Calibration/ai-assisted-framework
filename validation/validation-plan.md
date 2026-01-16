# AIris Framework Validation Plan 👁️

**Project:** Phoenix IRIS - Intelligent Real-time Insight System  
**Validation Start:** 2026-01-16  
**Status:** 🔄 In Progress  
**Approach:** Fresh start - Treat existing project as new with AIris methodology

---

## 🎯 Validation Objective

Validate the AIris framework by applying it to a **real, complex, in-production project** (Phoenix IRIS) using a fresh-start approach.

**Key Questions to Answer:**
1. Does constraint-first methodology prevent AI from suggesting generic solutions?
2. Do AIris templates capture everything needed for complex data platforms?
3. Does the session workflow maintain context across development cycles?
4. Are time estimates realistic for real projects?
5. Does the framework add value or just bureaucratic overhead?

---

## 📦 Repository Strategy

### Repo 1: ai-assisted-framework (Framework + Validation)
**Purpose:** AIris framework core and validation documentation  
**Location:** `https://github.com/Phoenix-Calibration/ai-assisted-framework`  
**Contains:**
- AIris framework (`.airis/` folder)
- Validation documentation (`validation/` folder)
- Project journal and status

### Repo 2: phoenix-iris (Real Project)
**Purpose:** Actual Phoenix IRIS project with AIris applied  
**Location:** `https://github.com/Phoenix-Calibration/phoenix-iris`  
**Will contain:**
- Project codebase (airflow, dbt, mcp_server, etc.)
- AIris documentation (`.airis/docs/`)
- Development sessions (`.airis/session/`)

---

## 🎯 Validation Strategy: Fresh Start

**Approach:** Treat Phoenix IRIS as a NEW project, even though code exists.

**What this means:**
```
Existing Project Assets          →    AIris Fresh Start
──────────────────────                ──────────────────
✓ Working code                   →    💡 Proof of concept
✓ Current documentation          →    📝 Input for Discovery
✓ Implemented architecture       →    🎯 Real use cases
✓ Task backlog                   →    ✅ Known requirements

                    ↓
         AIris Discovery Phase
                    ↓
    Generate NEW AIris documents
         (may differ from current!)
```

**Why this approach:**
- Compare AIris-generated docs vs current documentation
- Identify gaps, improvements, or different perspectives
- Validate if constraint-first would have led to different decisions
- Test templates against real project complexity

---

## 📋 Validation Phases

### Phase 0: Setup & Planning ✅ (Current)
**Chat:** 2026-01-16 Session 2  
**Duration:** 1 chat session  
**Deliverables:**
- ✅ Validation plan document
- ✅ Validation tracker document  
- ✅ Updated project journal
- ✅ Updated project status

**Outcome:** Clear roadmap for validation process

---

### Phase 1: Discovery - PRD Generation ⏳
**Target:** Next chat session  
**Duration:** 1 chat (~2-3 hours of work)  
**Method:** Use `.airis/_setup/prompts/1-discovery.prompt.md`

**Input Required:**
- Current Phoenix IRIS documentation:
  - `01_Master_Architecture.md`
  - `02_PRD_Technical_Specs.md`
  - `README.md`
  - Any other relevant docs
- Verbal context from Ivan about project goals

**Process:**
1. Place current docs in `phoenix-iris/.airis/input/` (reference only)
2. Load discovery prompt in Claude
3. Have conversation about project with AI
4. AI generates fresh PRD from AIris perspective

**Output:** `phoenix-iris/.airis/docs/0-prd.md`

**Validation Checkpoint:**
- [ ] Does PRD capture everything current docs have?
- [ ] Does PRD identify things current docs missed?
- [ ] Is PRD more structured/actionable than current docs?
- [ ] Time taken vs template estimate (2-4 hours)

---

### Phase 2: Scope Definition ⏳
**Target:** Chat after Phase 1  
**Duration:** 1 chat (~4-6 hours of work)  
**Method:** Use `.airis/_setup/prompts/2-scope.prompt.md`

**Input:** PRD from Phase 1

**Process:**
1. Load scope prompt
2. Feed PRD to AI
3. AI generates scope document

**Output:** `phoenix-iris/.airis/docs/1-scope.md`

**Validation Checkpoint:**
- [ ] Are boundaries clearer than current docs?
- [ ] Success metrics actionable?
- [ ] In/Out of scope well defined?
- [ ] Time taken vs template estimate (4-6 hours)

---

### Phase 3: Requirements Documentation ⏳
**Target:** Chat after Phase 2  
**Duration:** 1-2 chats (~6-10 hours of work)  
**Method:** Use `.airis/_setup/prompts/3-requirements.prompt.md`

**Input:** Scope from Phase 2 + PRD from Phase 1

**Output:** `phoenix-iris/.airis/docs/2-requirements.md`

**Validation Checkpoint:**
- [ ] Sufficient detail for AI to generate code?
- [ ] User stories testable?
- [ ] Business rules captured?
- [ ] Data entities clear?
- [ ] Time taken vs template estimate (6-10 hours)

---

### Phase 4: Design & Architecture ⭐ CRITICAL ⏳
**Target:** Chat after Phase 3  
**Duration:** 1-2 chats (~6-10 hours of work)  
**Method:** Use `.airis/_setup/prompts/4-design.prompt.md`

**Input:** Requirements + Scope

**Output:** `phoenix-iris/.airis/docs/3-design.md`

**This is THE CRITICAL validation for constraint-first:**

**Validation Checkpoint:**
- [ ] Technical constraints crystal clear?
- [ ] Stack decisions documented with rationale (ADRs)?
- [ ] **CONSTRAINT-FIRST TEST:**
  - Test A: Ask AI for implementation WITHOUT reading design.md first
  - Test B: Ask AI to read design.md THEN implement same feature
  - Compare: Does AI respect GCP/BigQuery/MCP constraints in Test B?
- [ ] Time taken vs template estimate (6-10 hours)

**If constraint-first doesn't work here → Framework needs serious refinement**

---

### Phase 5: Tracker Generation ⏳
**Target:** Chat after Phase 4  
**Duration:** 1 chat (~1-2 hours)  
**Method:** Use `.airis/_setup/prompts/5-tracker.prompt.md`

**Input:** Design + Scope + Requirements

**Output:** `phoenix-iris/.airis/docs/4-tracker.md`

**Validation Checkpoint:**
- [ ] Tasks actionable without editing?
- [ ] Dependencies make sense?
- [ ] Covers all requirements?
- [ ] Includes setup, testing, deployment?
- [ ] Editing needed: None / <20% / >50% / Complete rewrite
- [ ] Time taken vs template estimate (1-2 hours)

---

### Phase 6: First Development Session ⏳
**Target:** After tracker generated  
**Duration:** Multiple chats (actual development work)  
**Method:** Use `.airis/_setup/prompts/6-session.prompt.md`

**Process:**
1. Part 0: Create ToDo for first tasks
2. Part 1: Start session with Opening Brief
3. [Actual development work]
4. Part 2: Close session with reports + handoff

**Validation Checkpoint:**
- [ ] ToDo creation smooth?
- [ ] Opening Brief has sufficient context?
- [ ] Handoff captures decisions made?
- [ ] Can pick up from handoff in next session?
- [ ] Session workflow feels natural or bureaucratic?

---

### Phase 7: Comparison & Analysis ⏳
**Target:** After 2-3 development sessions  
**Duration:** 1 chat (analysis)

**Activities:**
1. Compare AIris docs vs current Phoenix IRIS docs
2. Document differences, gaps, improvements
3. Analyze if constraint-first worked
4. Calculate ROI: time invested vs value gained
5. Identify framework adjustments needed

**Output:** 
- `validation/findings.md` (comprehensive report)
- Updated validation tracker with results
- Recommendations for framework refinement

---

## 📊 Metrics to Track

### Time Metrics
For each phase, track:
- **Estimated time** (from templates)
- **Actual time** spent
- **Ratio:** actual/estimated
- **Note deviations:** >2x estimate = investigate why

### Quality Metrics
- **Completeness:** Does doc have everything needed? (1-10)
- **Clarity:** Is doc understandable? (1-10)
- **Actionability:** Can you work from this doc? (1-10)
- **Constraint respect:** Does AI follow design.md? (Yes/Partial/No)

### Friction Metrics
- **Template usability:** Easy to follow? (1-10, 1=confusing, 10=intuitive)
- **Prompt effectiveness:** Generated usable output? (1-10)
- **Overhead feeling:** Worth the time? (1-10, 1=bureaucracy, 10=high value)

### Comparative Metrics
- **vs Current docs:** Better/Same/Worse
- **Gap identification:** Things AIris caught that current docs missed
- **New perspectives:** Different architectural decisions suggested?

---

## 🎯 Success Criteria

### Must Have (Framework is Valid)
- ✅ Constraint-first demonstrably works (AI respects design.md)
- ✅ Templates capture real project complexity
- ✅ Session workflow maintains context across sessions
- ✅ Time overhead justified by value gained

### Should Have (Framework is Useful)
- ✅ Docs are clearer than current documentation
- ✅ AI suggestions are better quality
- ✅ Identified genuine gaps in current docs
- ✅ Multi-developer coordination improved

### Nice to Have (Framework is Excellent)
- ✅ Team wants to adopt for other projects
- ✅ Docs become source of truth
- ✅ Onboarding new devs easier
- ✅ Architecture drift prevented

---

## 🚫 Failure Criteria (Stop and Revise)

Stop validation and revise framework if:
- ❌ Constraint-first doesn't work (AI ignores design.md)
- ❌ Time overhead >2x estimates consistently
- ❌ Templates feel bureaucratic without adding value
- ❌ Prompts generate unusable output requiring complete rewrite
- ❌ Session workflow loses context between chats

---

## 📝 Documentation Requirements

### Per Phase
Create entry in `validation-tracker.md` after each phase:
- Date completed
- Time spent (actual vs estimate)
- Quality scores
- Key findings
- Decision to continue or adjust

### Continuous
Update `findings.md` with insights as they emerge:
- What works well
- What needs improvement
- Unexpected discoveries
- Framework adjustment recommendations

---

## 🔄 Iterative Refinement

If validation reveals issues:
1. **Document the issue** in findings.md
2. **Propose adjustment** to framework
3. **Test adjustment** in next phase
4. **Update templates/prompts** if validated
5. **Continue validation** with improved framework

**Goal:** End validation with refined, proven framework

---

## 👥 Team Involvement

**Current:** Solo validation (Ivan)

**Future consideration:**
- Share docs with team after Phase 4 (Design complete)
- Get feedback from .NET Sr, .NET Jr, Odoo Dev
- Test multi-developer workflow in Phase 6
- Track if docs help team coordination

---

## 📅 Timeline

**Aggressive:** 2-3 weeks (full-time focus)  
**Realistic:** 4-6 weeks (part-time alongside other work)  
**Conservative:** 8-10 weeks (minimal time investment)

**Current pace:** TBD based on Ivan's availability

---

## 🎯 Next Immediate Steps

1. ✅ Create validation plan (this document)
2. ✅ Create validation tracker
3. ✅ Update project journal
4. ✅ Update project status
5. ⏳ **Get access to phoenix-iris repo**
6. ⏳ **Collect current docs** for Discovery input
7. ⏳ **Execute Phase 1: Discovery**

---

## 📞 Validation Support

**Primary:** Ivan (Phoenix Calibration CTO)  
**AI Assistant:** Claude (via this project)  
**Repository:** ai-assisted-framework + phoenix-iris  
**Communication:** Claude chats with full context preservation

---

**Last Updated:** 2026-01-16  
**Status:** Phase 0 Complete, Ready for Phase 1  
**See clearly. Build confidently.** 👁️
