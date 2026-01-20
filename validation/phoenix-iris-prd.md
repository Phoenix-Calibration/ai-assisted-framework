# PRODUCT REQUIREMENTS DOCUMENT (PRD)

> **Purpose:** Foundation document for Phoenix IRIS Core Platform development.  
> **Time to complete:** 3 hours (discovery + documentation)  
> **Next step:** Create Scope.md → Requirements.md → Design.md (in that order)

---

## METADATA

- **Project Name:** Phoenix IRIS (Intelligent Real-time Insight System)
- **What is IRIS:** Core data and intelligence engine that powers the IRIS product suite (Analytics, Sales, QC, Field)
- **This Repository:** Backend platform only - data warehouse + MCP tools (no UIs)
- **Author:** Ivan, CTO - Phoenix Calibration
- **Date:** 2026-01-19
- **Status:** Approved
- **Version:** 1.0 (AIris Framework)

---

## 1. EXECUTIVE SUMMARY

**Problem:**  
Phoenix Calibration operates with operational data siloed across two disconnected systems (Calsystem on Azure SQL + Odoo ERP). Executive decision-making relies on manual data extraction taking 5-7 days, preventing timely strategic decisions and real-time operational visibility.

**Solution:**  
Build Phoenix IRIS Core Platform - the foundational backend that unifies operational data in BigQuery and exposes it through MCP (Model Context Protocol) tools. This core platform enables conversational analytics through any LLM client (Claude, GPT, Gemini) and serves as the data/intelligence layer for future IRIS products (Analytics dashboards, Sales tools, QC systems, Field apps).

**Scope of This Project:**  
Core platform ONLY (data warehouse + MCP server). Product UIs (dashboards, mobile apps) are separate future projects that will consume this platform.

**Key Components:**
1. **Data Ingestion:** Daily batch sync from Calsystem (Azure SQL) and Odoo (PostgreSQL)
2. **Data Warehouse:** BigQuery with 3 layers - raw (10 priority tables, ~1.4M rows), transformed (staging), and marts (analytics-ready)
3. **Data Transformation:** dbt models creating ServiceItem-centric fact tables with business days TAT calculation
4. **Intelligence Layer:** FastMCP Server exposing 6 core tools (query_service_items, query_calibrations, query_financials, calculate_metrics, analyze_operations, get_data_health)
5. **Cross-System Bridge:** dim_sale_items table linking Odoo revenue to Calsystem operations via GUID matching

**Users:**  
- **Primary:** CEO, CFO, COO (strategic decision-makers)
- **Secondary:** Future IRIS product applications (Analytics, Sales, QC, Field)
- **Tertiary:** Data analysts, IT team (platform maintainers)

**Goal:**  
Transform executive decision-making from manual, delayed reporting to self-service analytics - enabling 250+ monthly queries with 90% success rate, improving TAT compliance to 85%, and contributing to 8% revenue per employee growth.

**Success Metrics:**  
- **Platform success:** 250+ queries/month @ 90% success (Month 3)
- **Operational impact:** 85% TAT compliance (Month 6)
- **Business growth:** +8% revenue per employee (Year 1)
- **Technical foundation:** Daily data refresh, <5s query latency, 99.5% uptime

**Timeline:**  
- Staging functional: End of April 2026 (~3.5 months)
- Production launch: Early June 2026 (~4.5 months)

**Budget:**  
- Dev cost: Internal team (no external contractors)
- GCP ops: ~$25/month staging + ~$700/month production

---

## 2. PROBLEM

### Current Situation

Phoenix Calibration manages ~600K service items and ~500K calibrations across two isolated systems. Calsystem (Azure SQL) tracks laboratory operations while Odoo (PostgreSQL) manages sales and accounting. These systems don't communicate, forcing executives to request manual data extractions that take 5-7 days to compile.

**Critical pain points:**
- CEO cannot answer board questions without multi-day delays
- CFO spends 10+ days on month-end close due to manual reconciliation
- COO discovers operational bottlenecks only after customer complaints
- Turn Around Time (TAT) calculations require manual spreadsheet work
- No cross-system visibility (can't link revenue to service item status)

The company makes strategic decisions based on intuition rather than data, missing opportunities and reacting to problems instead of preventing them.

### Impact

| Type | Current State | Annual Cost |
|------|---------------|-------------|
| Executive time wasted | 40+ hours/week searching for data | $156K/year |
| Late decision-making | 5-7 day delays on critical questions | $80K lost opportunities |
| Manual reporting | 10-day month-end close | $45K/year overhead |
| Missed TAT targets | Cannot track real-time | $120K customer dissatisfaction |

**Total estimated cost of inaction:** ~$400K/year

### If We Don't Act

- **3-6 months:** Continue missing market opportunities due to slow decision cycles. Executives frustrated by inability to access their own data.
- **6-12 months:** Competitors with better data systems gain strategic advantage. Customer satisfaction declines due to poor TAT visibility.
- **1-2 years:** Business growth limited by inability to scale operations without real-time insights. Regulatory audits become riskier without data governance.

---

## 3. USERS

### Primary User 1: CEO
- **Role:** Chief Executive Officer
- **Current workflow:** Requests manual reports from IT → Waits 5-7 days → Makes decisions on stale data
- **Pain points:** 
  1. Cannot answer board questions in real-time
  2. No visibility into operational KPIs without requesting reports
  3. Strategic planning based on outdated information
- **Goals:** 
  - Ask business questions in natural language and get instant answers
  - Monitor company performance in real-time
  - Make data-driven strategic decisions confidently

### Primary User 2: CFO
- **Role:** Chief Financial Officer
- **Current workflow:** Manually reconciles Odoo invoices with Calsystem services → 10-day month-end close
- **Pain points:**
  1. Revenue data disconnected from operational data
  2. Cannot track profitability per service item
  3. Month-end close takes too long
- **Goals:**
  - Link revenue to service delivery automatically
  - Close books faster with automated reconciliation
  - Analyze financial trends by customer/service type

### Primary User 3: COO
- **Role:** Chief Operating Officer
- **Current workflow:** Discovers bottlenecks after customer complaints → Requests TAT reports → Investigates manually
- **Pain points:**
  1. No real-time TAT visibility
  2. Cannot predict capacity issues before they happen
  3. Reactive problem-solving instead of proactive management
- **Goals:**
  - Monitor TAT in real-time (business days, not calendar days)
  - Identify bottlenecks before customers complain
  - Optimize technician utilization based on data

### Secondary Users

**Future IRIS Products (Post-MVP):**
Phoenix IRIS Core Platform will serve as the backend for future products:
- **IRIS Analytics:** Executive dashboards (web app) consuming MCP tools
- **IRIS Sales:** AI quote generator for sales team  
- **IRIS QC:** Quality control system for technicians
- **IRIS Field:** Mobile app for field operations

**Data Analysts:**
- Build custom queries using MCP tools directly
- Validate data quality and completeness  
- Support executive ad-hoc analysis requests

**IT Team:**
- Monitor platform health (BigQuery costs, pipeline status)
- Manage data ingestion schedules
- Troubleshoot integration issues

---

## 4. BUSINESS GOALS

### North Star Metrics

**1. Platform Success (Direct Indicator):**  
**Executive Query Volume:** 0 → 250+ queries/month by Month 3  
**with Success Rate:** N/A → 90%+ maintained

Combined metric measuring platform adoption AND quality:

**Volume (Adoption):**
- **Current state:** 0 queries/month (no self-service platform exists)
- **Month 1 (July 2026):** 50 queries/month (exploration and learning phase)
- **Month 3 (September 2026):** 250 queries/month (daily habit established)
- **Month 6 (December 2026):** 500 queries/month (operational dependency)

**Success Rate (Quality):**
- **Definition:** Query answered successfully with valid citations, no errors or escalations
- **Target:** 90% of all queries result in successful answers
- **Quality gate:** Prevents inflating volume with failed or repeated queries

**Why this is our direct platform success indicator:**
- **Auto-measured:** Every MCP tool call automatically logged (user_id, timestamp, tool, outcome, citations) - no manual IT tracking required
- **If platform works:** Query volume grows steadily + success rate remains high (>90%)
- **If platform fails:** Volume drops OR success rate tanks (alerts triggered)
- **Reflects multi-dimensional success:** Adoption × Reliability × Accuracy × Usefulness

**Measurement (fully automated):**
```python
# MCP server auto-logs every request:
monthly_queries = count(user_id IN [CEO, CFO, COO], month = current)
successful_queries = count(outcome = 'success', month = current)  
success_rate = successful_queries / monthly_queries

# Dashboard tracks:
# - Query volume trend (weekly/monthly)
# - Success rate percentage
# - Query breakdown by executive and tool type
# - Alert if success rate <85% for 2 consecutive weeks
```

**What 250 queries/month means:**
- CEO: ~100 queries (strategic questions, board prep, market analysis)
- CFO: ~80 queries (financial reconciliation, margin analysis, collections)
- COO: ~70 queries (TAT monitoring, bottleneck identification, capacity planning)
- Average: 12 queries per executive per week (real daily usage)

---

**2. Operational Excellence:**  
**TAT Compliance Rate:** Unknown → 85% by Month 6

Percentage of service items meeting or exceeding their service-specific target TAT (measured in business days).

**Current state:** TAT compliance completely unmeasured - data calculated manually weeks after completion in spreadsheets. No real-time visibility into performance, cannot proactively identify bottlenecks.

**With IRIS Platform:** Real-time TAT tracking by service type enables COO to identify and resolve bottlenecks before they impact customers.

**Why this matters:**
- **COO gains proactive management capability** instead of reactive firefighting
- **Customer satisfaction improves** through reliable on-time delivery
- **Competitive advantage** via faster turnaround than industry standard
- **Platform validates core value:** Making invisible operational data visible and actionable

**TAT Compliance Calculation:**
```
For each service type, define target TAT (business days):
- Standard Calibration: 5 days
- Complex Calibration: 8 days  
- Repair Service: 10 days
- On-site Service: Variable (excluded from lab metrics)

Service Type Compliance = (Items meeting target) / (Total items completed)

Weighted TAT Compliance Rate = Σ(Service_Compliance × Service_Volume) / Total_Volume
```

**Measurement timeline:**
- **Baseline (Staging - Months 1-2):** Establish current performance (~70-75% estimated)
- **Month 3 (First production data):** Track trend and identify improvement areas
- **Month 6:** Target 85% compliance rate achieved
- **Month 12:** Target 90% compliance rate (stretch goal)

**Data source:** BigQuery `mart_services_items_summary_breakdown` table
- Field: `demora_turnaround` (business days calculated)
- Mapping: `equipment_type` → TAT target lookup
- Filter: `release_status = 'Delivered'` AND `cal_location != 'On-Site Calibration'`

---

**3. Strategic Growth:**  
**Revenue Per Employee:** $190K → $205K (+8%) by Year 1

Company-wide efficiency metric reflecting improved decision-making and operational excellence enabled by IRIS Platform.

**Current baseline (Q1 2026):** $190K revenue per employee

**IRIS Platform contribution path:**
```
Better Data Visibility (IRIS)
  ↓
Faster Executive Decisions
  ↓
Higher TAT Compliance → Happier Customers → Better Retention + Referrals
  ↓
Operational Efficiency → Same Team Serves More Customers
  ↓
Increased Revenue Per Employee
```

**Target trajectory:**
- **Q2 2026 (partial):** Platform launches mid-quarter
- **Q4 2026:** $197K (+4% partial year impact)
- **Q4 2027:** $205K (+8% full year impact)

**Why this metric matters:**
- **Aligns with CEO strategic vision** and board expectations
- **Reflects compound effects** of data-driven decision making
- **Measurable business outcome** beyond pure technology metrics
- **Long-term sustainability indicator** for company growth

**Measurement:** Quarterly financial reports (Revenue ÷ Employee Count)

---

### Primary Objective

Create a conversational analytics platform that eliminates manual reporting delays and enables real-time, data-driven decision making for Phoenix Calibration executives.

---

### Success Metrics by Phase

**Launch (June 2026):**
- Data freshness: Daily refresh (24 hours)
- Query latency: <5 seconds for summary queries (p95)
- Platform uptime: 99.5% availability
- Initial users: 3 executives trained and actively using platform

**3 months (September 2026):**
- Executive satisfaction: >8/10 rating
- Manual reporting reduced: 75% reduction in manual data extraction requests
- TAT visibility: Real-time business days calculation operational
- Platform success metrics: 250+ queries/month @ 90% success rate

**12 months (June 2027):**
- Decision-making speed: Strategic decisions 5x faster (hours vs days)
- Platform adoption: Used daily by all executives (habit formed)
- First IRIS product launched: Analytics dashboard consuming MCP tools
- ROI validated: Platform costs < documented value of time saved
- Data freshness evolution: Evaluate moving to hourly refresh based on usage patterns

---

### ROI Analysis

**Annual Benefits:** $400K/year
- Executive time saved: $156K/year (40+ hours/week → self-service)
- Faster decision-making: $80K/year (reduced opportunity cost)
- Reduced manual reporting overhead: $45K/year (CFO month-end close)
- Improved TAT compliance: $120K/year (customer satisfaction + retention)

**Costs:**
- **Development:** $60K one-time (internal team, no contractors)
- **Operations:** $9K/year ($700/mo GCP + $50/mo tools)

**Payback Period:** 2 months (conservative)

**3-Year NPV:** $1.14M ($400K × 3 years - $87K total costs)

---

## 5. FEATURES

### Must-Have (MVP - Core Platform)

**F-001: Unified Data Warehouse (BigQuery)**  
Ingest data from Calsystem (Azure SQL) and Odoo (PostgreSQL) into centralized BigQuery warehouse with daily refresh → Executives can query recent operational data without waiting days.

**F-002: MCP Server (AI Query Interface)**

Expose 6 core MCP tools enabling executives to query operational data through natural language (via any LLM client: Claude, GPT, Gemini) with optional verifiable sources and domain-accurate interpretations.

**Core Tools:**

| Tool | Purpose | Business Value |
|------|---------|----------------|
| **query_service_items** ⭐ | TAT tracking, workflow status, equipment lookup | "Show me overdue services" → Instant answer |
| **query_calibrations** | Calibration quality details, OOT rates, technician performance | "What's our OOT rate this month?" → Quality metrics |
| **query_financials** | Revenue analysis, invoicing, collections | "Outstanding AR by customer?" → Real-time data |
| **calculate_metrics** | TAT compliance, productivity KPIs | "TAT compliance last quarter?" → Board-ready metrics |
| **analyze_operations** | Bottleneck detection, capacity planning | "Where are TAT delays happening?" → Actionable insights |
| **get_data_health** | Data freshness, completeness monitoring | "Is my data current?" → Trust validation |

**Why 6 tools (not 15+):** Research shows fewer tools = 37-70% faster AI decision-making and higher accuracy. One flexible tool beats many specific tools.

---

**Key Capabilities:**

**1. Optional Citation-Grade Responses (ISO 17025 Compliance)**
- **What:** AI answers can include verifiable source references when requested by user
- **Why:** Executives choose when they need audit trails (board prep) vs quick exploratory queries
- **Example with citations:** "TAT is 6.2 days | Source: BigQuery mart_services_items (342 services, Jan 1-20)"
- **Example without citations:** "TAT is 6.2 days"
- **How to request:** User says "Show me TAT with sources" or tool parameter `include_citations=true`
- **Value:** Flexibility - quick answers by default, verifiable sources on-demand for high-stakes decisions

**2. Business Logic Guardrails (Prevent AI Hallucinations)**
- **What:** Hard-coded domain rules prevent incorrect interpretations
- **Why:** Generic AI doesn't understand Phoenix-specific business context
- **Critical Rules:**
  - TAT calculations auto-exclude on-site services (different SLAs)
  - Zero-cost services report as "Pricing Pending" (not "Free")
  - Incomplete data communicated transparently (~70% invoice linkage)
  - OOT Rate formula standardized: COUNT(as_found='Out of tolerance') / Total × 100
- **Value:** Accurate answers aligned with 23 years Phoenix operational knowledge

**3. Cross-System Visibility (Odoo ↔ Calsystem Bridge)**
- **What:** Tools automatically join financial (Odoo) + operational (Calsystem) data
- **Why:** Executives need unified view (revenue + service status) in single query
- **Example:** "Revenue by service status?" → Combines both systems seamlessly
- **Value:** No more manual reconciliation or requesting IT to merge data

---

**Executive Capabilities Enabled:**

**CEO Can:**
- Answer board questions instantly (not 5-7 day wait for reports)
- Request source citations only for board presentations (optional verification)
- Track strategic KPIs in real-time (TAT trends, revenue growth)

**CFO Can:**
- Reconcile Odoo invoices with Calsystem services automatically
- Analyze revenue patterns by customer/service type
- Close books faster (no manual data extraction)

**COO Can:**
- Identify TAT bottlenecks proactively (before customer complaints)
- Monitor technician utilization and capacity
- Track calibration quality metrics (OOT rates by product/technician)
- Make data-driven operational decisions daily

---

**Trade-offs Accepted (MVP Scope):**

⚠️ **Data Freshness:** Daily refresh (24 hours), not real-time  
- **Why MVP:** Sufficient for strategic decisions; hourly refresh evaluated in Phase 3

⚠️ **Query Complexity:** 6 tools cover 80-95% use cases  
- **Why MVP:** Edge cases handled through filter combinations; acceptable for MVP validation

⚠️ **Business Rules:** Hard-coded in tool logic (not configurable UI)  
- **Why MVP:** Faster to build; rule engine considered for Phase 2 if needed

⚠️ **Citations:** Optional (not enforced), requires explicit request  
- **Why MVP:** Performance optimization - citations add ~50ms latency; users choose when needed

---

**Success Criteria:**
- 250+ executive queries/month by Month 3 (platform adoption)
- 90%+ success rate (accurate, cited answers)
- <5 second response time p95 (executive expectations)
- Zero manual IT intervention for 95%+ of queries
- Citations used in <30% of queries (exploratory queries dominate)

**Rationale:** MCP tools are the CORE of Phoenix IRIS platform - enabling conversational analytics that eliminates 5-7 day report delays and empowers executives with self-service data access. Future IRIS products (Analytics, Sales, QC, Field) will consume these same tools.

**Technical Details:** Full MCP tool specifications, schemas, and SQL implementations documented in Design.md Section 7.

---

**F-003: ServiceItem-Centric Data Model**  
Transform raw data into analytics-ready fact tables with ServiceItem as central entity and business days TAT calculation → Accurate TAT tracking and workflow visibility.

**F-004: Cross-System Bridge (Odoo ↔ Calsystem)**  
Create dim_sale_items bridge table linking Odoo sale orders to Calsystem service items via GUID → Revenue can be tracked by service item status.

**F-005: Data Quality Validation**  
Implement automated data quality checks (freshness, completeness, consistency) exposed via get_data_health() tool → Trust in data accuracy before making decisions.

### Future (Post-MVP)

**Phase 2: Product Applications**
- IRIS Analytics: Executive dashboards (web application)
- IRIS Sales: AI-powered quote generation
- IRIS QC: Intelligent quality control system
- IRIS Field: Mobile field operations app

**Phase 3: Advanced Features**
- Real-time alerts (Slack/email notifications)
- Predictive analytics (forecast TAT, capacity planning)
- Multi-tenant SaaS (support franchise labs)
- Enhanced data freshness (hourly or sub-hourly refresh as usage patterns demand)

### Out of Scope (MVP)

- **Web dashboards:** Future IRIS Analytics product, not Core platform
- **Mobile apps:** Future IRIS Field product
- **Real-time streaming:** Batch processing sufficient for MVP (daily refresh)
- **Historical migration >2 years:** Only recent data for MVP validation
- **Custom ML models:** Use existing BigQuery ML capabilities only

---

## 6. CONSTRAINTS

**Budget:**  
- **Total:** $69K year 1 = $60K dev (internal team) + $9K ops/year
- **No external contractors:** Use existing .NET/Python developers
- **GCP costs:** $25/mo staging + $700/mo production (BigQuery + Composer)

**Timeline:**  
- **Staging functional:** End April 2026 (3.5 months from now)
- **Production launch:** Early June 2026 (4.5 months from now)
- **MVP validation:** 2-3 weeks in staging before production deployment

**Team:**  
- **Available:** .NET Developer Sr., .NET Developer Jr., Odoo Developer, QA, IT Infrastructure
- **Skills:** Python, SQL, .NET, Odoo integration
- **Gaps:** BigQuery/dbt experience (learning on the job), MCP protocol (new)
- **Leadership:** CTO (Ivan) leads architecture and technical decisions

**Technical:**  
- **Must use:** GCP BigQuery (data warehouse), FastMCP (MCP server), Python (ETL scripts), dbt (transformations)
- **Must integrate:** Calsystem (Azure SQL via pyodbc), Odoo (PostgreSQL via odoorpc)
- **Cannot use:** Cloud Composer initially (too expensive for MVP - use manual scripts first)
- **Must comply:** ISO 17025 (lab compliance), A2LA audit requirements (dev/prod separation)

**Data:**  
- **Priority tables:** 10 core tables (~1.4M rows total)
- **Largest table:** ServiceItem (400K rows, central entity)
- **Refresh rate:** Daily (24 hours) for MVP - Calsystem and Odoo synced nightly
- **Storage:** us-central1 region (cost optimization)

---

## 7. ASSUMPTIONS & DEPENDENCIES

### Assumptions

**Data & Systems:**
- Calsystem staging database remains stable and accessible during development
- Current schema structure (10 priority tables) won't undergo major changes
- ~1.4M rows across priority tables sufficient for MVP validation
- Daily batch sync sufficient for executive decision-making (no real-time requirement for MVP)

**Team & Skills:**
- Internal team can learn BigQuery/dbt/MCP within 2-week ramp-up
- .NET developers can transition to Python for ETL scripts
- CTO available for architecture decisions and code reviews throughout project

**Users & Adoption:**
- Executives have access to Claude Desktop or can use web-based LLM clients
- CEO/CFO/COO willing to learn conversational query patterns
- Business questions can be answered with available data (no major gaps)
- Daily data freshness acceptable for strategic decision-making

**Infrastructure:**
- GCP project phoenix-analytics-staging remains accessible
- Service accounts and IAM roles already configured remain valid
- Azure SQL staging database stays online for nightly sync windows
- Odoo staging instance remains accessible for nightly syncs

### Dependencies

**Already Completed (Green):**
- ✅ GCP staging environment provisioned (TASK-002A)
- ✅ Service accounts created with correct permissions
- ✅ Calsystem schema extracted and validated (TASK-005)
- ✅ Odoo schema extracted and validated (TASK-006)
- ✅ Connection to calsystem_staging verified (2025-12-28)

**External Dependencies (Critical Path):**
- **Azure SQL access:** Must remain stable; downtime blocks ingestion
- **Odoo API access:** Required for daily financial data sync
- **GCP quota limits:** BigQuery slots and storage must not be exceeded
- **Secret Manager:** Credentials storage must be operational

**Internal Dependencies:**
- **Table prioritization:** Must complete ServiceItem (400K rows) before dependent tables
- **Business days UDF:** Required before TAT calculations can work
- **Bridge table (dim_sale_items):** Required before cross-system queries work
- **dbt models:** Raw layer must complete before transformed layer starts

**Knowledge Dependencies:**
- Team needs 2-week learning period for BigQuery best practices
- dbt documentation review required before model development
- FastMCP tutorial completion before MCP server development
- MCP protocol understanding before tool design

---

## 8. RISKS & MITIGATIONS

### High Risk

**R-001: Team Lacks BigQuery/dbt Experience**
- **Impact:** Development delays, poor performance, wrong data models
- **Probability:** High (80%) - New technology stack for team
- **Mitigation:**
  - 2-week learning sprint before Sprint 1 starts
  - Start with simple tables (Provider, Customer) to learn patterns
  - Code reviews with CTO on all BigQuery/dbt work
  - Follow BigQuery best practices documentation religiously
  - Use AI assistants (Claude/ChatGPT) for code reviews
- **Fallback:** Hire GCP consultant for 1-week knowledge transfer if blocked

**R-002: Data Quality Issues in Source Systems**
- **Impact:** Incorrect analytics, lost trust in platform
- **Probability:** Medium (50%) - Legacy systems with known gaps
- **Mitigation:**
  - Implement get_data_health() MCP tool for continuous monitoring
  - Add data validation queries after each ingestion
  - Document known data quirks in Design.md
  - Set expectations with executives: "data is as good as source systems"
  - Phase 1: Validate with small dataset before full load
- **Fallback:** Manual data correction scripts for critical issues

### Medium Risk

**R-003: MCP Protocol Adoption Uncertainty**
- **Impact:** LLM clients may not support MCP well, limiting usability
- **Probability:** Medium (40%) - MCP is relatively new protocol
- **Mitigation:**
  - Test with Claude Desktop first (known MCP support)
  - Design tools to also work via REST API (fallback)
  - Keep tool interfaces simple and standard-compliant
  - Monitor Anthropic/OpenAI MCP announcements
- **Fallback:** Build simple REST wrapper if MCP adoption fails

**R-004: Timeline Pressure (April/June Deadlines)**
- **Impact:** Cut corners on quality, incomplete MVP
- **Probability:** Medium (40%) - Aggressive timeline for new stack
- **Mitigation:**
  - Prioritize ruthlessly: Core 6 features only for MVP
  - Use manual scripts before Airflow to save time
  - Skip non-essential tables (focus on 10 priority tables)
  - Weekly progress reviews to catch delays early
- **Fallback:** Push production to July if staging reveals issues

**R-005: Incremental Load Failures**
- **Impact:** Data drift, missed updates, stale analytics
- **Probability:** Medium (30%) - Complex incremental logic
- **Mitigation:**
  - Start with daily full reloads for MVP simplicity
  - Add incremental load optimization post-launch
  - Monitor for data freshness via get_data_health() tool
  - Set clear expectations: daily refresh, not real-time
- **Fallback:** Continue daily full reloads if incremental unnecessary for MVP

### Low Risk

**R-006: GCP Cost Overruns**
- **Impact:** Budget exceeded, CFO unhappy
- **Probability:** Low (20%) - Predictable pricing model
- **Mitigation:**
  - Set up billing alerts at $500/month threshold
  - Monitor BigQuery query costs via _meta.bigquery_cost_usd
  - Use partitioned tables and clustering for cost optimization
  - Review costs weekly in Sprint 1
- **Fallback:** Optimize queries or reduce data retention if costs spike

**R-007: Executive Adoption Resistance**
- **Impact:** Platform unused, ROI not realized
- **Probability:** Low (15%) - Executives already bought in
- **Mitigation:**
  - Train executives personally (CTO-led sessions)
  - Provide query examples library
  - Quick wins in first week (simple queries that work)
  - Regular check-ins to address frustrations
- **Fallback:** Build simpler web dashboard if chat interface too complex

---

## 9. NEXT STEPS

### Approval Checklist
- [x] Stakeholders approved (CTO decision, executive buy-in)
- [x] Users validated problem/solution (executives confirmed pain points)
- [x] Technical feasibility confirmed (schemas extracted, GCP tested)
- [x] Budget approved (internal team + GCP costs acceptable)
- [x] Timeline agreed (April staging, June production realistic)
- [x] Assumptions documented and validated
- [x] Risks identified with mitigation plans

### Create Strategy Documents (AIris Framework)

**Using AIris methodology - constraint-first approach:**

1. **Scope.md** (4-6h): 
   - Define project boundaries and success metrics
   - Document stakeholders and constraints
   - Set clear in/out of scope boundaries
   - Establish SLOs and quality gates

2. **Requirements.md** (6-10h): 
   - Detail functional requirements by feature
   - Write user stories with acceptance criteria
   - Document business rules and data entities
   - Specify integration requirements

3. **Design.md** (6-10h): 
   - **CRITICAL:** Document technical architecture FIRST
   - Define technology stack decisions (GCP, BigQuery, FastMCP)
   - Write Architecture Decision Records (ADRs)
   - Specify non-functional requirements (performance, security)
   - **This ensures AI respects our constraints when generating code**

4. **Tracker.md** (1-2h):
   - AI generates complete task breakdown from strategic docs
   - Task dependencies and priorities calculated
   - Execution roadmap created

5. **Development Sessions**:
   - Session-based workflow (ToDo → Work → Handoff)
   - Context preserved across multiple development cycles

---

## 10. APPROVAL

| Role | Name | Date |
|------|------|------------|
| Product Owner | Ivan (CTO) | 2026-01-19 |
| Engineering Lead | Ivan (CTO) | 2026-01-19 |
| Business Owner | CEO | 2026-01-19 |

---

## APPENDIX: KEY CONCEPTS

**TAT (Turn Around Time):**  
Business days from equipment received (ServiceItem.ReceiveDate) to certificate approved (CalibrationReport.ApprovedDate). Calculated excluding weekends and 16 Dominican Republic public holidays per year. Target: 8 days → 5.5 days.

**MCP (Model Context Protocol):**  
Standard protocol enabling LLMs to communicate with external data sources through structured tools. Phoenix IRIS implements 6 MCP tools that any LLM client can consume.

**ServiceItem (Central Entity):**  
Each ServiceItem = 1 piece of customer equipment going through calibration workflow. Primary entity for tracking TAT, status, and linking to revenue (via Odoo bridge).

**Bridge Table (dim_sale_items):**  
Links Odoo sale orders to Calsystem service items via GUID matching, enabling cross-system queries like "revenue by service item status" or "profitability by customer."

**Business Days Calculation:**  
Custom BigQuery UDF that calculates working days between two dates, excluding weekends (Saturday/Sunday) and 16 DR public holidays per year. Critical for accurate TAT measurement.

---

**NEXT:** Generate Scope.md using AIris scope prompt (4-6 hours estimated)
