---
name: airis-issue
description: "AIris framework issue intake and triage. Use when a user reports a bug, hotfix, improvement, or maintenance need in a project using AIris. Classifies the issue type, determines whether an amendment is needed first, and creates a typed task in tracker.md. Triggers: 'bug:', 'hotfix:', 'I have a bug', 'something is broken', 'register issue', 'maintenance:', 'urgent fix needed', 'I need to update a dependency', or any description of unexpected behavior or a task that does not fit the standard session flow."
---

# AIris Issue Intake

Triage and register bugs, hotfixes, improvements, and maintenance tasks into `tracker.md`.

## File Locations

- Tracker: `.ai-docs/tracker.md`
- Design: `.ai-docs/design.md` (for scope impact check)

## Triage (max 3 questions)

Ask only what isn't clear from the user's description:

**1. Severity**
"Is this blocking users in production right now, or can it wait for the next session?"
- Production-critical, immediate → Type: `HOT`
- Can wait → Type: `BUG`

**2. Scope impact**
"Does fixing this require changing the expected behavior documented in `design.md` or `scope.md`?"
- Yes → Route to `airis-amendment` skill first, then return to register the task
- No → Register directly

**3. Type clarification** (if not obvious)
- Broken functionality → `BUG` / `HOT`
- New capability or behavior change → `FEAT` (use `airis-amendment` if scope change needed)
- Dependency update / security patch → `MAINT`
- Known shortcut that needs fixing → `DEBT`

---

## Decision Tree

```
Issue reported
      |
Is it production-critical?
  Yes -> Type: HOT -> Register -> Use airis-session Hotfix Mode
  No
      |
Does it change design.md / scope.md?
  Yes -> Pause -> Route to airis-amendment -> Return after amendment
  No
      |
Classify type (BUG / MAINT / DEBT / FEAT)
  -> Register in tracker correct section
  -> Use standard airis-session flow
```

---

## Task Creation

Create task in `tracker.md` using this format:

```
### T-XXX: [Issue title]

**Type:** BUG | HOT | MAINT | DEBT
**Status:** circle Not Started | **Priority:** Critical (HOT) / High (blocking BUG) / Medium (non-blocking BUG) / Low (MAINT, DEBT)
**Estimated Effort:** [e.g., 0.5 day]
**Dependencies:** None | [T-YYY if blocked by another task]
**Blockers:** None
**References:**
- [Component/module/file affected]

**Acceptance Criteria:**
- [ ] Reproduction steps: [exact steps to reproduce]
- [ ] Expected behavior: [what should happen]
- [ ] Actual behavior: [what is happening]
- [ ] Regression test: a test that would have caught this issue is added
```

Omit **Story** for all non-FEAT types. Omit Scope.md reference for BUG/HOT/MAINT.

---

## Register in Tracker

- BUG / HOT → add to `tracker.md §Bugs & Hotfixes`
- MAINT → add to `tracker.md §Maintenance`
- DEBT / FEAT → add to appropriate phase section

Update Project Metadata counts. Log in CHANGE LOG.

---

## Confirm to User

State:
- Task ID assigned: T-XXX
- Type and priority
- Route: "Ready for standard session (airis-session)" OR "Route to airis-amendment first, then session"
- For HOT: "Use Hotfix Mode: say 'Hotfix for T-XXX' to trigger airis-session Hotfix Mode"
