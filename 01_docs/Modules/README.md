# i-Source One SaaS Platform — Module Specifications

**Document:** Complete module catalogue in SPARC methodology  
**Total Modules:** 53  
**Domains:** 10 capability areas  
**Last Updated:** 2026-08-24

---

## Overview

This directory contains individual SPARC-based module specifications extracted from the complete SaaS platform definition. Each module file (`NNN_ModuleName.md`) contains:

- **Catalogue domain** and delivery priority
- **Primary personas** and dependencies
- **Purpose and outcome** statement
- **Scope and functional requirements**
- **Frontend, Backend, and API specifications**
- **SPARC execution protocol** (Specify → Plan → Act → Review → Close)
- **Agent-ready implementation contract** with tickets and DoD
- **Module-specific Definition of Done**

---

## Modules by Delivery Priority

### 🔴 P0 — Critical Foundation (7 modules)
*Must complete before any other work; form the platform nucleus*

| Module | Domain | Personas |
|--------|--------|----------|
| [01. Authentication and Identity](01_Authentication_Identity.md) | A — SaaS Foundation | Platform admin, Security admin |
| [02. Tenant Management](02_Tenant_Management.md) | A — SaaS Foundation | Platform admin, Tenant admin |
| [03. Organization Management](03_Organization_Management.md) | A — SaaS Foundation | Org admin, Tenant admin |
| [04. User Management](04_User_Management.md) | A — SaaS Foundation | Org admin, User admin |
| [05. Roles, Personas and Groups](05_Roles_Personas_Groups.md) | A — SaaS Foundation | Org admin, Security admin |
| [06. Application Management](06_Application_Management.md) | A — SaaS Foundation | App owner, Platform admin |
| [07. Subscription, Plans and Entitlements](07_Subscription_Plans_Entitlements.md) | A — SaaS Foundation | Product owner, Billing admin |

---

### 🟠 P1 — Enterprise Data Foundation (12 modules)
*Enable data ingestion, governance, and knowledge extraction*

| Module | Domain | Personas |
|--------|--------|----------|
| [12. Source and Connector Management](12_Source_Connector_Management.md) | C — Enterprise Data Foundation | Data engineer, Integration lead |
| [13. Data Pipeline Management](13_Data_Pipeline_Management.md) | C — Enterprise Data Foundation | Data engineer, Pipeline lead |
| [14. Lakehouse Management](14_Lakehouse_Management.md) | C — Enterprise Data Foundation | Data architect, Data engineer |
| [15. Data Catalogue](15_Data_Catalogue.md) | C — Enterprise Data Foundation | Data steward, Analyst |
| [16. Data Quality](16_Data_Quality.md) | C — Enterprise Data Foundation | Data quality lead, Data engineer |
| [17. Data Lineage](17_Data_Lineage.md) | C — Enterprise Data Foundation | Data steward, Auditor |
| [18. Master and Reference Data](18_Master_Reference_Data.md) | C — Enterprise Data Foundation | Data steward, Master data admin |
| [19. Knowledge Base Management](19_Knowledge_Base_Management.md) | D — Knowledge and Enterprise Memory | Knowledge manager, Subject matter expert |
| [20. Document Intelligence](20_Document_Intelligence.md) | D — Knowledge and Enterprise Memory | Knowledge analyst, Document processor |
| [21. Enterprise Search and Knowledge Explorer](21_Enterprise_Search_Knowledge_Explorer.md) | D — Knowledge and Enterprise Memory | Knowledge user, Analyst |
| [22. Knowledge Graph](22_Knowledge_Graph.md) | D — Knowledge and Enterprise Memory | Knowledge architect, Data scientist |
| [23. Organizational Memory](23_Organizational_Memory.md) | D — Knowledge and Enterprise Memory | Knowledge lead, Organization admin |

---

### 🟡 P2 — Enterprise Intelligence and Agentic Core (7 modules)
*Add AI reasoning, agent orchestration, and decision intelligence*

| Module | Domain | Personas |
|--------|--------|----------|
| [24. Enterprise Brain Module](24_Enterprise_Brain_Module.md) | E — Enterprise Intelligence and Agentic Operations | AI lead, Decision owner |
| [25. AI Gateway and Model Management](25_AI_Gateway_Model_Management.md) | E — Enterprise Intelligence and Agentic Operations | ML engineer, AI architect |
| [26. Prompt Management](26_Prompt_Management.md) | E — Enterprise Intelligence and Agentic Operations | Prompt engineer, AI specialist |
| [27. Agent Management](27_Agent_Management.md) | E — Enterprise Intelligence and Agentic Operations | Agent developer, Orchestration lead |
| [28. Skills and Tool Management](28_Skills_Tool_Management.md) | E — Enterprise Intelligence and Agentic Operations | Tool developer, Agent architect |
| [29. Workflow and Orchestration](29_Workflow_Orchestration.md) | E — Enterprise Intelligence and Agentic Operations | Workflow designer, Integration lead |
| [30. Human Approval Management](30_Human_Approval_Management.md) | E — Enterprise Intelligence and Agentic Operations | Operations lead, Approver |

---

### 🔵 P3 — User Experience and Command Centres (11 modules)
*Build user-facing dashboards, command centres, and workspaces*

| Module | Domain | Personas |
|--------|--------|----------|
| [08. Dashboard Management](08_Dashboard_Management.md) | B — Dashboards, Reports and Performance | Analyst, Business user |
| [09. Report Management](09_Report_Management.md) | B — Dashboards, Reports and Performance | Report analyst, Operations lead |
| [10. KPI, KRA and Performance Management](10_KPI_KRA_Performance_Management.md) | B — Dashboards, Reports and Performance | Performance manager, Exec |
| [11. Analytics and Scenario Management](11_Analytics_Scenario_Management.md) | B — Dashboards, Reports and Performance | Data scientist, Analyst |
| [31. Role Command Centre](31_Role_Command_Centre.md) | F — User Work and Command Centres | Role owner, Department lead |
| [32. Unified Inbox](32_Unified_Inbox.md) | F — User Work and Command Centres | End user, Workflow participant |
| [33. Meeting Intelligence](33_Meeting_Intelligence.md) | F — User Work and Command Centres | Meeting organizer, Team lead |
| [34. Action and Commitment Management](34_Action_Commitment_Management.md) | F — User Work and Command Centres | Task owner, Team member |
| [35. Project and Portfolio Management](35_Project_Portfolio_Management.md) | F — User Work and Command Centres | Project manager, Portfolio lead |
| [36. Notifications and Alert Intelligence](36_Notifications_Alert_Intelligence.md) | F — User Work and Command Centres | Alert manager, Operations |
| [37. Desktop Companion](37_Desktop_Companion.md) | F — User Work and Command Centres | End user, Knowledge worker |

---

### 🟣 P0/P2 — Governance and Control Foundation (5 modules)
*Implement security, compliance, audit, and observability; P0 core + P2 polish*

| Module | Domain | Personas |
|--------|--------|----------|
| [38. Policy Management](38_Policy_Management.md) | G — Governance, Security and Operations | Security officer, Policy admin |
| [39. Privacy and Consent](39_Privacy_Consent.md) | G — Governance, Security and Operations | Privacy officer, Compliance lead |
| [40. Audit Trail](40_Audit_Trail.md) | G — Governance, Security and Operations | Auditor, Compliance officer |
| [41. Observability](41_Observability.md) | G — Governance, Security and Operations | SRE, Operations engineer |
| [42. AI Evaluation and Assurance](42_AI_Evaluation_Assurance.md) | G — Governance, Security and Operations | AI governance lead, QA lead |

---

### 🟢 P0/P4 — Platform Administration and Engineering (8 modules)
*P0 minimal critical operations; P4 optional enhancements*

| Module | Domain | Personas |
|--------|--------|----------|
| [43. Platform Administration](43_Platform_Administration.md) | H — Platform Administration and Engineering | Platform operator, SRE |
| [44. Developer and API Management](44_Developer_API_Management.md) | H — Platform Administration and Engineering | Developer advocate, API lead |
| [45. File and Media Management](45_File_Media_Management.md) | H — Platform Administration and Engineering | Content manager, Storage admin |
| [46. Notification Template Management](46_Notification_Template_Management.md) | H — Platform Administration and Engineering | Comms admin, Template designer |
| [47. Feature Flag and Release Management](47_Feature_Flag_Release_Management.md) | H — Platform Administration and Engineering | Release manager, DevOps lead |
| [48. Support and Feedback](48_Support_Feedback.md) | H — Platform Administration and Engineering | Support manager, Product manager |
| [49. Backup, Recovery and Continuity](49_Backup_Recovery_Continuity.md) | H — Platform Administration and Engineering | SRE, Disaster recovery lead |
| [50. Billing, Payments and Revenue Management](50_Billing_Payments_Revenue_Management.md) | H — Platform Administration and Engineering | CFO, Billing admin |

---

### 🟢 P3/P4 — Domain Experiences (2 modules)
*Specialized end-user applications; P3 core + P4 enhancements*

| Module | Domain | Personas |
|--------|--------|----------|
| [51. Department Cockpits](51_Department_Cockpits.md) | I — Domain Experiences and Products | Department head, Manager |
| [52. Product Applications](52_Product_Applications.md) | I — Domain Experiences and Products | Product user, Domain specialist |

---

### ⚫ P4 — Trial and Conversion (1 module)
*Evaluation and tenant onboarding flows*

| Module | Domain | Personas |
|--------|--------|----------|
| [53. Trial, Evaluation and Conversion Management](53_Trial_Evaluation_Conversion_Management.md) | J — Trial, Evaluation and Conversion | Product manager, Sales enabler |

---

## SPARC Methodology Reference

Each module follows the **SPARC** execution protocol:

| Stage | Output | Gate |
|-------|--------|------|
| **S — Specify** | Epic/story scope, personas, acceptance criteria, data classification, SLO, traceability | Product owner approval |
| **P — Plan** | Domain model, API contract, UI map, migrations, threat cases, test plan | Checker feasibility sign-off |
| **A — Act** | Frontend, backend, contracts, migrations, tests, telemetry, docs | Maker evidence bundle |
| **R — Review** | Independent correctness, security, accessibility, performance review | Reviewer/approver gate |
| **C — Close** | Progressive release, smoke tests, runbooks, support handoff, production verification | Module DoD pass |

---

## How to Use This Module Library

### For Development Teams
1. **Start with P0** modules to build the platform foundation
2. **Read the "Primary personas" and "Purpose and outcome"** sections first
3. **Follow the SPARC work package breakdown** in each module
4. **Use the "Agent ticket slices"** to decompose into Jira stories
5. **Check the "Definition of Done"** before marking complete

### For Product Managers
- Review **"Scope and functional requirements"** for feature scope
- Understand **"Out of scope"** items to manage stakeholder expectations
- Check **"Initial production SLO objectives"** for commitments

### For Architects
- Study **"Backend specification"** and **"API specification"** for design
- Review **"Global architecture rules"** (see main document section 5)
- Note **"Dependencies"** and cross-module contracts
- Validate **"Lifecycle state machine"** and **"Permission model"**

### For QA and Security
- Use the **"Mandatory UI states"** checklist
- Execute all **"Failure and recovery cases"**
- Validate **"Module-specific Definition of Done"** criteria
- Review **"Agent-ready implementation contract"** permissions

---

## Navigation Tips

- **By Priority:** Use the sections above to find P0-P4 modules
- **By Domain (A-J):** Sort by capability area in the priority tables
- **By Persona:** Find who uses each module in the "Primary personas" field
- **By Dependency:** Check each module's "Dependencies" section

---

## Key Platform Patterns

### State Machines
Every module uses lifecycle states: `Draft → Validating → Active → Suspended|Degraded → Restored → Archived`

### Permission Model
- `module:read` — view authorized records
- `module:create` — create drafts
- `module:update` — edit drafts/versions
- `module:execute` — run actions
- `module:approve` — approve governed actions
- `module:admin` — configure module policies

### Events
All modules emit versioned domain events through a transactional outbox:
- Format: `isource.{module}.{action}.v{N}`
- Include: event_id, tenant_id, actor, resource, occurred_at, correlation_id

### API Response
Standard JSON envelope:
```json
{
  "data": {},
  "meta": { "request_id", "tenant_id", "version", "next_cursor" },
  "errors": []
}
```

---

## Integration Points

- **Gateway:** All requests tenant-scoped and policy-checked
- **Transactional Outbox:** Events published durably with PostgreSQL
- **Keycloak:** OIDC/SAML identity provider
- **Casbin:** RBAC/ABAC policy engine
- **PostgreSQL:** Transactional source of truth
- **Redis:** Bounded caches, locks, rate limits
- **OpenTelemetry:** Distributed tracing and metrics
- **Vault:** Secrets management

---

## Version and Governance

- **Document Version:** 2.0 (architecture-audited, agent-execution enhanced)
- **Date:** 2026-08-24
- **Governance Model:** Maker → Checker → Reviewer → Approver
- **Delivery Model:** Protected branches, feature flags, progressive rollout

---

## Getting Help

Refer to the main platform specification document for:
- Section 4: Repository and agent boundaries
- Section 5: Global architecture rules
- Section 6: SPARC execution protocol
- Section 7: Shared API and event conventions
- Section 8-18: Detailed architecture guidance

---

*Generated from: `/Users/yogesh/1_Code/Personal/saas_foundation/01_docs/Saas_Module_List/SaaS_ModuleList.md`*
