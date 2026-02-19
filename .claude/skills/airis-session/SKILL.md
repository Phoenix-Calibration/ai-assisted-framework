---
name: airis-session
description: "AIris framework session manager. Use when user wants to manage a development session in a project using the AIris framework. Triggers include: 'Create ToDo for T-XXX', 'What should I work on?', 'Start session', 'Session complete', 'End session', 'Close session', 'Hotfix for T-XXX', 'Urgent fix for [issue]', or when a developer has no handoff.md and needs to onboard to an AIris project."
---

# AIris Session Manager

Manages the full lifecycle of an AIris development session across three parts plus two special modes.

## File Locations

- Todo: `.ai-session/{developer-id}/current/todo.md`
- Handoff: `.ai-session/{developer-id}/current/handoff.md`
- Design: `.ai-docs/design.md`
- Tracker: `.ai-docs/tracker.md`
- Scope: `.ai-docs/scope.md`

## Mode Detection

| Trigger | Action |
|---------|--------|
| "Create ToDo for T-XXX" / "What should I work on?" | Part 0 |
| "Start session" / provides existing todo.md | Part 1 |
| "Session complete" / "End session" | Part 2 |
| "Hotfix for T-XXX" / "Urgent fix for [issue]" | Hotfix Mode |
| No handoff.md + new developer | Onboarding Mode (within Part 0) |

---

## Part 0: Create ToDo

1. Quick read: `handoff.md §2` (Active Tasks) + `§7` (Next Steps)
2. If user specifies task: note if already 🟡 in-progress
3. If "What should I work on?": also read `tracker.md` (⚪ high-priority only) → suggest 1 task
4. Generate `todo.md` Phase 1 format (see `references/todo-template.md`)
5. End with: "Ready to start? Say 'Start session' when ready."

**Onboarding Mode** (no handoff.md, new developer):
1. Read: `design.md` (complete) + `scope.md §3` (roadmap) + `tracker.md` (statuses only)
2. Output Project Orientation Brief: tech stack summary, architecture constraints, current progress, recommended first task, developer setup from `design.md §7`
3. Confirm with user, then generate todo.md Phase 1

---

## Part 1: Session Start (Opening Brief)

### Context Reading Order (constraint-first)

**Stage 1 — Always read:**
1. `handoff.md` — full document (prior decisions, active constraints, current state)
2. `design.md` — full document (all constraints non-negotiable). If `CLAUDE.md` exists at project root, compare its Technical Constraints with `design.md §0` and `§10`. If stale, notify developer.

**Stage 2 — Selective:**
3. `todo.md` — already created in Part 0
4. `tracker.md` — only tasks in todo + their direct dependencies

**Stage 3 — Reference (if needed):**
5. `scope.md` — only for boundary questions or feature clarification

**First session (no handoff):** Read `design.md` → `scope.md` → `tracker.md` → `todo.md`

### Opening Brief (7 Required Elements)

Append to `todo.md` Phase 2 format (see `references/todo-template.md`):

1. **Context** — current project state from handoff.md
2. **Assumptions** — what AI takes as given, interpretations of ambiguity
3. **Dependencies** — components, tasks, external factors
4. **Edge Cases** — specific to THIS task (not generic)
5. **Risks** — specific to THIS task with mitigations (not generic)
6. **Success Criteria** — from tracker.md acceptance criteria
7. **Plan** — concrete steps referencing specific `design.md §X` and `scope.md §4 F-XXX`

**Wait for human approval before any implementation.**

---

## Part 2: Session Close

### Step 1: Closing Report
Append to `todo.md` Phase 3 format (see `references/todo-template.md`). Must include: actual file paths with line counts, test counts/CI status, decisions with rationale, next steps.

### Step 2: Update Handoff
Replace complete `handoff.md` (see `references/handoff-template.md`). All 8 sections required. REPLACE content — never accumulate.

### Step 3: Propose Design.md Updates (DO NOT APPLY)
Identify gaps from this session's decisions:
- New architectural decision → propose for `design.md §14` (ADR)
- New data model/API → `design.md §5`
- New constraint or pattern → `design.md §2` or `§9`

State: "Recommend adding to design.md §X: [exact content]" OR "design.md is up to date."

### Step 4: Tracker Updates
**Simple** (⚪→✅, ⚪→🟡, ⚪→🚫) for tasks in current todo: ask "Apply these now? [Y/N]" → apply if confirmed.

**Complex** (new tasks, reopening ✅, dependency changes): add to Proposed Tracker Updates in todo.md with command string for `airis-tracker` skill.

---

## Hotfix Mode

1. Skip todo.md creation
2. Read minimal context: `handoff.md §2` + `design.md §0` only
3. Generate abbreviated Opening Brief (4 elements): what's broken, root cause hypothesis, fix approach, rollback plan
4. Wait for approval
5. Implement — scope strictly limited to broken behavior only. No refactoring.
6. Close same as Part 2. Add to Closing Report: root cause identified (yes/no), regression test added (yes/no), design flaw exposed (route to `airis-amendment` skill if yes)

**Constraints:** No scope expansion. No new dependencies without approval. Regression test mandatory.

---

## References

Read these when generating the corresponding documents:

- `references/todo-template.md` — todo.md Phase 1/2/3 exact format
- `references/handoff-template.md` — handoff.md 8-section schema
