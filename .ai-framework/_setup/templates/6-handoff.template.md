# Handoff Template - Session State Transfer

> **Purpose:** Transfer verified results and context from one session to the next.  
> **Updated:** After EVERY session (mandatory)  
> **Created By:** AI at the end of each session  
> **Replaces:** Previous handoff content (does not accumulate)  
> **Analogy:** Like a Git commit message + diff — captures what changed and why

---

## ⚠️ CRITICAL: This Document's Role

Think of the document hierarchy like Git:
- **Tracker.md** = Git repository (all commits, full history)
- **ToDo.md** = Working branch (current changes in progress)
- **Handoff.md** = Commit message + diff (what changed and why)

**Handoff.md is the SESSION MEMORY:**
- AI models have no memory between sessions
- This document provides continuity
- AI reads this at the start of the next session to understand project state
- Must be concise but complete

**Update Strategy:**
- **REPLACE** entire content after each session (don't accumulate)
- Keep only current state, not history (history lives in Git and Tracker.md)
- Focus on what's important for the NEXT session

---

## 📋 8-SECTION CANONICAL SCHEMA

Every handoff.md follows this exact structure:

1. Context Snapshot
2. Active Task(s)
3. Decisions Made
4. Changes Since Last Session
5. Validation & Evidence
6. Risks & Unknowns
7. Next Steps
8. Status Summary

---

## Template Structure

```markdown
# Handoff - Session State Transfer

**Last Updated:** YYYY-MM-DD HH:MM
**Session Number:** #XXX
**Developer:** [Name or ID]

---

## 1. Context Snapshot

[Brief 3-5 bullet summary of WHERE THE PROJECT IS NOW]

- [What major components are complete]
- [What's currently working/deployed]
- [What's ready for next work]
- [Current project phase/milestone]

---

## 2. Active Task(s)

**Completed This Session:**
- T-XXX ✅ — [Task title with brief outcome]

**Next Up:**
- T-YYY ⚪ — [Next task to work on]

**In Progress (if any):**
- T-ZZZ 🟡 — [Partial completion details]

---

## 3. Decisions Made

[Decisions made during THIS SESSION with rationale]

**Decision 1:** [What was decided]
- **Rationale:** [Why this choice was made]
- **References:** [Design.md ADR-XXX if documented]

**Decision 2:** [What was decided]
- **Rationale:** [Why this choice was made]
- **Impact:** [What this affects]

---

## 4. Changes Since Last Session

[Files and configurations modified, with line counts]

**Created:**
- `path/to/file.ext` (+X lines): [Brief description]
- `path/to/file2.ext` (+Y lines): [Brief description]

**Modified:**
- `path/to/existing.ext` (+A/-B lines): [What changed]
- `config/settings.json` (+C/-D lines): [What changed]

**Deleted:**
- `obsolete/file.ext`: [Why removed]

**Dependencies:**
- Added: [package-name@version] - [Purpose]
- Updated: [package-name] from X to Y - [Reason]

---

## 5. Validation & Evidence

[Proof that work is complete and correct]

**Tests:**
- Unit tests: X/Y passing ([link to test run])
- Integration tests: X/Y passing
- E2E tests: X/Y passing
- Coverage: X% ([link to coverage report])

**Code Quality:**
- Linting: 0 errors, 0 warnings
- Type checking: Passed
- Security scan: No vulnerabilities

**Build & CI:**
- Local build: ✅ Success
- CI Pipeline: Run #XXX passed ([link])
- Deployment: [Environment] updated successfully

**Reviews:**
- Code review: Approved by [Name]
- Design review: [Status]
- Testing: [QA status]

---

## 6. Risks & Unknowns

[Things to watch out for, open questions, potential issues]

**Risks:**
- [Risk 1]: [Description and potential impact]
- [Risk 2]: [Description and mitigation plan]

**Unknowns:**
- [Question 1]: [What we don't know yet]
- [Question 2]: [What needs clarification]

**Blockers (if any):**
- [Blocker]: [What's blocking progress and how to resolve]

**Technical Debt:**
- [Debt item]: [What needs refactoring later]

---

## 7. Next Steps

[Ordered list of what to do next]

**Immediate (Human):**
1. [Action for human to take right now - commit, push, deploy, etc.]
2. [Any manual verification needed]

**Next Session (AI):**
1. T-XXX: [Recommended task to work on next]
2. [Any follow-up work from this session]
3. [Any blocked items that may be unblocked]

**Follow-up:**
- [Any pending items to address]
- [Questions to resolve]
- [Documentation to update]

---

## 8. Status Summary

**Overall Project Status:** [Choose one]
- ✅ On track — [% complete of current milestone]
- ⚠️ At risk — [Reason and recovery plan]
- 🚫 Blocked — [What's blocking and when will unblock]

**This Session:**
- ✅ 100% — All planned tasks complete
- OR
- ✅ 80% — Most tasks complete, [X] remaining
- OR
- ⚪ 50% — Partial progress, [reason]
- OR
- 🚫 Blocked — [What blocked us]

**Session Metrics:**
- Planned: [X] tasks, [Y] hours estimated
- Completed: [X] tasks, [Y] hours actual
- Efficiency: [Z]% (actual vs estimated)

**Velocity:**
- Tasks completed this session: [N]
- Tasks remaining in Tracker: [M]
- Estimated sessions to completion: [P]
```

---

## Complete Example: Full Handoff

```markdown
# Handoff - Session State Transfer

**Last Updated:** 2026-01-15 14:30
**Session Number:** #003
**Developer:** Alice

---

## 1. Context Snapshot

- Payment API project started (Week 2 of development)
- Project scaffolding (T-001) complete and verified ✅
- CI pipeline established and passing (GitHub Actions)
- TypeScript strict mode enforced across codebase
- Database schema designed and migrated (T-002) ✅
- Ready to implement authentication layer (T-003)

---

## 2. Active Task(s)

**Completed This Session:**
- T-002 ✅ — Database schema for payments (PostgreSQL migrations)

**Next Up:**
- T-003 ⚪ — Implement JWT authentication endpoints

**In Progress:**
- None

---

## 3. Decisions Made

**Decision 1:** Use UUID for primary keys instead of auto-increment integers
- **Rationale:** Better for distributed systems, prevents ID collision in microservices
- **References:** Documented as ADR-002 in Design.md §11
- **Impact:** All entity tables use UUID v4

**Decision 2:** Separate schema for audit logs
- **Rationale:** Easier to manage data retention policies and optimize query performance
- **References:** Design.md §3.3 database architecture
- **Impact:** Created `audit` schema alongside `public` schema

**Decision 3:** Use pg-migrate for database versioning
- **Rationale:** Team familiarity, good rollback support, works with TypeScript
- **References:** Design.md §4.3 development workflow

---

## 4. Changes Since Last Session

**Created:**
- `migrations/001_create_payments_schema.sql` (+87 lines): Core payments tables
- `migrations/002_create_audit_schema.sql` (+34 lines): Audit logging tables
- `docs/database/erd.png`: Entity relationship diagram
- `src/db/migrations/README.md` (+28 lines): Migration instructions

**Modified:**
- `package.json` (+3/-0 lines): Added pg-migrate dependency
- `README.md` (+24/-2 lines): Added database setup section
- `docker-compose.yml` (+12/-3 lines): Updated PostgreSQL configuration

**Deleted:**
- None

**Dependencies:**
- Added: node-pg-migrate@7.0.0 - Database migration management
- Added: pg@8.11.3 - PostgreSQL client for Node.js

---

## 5. Validation & Evidence

**Tests:**
- Migration tests: 2/2 passing (up and down migrations)
- Schema validation: All constraints verified
- No unit tests yet (next session will add repository layer)

**Code Quality:**
- SQL Lint: 0 errors, 0 warnings
- Migration files: Peer reviewed by Bob

**Build & CI:**
- Local migration: ✅ Successfully applied to local PostgreSQL
- Database created: `payments_dev` with all tables
- Indexes verified: Using EXPLAIN ANALYZE, confirmed indexes active
- Docker stack: PostgreSQL running on port 5432

**Reviews:**
- ERD diagram: ✅ Approved by Alice, Bob, and Product Manager
- Schema design: ✅ Reviewed against Requirements.md §3 data entities

**Evidence Links:**
- ERD: `docs/database/erd.png` (committed)
- Migration logs: Available in Git history

---

## 6. Risks & Unknowns

**Risks:**
- None identified at this stage

**Unknowns:**
- How to handle payment provider webhooks timing (discuss in T-005)
- Whether to use database-level or application-level encryption for sensitive fields

**Blockers:**
- None

**Technical Debt:**
- Migration rollback hasn't been tested in production-like environment (add to testing checklist)

---

## 7. Next Steps

**Immediate (Human):**
1. Commit migration files and ERD to repository
2. Push to feature/database-schema branch
3. Create pull request for team review
4. Merge to main after approval

**Next Session (AI):**
1. T-003: Implement JWT authentication endpoints
   - User registration endpoint
   - Login endpoint  
   - Token refresh logic
   - Password hashing with bcrypt
2. Follow Design.md §7.2 security guidelines for JWT implementation
3. Reference Requirements.md §2.1 for authentication business rules

**Follow-up:**
- Consider adding database ER diagram to Design.md §3.3
- Schedule discussion on encryption strategy (application vs database level)
- Add migration testing to CI pipeline

---

## 8. Status Summary

**Overall Project Status:**
- ✅ On track — 20% complete of Phase 1 (Foundation)
- Week 2 of 10-week timeline
- No blockers or delays

**This Session:**
- ✅ 100% — T-002 complete (database schema fully implemented and validated)
- All planned work finished
- Validation passed, ready for next task

**Session Metrics:**
- Planned: 1 task (T-002), 2 hours estimated
- Completed: 1 task, 1.5 hours actual
- Efficiency: 133% (faster than estimated)

**Velocity:**
- Tasks completed this session: 1
- Tasks completed overall: 2 (T-001, T-002)
- Tasks remaining in Tracker: 12
- Estimated sessions to completion: 6-8 sessions (at current velocity)
```

---

## Instructions for AI

When creating/updating handoff.md at the end of a session:

### Reading Context First

Before writing the handoff, read in this order:
1. **Design.md** — Technical constraints and ADRs
2. **Scope.md** — Project goals and boundaries
3. **Requirements.md** — Functional requirements
4. **Tracker.md** — Task status and history
5. **Current ToDo.md** — What was planned for this session
6. **Previous Handoff.md** — Last session's state

### Writing the Handoff

**Section 1 (Context Snapshot):**
- 3-5 bullets maximum
- Focus on CURRENT state, not history
- Mention major completed milestones
- State what's ready for next work

**Section 2 (Active Tasks):**
- List tasks completed THIS SESSION
- Clearly mark next task to work on
- Include partial progress if applicable
- Use task IDs from Tracker.md (e.g., T-003)

**Section 3 (Decisions Made):**
- Only decisions from THIS SESSION
- Always include rationale
- Reference ADRs if created in Design.md
- Explain impact on future work

**Section 4 (Changes):**
- List actual file changes with line counts
- Group by created/modified/deleted
- Brief description of what changed
- Include dependency changes

**Section 5 (Validation):**
- Actual proof, not claims
- Include links to test runs, CI pipelines
- Exact numbers (X/Y tests passing)
- Code review status if applicable

**Section 6 (Risks & Unknowns):**
- Be honest about uncertainties
- Flag potential problems early
- Suggest mitigation strategies
- Note technical debt created

**Section 7 (Next Steps):**
- Separate immediate human actions from next session work
- Be specific and actionable
- Reference relevant task IDs
- Include follow-up items

**Section 8 (Status Summary):**
- Clear status indicator (✅/⚠️/🚫)
- Percentage completion with context
- Session efficiency metrics
- Velocity for planning purposes

### Quality Checklist

Before finalizing handoff.md, verify:

- [ ] All 8 sections are present and complete
- [ ] Context Snapshot is concise (3-5 bullets)
- [ ] Task IDs match Tracker.md
- [ ] Decisions include rationale
- [ ] File changes include line counts
- [ ] Validation includes actual evidence (links, numbers)
- [ ] Next Steps are actionable and specific
- [ ] Status Summary includes metrics
- [ ] No information from previous sessions (this is a fresh snapshot)
- [ ] Language is clear and unambiguous

---

## Multi-Developer Considerations

### Per-Developer Handoff Structure

When multiple developers work on the same project:

```
.ai-framework/session/
├── alice/
│   └── current/
│       └── handoff.md (Alice's personal context)
├── bob/
│   └── current/
│       └── handoff.md (Bob's personal context)
└── shared/
    └── project-status.md (Consolidated team view)
```

**Each developer's handoff contains:**
- Personal context (what THEY worked on)
- Tasks THEY completed
- Decisions THEY made
- Files THEY changed

**Shared project-status.md contains:**
- Overall project health
- All completed tasks across team
- Cross-team dependencies
- Next milestones

### Reading Context as a Developer

At the start of a session, AI reads:
1. **strategy/** documents (shared, stable)
2. **tactics/tracker.md** (shared, latest from main branch)
3. **session/{your-name}/current/handoff.md** (your personal context)
4. **session/shared/project-status.md** (team context)

This gives AI both:
- Your specific context (where YOU left off)
- Team context (what OTHERS have done)

---

## Handoff Evolution Example

### After Session #001

```markdown
# Handoff - Session State Transfer

**Last Updated:** 2026-01-15 10:30
**Session Number:** #001

## 1. Context Snapshot
- New project started
- Repository initialized
- Basic scaffolding complete

## 2. Active Task(s)
**Completed This Session:**
- T-001 ✅ — Project scaffolding

**Next Up:**
- T-002 ⚪ — Database schema design

[... rest of handoff ...]
```

### After Session #002 (REPLACES Session #001)

```markdown
# Handoff - Session State Transfer

**Last Updated:** 2026-01-15 14:30
**Session Number:** #002

## 1. Context Snapshot
- Payment API project (Week 2)
- Scaffolding complete ✅
- Database schema designed ✅
- Ready for authentication

## 2. Active Task(s)
**Completed This Session:**
- T-002 ✅ — Database schema for payments

**Next Up:**
- T-003 ⚪ — JWT authentication

[... rest of handoff ...]
```

**Notice:**
- Session #001 content is GONE (not accumulated)
- Context Snapshot includes T-001 outcome but focuses on current state
- Active Tasks shows T-002 as just completed
- This is a FRESH snapshot for the next session

---

## Common Mistakes to Avoid

❌ **Accumulating history** — Don't keep appending to previous handoffs
✅ Replace entire content each session

❌ **Too verbose** — Don't write essays in Context Snapshot
✅ Keep it to 3-5 bullets

❌ **Missing rationale** — Don't just list decisions
✅ Always explain WHY each decision was made

❌ **Vague validation** — Don't say "tests passed"
✅ Say "Unit tests: 45/45 passing, Coverage: 87%"

❌ **No evidence** — Don't claim without proof
✅ Include links to CI runs, test reports

❌ **Generic next steps** — Don't say "continue development"
✅ Say "T-004: Implement payment webhook handler"

❌ **Forgetting metrics** — Don't skip efficiency tracking
✅ Always include planned vs actual time

---

## CHANGE LOG

Not applicable - handoff.md is REPLACED each session, not versioned internally.
Version history exists in Git commits.
