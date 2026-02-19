---
name: airis-amendment
description: "AIris framework scope and design change manager. Use when requirements, architecture decisions, or features need to change in a project using AIris. Analyzes impact before applying any changes. Triggers: 'scope changed', 'design changed', 'amendment needed', 'new requirement', 'architecture change', 'update scope.md', 'update design.md', 'we need to add/remove/change [feature or behavior]', or whenever the user describes a change to documented behavior or architecture."
---

# AIris Amendment Manager

Manages changes to `.ai-docs/scope.md` and `.ai-docs/design.md`. Never edits either document without impact analysis first.

## File Locations

- Scope: `.ai-docs/scope.md`
- Design: `.ai-docs/design.md`
- Tracker: `.ai-docs/tracker.md`

## Process

### Step 1: Understand the Change

Ask until clear (max 3 questions per round):
- What exactly is changing? (feature, behavior, architecture, constraint)
- Is this a new addition, a modification, or a removal?
- For existing projects: is this AS-IS (current state) or TO-BE (planned)?

### Step 2: Impact Analysis

Read `scope.md` and `design.md` relevant sections. Identify:
- **Scope impact:** Which features (F-XXX) are added, modified, or removed?
- **Design impact:** Which architecture decisions, data model, API contracts, or constraints change?
- **Tracker impact:** Which tasks are affected? (blocked, invalidated, new tasks needed)
- **Breaking changes:** Does this break any existing acceptance criteria in tracker.md?

Present impact summary before making any changes. Wait for confirmation.

### Step 3: Update scope.md (if applicable)

Update in this order — never update design.md before scope.md:
- New feature: add to §4 Features with F-XXX ID, capabilities, business rules
- Changed feature: update existing F-XXX
- Removed feature: mark as removed with rationale (do not delete — preserve history)
- Update §3 Roadmap if phase allocation changes

### Step 4: Update design.md (after scope.md confirmed)

Apply constraint-first: constraints and standards before features.
- New architecture decision → add ADR to §14 with context, decision, rationale, consequences, alternatives
- Data model change → update §5 tables and ER diagram
- API change → update §5 endpoints
- New constraint → §2 Architecture Principles or §0 Constraints Summary
- Infrastructure change → §7
- For existing projects: update §15 Technical Debt or §16 Architecture Evolution if applicable

### Step 5: Propose Tracker Changes

Classify changes:
- **Invalidated tasks** (no longer needed): propose as 🚫 with reason
- **Affected tasks** (acceptance criteria changed): propose updated criteria
- **New tasks required**: provide full task format with type, story, criteria, dependencies
- **Unblocked tasks** (dependency resolved): note which tasks can now proceed

Present as: "Run `airis-tracker` skill with: Update tracker: [command string]"

### Step 6: Confirm Extraction

After amendments applied:
- Remind: "Re-extract CLAUDE.md/AGENTS.md — strategy docs changed. Use `airis-extract` or `.airis/templates/6-extraction.template.md`."

---

## Rules

- **Never edit scope.md and design.md simultaneously** — scope first, design second, always
- **Never apply changes without impact analysis** — manual edits miss tracker cascade
- **Breaking changes** (remove feature, change API contract, change data model) require explicit human confirmation before applying
- **Agile amendments** (sprint reprioritization): focus on minimal viable change. Preserve completed work. Evaluate cost of reverting vs. adapting.
