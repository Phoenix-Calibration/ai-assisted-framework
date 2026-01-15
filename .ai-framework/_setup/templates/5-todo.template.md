# Session ToDo Template

> **Purpose:** Task list for a specific work session with opening plan and closing report.  
> **Created By:** Human (Phase 1), then AI adds Opening Brief (Phase 2) and Closing Report (Phase 3)  
> **Updated:** Evolves during the session  
> **Naming Convention:** `todo-YYYYMMDD-HHMM.md` (e.g., `todo-20260115-0900.md`)

---

## ⚠️ IMPORTANT: Three Phases

This document evolves through three phases during a work session:

**Phase 1: Human Creates** (at start of session)
- List task IDs from Tracker.md
- Set time budget
- Mark optional tasks with "(if time permits)"

**Phase 2: AI Adds Opening Brief** (after reading context)
- AI reads: Design.md → Scope.md → Requirements.md → Tracker.md → Handoff.md → This ToDo
- AI generates plan, success criteria, and time estimate

**Phase 3: AI Adds Closing Report** (at end of session)
- AI documents what changed, validation results, decisions made
- AI updates Handoff.md and Tracker.md
- Human commits changes

---

## Naming Convention for Multiple Sessions

Each session creates a **NEW** ToDo file:

**Format:** `todo-YYYYMMDD-HHMM.md`

**Examples:**
- `todo-20260115-0900.md` - Morning session on Jan 15
- `todo-20260115-1400.md` - Afternoon session same day
- `todo-20260116-1000.md` - Next day session

**Alternative:** Sequential numbering
- `todo-001.md`, `todo-002.md`, `todo-003.md`

**Choose one convention and stick with it for the entire project.**

---

## Phase 1: Initial List (Human Creates)

```markdown
# Session ToDo (YYYY-MM-DD, [time budget])

- T-XXX: [Task title from Tracker.md]
- T-YYY: [Task title from Tracker.md] (if time permits)
```

**Instructions for Human:**
1. Copy this template
2. Update date and time budget (e.g., "2-hour time budget", "4-hour session")
3. Copy task IDs from Tracker.md
4. List primary tasks first
5. Mark secondary/optional tasks with "(if time permits)"
6. Keep it simple - just the list

**Example:**
```markdown
# Session ToDo (2026-01-15, 2-hour time budget)

- T-003: Design database schema
- T-004: Implement authentication (if time permits)
```

---

## Phase 2: Opening Brief (AI Adds)

After reading all context documents, AI adds this section to the file:

```markdown
---

## Opening Brief

**Context:** [Brief description of current project state]

**Active Task:** T-XXX — [Task title]

**Plan:**
1. [Specific step 1 with references to Design.md/Requirements.md]
2. [Specific step 2]
3. [Specific step 3]
4. [Specific step 4]

**Success Criteria:**
- [Criterion 1 from Tracker.md acceptance criteria]
- [Criterion 2 from Tracker.md acceptance criteria]
- [Criterion 3 specific to this session]

**Time estimate:** [X] minutes for T-XXX, [Y] minutes for T-YYY if time permits

**References:**
- Design.md §X.Y - [Relevant constraint or decision]
- Requirements.md §Z - [Relevant requirement]
- Tracker.md T-XXX - [Acceptance criteria]
```

**Example:**
```markdown
---

## Opening Brief

**Context:** Project scaffolding complete (T-001 ✅). CI pipeline green. Moving to data layer.

**Active Task:** T-003 — Design database schema

**Plan:**
1. Review entity relationships from Requirements.md §3.3
2. Create ERD diagram with all entities from Requirements.md §3.1
3. Define indexes for frequently queried fields per Design.md §8.2
4. Create migration scripts following Design.md §3.3 database strategy
5. Peer review with team

**Success Criteria:**
- All entities from Requirements.md §3.1 included in schema
- Relationships properly defined with foreign keys
- Indexes created for performance per Design.md §8.2
- Migration scripts tested locally
- ERD diagram approved by team

**Time estimate:** 90 minutes for T-003

**References:**
- Design.md §3.3 - PostgreSQL 15, migration strategy
- Requirements.md §3 - Complete data entities specification
- Tracker.md T-003 - Full acceptance criteria
```

---

## Phase 3: Closing Report (AI Adds at End)

At the end of the session, AI adds this final section:

```markdown
---

## Closing Report

**What Changed:**
- [File 1 created/modified with brief description]
- [File 2 created/modified with brief description]
- [Configuration changes]
- [Dependencies added/updated]

**Validation & Evidence:**
- Tests: [X/Y passing, link to test run]
- Lint: [0 errors, 0 warnings / X issues found]
- Build: [Success / Failed with reason]
- CI Pipeline: [Run #X passed/failed, link]
- Code Review: [Approved by NAME / Pending]

**Status:** [✅ 100% | ✅ 80% | ⚪ 50% | 🚫 Blocked]

**Task Updates:**
- T-XXX: [⚪ → 🟡 | 🟡 → ✅ | Status and progress notes]
- T-YYY: [Status if worked on]

**Decisions Made:**
- [Decision 1 with rationale, reference ADR if created]
- [Decision 2 with rationale]
- [Important choice made during implementation]

**Blockers Encountered:**
- [Blocker 1 and how it was resolved / marked in Tracker]
- [Blocker 2 and current status]

**Next Steps:**
1. Human: [Immediate action - commit, push, test, etc.]
2. Next session: [Recommended task(s) to work on]
3. Follow-up: [Any pending items or questions to resolve]

**Session Metrics:**
- Planned: [X] tasks, [Y] hours
- Completed: [X] tasks, [Y] hours actual
- Efficiency: [Z]% (actual vs. estimated)
```

**Example:**
```markdown
---

## Closing Report

**What Changed:**
- `migrations/001_create_schema.sql` created with all tables from Requirements.md §3
- `docs/erd.png` created showing entity relationships
- `README.md` updated with database setup instructions
- Added pg-migrate dependency for migration management

**Validation & Evidence:**
- Migration: Successfully applied locally, all tables created
- Indexes: Verified with `EXPLAIN ANALYZE`, using indexes correctly
- ERD: Reviewed and approved by team (Jane, Mike)
- Documentation: Database setup section added to README

**Status:** ✅ 100% — T-003 complete

**Task Updates:**
- T-003: ⚪ → ✅ Complete (database schema designed and validated)

**Decisions Made:**
- Using UUID for primary keys instead of auto-increment integers
  - Rationale: Better for distributed systems, prevents ID collision
  - Documented in Design.md as new ADR-002
- Separate schema for audit logs
  - Rationale: Easier to manage retention and performance
  - Future: May move to separate database

**Blockers Encountered:**
- None

**Next Steps:**
1. Human: Commit migration scripts and ERD, push to feature/database-schema branch
2. Next session: T-004 — Implement authentication (now ready with User table)
3. Follow-up: Consider adding database diagram to Design.md §3.3

**Session Metrics:**
- Planned: 1 task, 2 hours
- Completed: 1 task, 1.5 hours actual
- Efficiency: 133% (faster than estimated)
```

---

## Complete Example: Full Session Evolution

### Phase 1: Start (Human Creates)
```markdown
# Session ToDo (2026-01-15, 2-hour time budget)

- T-003: Design database schema
- T-004: Implement authentication (if time permits)
```

### Phase 2: After AI Reads Context
```markdown
# Session ToDo (2026-01-15, 2-hour time budget)

- T-003: Design database schema
- T-004: Implement authentication (if time permits)

---

## Opening Brief

**Context:** Project scaffolding complete (T-001 ✅). CI pipeline green. Moving to data layer.

**Active Task:** T-003 — Design database schema

**Plan:**
1. Review entity relationships from Requirements.md §3.3
2. Create ERD diagram with all entities
3. Define indexes for performance
4. Create migration scripts
5. Peer review with team

**Success Criteria:**
- All entities included
- Foreign keys defined
- Indexes for performance
- Migrations tested

**Time estimate:** 90 minutes for T-003

**References:**
- Design.md §3.3 - Database specs
- Requirements.md §3 - Data entities
- Tracker.md T-003 - Acceptance criteria
```

### Phase 3: End of Session
```markdown
# Session ToDo (2026-01-15, 2-hour time budget)

- T-003: Design database schema
- T-004: Implement authentication (if time permits)

---

## Opening Brief
[... same as Phase 2 ...]

---

## Closing Report

**What Changed:**
- `migrations/001_create_schema.sql` created
- `docs/erd.png` created
- `README.md` updated

**Validation & Evidence:**
- Migration: Applied successfully
- ERD: Approved by team

**Status:** ✅ 100% — T-003 complete

**Task Updates:**
- T-003: ✅ Complete

**Decisions Made:**
- UUID for PKs (ADR-002)

**Next Steps:**
1. Human: Commit and push
2. Next session: T-004

**Session Metrics:**
- Completed: 1 task, 1.5 hours
```

---

## Archiving Completed Sessions

**Recommended Structure:**
```
project/
├── .ai-framework/
│   ├── session/
│   │   ├── todo-current.md        # Current/active session (optional)
│   │   └── archive/
│   │       ├── 2026-01/
│   │       │   ├── todo-20260115-0900.md
│   │       │   ├── todo-20260115-1400.md
│   │       │   └── todo-20260116-1000.md
│   │       └── 2026-02/
│   │           └── [more sessions]
```

**Archive Strategy:**
1. Complete the session (all 3 phases done)
2. Commit the final ToDo file
3. Move to archive folder organized by month
4. Update Handoff.md and Tracker.md
5. Start fresh with new ToDo for next session

---

## Tips for Effective Sessions

**For Humans:**
- Be realistic with time budgets
- Focus on 1-2 primary tasks per session
- Mark stretch goals clearly with "(if time permits)"
- Review Handoff.md before starting to understand context

**For AI:**
- Opening Brief should reference specific sections (e.g., Design.md §3.2)
- Success criteria should be measurable and verifiable
- Closing Report should include evidence (links, screenshots, test results)
- Be honest about blockers and partial completion

**For Continuity:**
- Every Closing Report updates Handoff.md
- Task status changes are reflected in Tracker.md
- Important decisions become ADRs in Design.md
- Pattern: ToDo → Handoff → Tracker → Design

---

## NEXT STEPS

After completing a session:

1. **Commit the ToDo file** to version control
2. **Update Tracker.md** with task status changes
3. **Update Handoff.md** with current project state
4. **Archive the ToDo** to keep session/ folder clean
5. **For next session:** Create new ToDo file with new tasks

---

## CHANGE LOG

Not applicable - each ToDo file is independent and represents a single session.
