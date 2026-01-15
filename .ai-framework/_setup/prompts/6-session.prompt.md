# Session Prompt

## Purpose
Manage complete session lifecycle: 
- Create ToDo Phase 1 (simple task list)
- Start Session (Opening Brief with full context read - Phase 2)
- Close Session (Closing Report + Handoff + Tracker updates - Phase 3)

## Context Detection
Detect which moment of the session:

**IF user says:** "Create ToDo for T-XXX, T-YYY" OR provides task list
→ Generate ToDo.md Phase 1 (simple task list only)

**IF user provides:** ToDo.md Phase 1 OR "Start session"
→ Read full context stack → Generate Opening Brief (Phase 2)

**IF user says:** "Session complete" OR "Generate Closing Report"
→ Generate Closing Report + Update Handoff + Propose Tracker updates (Phase 3)

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

**User:** "What should I work on?"

**AI:**
```
[Quick scan of Handoff and Tracker]

I recommend:
- T-003: Design database schema (recommended in last session, high priority)
- T-004: Implement authentication (if time permits)

Should I create a ToDo with these tasks? (Yes/No)
```

**User:** "Yes"

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
Read FULL context stack and generate Opening Brief

### Trigger
User says: "Start session" OR provides existing ToDo.md Phase 1

### Step 1: Read Complete Context Stack

**NOW read everything in this EXACT order:**

1. **Design.md** (FIRST - technical constraints non-negotiable)
   - Read complete document
   - All sections
   
2. **Scope.md** (SECOND - project boundaries)
   - Read complete document
   - All sections
   
3. **Requirements.md** (THIRD - what to build)
   - Read complete document
   - All sections
   
4. **Tracker.md** (FOURTH - task details)
   - Read complete document
   - Focus on tasks mentioned in ToDo
   
5. **Handoff.md** (FIFTH - previous session state)
   - Read complete document
   - Understand current project state
   
6. **ToDo.md** (LAST - today's plan)
   - Read the task list from Phase 1
   - These are today's tasks

**Important:** This full context read happens ONLY at session start, NOT when creating ToDo.

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
3. [Step referencing Requirements.md §Z]
4. [Validation step]
5. [Review step]

**Success Criteria:** [From Tracker.md]
- [Criterion 1]
- [Criterion 2]
- [Criterion 3]

**Time Estimate:** [Based on Tracker]

**References:**
- Design.md §X.Y - [Relevant section]
- Requirements.md §Z - [Relevant section]
- Tracker.md T-XXX - [Full criteria]
```

### Step 3: Validation
- [ ] Read ALL 6 documents in correct order
- [ ] Opening Brief references specific sections
- [ ] Plan is concrete and actionable
- [ ] Success criteria from Tracker

---

## PART 2: SESSION CLOSE (Closing Report + Handoff + Tracker - Phase 3)

### Purpose
Generate session artifacts and propose Tracker updates

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
1. Human: [Immediate actions for human]
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
[Human actions]

**Next Session:**
[AI recommendations]

## 8. Status Summary
[Project status with metrics]
```

**Important:** 
- REPLACE entire Handoff.md content (don't accumulate)
- This is a fresh snapshot for next session
- Focus on current state, not history

### Step 3: Propose Tracker Updates

Generate update proposal:

```markdown
---

## Proposed Tracker Updates

**Do you want me to update Tracker.md with these changes?**

**For each task worked on:**
[Task ID]: [Task title]
- Status: [Old] → [New]
- Actual Effort: [Time] (estimated: [Original estimate])
- Evidence: [Links and proof]
- Completion Date: [If complete]
- Notes: [Important notes]

**For dependent tasks:**
[Task ID that was blocked]:
- Status: ⏸️ Blocked → ⚪ Ready to start
- Note: [What unblocked it]

**Project Metrics Update:**
- Tasks completed: [Old] → [New]
- Progress: [Old]% → [New]%
- Velocity: [Calculate from recent sessions]

---

Reply "Yes" to apply these updates automatically, or "No" to update manually.
```

### Step 4: If User Approves - Update Tracker

If user says "Yes":
1. Apply all proposed changes to Tracker.md
2. Confirm: "✅ Tracker.md updated successfully"
3. List what was changed

If user says "No":
1. Acknowledge: "Understood. Please update Tracker.md manually using the proposal above."

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
- If Tracker.md outdated: recommend regenerating it

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
Reading context...
✓ Design.md
✓ Scope.md  
✓ Requirements.md
✓ Tracker.md
✓ Handoff.md
✓ ToDo.md

Adding Opening Brief...
```

**NOW the full context read happens.**

Output:
```markdown
# Session ToDo (2026-01-15, 2-hour time budget)

- T-003: Design database schema

---

## Opening Brief

**Context:** Foundation complete (T-001 ✅, T-002 ✅). Moving to data layer.

**Active Task:** T-003 — Design database schema

**Plan:**
1. Review entity relationships from Requirements.md §3.3
2. Create ERD with entities from Requirements.md §3.1
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
- Requirements.md §3 - Data entities
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

Done! Do you want me to update Tracker.md? (Yes/No)
```

---

## Summary of Changes

**Part 0 (Create ToDo):**
- ❌ NO full context read
- ❌ NO Opening Brief
- ✅ ONLY generate simple task list file
- ✅ Optional: quick Handoff/Tracker scan for recommendations

**Part 1 (Start Session):**
- ✅ Full context stack read (Design → Scope → Requirements → Tracker → Handoff → ToDo)
- ✅ Generate Opening Brief
- ✅ Add to existing ToDo.md

**Part 2 (Close Session):**
- ✅ Generate Closing Report
- ✅ Update Handoff
- ✅ Propose Tracker updates

---

## Validation Checklist

**Part 0 - Create ToDo:**
- [ ] Simple task list only
- [ ] No Opening Brief yet
- [ ] Date and time budget included
- [ ] Ready message to user

**Part 1 - Start Session:**
- [ ] Read ALL 6 docs in order: Design → Scope → Requirements → Tracker → Handoff → ToDo
- [ ] Opening Brief added to ToDo
- [ ] References specific sections
- [ ] Plan is actionable

**Part 2 - Close Session:**
- [ ] Closing Report complete
- [ ] Handoff updated (8 sections)
- [ ] Tracker proposal clear

---

## Tips

1. **Part 0 is lightweight** - Just create the file, no analysis
2. **Part 1 is comprehensive** - Full context read essential
3. **Part 2 is thorough** - Document everything for next session
4. **Always validate** - Check all criteria before proceeding

---

## CHANGE LOG

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-01-15 | Initial prompt created |
