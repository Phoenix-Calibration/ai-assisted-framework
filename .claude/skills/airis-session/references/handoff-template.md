# HANDOFF — Session State Transfer

> **Purpose:** Transfer verified results and context from one session to the next.
> **Location:** `.ai-session/{developer-id}/current/handoff.md`
> **Updated:** After EVERY session — complete replacement (not accumulated)
> **Created by:** AI at end of session via `prompts/5-session.prompt.md` Part 2

**Note:** Each developer maintains their own handoff.md. AI reads this at session start to restore context. Generate this document using `prompts/5-session.prompt.md`. Do not fill manually.

---

## 8-Section Schema

Every handoff follows this exact structure:

1. Context Snapshot — Where the project is now
2. Active Task(s) — Completed, next up, in progress
3. Decisions Made — This session's decisions with rationale
4. Changes Since Last Session — Files created/modified/deleted
5. Validation & Evidence — Proof that work is correct
6. Risks & Unknowns — Watch-outs for next session
7. Next Steps — Immediate human actions + next session recommendations
8. Status Summary — Project health + session metrics

---

**Last Updated:** YYYY-MM-DD HH:MM
**Session Number:** #XXX
**Developer:** [Name or ID]

---

## 1. Context Snapshot

> 3-5 bullets: current state, not history. Focus on what matters for NEXT session.

- [Major component status]
- [Current phase/milestone]
- [What's ready for next work]

---

## 2. Active Task(s)

**Completed This Session:**
- T-XXX ✅ — [Task title with brief outcome]

**Next Up:**
- T-YYY ⚪ — [Next task to work on]

**In Progress (if any):**
- T-ZZZ 🟡 — [Partial completion details, % done]

---

## 3. Decisions Made

> Only decisions from THIS session. Always include rationale.

**Decision 1:** [What was decided]
- **Rationale:** [Why this choice]
- **References:** [Design.md ADR-XXX if documented]
- **Impact:** [What this affects going forward]

---

## 4. Changes Since Last Session

**Created:**
- `path/to/file.ext` (+X lines): [Brief description]

**Modified:**
- `path/to/existing.ext` (+A/-B lines): [What changed]

**Deleted:**
- `path/to/file.ext`: [Why removed]

**Dependencies:**
- Added: [package@version] — [Purpose]

---

## 5. Validation & Evidence

> Actual proof, not claims. Include numbers and links.

**Tests:**
- Unit: X/Y passing | Integration: X/Y | Coverage: X%

**Code Quality:**
- Lint: [Status] | Type check: [Status]

**Build & CI:**
- Local build: [Status] | CI: Run #XXX [Status]

---

## 6. Risks & Unknowns

**Risks:**
- [Risk with potential impact]

**Unknowns:**
- [Open question for next session]

**Blockers (if any):**
- 🟡 Technical: [Blocker — resolvable without external input — suggested next step]
- 🚫 External: [Blocker — requires [stakeholder/team/environment] action — REQUIRED BEFORE NEXT SESSION]
- **Partial work note:** [What was committed vs. what remains in branch — safe to use: yes/no]

**Technical Debt:**
- [Debt item created this session]

---

## 7. Next Steps

**Immediate (Human):**
1. [Action — commit, push, deploy]
> If session was blocked: "REQUIRED ACTION before next session: [specific unblocking action]"

**Next Session (AI):**
1. T-XXX: [Recommended task]
2. [Follow-up from this session]

**Follow-up:**
- [Pending items or questions]

---

## 8. Status Summary

**Overall:** ✅ On track | ⚠️ At risk | 🚫 Blocked — [% complete of current milestone]

**This Session:** ✅ 100% | ✅ 80% | ⚪ 50% | 🚫 Blocked

**Metrics:**
- Planned: [X] tasks, [Y] hours | Completed: [X] tasks, [Y] hours
- Velocity: [N] tasks/session | Remaining: [M] tasks

---

## NEXT STEPS

1. **Next session** → AI reads this handoff first (constraint-first principle)
2. **Apply tracker** → Use `prompts/4-tracker.prompt.md` to apply proposed status changes
3. **Archive todo** → Move completed todo.md to `.ai-session/{dev}/archive/`

---

## VALIDATION CHECKLIST

- [ ] All 8 sections present and complete
- [ ] Context Snapshot is concise (3-5 bullets, current state only)
- [ ] Task IDs match tracker.md
- [ ] Decisions include rationale
- [ ] File changes include line counts
- [ ] Validation includes actual evidence (numbers, links)
- [ ] Next Steps are actionable and specific
- [ ] Content is REPLACED (no accumulated history from previous sessions)
