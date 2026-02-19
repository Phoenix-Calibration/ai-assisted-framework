# SESSION TODO

> **Purpose:** Task list for a specific work session with Opening Brief and Closing Report.
> **Location:** `.ai-session/{developer-id}/current/todo.md`
> **Created by:** Human (Phase 1) → AI adds Opening Brief (Phase 2) → AI adds Closing Report (Phase 3)
> **Archive:** After session → `.ai-session/{dev}/archive/session-XXX_YYYY-MM-DD.md`

**Note:** Phases 2-3 are managed by `prompts/5-session.prompt.md`. Do not fill manually.

---

## Three Phases

| Phase | Who | When | What |
|-------|-----|------|------|
| Phase 1 | Human | Session start | 1 task from tracker.md + time budget |
| Phase 2 | AI | After reading context | Opening Brief: assumptions, risks, plan |
| Phase 3 | AI | Session end | Closing Report + propose tracker updates |

---

## Phase 1: Initial List *(Human Creates)*

> Copy this structure to create your todo.md:

```markdown
# Session ToDo (YYYY-MM-DD, [time budget])

- T-XXX: [Task title from tracker.md]
```

**Instructions:**
1. Set date and time budget (e.g., "2-hour time budget")
2. Select 1 task from tracker.md — a complete vertical slice (PR-ready deliverable)
3. Say "Start session" when ready for AI to generate Opening Brief

---

## Phase 2: Opening Brief *(AI Adds)*

> AI appends this structure after reading context stack. See `prompts/5-session.prompt.md` Part 1.

```markdown
---

## Opening Brief

**Context:** [Brief project state from handoff.md]

**Active Task:** T-XXX — [Task title]

**Assumptions:**
- [What AI takes as given about current state]
- [Interpretation of ambiguous requirements]

**Dependencies:**
- [Components, tasks, or external factors]
- [Tasks that must be complete]

**Edge Cases:**
- [Boundary condition and how it will be handled]

**Risks:**
- [What could go wrong, with mitigation]

**Success Criteria:**
- [From tracker.md acceptance criteria]

**Plan:**
1. [Step with reference to design.md §X]
2. [Step 2]
3. [Validation step]

**References:**
- Design.md §X — [Relevant constraint]
- Scope.md §4 — [Relevant feature]
- Tracker.md T-XXX — [Acceptance criteria]
```

---

## Phase 3: Closing Report *(AI Adds at End)*

> AI appends this structure at session end. See `prompts/5-session.prompt.md` Part 2.

```markdown
---

## Closing Report

**What Changed:**
- `path/to/file.ext` created/modified (+X lines): [Description]

**Validation & Evidence:**
- Tests: [X/Y passing, coverage %]
- Build: [Success / Failed]
- CI: [Run status]
- Review: [Status]

**Status:** [✅ 100% | ✅ 80% | ⚪ 50% | 🚫 Blocked]

**Task Updates:**
- T-XXX: [Old → New status with notes]

**Decisions Made:**
- [Decision with rationale, ADR ref if applicable]

**Blockers Encountered:**
- [Blocker and resolution] OR None

**Next Steps:**
1. Human: [Immediate action — commit, push]
2. Next session: [Recommended task(s)]
3. Follow-up: [Pending items]

---

## Proposed Tracker Updates

> AI proposes, human applies via `prompts/4-tracker.prompt.md`

**Command:** `"Update tracker: T-XXX ⚪→✅, T-YYY ⚪→🟡"`

**Changes:**
- T-XXX: [Status change] | Effort: [Actual vs estimated] | Evidence: [Links]
```

---

## NEXT STEPS

1. **Start session** → `prompts/5-session.prompt.md` Part 1 generates Opening Brief
2. **Close session** → `prompts/5-session.prompt.md` Part 2 generates Closing Report + updates handoff.md
3. **Apply tracker** → `prompts/4-tracker.prompt.md` with proposed command
4. **Archive** → Move to `.ai-session/{dev}/archive/session-XXX_YYYY-MM-DD.md`

---

## VALIDATION CHECKLIST

- [ ] Phase 1: 1 task selected from tracker.md (vertical slice), date and time budget set
- [ ] Phase 2: Opening Brief has 7 elements (context, assumptions, dependencies, edge cases, risks, criteria, plan)
- [ ] Phase 2: Plan references specific design.md and scope.md sections
- [ ] Phase 3: What Changed lists actual files with line counts
- [ ] Phase 3: Validation includes evidence (test counts, CI status)
- [ ] Phase 3: Task Updates match actual progress
- [ ] Phase 3: Decisions include rationale
- [ ] Phase 3: Next Steps are actionable and specific
- [ ] Phase 3: Tracker updates proposed with command (not applied)
