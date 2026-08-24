# Jira Epics Index — i-Source One Platform (ISO)

**Project:** i-Source One (ISO)  
**Total Epics:** 53  
**Domains:** 10 (A-J)  
**Priorities:** P0, P1, P2, P3, P0/P2, P0/P4, P3/P4, P4  
**Generated:** 2026-08-24

---

## Overview

This directory contains Jira epic definitions for all 53 modules of the i-Source One SaaS platform. Each epic maps to one module and is decomposed into 6 ticket slices:

1. **CONTRACT** — API schemas, permissions, ADRs
2. **DATA** — Database, migrations, repositories
3. **BE** — Backend implementation (FastAPI, domain model)
4. **FE** — Frontend implementation (React, components)
5. **QA** — Testing and quality assurance
6. **OPS** — Operations, dashboards, runbooks

---

## Epics by Priority

### 🔴 P0 — Critical Foundation (7 epics)

| Epic ID | Module Name | File |
|---------|-------------|------|
| ISO-01 | Authentication and Identity | [ISO_01_EPIC_Authentication_Identity.md](ISO_01_EPIC_Authentication_Identity.md) |
| ISO-02 | Tenant Management | [ISO_02_EPIC_Tenant_Management.md](ISO_02_EPIC_Tenant_Management.md) |
| ISO-03 | Organization Management | [ISO_03_EPIC_Organization_Management.md](ISO_03_EPIC_Organization_Management.md) |
| ISO-04 | User Management | [ISO_04_EPIC_User_Management.md](ISO_04_EPIC_User_Management.md) |
| ISO-05 | Roles, Personas and Groups | [ISO_05_EPIC_Roles_Personas_Groups.md](ISO_05_EPIC_Roles_Personas_Groups.md) |
| ISO-06 | Application Management | [ISO_06_EPIC_Application_Management.md](ISO_06_EPIC_Application_Management.md) |
| ISO-07 | Subscription, Plans and Entitlements | [ISO_07_EPIC_Subscription_Plans_Entitlements.md](ISO_07_EPIC_Subscription_Plans_Entitlements.md) |

---

### 🟠 P1 — Enterprise Data & Knowledge (12 epics)

| Epic ID | Module Name | File |
|---------|-------------|------|
| ISO-12 | Source and Connector Management | [ISO_12_EPIC_Source_Connector_Management.md](ISO_12_EPIC_Source_Connector_Management.md) |
| ISO-13 | Data Pipeline Management | [ISO_13_EPIC_Data_Pipeline_Management.md](ISO_13_EPIC_Data_Pipeline_Management.md) |
| ISO-14 | Lakehouse Management | [ISO_14_EPIC_Lakehouse_Management.md](ISO_14_EPIC_Lakehouse_Management.md) |
| ISO-15 | Data Catalogue | [ISO_15_EPIC_Data_Catalogue.md](ISO_15_EPIC_Data_Catalogue.md) |
| ISO-16 | Data Quality | [ISO_16_EPIC_Data_Quality.md](ISO_16_EPIC_Data_Quality.md) |
| ISO-17 | Data Lineage | [ISO_17_EPIC_Data_Lineage.md](ISO_17_EPIC_Data_Lineage.md) |
| ISO-18 | Master and Reference Data | [ISO_18_EPIC_Master_Reference_Data.md](ISO_18_EPIC_Master_Reference_Data.md) |
| ISO-19 | Knowledge Base Management | [ISO_19_EPIC_Knowledge_Base_Management.md](ISO_19_EPIC_Knowledge_Base_Management.md) |
| ISO-20 | Document Intelligence | [ISO_20_EPIC_Document_Intelligence.md](ISO_20_EPIC_Document_Intelligence.md) |
| ISO-21 | Enterprise Search and Knowledge Explorer | [ISO_21_EPIC_Enterprise_Search_Knowledge_Explorer.md](ISO_21_EPIC_Enterprise_Search_Knowledge_Explorer.md) |
| ISO-22 | Knowledge Graph | [ISO_22_EPIC_Knowledge_Graph.md](ISO_22_EPIC_Knowledge_Graph.md) |
| ISO-23 | Organizational Memory | [ISO_23_EPIC_Organizational_Memory.md](ISO_23_EPIC_Organizational_Memory.md) |

---

### 🟡 P2 — Enterprise Intelligence & Agentic Core (7 epics)

| Epic ID | Module Name | File |
|---------|-------------|------|
| ISO-24 | Enterprise Brain Module | [ISO_24_EPIC_Enterprise_Brain_Module.md](ISO_24_EPIC_Enterprise_Brain_Module.md) |
| ISO-25 | AI Gateway and Model Management | [ISO_25_EPIC_AI_Gateway_Model_Management.md](ISO_25_EPIC_AI_Gateway_Model_Management.md) |
| ISO-26 | Prompt Management | [ISO_26_EPIC_Prompt_Management.md](ISO_26_EPIC_Prompt_Management.md) |
| ISO-27 | Agent Management | [ISO_27_EPIC_Agent_Management.md](ISO_27_EPIC_Agent_Management.md) |
| ISO-28 | Skills and Tool Management | [ISO_28_EPIC_Skills_Tool_Management.md](ISO_28_EPIC_Skills_Tool_Management.md) |
| ISO-29 | Workflow and Orchestration | [ISO_29_EPIC_Workflow_Orchestration.md](ISO_29_EPIC_Workflow_Orchestration.md) |
| ISO-30 | Human Approval Management | [ISO_30_EPIC_Human_Approval_Management.md](ISO_30_EPIC_Human_Approval_Management.md) |

---

### 🔵 P3 — User Experience & Command Centres (11 epics)

| Epic ID | Module Name | File |
|---------|-------------|------|
| ISO-08 | Dashboard Management | [ISO_08_EPIC_Dashboard_Management.md](ISO_08_EPIC_Dashboard_Management.md) |
| ISO-09 | Report Management | [ISO_09_EPIC_Report_Management.md](ISO_09_EPIC_Report_Management.md) |
| ISO-10 | KPI, KRA and Performance Management | [ISO_10_EPIC_KPI_KRA_Performance_Management.md](ISO_10_EPIC_KPI_KRA_Performance_Management.md) |
| ISO-11 | Analytics and Scenario Management | [ISO_11_EPIC_Analytics_Scenario_Management.md](ISO_11_EPIC_Analytics_Scenario_Management.md) |
| ISO-31 | Role Command Centre | [ISO_31_EPIC_Role_Command_Centre.md](ISO_31_EPIC_Role_Command_Centre.md) |
| ISO-32 | Unified Inbox | [ISO_32_EPIC_Unified_Inbox.md](ISO_32_EPIC_Unified_Inbox.md) |
| ISO-33 | Meeting Intelligence | [ISO_33_EPIC_Meeting_Intelligence.md](ISO_33_EPIC_Meeting_Intelligence.md) |
| ISO-34 | Action and Commitment Management | [ISO_34_EPIC_Action_Commitment_Management.md](ISO_34_EPIC_Action_Commitment_Management.md) |
| ISO-35 | Project and Portfolio Management | [ISO_35_EPIC_Project_Portfolio_Management.md](ISO_35_EPIC_Project_Portfolio_Management.md) |
| ISO-36 | Notifications and Alert Intelligence | [ISO_36_EPIC_Notifications_Alert_Intelligence.md](ISO_36_EPIC_Notifications_Alert_Intelligence.md) |
| ISO-37 | Desktop Companion | [ISO_37_EPIC_Desktop_Companion.md](ISO_37_EPIC_Desktop_Companion.md) |

---

### 🟣 P0/P2 — Governance & Control (5 epics)

| Epic ID | Module Name | File |
|---------|-------------|------|
| ISO-38 | Policy Management | [ISO_38_EPIC_Policy_Management.md](ISO_38_EPIC_Policy_Management.md) |
| ISO-39 | Privacy and Consent | [ISO_39_EPIC_Privacy_Consent.md](ISO_39_EPIC_Privacy_Consent.md) |
| ISO-40 | Audit Trail | [ISO_40_EPIC_Audit_Trail.md](ISO_40_EPIC_Audit_Trail.md) |
| ISO-41 | Observability | [ISO_41_EPIC_Observability.md](ISO_41_EPIC_Observability.md) |
| ISO-42 | AI Evaluation and Assurance | [ISO_42_EPIC_AI_Evaluation_Assurance.md](ISO_42_EPIC_AI_Evaluation_Assurance.md) |

---

### 🟢 P0/P4 — Platform Administration & Engineering (8 epics)

| Epic ID | Module Name | File |
|---------|-------------|------|
| ISO-43 | Platform Administration | [ISO_43_EPIC_Platform_Administration.md](ISO_43_EPIC_Platform_Administration.md) |
| ISO-44 | Developer and API Management | [ISO_44_EPIC_Developer_API_Management.md](ISO_44_EPIC_Developer_API_Management.md) |
| ISO-45 | File and Media Management | [ISO_45_EPIC_File_Media_Management.md](ISO_45_EPIC_File_Media_Management.md) |
| ISO-46 | Notification Template Management | [ISO_46_EPIC_Notification_Template_Management.md](ISO_46_EPIC_Notification_Template_Management.md) |
| ISO-47 | Feature Flag and Release Management | [ISO_47_EPIC_Feature_Flag_Release_Management.md](ISO_47_EPIC_Feature_Flag_Release_Management.md) |
| ISO-48 | Support and Feedback | [ISO_48_EPIC_Support_Feedback.md](ISO_48_EPIC_Support_Feedback.md) |
| ISO-49 | Backup, Recovery and Continuity | [ISO_49_EPIC_Backup_Recovery_Continuity.md](ISO_49_EPIC_Backup_Recovery_Continuity.md) |
| ISO-50 | Billing, Payments and Revenue Management | [ISO_50_EPIC_Billing_Payments_Revenue_Management.md](ISO_50_EPIC_Billing_Payments_Revenue_Management.md) |

---

### 🟢 P3/P4 — Domain Experiences (2 epics)

| Epic ID | Module Name | File |
|---------|-------------|------|
| ISO-51 | Department Cockpits | [ISO_51_EPIC_Department_Cockpits.md](ISO_51_EPIC_Department_Cockpits.md) |
| ISO-52 | Product Applications | [ISO_52_EPIC_Product_Applications.md](ISO_52_EPIC_Product_Applications.md) |

---

### ⚫ P4 — Trial & Conversion (1 epic)

| Epic ID | Module Name | File |
|---------|-------------|------|
| ISO-53 | Trial, Evaluation and Conversion Management | [ISO_53_EPIC_Trial_Evaluation_Conversion_Management.md](ISO_53_EPIC_Trial_Evaluation_Conversion_Management.md) |

---

## Ticket Slice Template

Each epic contains 6 user stories following this pattern:

### Story Types by Slice

| Slice | Type | Primary Responsibility | Blockers |
|-------|------|----------------------|----------|
| **CONTRACT** | Technical Task | Architect, Tech Lead | Must close before BE/FE |
| **DATA** | Technical Task | Backend engineer | Must close before BE |
| **BE** | Feature | Backend engineer | Depends on CONTRACT, DATA |
| **FE** | Feature | Frontend engineer | Depends on CONTRACT |
| **QA** | Technical Task | QA engineer | Depends on BE, FE |
| **OPS** | Technical Task | SRE, DevOps | Depends on QA |

---

## Story Key Naming Convention

All story keys follow the pattern: `ISO-{MODULE_ID}-{SLICE_TYPE}`

Examples:
- `ISO-01-CONTRACT` — Authentication module contract
- `ISO-01-DATA` — Authentication module data
- `ISO-01-BE` — Authentication module backend
- `ISO-01-FE` — Authentication module frontend
- `ISO-01-QA` — Authentication module QA
- `ISO-01-OPS` — Authentication module operations

---

## Execution Flow

### Phase 1: Specify (P0 Foundation)
Create Jira epics for P0 modules (01-07) and start CONTRACT work:
- ISO-01-CONTRACT through ISO-07-CONTRACT

### Phase 2: Plan (P0/P1)
Complete DATA definitions and contract stubs for P0, then start P1:
- Modules 01-07: DATA stories
- Modules 12-23: CONTRACT stories

### Phase 3: Act (Core Implementation)
Parallel implementation of P0/P1 with phased P2/P3 planning:
- Backend and frontend implementation across all priority levels
- Contract-first approach unblocks frontend from backend

### Phase 4: Review (Quality Gates)
All QA tickets execute against implementation:
- Integration, E2E, security, performance testing
- Cross-module contract testing
- Multi-tenancy isolation verification

### Phase 5: Close (Operations)
Progressive rollout behind feature flags:
- Monitoring and alerting activation
- Runbook and documentation review
- Post-release verification

---

## Dependencies Between Epics

### Foundation Dependencies
- **ISO-01** (Authentication) required by all modules
- **ISO-02** (Tenant Management) required by all modules
- **ISO-03** (Organization) required by user/role modules
- **ISO-05** (Roles) required by policy modules (ISO-38)

### Data Dependencies
- **ISO-12** (Connectors) required by ISO-13, ISO-14
- **ISO-13** (Pipelines) required by ISO-14, ISO-15
- **ISO-14** (Lakehouse) required by analytics (ISO-08, ISO-11)

### AI/Agentic Dependencies
- **ISO-24** (Brain Module) requires ISO-19 through ISO-23 (Knowledge)
- **ISO-27** (Agents) required by ISO-29, ISO-30, ISO-31
- **ISO-29** (Workflows) required by domain products (ISO-51, ISO-52)

### Governance Dependencies
- **ISO-38** (Policy) gates all high-impact actions
- **ISO-40** (Audit) required for compliance
- **ISO-41** (Observability) required for all operations

---

## How to Use These Epics

### For Jira Setup

1. **Create Epic Issue Type** (if not exists)
   - Jira admin creates "Epic" issue type
   - Configure epic link custom field

2. **Import Epics**
   - Copy each epic key (ISO-01 through ISO-53)
   - Create epic issues in Jira manually, or
   - Use bulk import with JSON (see jira_epics.json)

3. **Create Stories**
   - For each epic, create 6 stories per the template
   - Link stories to epic via epic link field
   - Set story type (Feature, Technical Task)

### For Planning

1. **P0 First:** ISO-01 through ISO-07
2. **P1 Parallel:** ISO-12 through ISO-23
3. **P2 Next:** ISO-24 through ISO-30
4. **P3 & P0/P2 Parallel:** ISO-08-11, ISO-31-42
5. **P0/P4 Continuous:** ISO-43 through ISO-50
6. **P3/P4 & P4:** ISO-51 through ISO-53

### For Team Assignment

Each story should be assigned to a specific person or team:
- **CONTRACT** → Architect or Tech Lead
- **DATA** → Database/Backend engineer
- **BE** → Backend engineer
- **FE** → Frontend engineer
- **QA** → QA engineer or automation specialist
- **OPS** → SRE or DevOps engineer

---

## Integration with GitHub

Each story should link to:
- **Branch:** `feature/iso-{MODULE_ID}` or `feature/iso-{MODULE_ID}-{SLICE_TYPE}`
- **PR:** Points back to story key
- **Commits:** Reference story key (e.g., `ISO-01-CONTRACT: Add OpenAPI spec`)

---

## Acceptance Criteria Pattern

All stories follow this pattern:

```
Given [prerequisite state]
When [action is taken]
Then [expected outcome]

And [additional acceptance criterion]
```

See individual epic files for story-specific criteria.

---

## Definition of Done

All stories use a shared DoD:
- [ ] Code review approved
- [ ] Tests passing (unit, integration, E2E)
- [ ] Type checking passing (TypeScript, mypy)
- [ ] Linting passing
- [ ] Changes documented
- [ ] Related issues linked
- [ ] No unresolved findings from security review

Additional criteria per story type in each epic.

---

## File Structure

```
/01_docs/jira/
├── EPIC_INDEX.md                              (this file)
├── jira_epics.json                            (bulk import)
├── ISO_01_EPIC_Authentication_Identity.md
├── ISO_02_EPIC_Tenant_Management.md
├── ... (51 more epic files) ...
├── ISO_53_EPIC_Trial_Evaluation_Conversion_Management.md
└── TEMPLATES/
    ├── Epic_Template.md
    ├── Story_Template.md
    └── Dependency_Map.md
```

---

## Quick Start

1. **Read this index** to understand epic organization
2. **Pick a priority level** (start with P0)
3. **Open an epic file** (e.g., ISO_01_EPIC_Authentication_Identity.md)
4. **Create Jira stories** using the 6 ticket slices template
5. **Set up story dependencies** per the dependency section
6. **Assign stories** to team members
7. **Link to module spec** in `/01_docs/Modules/`

---

## Reference Documents

- **Module Specifications:** `/01_docs/Modules/README.md`
- **Platform Spec:** `/01_docs/Saas_Module_List/SaaS_ModuleList.md`
- **SPARC Protocol:** Platform spec, Section 6
- **Global Architecture:** Platform spec, Section 5

---

**Generated:** 2026-08-24  
**Project:** i-Source One (ISO)  
**Version:** 1.0
