# AIris Framework - Developer Workflow Guide

**Version:** 1.0  
**Last Updated:** January 2026  
**Purpose:** Guide for session-based development with AIris  
**Prerequisites:** Strategic docs created (scope.md, requirements.md, design.md), tool integration complete

---

## 🤖 How to Use This Guide

### For Humans
This guide explains the daily development workflow using AIris sessions. Read it to understand how TODO.md, handoff.md, and tracker.md work together to maintain continuity across development sessions.

### For AI Agents (Agent-Assisted Mode)
**When helping users with AIris sessions:**

You are guiding the user through session-based development. Your role changes across session parts:

**Part 0 (Task Selection):** Help user select 1-3 appropriate tasks from tracker.md based on dependencies, priority, and session scope (1-6 hours). Create simple task list in TODO.md.

**Part 1 (Session Start):** Read context stack using progressive loading strategy (handoff.md + design.md always, others selectively). Generate detailed Opening Brief including implementation plan with technical subtasks and strategy.

**Part 2 (Work):** Support implementation by answering questions, suggesting approaches that respect constraints from design.md, helping debug issues. Always reference design.md constraints first.

**Part 3 (Session Close):** Generate thorough Closing Report documenting accomplishments with evidence, update handoff.md with verified state only, propose tracker.md updates.

**Key behaviors:**
- Track progress within the session
- Follow constraint-first principle (design.md constraints are non-negotiable)
- Only document verified accomplishments in handoff.md
- Propose tracker updates, don't assume approval
- Remind user about archiving completed TODO.md

**Reference these files:**
- Strategic docs: design.md (constraints), scope.md (boundaries), requirements.md (features)
- Session state: handoff.md (previous session context)
- Task registry: tracker.md (current task status)
- This guide: For session process questions

---

## Overview

### You're Here If...
- ✅ You have scope.md, requirements.md, design.md created
- ✅ You have CLAUDE.md or AGENTS.md set up for your AI tool
- ✅ You're ready to start development
- ✅ You want to understand the session workflow

### This Guide Covers
**Phase 3: Session Execution**
- Session lifecycle (Parts 0, 1, 2, 3)
- TODO.md workflow (3 phases)
- Handoff.md usage (state transfer)
- Tracker.md updates (after sessions)
- Multi-session continuity
- Session archiving

### For Phases 1 & 2
📖 **See:** [INTEGRATION-GUIDE.md](INTEGRATION-GUIDE.md) for creating strategic documents and tool integration.

---

## The AIris Session Model

### What is a Session?

A session is a **bounded work unit** lasting 1-6 hours focused on completing 1-3 specific tasks. Sessions have clear start and end points, ensuring work stays within AI context windows and creates natural checkpoints for verification.

### Why Sessions?

**Context Windows:** AI models have limited context (e.g., Claude 200K tokens). Sessions keep work bounded within these limits.

**Verification Checkpoints:** Each session ends with validation. Only verified work moves to handoff.md.

**Continuity:** Handoff.md transfers state between sessions, preventing context loss across days/weeks.

**Accountability:** Session archives create complete project history with evidence.

### Session Lifecycle

```
Part 0: Create TODO (Task Selection)
   ↓
Part 1: Start Session (Opening Brief + Implementation Plan)
   ↓
Part 2: Work (Implementation)
   ↓
Part 3: Close Session (Closing Report + State Transfer)
   ↓
Archive session → session/{developer}/archive/
   ↓
Repeat
```

### Session Artifacts

```
session/{developer}/
├── current/
│   ├── todo.md        # Active session plan (3 phases)
│   └── handoff.md     # Session state transfer
└── archive/
    └── session-XXX_YYYY-MM-DD.md  # Completed sessions
```

---

## Part 0: Create TODO (Task Selection)

### Purpose
Select 1-3 tasks from tracker.md and create initial TODO.md with simple task list.

### Process

**Step 1:** Review tracker.md for available tasks
- Look for tasks with status ⚪ (Not Started) or ⏸️ (Paused)
- Check dependencies (tasks should be unblocked)
- Estimate combined duration (1-6 hours total)

**Step 2:** Invoke prompt Part 0
```bash
# Using 6-session.prompt.md Part 0
"Create TODO for T-005, T-006, T-007"
```

**Step 3:** AI generates TODO.md Phase 1
- Simple bullet list of selected tasks
- Task IDs, titles, brief descriptions
- Saved to `session/{developer}/current/todo.md`

### Example TODO.md After Part 0

```markdown
# Session TODO

**Developer:** Alice
**Date:** 2026-01-21
**Tasks:** T-005, T-006, T-007

## Tasks

- **T-005:** Implement user authentication middleware
- **T-006:** Add JWT token validation
- **T-007:** Create login endpoint tests

[Opening Brief will be added when session starts...]
```

**Agent Note:** Keep Part 0 lightweight. Just task selection, no detailed planning yet. Planning happens in Part 1.

---

## Part 1: Start Session (Opening Brief)

### Purpose
Load full context and create detailed implementation plan with technical subtasks and strategy.

### The Context Stack (Progressive Loading)

AI reads documents progressively based on need:

**Always Read:**
1. **handoff.md** (previous session state - start here)
2. **design.md** (technical constraints - non-negotiable)

**Read Selectively:**
3. **requirements.md** (only features in session tasks)
4. **tracker.md** (only session tasks + dependencies)

**Reference If Needed:**
5. **scope.md** (only for boundary clarification)

**Token Impact:**
- Full read: ~17,500 tokens (rare)
- Typical read: ~5,000 tokens (most sessions)
- Minimum read: ~2,500 tokens (simple tasks)

**Why this order?** handoff.md provides immediate context, design.md ensures constraint compliance, other docs read selectively for efficiency.

### The Opening Brief

The Opening Brief is added to TODO.md and contains:

**1. Context Summary**
- Current project state from handoff.md
- Relevant decisions from design.md
- Feature requirements from requirements.md

**2. Implementation Plan** ⭐
- **Technical subtasks:** Break each task into concrete implementation steps
- **Strategy:** Approach for achieving objectives
- **Constraint compliance:** How solution respects design.md constraints
- **Dependencies:** What needs to happen first
- **Risks:** Potential blockers identified upfront

**3. Session Scope**
- What will be accomplished this session
- What's explicitly out of scope
- Exit criteria (how we know we're done)

### Process

**Step 1:** Ensure you're in session workspace
```bash
cd session/{your-name}/current/
```

**Step 2:** Invoke prompt Part 1
```bash
# Using 6-session.prompt.md Part 1
"Start session"
```

**Step 3:** AI reads context stack (progressive loading)

**Step 4:** AI generates Opening Brief and appends to TODO.md

**Step 5:** Review Opening Brief
- Verify implementation plan is realistic
- Check constraints from design.md are respected
- Confirm scope is achievable in 1-6 hours

**Step 6:** Start work

### Example TODO.md After Part 1

```markdown
# Session TODO

**Developer:** Alice
**Date:** 2026-01-21
**Tasks:** T-005, T-006, T-007

## Tasks

- **T-005:** Implement user authentication middleware
- **T-006:** Add JWT token validation
- **T-007:** Create login endpoint tests

---

## Opening Brief

**Session Goal:** Implement JWT-based authentication system

### Context
Previous session (handoff.md):
- Database models for User created
- FastAPI app structure in place
- No authentication system exists yet

Design constraints (design.md):
- Must use FastAPI + PostgreSQL (no external auth services)
- JWT tokens with RS256 signing
- Passwords hashed with bcrypt
- Session duration: 24 hours max

### Implementation Plan

**T-005: Authentication Middleware**
Technical subtasks:
1. Create middleware/auth.py module
2. Implement get_current_user() dependency
3. Extract and verify JWT from Authorization header
4. Handle missing/invalid/expired tokens
5. Add middleware to FastAPI app

Strategy: FastAPI dependency injection pattern for reusability

**T-006: JWT Token Validation**
Technical subtasks:
1. Create auth/jwt.py module
2. Implement verify_token() function using PyJWT
3. Load RS256 public key from config
4. Validate token signature, expiration, claims
5. Return decoded user payload or raise exception

Strategy: Separate validation logic for testability

**T-007: Login Endpoint Tests**
Technical subtasks:
1. Create tests/test_auth.py
2. Test POST /auth/login with valid credentials
3. Test invalid password rejection
4. Test JWT token in response
5. Test using token in protected endpoint

Strategy: pytest fixtures for test database and test users

### Constraint Compliance
- ✅ FastAPI native (no external services)
- ✅ RS256 JWT (as specified in design.md)
- ✅ bcrypt password hashing
- ✅ 24-hour token expiration

### Dependencies
- PyJWT library (add to requirements.txt)
- cryptography library for RS256 keys
- Test database fixture from T-002 (completed)

### Risks & Mitigations
- Risk: RS256 key generation complexity
  Mitigation: Use existing key pair from config/
  
- Risk: Token refresh not in scope
  Mitigation: Document as future work (T-023)

### Session Scope
**In scope:**
- Basic JWT authentication
- Login endpoint
- Protected route example
- Tests for happy path

**Out of scope:**
- Token refresh mechanism → T-023
- Role-based authorization → T-024
- Password reset flow → T-025

**Exit criteria:**
- All 3 tasks completed
- Tests passing
- Code committed to feature branch
```

**Agent Note:** Opening Brief should provide complete implementation roadmap. Break tasks into technical subtasks. Specify strategy and constraint compliance. User should be able to execute without asking basic questions.

---

## Part 2: Work (Implementation)

### During the Session

**Reference design.md frequently:** When making technical decisions, check design.md constraints first.

**Follow the implementation plan:** Use Opening Brief as roadmap but adapt as needed.

**Take notes:** Track accomplishments, blockers, decisions for Closing Report.

**Stay in scope:** Resist feature creep. Out-of-scope work goes to tracker.md as new tasks.

### When You Need Help

**Ask AI for:**
- Code suggestions respecting design.md constraints
- Debugging assistance
- Clarification on requirements.md
- Best practices within chosen stack

**AI should reference:**
- design.md for technical constraints
- requirements.md for feature specs
- Opening Brief for implementation plan

### Staying Aligned

**Constraint-first principle applies during work:**
- Technical decisions must respect design.md
- If solution violates constraints, revise approach or update design.md (with ADR)
- Document any constraint changes immediately

### Taking Notes for Closing Report

Track during work:
- ✅ Tasks completed
- 🔧 Code files created/modified
- ✅ Tests written/passing
- 📝 Decisions made
- 🚧 Blockers encountered
- 💡 Ideas for future work

**Agent Note:** During implementation, remind user about design.md constraints when suggesting solutions. Help user stay focused on session scope. Encourage note-taking for smooth Closing Report generation.

---

## Part 3: Close Session (Closing Report)

### Purpose
Document accomplishments, update handoff.md with verified state, propose tracker.md updates, archive session.

### The Closing Report

Added to TODO.md after work is complete. Contains:

**1. Accomplishments**
- What was completed this session
- Tasks moved to ✅ Done status
- Tasks moved to 🟡 In Progress (if partially complete)

**2. Evidence**
- Files created/modified
- Tests passing (test results)
- Code committed (branch name, commit hash)
- CI/CD status

**3. Decisions Made**
- Technical choices during implementation
- Any deviations from Opening Brief
- Rationale for decisions

**4. Blockers & Resolutions**
- Issues encountered
- How they were resolved
- Unresolved blockers (impact on next session)

**5. Next Steps**
- Immediate next actions
- Tasks ready to start
- Dependencies now unblocked

### Updating Handoff.md

Handoff.md **replaces completely** each session (not accumulated).

**What goes in handoff.md:**
- Current project snapshot (what exists now)
- Recent decisions (from this session)
- Next recommended steps
- Known blockers
- Important context for next session

**What doesn't go in handoff.md:**
- Complete history (use session archives)
- Unverified ideas or experiments
- Duplicate information from tracker.md

### Proposing Tracker Updates

AI proposes tracker.md updates in Closing Report:
- Tasks completed: ⚪ → ✅ or 🟡 → ✅
- Tasks started: ⚪ → 🟡
- New tasks discovered: Add to backlog
- Estimates refined: Update based on actual time

**User reviews and approves** before AI applies updates.

### Session Archiving

After Part 3 complete:
```bash
# Move completed TODO.md to archive
mv session/{developer}/current/todo.md \
   session/{developer}/archive/session-005_2026-01-21.md
```

Naming: `session-XXX_YYYY-MM-DD.md` where XXX is incremental session number.

### Process

**Step 1:** Finish implementation work

**Step 2:** Invoke prompt Part 2
```bash
# Using 6-session.prompt.md Part 2
"Session complete"
```

**Step 3:** AI generates Closing Report and appends to TODO.md

**Step 4:** Review Closing Report
- Verify accomplishments are accurate
- Check evidence is included
- Confirm next steps make sense

**Step 5:** AI proposes handoff.md updates

**Step 6:** Review and approve handoff.md changes

**Step 7:** AI proposes tracker.md updates

**Step 8:** Review and approve tracker.md changes

**Step 9:** AI applies approved updates

**Step 10:** Archive TODO.md to session archive

### Example TODO.md After Part 3

```markdown
# Session TODO

**Developer:** Alice
**Date:** 2026-01-21
**Tasks:** T-005, T-006, T-007

## Tasks

- **T-005:** Implement user authentication middleware
- **T-006:** Add JWT token validation
- **T-007:** Create login endpoint tests

---

## Opening Brief
[... previous Opening Brief content ...]

---

## Closing Report

**Session Duration:** 4.5 hours

### Accomplishments

✅ **T-005: Authentication middleware** - COMPLETE
- Created middleware/auth.py with get_current_user() dependency
- Integrated into FastAPI app
- Handles token extraction and validation

✅ **T-006: JWT validation** - COMPLETE
- Created auth/jwt.py module
- verify_token() function using RS256
- Proper error handling for invalid/expired tokens

✅ **T-007: Login endpoint tests** - COMPLETE
- Created tests/test_auth.py with 8 test cases
- All tests passing (pytest -v)
- Coverage: 95% on auth modules

### Evidence

**Files Created:**
- middleware/auth.py (87 lines)
- auth/jwt.py (124 lines)
- tests/test_auth.py (156 lines)
- config/jwt_keys.py (key loading utility)

**Tests Passing:**
```
tests/test_auth.py::test_login_valid_credentials PASSED
tests/test_auth.py::test_login_invalid_password FAILED → FIXED
tests/test_auth.py::test_jwt_in_response PASSED
tests/test_auth.py::test_protected_endpoint_with_token PASSED
tests/test_auth.py::test_protected_endpoint_no_token PASSED
tests/test_auth.py::test_expired_token PASSED
tests/test_auth.py::test_invalid_signature PASSED
tests/test_auth.py::test_malformed_token PASSED
```

**Code Committed:**
- Branch: feature/alice-auth
- Commit: a3f5c8d "feat(auth): Implement JWT authentication system"
- CI Status: ✅ Passing (GitHub Actions)

### Decisions Made

**Decision 1: Token storage location**
- Chose Authorization: Bearer <token> header
- Rationale: Standard practice, stateless
- Alternative considered: HTTP-only cookies (rejected for API-first design)

**Decision 2: Key rotation strategy**
- Deferred to future work (T-028)
- Current: Single RS256 key pair
- Rationale: Adds complexity, not needed for MVP

### Blockers & Resolutions

**Blocker:** test_login_invalid_password initially failing
- Issue: Password hash comparison not working
- Resolution: bcrypt salt rounds mismatch (fixed in User model)
- Impact: 30 minutes debugging

**No unresolved blockers**

### Next Steps

**Immediate:**
1. Merge feature/alice-auth to main (after code review)
2. Start T-023 (Token refresh mechanism)
3. Update API documentation with auth endpoints

**Dependencies Unblocked:**
- T-024 (Role-based authorization) - can start after merge
- T-025 (Password reset) - authentication foundation in place

**Recommended for next session:**
- T-023, T-024 (related to auth system)
- Or switch to T-015 (different feature)

---

## Proposed Tracker Updates

**Tasks Completed:**
- T-005: ⚪ → ✅ (User authentication middleware)
- T-006: ⚪ → ✅ (JWT token validation)
- T-007: ⚪ → ✅ (Login endpoint tests)

**Tasks Unblocked:**
- T-024: Status unchanged, dependency on T-005 removed
- T-025: Status unchanged, dependency on T-005 removed

**New Tasks Discovered:**
- T-028: JWT key rotation strategy (Priority: Low, Effort: Medium)

**Estimates Updated:**
- T-023: Original 4h → 3h (auth foundation simplifies refresh)

---

## Proposed Handoff Updates

Replace handoff.md with:

**Current Project Snapshot:**
- Authentication system implemented (JWT with RS256)
- Login endpoint functional at POST /auth/login
- Protected routes use get_current_user() dependency
- Test coverage: 95% on auth modules

**Recent Decisions (Session 5):**
- Bearer token in Authorization header (not cookies)
- Key rotation deferred to T-028
- Password hashing: bcrypt with 12 rounds

**Next Recommended Steps:**
- Merge feature/alice-auth after code review
- Continue with T-023 (Token refresh) or T-024 (RBAC)
- Update API docs with authentication flow

**Known Blockers:**
- None

**Important Context:**
- RS256 keys located in config/jwt_keys/
- Token expiration: 24 hours (configurable in .env)
- Test database fixture from T-002 reused successfully
```

**Agent Note:** Closing Report should be thorough with concrete evidence. Only document verified accomplishments. Propose tracker updates, don't assume approval. Generate handoff.md that provides complete context for next session without duplicating tracker.md.

---

## Working with TODO.md

### Structure Overview

TODO.md evolves through **3 phases** during a session:

**Phase 1: Task List** (Part 0)
- Simple bullet list of selected tasks
- Minimal information

**Phase 2: Opening Brief** (Part 1)
- Context + Implementation Plan
- Detailed roadmap for session

**Phase 3: Closing Report** (Part 2)
- Accomplishments + Evidence
- State transfer preparation

### Complete Lifecycle Example

**Phase 1 (After Part 0):**
```markdown
# Session TODO
**Developer:** Bob
**Date:** 2026-01-21
**Tasks:** T-012

## Tasks
- **T-012:** Implement payment processing
```

**Phase 2 (After Part 1):**
```markdown
# Session TODO
**Developer:** Bob
**Date:** 2026-01-21
**Tasks:** T-012

## Tasks
- **T-012:** Implement payment processing

---

## Opening Brief
**Session Goal:** Stripe payment integration

### Context
Design constraints: Must use Stripe, webhook-based, idempotent

### Implementation Plan
**T-012: Payment Processing**
Technical subtasks:
1. Install stripe library
2. Create payments/stripe.py module
3. Implement create_payment_intent()
4. Add webhook endpoint for payment.succeeded
5. Update Order model with payment_status

Strategy: Event-driven architecture for reliability

[... rest of Opening Brief ...]
```

**Phase 3 (After Part 2):**
```markdown
[... Previous content from Phase 1 & 2 ...]

---

## Closing Report

### Accomplishments
✅ T-012 complete
- Stripe integration functional
- Webhook handling tested
- Payment status tracking in DB

### Evidence
Files: payments/stripe.py, webhooks/stripe.py
Tests: 12/12 passing
Commit: b7e2f1a

[... rest of Closing Report ...]
```

---

## Working with Handoff.md

### Purpose
Transfer **verified state** between sessions. Each session replaces handoff.md completely.

### What Goes in Handoff

**1. Current Project Snapshot**
- What exists right now
- Current system capabilities
- Recent completions (last 1-2 sessions)

**2. Recent Decisions**
- Technical choices made recently
- Why those choices were made
- Impact on architecture

**3. Next Recommended Steps**
- What should happen next
- Why (priority, dependencies)
- Unblocked tasks

**4. Known Blockers**
- Issues preventing progress
- What's needed to resolve
- Impact assessment

**5. Important Context**
- Non-obvious information
- Setup details
- Environmental notes

### What Doesn't Go in Handoff

❌ Complete project history (use session archives)
❌ Unverified experiments or ideas
❌ Task lists (that's tracker.md)
❌ Detailed implementation notes (use code comments)
❌ Old decisions (>2 sessions ago)

### Replacement Strategy

Handoff.md is **replaced** each session, not appended:
- Previous session's handoff.md is overwritten
- Only current state matters
- History is in session archives

### Example Handoff.md

```markdown
# Project Handoff

**Last Updated:** 2026-01-21 (Session 5 by Alice)
**Project:** Phoenix IRIS Platform

## Current Project Snapshot

**What Exists:**
- Data warehouse with 10 core tables (Customer, Project, ServiceItem, etc.)
- ETL pipelines for daily batch updates
- JWT authentication system (RS256)
- FastAPI backend with 15 endpoints
- Test coverage: 87% overall

**Recent Completions:**
- Session 5 (Alice): JWT authentication (T-005, T-006, T-007)
- Session 4 (Alice): User model and database migrations (T-002, T-003)

## Recent Decisions

**Session 5: Authentication approach**
- Decision: Bearer tokens in Authorization header
- Why: Stateless API design, industry standard
- Impact: All protected routes use get_current_user() dependency

**Session 4: Database schema**
- Decision: SQLAlchemy ORM with Alembic migrations
- Why: Type safety, schema versioning
- Impact: All models inherit from Base, migrations in versions/

## Next Recommended Steps

**Immediate (Next Session):**
1. **T-023: Token refresh** - Auth system ready for this enhancement
2. **Code review** feature/alice-auth branch
3. **Merge to main** after approval

**Soon (This Week):**
- T-024: Role-based authorization (depends on auth merge)
- T-025: Password reset flow (depends on auth merge)

**Later:**
- T-028: JWT key rotation (low priority, documented)

## Known Blockers

**None currently**

Previous blocker (bcrypt configuration) resolved in Session 5.

## Important Context

**Environment Setup:**
- RS256 keys: config/jwt_keys/ (public.pem, private.pem)
- Token expiration: 24 hours (configurable in .env JWT_EXPIRY)
- Test database: Uses fixtures from T-002

**Dev Workflow:**
- Feature branches: feature/{developer}-{topic}
- Tests required for all auth code (95% coverage minimum)
- CI must pass before merge

**Notes:**
- Key rotation strategy deferred to T-028
- Password reset emails out of scope for MVP
- Admin panel not started yet (T-040+)
```

---

## Updating Tracker.md

### When to Update

**After each session** as part of Part 3 (Closing Report).

### What to Update

**Task Status Changes:**
- ⚪ Not Started → 🟡 In Progress (work began)
- 🟡 In Progress → ✅ Done (work complete)
- ⚪ → ✅ (completed in one session)
- Any task → 🚫 Cancelled (if no longer needed)

**New Tasks Discovered:**
- Add to tracker.md with appropriate status ⚪
- Assign priority and estimate
- Note dependencies if any

**Dependencies Changed:**
- Remove blocking dependencies when tasks complete
- Add new dependencies discovered during work

**Estimates Refined:**
- Update based on actual time spent
- Note variance for future planning

### How Updates Work

**Step 1:** AI proposes updates in Closing Report
```markdown
## Proposed Tracker Updates

Tasks Completed:
- T-012: ⚪ → ✅

Dependencies Unblocked:
- T-015: Remove dependency on T-012

New Tasks:
- T-029: Implement payment retry logic (Priority: Medium, Effort: 2h)
```

**Step 2:** Developer reviews proposals

**Step 3:** Developer approves or modifies

**Step 4:** AI applies approved updates to tracker.md

**Step 5:** Tracker.md reflects current project state

### Multi-Developer Merge Conflicts

**Situation:** Alice and Bob both update tracker.md in parallel branches.

**Resolution Strategy:**
1. Both developers work on different tasks
2. Merge conflicts expected in tracker.md
3. Resolution: **Keep both updates** (merge, don't overwrite)
4. Different developers update different task IDs
5. Update `session/shared/project-status.md` with consolidated view

**Example:**
```
Alice's branch: Updates T-005, T-006, T-007 → ✅
Bob's branch: Updates T-012, T-013 → ✅

Merge conflict in tracker.md:
Resolution: Keep all status updates (different tasks = no conflict)
```

---

## Multi-Session Continuity

### How Sessions Connect

**Handoff.md is the bridge** between sessions.

Each session:
1. Reads previous handoff.md for context
2. Does work
3. Updates handoff.md with new state
4. Next session repeats

### Starting Next Session

**Step 1:** Read previous handoff.md
```bash
cat session/{your-name}/current/handoff.md
```

**Step 2:** Review tracker.md for available tasks

**Step 3:** Create new TODO.md (Part 0)
- Select tasks based on handoff.md recommendations
- Or choose different tasks if priorities changed

**Step 4:** Start session (Part 1)
- AI reads handoff.md for context
- Generates Opening Brief considering previous state

**Step 5:** Continue from where last session left off

### Long Breaks (Days/Weeks)

**After extended time away:**

**Step 1:** Read handoff.md (current state)

**Step 2:** Review recent session archives
```bash
ls session/{your-name}/archive/
# Read last 2-3 sessions for context
```

**Step 3:** Check tracker.md (overall progress)

**Step 4:** Start fresh session with context loaded

### Context Refresh

**When to re-read strategic docs:**
- After long break (>1 week)
- When working on new feature area
- When technical decisions seem unclear
- When Opening Brief references old decisions

**How to refresh:**
1. Skim design.md (constraints still current?)
2. Review requirements.md (feature specs)
3. Check scope.md (project boundaries)
4. Proceed with session

---

## Session Archiving

### When to Archive

**After Part 3 complete:** Move TODO.md to archive immediately.

### Archive Location

```
session/{developer}/archive/session-XXX_YYYY-MM-DD.md
```

**Components:**
- `XXX`: Incremental session number (001, 002, 003, ...)
- `YYYY-MM-DD`: Date of session

### What to Archive

**Complete TODO.md** with all 3 phases:
- Phase 1: Task List
- Phase 2: Opening Brief
- Phase 3: Closing Report

### Naming Example

```
session/alice/archive/
├── session-001_2026-01-15.md
├── session-002_2026-01-16.md
├── session-003_2026-01-17.md
├── session-004_2026-01-18.md
└── session-005_2026-01-21.md
```

### Retention

**Keep indefinitely** for:
- Project history
- Audit trail
- Reference for similar work
- Onboarding new team members

---

## Daily Development Patterns

### Pattern 1: Single Task Session

**Scenario:** Focused work on one complex feature  
**Duration:** 3-4 hours  
**Process:**
1. Part 0: Select one task (e.g., T-015)
2. Part 1: Detailed implementation plan
3. Work: Complete implementation
4. Part 3: Document completion, archive

**Best for:** Complex features, research tasks, debugging

---

### Pattern 2: Multi-Task Session

**Scenario:** Several related small tasks  
**Duration:** 4-6 hours  
**Process:**
1. Part 0: Select 3 related tasks (e.g., T-020, T-021, T-022)
2. Part 1: Implementation plan for all tasks
3. Work: Complete in sequence or parallel
4. Part 3: Document all completions, archive

**Best for:** Related small features, bug fixes, testing tasks

---

### Pattern 3: Interrupted Session

**Scenario:** Unexpected interruption mid-session  
**Process:**
1. Stop work immediately
2. Take quick notes (what's done, what's pending)
3. Don't run Part 3 yet (incomplete work)
4. Resume later:
   - Review notes
   - Continue work
   - Run Part 3 when complete

**Best for:** Handling emergencies, urgent requests

---

### Pattern 4: Exploration Session

**Scenario:** Research without specific tasks  
**Duration:** 2-3 hours  
**Process:**
1. Part 0: Create "Research: [Topic]" task
2. Part 1: Questions to answer, approach
3. Work: Explore, prototype, document findings
4. Part 3: Summarize learnings, propose new tasks for tracker.md

**Best for:** Technical spikes, library evaluation, architecture investigation

---

## Multi-Developer Coordination

### Parallel Sessions

Multiple developers work simultaneously:

```
session/
├── alice/current/    # Alice working on T-005, T-006
├── bob/current/      # Bob working on T-012, T-013
└── shared/
    └── project-status.md  # Team coordination
```

### Session Isolation

**Each developer has:**
- Independent todo.md (their tasks)
- Independent handoff.md (their context)
- Independent archive/ (their history)

**Developers share:**
- Strategic docs (design.md, scope.md, requirements.md)
- Tracker.md (all tasks)
- Project-status.md (team status)

### Tracker Conflicts

**Expected during merge:**

Alice and Bob both update tracker.md on feature branches:
- Alice: T-005, T-006, T-007 → ✅
- Bob: T-012, T-013 → ✅

**Resolution:**
1. Merge both branches to main
2. Conflict in tracker.md (different task updates)
3. Keep both updates (different tasks = compatible)
4. Update project-status.md with consolidated state

### Shared Project Status

`session/shared/project-status.md` contains:
- Last update from each developer
- Overall project health
- Cross-team dependencies
- Coordination notes

**Update when:**
- Major milestone reached
- Dependencies affect other developers
- Architectural decision impacts team

---

## Troubleshooting Sessions

### Issue: Session running too long (>6 hours)

**Solution:**
- Stop at 6 hour mark
- Run Part 3 with current progress
- Mark incomplete tasks as 🟡 In Progress in tracker.md
- Archive session
- Continue in new session

**Prevention:** Select fewer tasks in Part 0

---

### Issue: Lost track during work

**Solution:**
- Review Opening Brief (implementation plan)
- Check what's complete vs. pending
- Take notes now for Closing Report
- Continue with focus

**Prevention:** Take notes during work, check progress hourly

---

### Issue: Handoff.md unclear after break

**Solution:**
- Read handoff.md + last 2 session archives
- Review tracker.md for context
- Start new session with "refresh context" goal
- Ask AI to summarize current state

**Prevention:** Write clearer handoff.md (test: can you understand it after 1 week?)

---

### Issue: Tracker.md out of sync

**Solution:**
- Review recent session archives
- Reconcile actual status vs. tracker.md
- Update tracker.md to reflect reality
- Document discrepancy reason

**Prevention:** Always run Part 3, always update tracker.md

---

### Issue: Can't pick up after long break

**Solution:**
1. Read handoff.md (start here)
2. Read last 3 session archives
3. Skim design.md, requirements.md
4. Review tracker.md
5. Start simple session (1 easy task)

**Prevention:** Comprehensive handoff.md, regular sessions (don't wait weeks)

---

### Issue: Forgot to close session

**Solution:**
- Reconstruct Closing Report manually
- Review git commits for evidence
- Update handoff.md based on memory + commits
- Update tracker.md
- Archive reconstructed TODO.md

**Prevention:** Always run Part 3, make it a habit

---

## Quick Reference

### Session Checklist

**Before Session:**
```
[ ] Read previous handoff.md
[ ] Review tracker.md for available tasks
[ ] Create TODO.md with tasks (Part 0)
[ ] Generate Opening Brief (Part 1)
```

**During Session:**
```
[ ] Reference design.md for constraints
[ ] Follow implementation plan
[ ] Take notes on accomplishments
[ ] Track blockers and decisions
[ ] Stay within scope (1-6 hours)
```

**After Session:**
```
[ ] Generate Closing Report (Part 2)
[ ] Review and approve handoff.md updates
[ ] Review and approve tracker.md updates
[ ] Archive TODO.md to session archive
[ ] Commit code to repository
```

### File Locations

```
Strategic Documents:
docs/design.md          # Constraints (read with handoff.md)
docs/scope.md           # Boundaries (reference if needed)
docs/requirements.md    # Features (read selectively)
docs/tracker.md         # Task registry (read selectively)

Session Files:
session/{developer}/current/todo.md       # Active session
session/{developer}/current/handoff.md    # State transfer (read first)
session/{developer}/archive/session-*.md  # History

Team Coordination:
session/shared/project-status.md          # Team status
```

### Prompt Usage

```
Part 0: Create TODO
  Command: "Create TODO for T-XXX, T-YYY"
  Output: TODO.md with task list

Part 1: Start Session
  Command: "Start session"
  Output: Opening Brief in TODO.md

Part 2: Close Session
  Command: "Session complete"
  Output: Closing Report + updates
```

### Prompt Location

All session prompts in: `.airis/_setup/prompts/6-session.prompt.md`

---

## Related Documentation

### AIris Framework Core
- **[.airis/README.md](README.md)** - Complete framework (20KB)
  - Document hierarchy and phases
  - Core principles and philosophy
  - Multi-developer workflows
  - Constraint-first principle deep dive

### Integration & Setup
- **[INTEGRATION-GUIDE.md](INTEGRATION-GUIDE.md)** - Phases 1 & 2 (59KB)
  - Creating strategic documents
  - Tool integration (CLAUDE.md, AGENTS.md)
  - Getting to development-ready state

### Session Workflow
- **[6-session.prompt.md](_setup/prompts/6-session.prompt.md)** - Session prompt
  - Complete 3-part prompt
  - Handles entire session lifecycle
  - Part 0: Create TODO
  - Part 1: Start Session
  - Part 2: Close Session

### Templates
- **[5-todo.template.md](_setup/templates/5-todo.template.md)** - TODO structure
- **[6-handoff.template.md](_setup/templates/6-handoff.template.md)** - Handoff structure
- **[4-tracker.template.md](_setup/templates/4-tracker.template.md)** - Tracker structure

---

## Summary

**Sessions are the heartbeat of AIris development.** They provide:

✅ **Clear boundaries** - 1-6 hours, defined start/end  
✅ **Verified state transfer** - Handoff.md bridges sessions  
✅ **Complete history** - Archives provide audit trail  
✅ **Context efficiency** - Stays within LLM windows  
✅ **Constraint alignment** - Design.md read first, always  
✅ **Continuous progress** - Small, verified increments  

**The session workflow ensures AI-assisted development remains:**
- Architecturally coherent (constraint-first)
- Properly documented (Opening Brief + Closing Report)
- Continuously verified (only proven work in handoff.md)
- Maintainable long-term (complete history in archives)

---

**See clearly. Build confidently.** 👁️