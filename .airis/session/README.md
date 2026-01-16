# Session Execution Space

This folder contains session-specific files that are created and updated during development work.

## Structure

```
session/
├── {developer-id}/          # Per-developer session space
│   ├── current/
│   │   ├── todo.md         # Current session plan
│   │   └── handoff.md      # Personal state transfer
│   └── archive/
│       └── session-XXX_YYYY-MM-DD.md  # Completed session records
└── shared/
    └── project-status.md   # Consolidated team status
```

## Developer Folders

Create a folder with your developer ID (e.g., `john-doe/`, `dev-01/`) to maintain your personal session space.

### current/

Contains active session files:

- **todo.md**: Session plan with Opening Brief and Closing Report
  - Created using: `_setup/prompts/6-session.prompt.md` (Part 0 & 1)
  - Updated during: Session work
  - Finalized with: Closing Report (Part 2)

- **handoff.md**: Personal state for next session
  - Generated using: `_setup/prompts/6-session.prompt.md` (Part 2)
  - Read at: Start of next session
  - Always contains: Current snapshot (not accumulated history)

### archive/

Completed session records for reference:

- Format: `session-XXX_YYYY-MM-DD.md`
- Contains: Final todo.md with Opening Brief + Closing Report
- Purpose: Historical record and retrospectives

## Shared Folder

### shared/project-status.md

Consolidated view of project status across all developers:

- Updated: Weekly or as needed
- Contains: High-level progress, blockers, decisions
- Purpose: Team coordination and stakeholder updates

## Workflow Example

1. **Start Session**: Create/update `{developer-id}/current/todo.md` (Part 0 & 1)
2. **Work**: Collaborate with AI, make changes
3. **End Session**: Generate Closing Report in todo.md and update handoff.md (Part 2)
4. **Archive**: Move completed todo.md to `archive/session-XXX_YYYY-MM-DD.md`
5. **Next Session**: Read handoff.md for context, create new todo.md

## Notes

- Each developer maintains their own space
- Handoff.md is always current (not accumulated)
- Archive preserves session history
- Shared folder is for team-wide coordination
