---
name: airis-tracker
description: "AIris framework tracker manager. Use to generate the initial tracker.md from strategy documents, apply status updates after sessions, or add new tasks. Triggers: 'Generate tracker', 'Create tracker.md', 'Update tracker: T-XXX status', 'Add new task to tracker'. For bug/issue triage and registration, use the airis-issue skill instead."
---

# AIris Tracker Manager

Manages `tracker.md` — the global task registry. Three modes based on trigger.

## File Locations

- Tracker: `.ai-docs/tracker.md`
- Design: `.ai-docs/design.md`
- Scope: `.ai-docs/scope.md`
- Template: see `references/tracker-template.md`

## Mode Detection

| Trigger | Mode |
|---------|------|
| "Generate tracker" / "Create tracker.md" | Generate Mode |
| "Update tracker: [changes]" | Update Mode |

---

## Generate Mode

### Step 1: Read Both Documents Completely
1. `design.md` — focus on: §2 Architecture, §4 Tech Stack, §5 Data Model & API, §7 Dev Workflow, §9 Coding Standards, §10 Security, §12 Testing. For existing projects: §15 Technical Debt, §16 Architecture Evolution.
2. `scope.md` — focus on: §3 Roadmap (phases → task grouping), §4 Features (capabilities → tasks, business rules → acceptance criteria), §6 Constraints (team size, timeline → effort estimates).

**Existing project** (design.md has §15/§16): also generate Technical Debt and Migration task categories.

### Step 2: Expand Features into Tasks

For each Feature (F-XXX) in `scope.md §4`, generate tasks as **vertical slices**:
- One task crosses all layers (schema + service + endpoint) + includes tests
- One task = one session = one PR
- Write user story only for FEAT tasks: "As a [role], I want to [action], so that [benefit]"
- Acceptance criteria must cover: happy path + error/validation path + edge cases + performance + test coverage

**Also generate cross-cutting tasks:** infrastructure, database schema, auth, CI/CD, test setup, deployment.

### Step 3: Assign Phases
Group by `scope.md §3` roadmap. Within each phase, order by dependency.
- Phase 1: Foundation (infra, scaffold, auth, DB)
- Phase 2: Core Features
- Phase 3: Enhancement
- Phase 4: Deploy

### Step 4: Pre-Generation Checkpoint
Present: tasks per phase, critical path, total effort, any gaps ("Scope §4 mentions F-003 but I couldn't derive tasks"). Wait for confirmation.

### Step 5: Generate tracker.md
Follow `references/tracker-template.md`. Every feature has tasks. Every criterion references a source document. Dependencies visualized in Mermaid graph.

---

## Update Mode

Input: `"Update tracker: [changes]"` (e.g., "T-003 ⚪→✅, T-004 ⚪→🟡")

1. Parse task IDs, status changes, new tasks
2. Read current `tracker.md`
3. Apply: status changes, completion dates, evidence
4. Unblock dependent tasks if a task completed
5. Add new tasks with full format (ask for missing fields)
6. Recalculate metadata and progress tables
7. Log in CHANGE LOG
8. Confirm: list all changes applied + updated progress

---

## Quality Rules (enforce strictly)

- Every task is a vertical slice — no horizontal decomposition (model task + service task + endpoint task = wrong)
- Tests are INCLUDED in each task — "Write tests for X" as a separate task is an anti-pattern
- Each task fits in a single session (1-6h) — if larger, break it down
- Every acceptance criterion is specific and testable — "works correctly" is not acceptable
- Each criterion references source: `Design.md §X` or `Scope.md §4 F-XXX`

## References

- `references/tracker-template.md` — exact tracker.md format with all sections
