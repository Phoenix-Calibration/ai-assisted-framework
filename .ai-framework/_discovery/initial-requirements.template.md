# INITIAL REQUIREMENTS

> **Purpose:** Capture high-level feature requirements before creating detailed Requirements.md.
> **When to use:** Bridge between problem definition and detailed functional specifications.
> **Who fills this:** Product Manager, Business Analyst, or Technical Lead.
> **Note:** This is a lightweight version. Full details go in strategy/requirements.md later.

---

## 1. FEATURE OVERVIEW

### High-Level Feature List

<!-- List major features at epic/theme level. Keep each to 1-2 sentences. -->

**Priority 0 (Must-Have for MVP):**

1. **[Feature Name 1]**
   - Description: [What it does in 1-2 sentences]
   - User benefit: [Why users need this]
   - Success metric: [How we measure success]

2. **[Feature Name 2]**
   - Description:
   - User benefit:
   - Success metric:

3. **[Feature Name 3]**
   - Description:
   - User benefit:
   - Success metric:

**Priority 1 (Important, Phase 2):**

1. **[Feature Name 4]**
   - Description:
   - User benefit:
   - Success metric:

2. **[Feature Name 5]**
   - Description:
   - User benefit:
   - Success metric:

**Priority 2 (Nice-to-Have, Future):**

1. **[Feature Name 6]**
   - Description:
   - User benefit:
   - Success metric:

---

## 2. USER JOURNEYS

### Critical User Flows

<!-- Describe 3-5 most important user journeys at a high level -->

**Journey 1: [User Action]** (e.g., "Submit a calibration request")

1. User [action]
2. System [response]
3. User [action]
4. System [response]
5. **Outcome:** [What the user achieves]

**Expected frequency:** [How often this happens]
**Priority:** [P0/P1/P2]

---

**Journey 2: [User Action]**

1. [Step 1]
2. [Step 2]
3. [Step 3]
4. [Step 4]
5. **Outcome:** [What the user achieves]

**Expected frequency:** [How often this happens]
**Priority:** [P0/P1/P2]

---

**Journey 3: [User Action]**

1. [Step 1]
2. [Step 2]
3. [Step 3]
4. **Outcome:** [What the user achieves]

**Expected frequency:** [How often this happens]
**Priority:** [P0/P1/P2]

---

## 3. KEY BUSINESS RULES

### Core Logic Requirements

<!-- List critical business rules that affect functionality -->

**Rule 1: [Rule Name]**
- Description: [What the rule is]
- When it applies: [Conditions]
- Exception: [If any]
- Priority: [P0/P1/P2]

**Example:** "Calibration requests submitted after 3 PM are processed the next business day"

---

**Rule 2: [Rule Name]**
- Description:
- When it applies:
- Exception:
- Priority:

---

**Rule 3: [Rule Name]**
- Description:
- When it applies:
- Exception:
- Priority:

---

## 4. DATA REQUIREMENTS

### What data do we need?

<!-- List major data entities and key attributes -->

**Entity 1: [Entity Name]** (e.g., "Calibration Request")

**Key Attributes:**
- [Attribute 1]: [Type, Required?]
- [Attribute 2]: [Type, Required?]
- [Attribute 3]: [Type, Required?]

**Relationships:**
- [Related to Entity X]
- [Related to Entity Y]

---

**Entity 2: [Entity Name]**

**Key Attributes:**
- [Attribute 1]:
- [Attribute 2]:
- [Attribute 3]:

**Relationships:**
- [Related to Entity X]

---

**Entity 3: [Entity Name]**

**Key Attributes:**
- [Attribute 1]:
- [Attribute 2]:

**Relationships:**
- [Related to Entity X]

---

## 5. INTEGRATION REQUIREMENTS

### What systems do we connect to?

**External System 1: [System Name]**
- Purpose: [Why we integrate]
- Direction: [We push to them / They push to us / Both]
- Data exchanged: [What data]
- Frequency: [Real-time / Batch / On-demand]
- Priority: [P0/P1/P2]

**External System 2: [System Name]**
- Purpose:
- Direction:
- Data exchanged:
- Frequency:
- Priority:

**External System 3: [System Name]**
- Purpose:
- Direction:
- Data exchanged:
- Frequency:
- Priority:

---

## 6. UI/UX REQUIREMENTS

### User Interface Considerations

**Target Platforms:**
- [ ] Web (desktop)
- [ ] Web (mobile responsive)
- [ ] Native mobile app (iOS)
- [ ] Native mobile app (Android)
- [ ] API only (no UI)

**User Experience Principles:**
- [Principle 1]: [Description] (e.g., "Mobile-first design")
- [Principle 2]: [Description] (e.g., "Accessibility WCAG 2.1 AA")
- [Principle 3]: [Description] (e.g., "No more than 3 clicks to complete task")

**Key UI Elements:**
- [Element 1]: [Purpose] (e.g., "Dashboard showing request status")
- [Element 2]: [Purpose] (e.g., "Form for submitting requests")
- [Element 3]: [Purpose] (e.g., "Notification system for updates")

---

## 7. NON-FUNCTIONAL REQUIREMENTS

### Performance, Security, Compliance

**Performance:**
- Page load time: [Target] (e.g., "< 2 seconds")
- API response time: [Target] (e.g., "< 500ms for 95th percentile")
- Concurrent users: [Target] (e.g., "Support 100 simultaneous users")
- Data volume: [Target] (e.g., "Handle 10,000 requests/month")

**Security:**
- Authentication: [Requirement] (e.g., "SSO with Active Directory")
- Authorization: [Requirement] (e.g., "Role-based access control")
- Data encryption: [Requirement] (e.g., "At rest and in transit")
- Audit logging: [Requirement] (e.g., "Track all data changes")

**Compliance:**
- [ ] GDPR (EU data privacy)
- [ ] HIPAA (Healthcare data)
- [ ] PCI-DSS (Payment card data)
- [ ] SOC 2 (Security controls)
- [ ] ISO/IEC 17025 (Calibration lab)
- [ ] [Other]: [Standard name]

**Availability:**
- Uptime target: [Percentage] (e.g., "99.5% uptime")
- RTO (Recovery Time Objective): [Time] (e.g., "< 4 hours")
- RPO (Recovery Point Objective): [Time] (e.g., "< 1 hour of data loss")

---

## 8. ASSUMPTIONS & DEPENDENCIES

### What are we assuming?

**Assumptions:**
- [Assumption 1]: [What we assume is true - needs validation]
- [Assumption 2]: [What we assume is true - needs validation]
- [Assumption 3]: [What we assume is true - needs validation]

**Dependencies:**
- **[Dependency 1]**: [What we depend on, who owns it, target date]
- **[Dependency 2]**: [What we depend on, who owns it, target date]
- **[Dependency 3]**: [What we depend on, who owns it, target date]

**Risks:**
- **[Risk 1]**: [Description, Impact: H/M/L, Mitigation]
- **[Risk 2]**: [Description, Impact: H/M/L, Mitigation]

---

## 9. OUT OF SCOPE

### What we are NOT building

<!-- Be explicit about what's excluded to avoid scope creep -->

**Explicitly Excluded:**
- [Feature X]: [Why it's out of scope]
- [Feature Y]: [Why it's out of scope]
- [Feature Z]: [Why it's out of scope]

**Deferred to Future Phases:**
- [Feature A]: [Why deferred, when might we do it]
- [Feature B]: [Why deferred, when might we do it]

---

## 10. OPEN QUESTIONS

### What do we still need to figure out?

**Technical Questions:**
- [ ] [Question 1]? - Owner: [Name], Due: [Date]
- [ ] [Question 2]? - Owner: [Name], Due: [Date]

**Business Questions:**
- [ ] [Question 1]? - Owner: [Name], Due: [Date]
- [ ] [Question 2]? - Owner: [Name], Due: [Date]

**User Experience Questions:**
- [ ] [Question 1]? - Owner: [Name], Due: [Date]
- [ ] [Question 2]? - Owner: [Name], Due: [Date]

---

## 11. NEXT STEPS

**Validation Needed:**
- [ ] Review with stakeholders
- [ ] Validate assumptions with users
- [ ] Technical feasibility spike
- [ ] Cost estimation

**Ready to Proceed:**
Once validated, use this document to create:
1. **strategy/scope.md** - Use sections 1, 7, 9 for scope boundaries
2. **strategy/requirements.md** - Expand sections 1-6 into detailed requirements
3. **strategy/design.md** - Use section 7 (non-functional) to inform technical decisions

---

## DOCUMENT METADATA

- **Author:** [Name]
- **Created:** [YYYY-MM-DD]
- **Last Updated:** [YYYY-MM-DD]
- **Status:** [Draft / In Review / Approved]
- **Approved By:** [Name, Date]
- **Version:** [1.0]
- **Related Documents:**
  - Business Context: [Link]
  - Problem Statement: [Link]
