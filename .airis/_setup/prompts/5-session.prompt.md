# Session Prompt

## Purpose
Manage complete session lifecycle: 
- Create ToDo Phase 1 (simple task list)
- Start Session (Opening Brief with progressive context loading - Phase 2)
- Close Session (Closing Report + Handoff + **Propose** Tracker updates - Phase 3)

**CRITICAL:** This prompt does NOT apply tracker updates. It only proposes them. User invokes 5-tracker.prompt.md to apply changes.

## Context Detection
Detect which moment of the session:

**IF user says:** "Create ToDo for T-XXX, T-YYY" OR provides task list
→ Generate ToDo.md Phase 1 (simple task list only)

**IF user provides:** ToDo.md Phase 1 OR "Start session"
→ Read context stack progressively → Generate Opening Brief (Phase 2)

**IF user says:** "Session complete" OR "Generate Closing Report"
→ Generate Closing Report + Update Handoff + **Propose** Tracker updates (Phase 3)

---

## PART 0: CREATE TODO (Phase 1 - Simple File Creation)

### Purpose
Generate the initial ToDo.md file with just the task list. NO context reading yet.

### User Input Options

**Option A: User specifies tasks**
```
User: "Create ToDo for T-003 and T-004"
User: "I want to work on T-003: Design database schema and T-004: Implement authentication"
```

**Option B: User asks for recommendations**
```
User: "What should I work on today?"
User: "Help me plan my session"
```

### Process

**IF user specified tasks (Option A):**
1. Extract task IDs mentioned
2. Generate simple ToDo.md Phase 1

**IF user asks for recommendations (Option B):**
1. Quick read ONLY:
   - Handoff.md §7 "Next Steps" (if exists)
   - Tracker.md - scan for ⚪ Ready tasks with high priority
2. Suggest 1-2 tasks
3. Wait for user confirmation
4. Generate ToDo.md Phase 1

### Output: ToDo.md Phase 1

Generate this simple structure:

```markdown
# Session ToDo (YYYY-MM-DD, [time budget])

- T-XXX: [Task title]
- T-YYY: [Task title] (if time permits)
```

**That's it. No Opening Brief yet. No context stack reading yet.**

### Example Interaction

**User:** "Create ToDo for T-003 and T-004, 2 hour session"

**AI:** 
```
Created ToDo.md:

# Session ToDo (2026-01-15, 2-hour time budget)

- T-003: Design database schema
- T-004: Implement authentication (if time permits)

Ready to start session? Say "Start session" when ready.
```

---

## PART 1: SESSION START (Opening Brief - Phase 2)

### Purpose
Read context using PROGRESSIVE LOADING strategy and generate Opening Brief

### Trigger
User says: "Start session" OR provides existing ToDo.md Phase 1

### Step 1: Read Context Stack (Progressive Loading)

**Read in stages based on need:**

**STAGE 1 - ALWAYS READ (Mandatory):**

1. **Handoff.md** (FIRST - immediate context)
   - Read complete document
   - Understand current project state
   
2. **Design.md** (SECOND - constraints are non-negotiable)
   - Read complete document
   - All sections

**STAGE 2 - SELECTIVE READ (As Needed):**

3. **Scope.md §4 Features** (THIRD - features relevant to session tasks)
   - Read ONLY feature categories related to tasks in ToDo
   - Skip unrelated features

4. **Tracker.md** (FOURTH - session tasks + dependencies)
   - Read ONLY tasks mentioned in ToDo
   - Read their dependencies
   - Skip completed/unrelated tasks

**STAGE 3 - REFERENCE (If Clarification Needed):**

5. **Scope.md** (FIFTH - only if boundary questions arise)
   - Read only if needed for clarification
   - Not typically required for implementation

**Token Efficiency:**
- Full read (all docs complete): ~17,500 tokens (rare)
- Typical read (Stage 1 + selective Stage 2): ~5,000 tokens (most sessions)
- Minimum read (Stage 1 only): ~2,500 tokens (simple tasks)

**Why progressive?** Respects context window limits while maintaining constraint-first principle.

### Step 2: Generate Opening Brief

Add this section to ToDo.md:

```markdown
---

## Opening Brief

**Context:** [3-5 sentences from Handoff describing current state]

**Active Task:** [First task from ToDo] — [Title from Tracker]

**Plan:**
1. [Step from Tracker acceptance criteria]
2. [Step referencing Design.md §X.Y]
3. [Step referencing Scope.md §4 feature]
4. [Validation step]
5. [Review step]

**Success Criteria:** [From Tracker.md]
- [Criterion 1]
- [Criterion 2]
- [Criterion 3]

**Time Estimate:** [Based on Tracker]

**References:**
- Design.md §X.Y - [Relevant section]
- Scope.md §4 - [Relevant feature]
- Tracker.md T-XXX - [Full criteria]
```

### Step 3: Validation
- [ ] Read context using progressive loading
- [ ] Always read Handoff + Design (Stage 1)
- [ ] Selectively read Scope §4 + Tracker (Stage 2)
- [ ] Opening Brief references specific sections
- [ ] Plan is concrete and actionable

---

## PART 2: SESSION CLOSE (Closing Report + Handoff + Propose Tracker - Phase 3)

### Purpose
Generate session artifacts and **PROPOSE** Tracker updates (NOT apply them)

### Trigger
User says: "Session complete" OR "Generate Closing Report" OR "End session"

### Step 1: Generate Closing Report

Add to ToDo.md:

```markdown
---

## Closing Report

**What Changed:**
- `path/to/file.ext` created/modified (+X lines)
- `path/to/file2.ext` created/modified (+Y lines)

**Validation & Evidence:**
- Tests: [Pass/Fail status, coverage percentage]
- Documentation: [What was updated]
- CI: [Build status, links]
- Peer Review: [Who reviewed, outcome]

**Status:** [Percentage complete] — [Task status update]

**Task Updates:**
- T-XXX: [Old status] → [New status] ([Brief reason])

**Decisions Made:**
- [Decision 1] - [Rationale] (ADR-XXX if applicable)
- [Decision 2] - [Rationale]

**Blockers Encountered:**
- [Blocker description] OR None

**Next Steps:**
1. Human: [Immediate actions for human including tracker update]
2. Next session: [Recommended task for next session]
3. Follow-up: [Any longer-term considerations]

**Session Metrics:**
- Planned: [X tasks, Y hours]
- Completed: [X tasks, Y hours actual]
- Efficiency: [Percentage]
```

### Step 2: Update Handoff.md

Generate/replace complete Handoff.md with 8 sections:

```markdown
# Handoff - Session State Transfer

**Last Updated:** [Date Time]
**Session Number:** #[Number]

## 1. Context Snapshot
[3-5 bullets - current project state]

## 2. Active Task(s)
**Completed This Session:**
- [Tasks completed]

**Next Up:**
- [Next recommended task]

## 3. Decisions Made
[Decisions from this session with rationale]

## 4. Changes Since Last Session
[Files created/modified/deleted]

## 5. Validation & Evidence
[Test results, CI links, proof of completion]

## 6. Risks & Unknowns
[Identified risks or unknowns]

## 7. Next Steps
**Immediate:**
[Human actions - including invoking tracker prompt]

**Next Session:**
[AI recommendations]

## 8. Status Summary
[Project status with metrics]
```

**Important:** 
- REPLACE entire Handoff.md content (don't accumulate)
- This is a fresh snapshot for next session
- Focus on current state, not history

### Step 3: PROPOSE Tracker Updates (DO NOT APPLY)

**CRITICAL:** You do NOT apply tracker updates. You only propose them.

Generate proposal section:

```markdown
---

## Proposed Tracker Updates

**To apply these updates, invoke 5-tracker.prompt.md:**

Command: "Update tracker: T-003 ⚪→✅, T-004 ⚪→🟡"

**Proposed Changes:**

**Tasks Completed:**
- T-XXX: [Task title]
  - Status: [Old] → [New]
  - Actual Effort: [Time] (estimated: [Original estimate])
  - Evidence: [Links and proof]
  - Completion Date: [If complete]
  - Notes: [Important notes]

**Tasks In Progress:**
- T-YYY: [Task title]
  - Status: ⚪ → 🟡
  - Progress: [Percentage]
  - Remaining: [Estimate]

**Dependencies Unblocked:**
- T-ZZZ: ⏸️ Blocked → ⚪ Ready to start
  - Reason: [What unblocked it]

**New Tasks Discovered:**
- T-AAA: [New task title]
  - Priority: [Level]
  - Estimate: [Time]
  - Dependencies: [If any]

**Project Metrics:**
- Tasks completed: +[Number]
- Progress: [Old]% → [New]%
- Velocity: [Calculate from recent sessions]

---

**Next:** Invoke 5-tracker.prompt.md to apply these updates to tracker.md
```

### Step 4: Remind User

After generating proposals:

```
✅ Closing Report generated
✅ Handoff.md updated
✅ Tracker updates proposed

To apply tracker updates, invoke:
"Update tracker: T-003 ⚪→✅, T-004 ⚪→🟡"
(Use 5-tracker.prompt.md)
```

**DO NOT** apply tracker updates yourself. User must explicitly invoke 5-tracker.prompt.md.

---

## Special Considerations

### For Existing Projects
- Opening Brief should consider both new features AND refactoring tasks
- Closing Report should note if task was feature vs architecture improvement
- Handoff should track migration phase progress

### For Multi-Session Tasks
- Opening Brief acknowledges partial completion
- Closing Report clearly states percentage complete
- Handoff maintains continuity of in-progress work

### Error Handling
- If strategy docs are incomplete: ask user to complete them first
- If Handoff.md missing (first session): create from scratch
- If Tracker.md outdated: recommend regenerating it with 5-tracker.prompt.md

---

## Complete Workflow Example

### Step 1: Create ToDo (Part 0)

**User:** "Create ToDo for T-003, 2 hours"

**AI:** 
```
# Session ToDo (2026-01-15, 2-hour time budget)

- T-003: Design database schema

Created. Say "Start session" when ready.
```

**No context reading yet. Just file creation.**

---

### Step 2: Start Session (Part 1)

**User:** "Start session"

**AI:** 
```
Reading context (progressive loading)...
✓ Handoff.md (Stage 1 - Always)
✓ Design.md (Stage 1 - Always)
✓ Scope.md §4 (Stage 2 - Selective, T-003 related features)
✓ Tracker.md T-003 (Stage 2 - Selective)

Adding Opening Brief...
```

**Progressive context read based on task needs.**

Output:
```markdown
# Session ToDo (2026-01-15, 2-hour time budget)

- T-003: Design database schema

---

## Opening Brief

**Context:** Foundation complete (T-001 ✅, T-002 ✅). Moving to data layer.

**Active Task:** T-003 — Design database schema

**Plan:**
1. Review data entities from Scope.md §4
2. Create ERD with entities from Scope.md §4 Data Entities
3. Define indexes per Design.md §8.2
4. Create migrations per Design.md §3.3
5. Peer review

**Success Criteria:**
- All entities in schema
- Foreign keys defined
- Indexes for performance
- Migrations tested

**Time Estimate:** 90 minutes

**References:**
- Design.md §3.3 - Database strategy
- Scope.md §4 - Data entities
- Tracker.md T-003 - Full criteria

Ready to begin!
```

---

### Step 3: Work Happens...

[Collaboration between human and AI]

---

### Step 4: Close Session (Part 2)

**User:** "Session complete"

**AI:** 
```
[Generates Closing Report]
[Updates Handoff.md]
[Proposes Tracker updates]

✅ Done! 

To update tracker.md, invoke:
"Update tracker: T-003 ⚪→✅"
(Use 5-tracker.prompt.md)
```

**User then separately invokes:** "Update tracker: T-003 ⚪→✅"  
**(That calls 5-tracker.prompt.md, not this prompt)**

---

## Summary of Responsibilities

**Part 0 (Create ToDo):**
- ✅ Generate simple task list file
- ❌ NO full context read
- ❌ NO Opening Brief

**Part 1 (Start Session):**
- ✅ Progressive context loading (Stage 1 always, Stage 2 selective, Stage 3 if needed)
- ✅ Generate Opening Brief
- ✅ Add to existing ToDo.md

**Part 2 (Close Session):**
- ✅ Generate Closing Report
- ✅ Update Handoff.md (complete replacement)
- ✅ **PROPOSE** Tracker updates (with command for user)
- ❌ **DO NOT APPLY** tracker updates (that's 5-tracker.prompt.md's job)

---

## Validation Checklist

**Part 0 - Create ToDo:**
- [ ] Simple task list only
- [ ] No Opening Brief yet
- [ ] Date and time budget included
- [ ] Ready message to user

**Part 1 - Start Session:**
- [ ] Stage 1: Read Handoff + Design (always)
- [ ] Stage 2: Read Scope §4 + Tracker (selectively, task-related only)
- [ ] Stage 3: Read Scope (only if needed)
- [ ] Opening Brief added to ToDo
- [ ] References specific sections
- [ ] Plan is actionable

**Part 2 - Close Session:**
- [ ] Closing Report complete
- [ ] Handoff updated (8 sections, replaced not accumulated)
- [ ] Tracker proposal with clear command
- [ ] Reminder to use 5-tracker.prompt.md
- [ ] Did NOT apply tracker updates

---

## CRITICAL REMINDERS

1. **Progressive Loading:** Read Handoff + Design always, Scope §4 + Tracker selectively
2. **Single Responsibility:** Session prompt handles sessions, tracker prompt handles tracker.md
3. **Propose Only:** Never apply tracker updates, only propose with command
4. **User Control:** User explicitly invokes 5-tracker.prompt.md to apply
5. **Handoff Replacement:** Always replace, never accumulate

---

## CHANGE LOG

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-01-15 | Initial prompt created |
| 1.1 | 2026-01-22 | Progressive loading + tracker proposal only |
