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
1. **Data Ingestion:** Airflow pipelines extracting from Calsystem (Azure SQL, every 6h) and Odoo (PostgreSQL, daily)
2. **Data Warehouse:** BigQuery with 3 layers - raw (10 priority tables, ~1.4M rows), transformed (staging), and marts (analytics-ready)
3. **Data Transformation:** dbt models creating ServiceItem-centric fact tables with business days TAT calculation
4. **Intelligence Layer:** FastMCP Server exposing 5 core tools (query_service_items, query_financials, calculate_metrics, analyze_operations, get_data_health)
5. **Cross-System Bridge:** dim_sale_items table linking Odoo revenue to Calsystem operations via GUID matching

**Users:**  
- **Primary:** CEO, CFO, COO (strategic decision-makers)
- **Secondary:** Future IRIS product applications (Analytics, Sales, QC, Field)
- **Tertiary:** Data analysts, IT team (platform maintainers)

**Goal:**  
Enable data-driven decision making through conversational AI access to unified operational data, eliminating manual reporting delays and enabling real-time business insights.

**Success Metric:**  
- Data freshness: 5-7 days → <2 hours
- TAT visibility: Manual calculation → Real-time business days
- Executive queries: Impossible → <5 seconds via chat

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
- **Future IRIS Products:** Analytics dashboards, Sales quote generator, QC system, Field mobile app
- **Data Analysts:** Build custom queries and reports using MCP tools
- **IT Team:** Monitor platform health, manage data pipelines

---

## 4. BUSINESS GOALS

**Primary Objective:**  
Create a conversational analytics platform that eliminates manual reporting delays and enables real-time, data-driven decision making for Phoenix Calibration executives.

**Success Metrics:**

**Launch (June 2026):**
- Data freshness: <2 hours for Calsystem data
- Query latency: <5 seconds for summary queries
- Platform uptime: 99.5%
- Initial users: 3 executives trained and active

**3 months (September 2026):**
- Executive satisfaction: >8/10 rating
- Query success rate: >80% answered correctly
- Manual reporting reduced: 75% reduction in IT report requests
- TAT visibility: Real-time business days calculation working

**12 months (June 2027):**
- Decision-making speed: Strategic decisions 5x faster
- Platform adoption: Used daily by all executives
- First IRIS product launched: Analytics dashboard consuming MCP tools
- ROI positive: Platform costs < value of time saved

**ROI:**
- **Benefit:** $400K/year (executive time saved + faster decisions + reduced errors)
- **Cost:** $60K one-time dev + $9K/year ops ($700/mo GCP + $50/mo tools)
- **Payback:** 2 months

---

## 5. FEATURES

### Must-Have (MVP - Core Platform)

**F-001: Unified Data Warehouse (BigQuery)**  
Ingest data from Calsystem (Azure SQL) and Odoo (PostgreSQL) into centralized BigQuery warehouse with 2-hour freshness → Executives can query recent operational data without waiting days.

**F-002: MCP Server (AI Query Interface)**  
Expose 5 core MCP tools (query_service_items, query_financials, calculate_metrics, analyze_operations, get_data_health) → LLMs can answer executive questions in natural language with structured data responses.

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

### Out of Scope (MVP)

- **Web dashboards:** Future IRIS Analytics product, not Core platform
- **Mobile apps:** Future IRIS Field product
- **Real-time streaming:** Batch processing sufficient for MVP (6-hour refresh)
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
- **Refresh rate:** 6 hours Calsystem, 24 hours Odoo (sufficient for MVP)
- **Storage:** us-central1 region (cost optimization)

---

## 7. ASSUMPTIONS & DEPENDENCIES

### Assumptions

**Data & Systems:**
- Calsystem staging database remains stable and accessible during development
- Current schema structure (10 priority tables) won't undergo major changes
- ~1.4M rows across priority tables sufficient for MVP validation
- Incremental load strategy (COALESCE(LastModified, Created)) works reliably

**Team & Skills:**
- Internal team can learn BigQuery/dbt/MCP within 2-week ramp-up
- .NET developers can transition to Python for ETL scripts
- CTO available for architecture decisions and code reviews throughout project

**Users & Adoption:**
- Executives have access to Claude Desktop or can use web-based LLM clients
- CEO/CFO/COO willing to learn conversational query patterns
- Business questions can be answered with available data (no major gaps)

**Infrastructure:**
- GCP project phoenix-analytics-staging remains accessible
- Service accounts and IAM roles already configured remain valid
- Azure SQL staging database stays online for 6-hour sync windows
- Odoo staging instance remains accessible for daily syncs

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
  - Prioritize ruthlessly: Core 5 features only for MVP
  - Use manual scripts before Airflow to save time
  - Skip non-essential tables (focus on 10 priority tables)
  - Weekly progress reviews to catch delays early
- **Fallback:** Push production to July if staging reveals issues

**R-005: Incremental Load Failures**
- **Impact:** Data drift, missed updates, stale analytics
- **Probability:** Medium (30%) - Complex incremental logic
- **Mitigation:**
  - Use proven pattern: COALESCE(LastModified, Created)
  - Add validation queries after each incremental run
  - Keep full-reload scripts as backup
  - Monitor for NULL LastModified edge cases
- **Fallback:** Fall back to daily full reloads if incremental fails

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
|------|------|------|
| Product Owner | Ivan (CTO) | 2026-01-19 |
| Engineering Lead | Ivan (CTO) | 2026-01-19 |
| Business Owner | CEO | 2026-01-19 |

---

## APPENDIX: KEY CONCEPTS

**TAT (Turn Around Time):**  
Business days from equipment received (ServiceItem.ReceiveDate) to certificate approved (CalibrationReport.ApprovedDate). Calculated excluding weekends and 16 Dominican Republic public holidays per year. Target: 8 days → 5.5 days.

**MCP (Model Context Protocol):**  
Standard protocol enabling LLMs to communicate with external data sources through structured tools. Phoenix IRIS implements 5 MCP tools that any LLM client can consume.

**ServiceItem (Central Entity):**  
Each ServiceItem = 1 piece of customer equipment going through calibration workflow. Primary entity for tracking TAT, status, and linking to revenue (via Odoo bridge).

**Bridge Table (dim_sale_items):**  
Links Odoo sale orders to Calsystem service items via GUID matching, enabling cross-system queries like "revenue by service item status" or "profitability by customer."

**Business Days Calculation:**  
Custom BigQuery UDF that calculates working days between two dates, excluding weekends (Saturday/Sunday) and 16 DR public holidays per year. Critical for accurate TAT measurement.

---

**NEXT:** Generate Scope.md using AIris scope prompt (4-6 hours estimated)
