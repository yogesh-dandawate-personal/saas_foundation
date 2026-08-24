# Jira Epics for i-Source One Platform

**Project:** i-Source One (ISO)  
**Total Epics:** 53  
**Date Generated:** 2026-08-24  
**Status:** Ready for Jira import

---

## 📋 Contents

This directory contains complete Jira epic definitions for all 53 modules of the i-Source One SaaS platform, organized by delivery priority and domain.

### Files in This Directory

| File | Purpose |
|------|---------|
| **EPIC_INDEX.md** | Master index of all 53 epics organized by priority |
| **jira_epics.json** | Bulk import file for Jira (JSON format) |
| **README.md** | This file — overview and usage guide |
| **ISO_01_EPIC_*.md** through **ISO_53_EPIC_*.md** | Individual epic definitions (53 files) |

---

## 🎯 Quick Start

### Option 1: Manual Creation in Jira
1. Read **EPIC_INDEX.md** to understand the structure
2. Open an individual epic file (e.g., ISO_01_EPIC_Authentication_Identity.md)
3. Create an Issue in Jira with type "Epic"
4. Copy summary, description, and links from the epic file
5. Repeat for all 53 epics

### Option 2: Bulk Import (Recommended)
1. Use Jira's **Import Issues** feature (Admin → System → Import Issues)
2. Upload **jira_epics.json**
3. Map fields and import
4. Verify all 53 epics created successfully

### Option 3: API Import
Use Jira REST API to bulk create epics:
```bash
curl -X POST https://your-jira.atlassian.net/rest/api/2/issue/bulk \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d @jira_epics.json
```

---

## 📊 Epic Summary

### By Priority

| Priority | Count | Purpose |
|----------|-------|---------|
| **P0** | 7 | Critical platform foundation |
| **P1** | 12 | Enterprise data and knowledge |
| **P2** | 7 | Intelligence and AI |
| **P3** | 11 | User experience and dashboards |
| **P0/P2** | 5 | Governance and security |
| **P0/P4** | 8 | Platform operations |
| **P3/P4** | 2 | Domain products |
| **P4** | 1 | Trial and conversion |

### By Domain

| Domain | Count | Epics |
|--------|-------|-------|
| **A** | 7 | SaaS Foundation (01-07) |
| **B** | 4 | Dashboards & Reports (08-11) |
| **C** | 7 | Enterprise Data (12-18) |
| **D** | 5 | Knowledge & Memory (19-23) |
| **E** | 7 | Intelligence & AI (24-30) |
| **F** | 7 | User Work & Command (31-37) |
| **G** | 5 | Governance & Security (38-42) |
| **H** | 8 | Platform Admin (43-50) |
| **I** | 2 | Domain Products (51-52) |
| **J** | 1 | Trial & Conversion (53) |

---

## 📖 What's in Each Epic

Every epic file contains:

### Header
- Epic key (ISO-01 through ISO-53)
- Module name and domain
- Delivery priority
- Status (To Do)

### Epic Summary
- Module description
- Domain assignment
- SPARC execution scope

### 6 User Stories per Epic

Each epic is decomposed into 6 ticket slices:

#### 1. **CONTRACT** — API and Permission Contracts
- **Story Type:** Technical Task
- **Description:** Domain glossary, states, permissions, OpenAPI/event schemas, ADRs
- **Acceptance Criteria:**
  - OpenAPI 3.1 schemas written
  - Event contracts defined
  - Permission matrix created
  - Lifecycle state machine documented
  - Data classification completed

#### 2. **DATA** — Database and Persistence
- **Story Type:** Technical Task
- **Description:** Migrations, tenant/RLS policies, repositories, seed fixtures, retention
- **Acceptance Criteria:**
  - Alembic migrations created
  - RLS policies implemented
  - Repository layer written
  - Seed data fixtures prepared
  - Retention policy documented

#### 3. **BE** — Backend Implementation
- **Story Type:** Feature
- **Description:** Commands, queries, policy enforcement, outbox, jobs, provider adapters
- **Acceptance Criteria:**
  - FastAPI routes implemented
  - Domain model created
  - Policy enforcement added
  - Transactional outbox integrated
  - Background jobs working

#### 4. **FE** — Frontend Implementation
- **Story Type:** Feature
- **Description:** Routes, components, accessibility, error states, analytics, client integration
- **Acceptance Criteria:**
  - React components created
  - TypeScript types defined
  - All UI states implemented
  - Accessibility compliance (WCAG 2.2 AA)
  - E2E tests with Playwright

#### 5. **QA** — Testing and Quality Assurance
- **Story Type:** Technical Task
- **Description:** Unit/integration/contract/E2E/isolation/performance/recovery and abuse test packs
- **Acceptance Criteria:**
  - Unit tests (≥80% coverage)
  - Integration tests for boundaries
  - Contract tests for API
  - E2E tests with Playwright
  - Security and isolation tests
  - Performance benchmarks

#### 6. **OPS** — Operations and Deployment
- **Story Type:** Technical Task
- **Description:** Dashboards, SLO alerts, runbooks, deployment flag, migration, rollback evidence
- **Acceptance Criteria:**
  - Grafana dashboards created
  - Prometheus alerts configured
  - Runbooks written (deployment, troubleshooting, recovery)
  - Feature flag ready
  - Migration procedures documented
  - Rollback steps tested

---

## 🔗 Story Dependencies

All stories follow this dependency order:

```
CONTRACT ──┬──> BE ──┐
           │         ├──> QA ──> OPS ──> Done
DATA ──────┴──> FE ──┘
```

**Key Rules:**
- CONTRACT and DATA must close **before** BE/FE implementation starts
- Backend can unblock frontend with contract stubs
- QA cannot start until both BE and FE complete
- OPS gate blocks production release

---

## 🚀 Recommended Implementation Sequence

### Phase 1: Foundation (P0)
Start with epics ISO-01 through ISO-07:
- ISO-01: Authentication and Identity
- ISO-02: Tenant Management
- ISO-03: Organization Management
- ISO-04: User Management
- ISO-05: Roles, Personas and Groups
- ISO-06: Application Management
- ISO-07: Subscription, Plans and Entitlements

**Timeline:** 6-8 weeks (parallel teams)

### Phase 2: Data and Knowledge (P1)
Add epics ISO-12 through ISO-23:
- Data connectors, pipelines, lakehouse, catalogue, quality, lineage, master data
- Knowledge base, document intelligence, search, graph, organizational memory

**Timeline:** 8-10 weeks (after P0 AUTH/TENANT done)

### Phase 3: Intelligence (P2)
Add epics ISO-24 through ISO-30:
- Brain module, AI gateway, prompts, agents, skills, workflows, approvals

**Timeline:** 6-8 weeks (parallel with P1)

### Phase 4: UX and Governance (P3 + P0/P2)
Add epics ISO-08-11, ISO-31-42:
- Dashboards, reports, KPIs, analytics
- Command centres, inbox, meetings, actions, projects, notifications
- Policy, privacy, audit, observability, AI assurance

**Timeline:** 8-10 weeks (parallel with P3)

### Phase 5: Platform and Optional (P0/P4 + P3/P4 + P4)
Add remaining epics ISO-43-53:
- Platform administration, developer APIs, files, templates, flags, support, backup, billing
- Department cockpits, product applications
- Trial and conversion management

**Timeline:** 6-8 weeks (post GA)

---

## 📌 Story Naming Convention

All story keys follow: `ISO-{MODULE_ID}-{SLICE_TYPE}`

Examples:
- `ISO-01-CONTRACT` — Authentication module contract
- `ISO-01-DATA` — Authentication module data
- `ISO-01-BE` — Authentication module backend
- `ISO-01-FE` — Authentication module frontend
- `ISO-01-QA` — Authentication module QA
- `ISO-01-OPS` — Authentication module operations

---

## ✅ Before You Start

### Prerequisites
1. ✅ Jira project "i-Source One" (ISO) created
2. ✅ Epic issue type configured
3. ✅ Custom field for Epic Name (if using bulk import)
4. ✅ Team members assigned
5. ✅ Git repository branching strategy defined

### Setup Checklist
- [ ] Create Jira project ISO
- [ ] Configure Epic issue type
- [ ] Set up priority levels (P0-P4)
- [ ] Create labels for domains (A-J)
- [ ] Create labels for modules
- [ ] Configure epic link relationships
- [ ] Set up workflow states (To Do, In Progress, Done, etc.)
- [ ] Assign team members to stories

---

## 🔄 Integration with Development Workflow

### GitHub + Jira Integration
1. **Branch naming:** `feature/iso-{MODULE_ID}` or `feature/iso-{MODULE_ID}-{SLICE}`
2. **Commit messages:** Reference story key (e.g., `ISO-01-BE: Add authentication endpoints`)
3. **PR linking:** Link PR to story in Jira description
4. **Story status:** Auto-update based on PR/branch activity

### Definition of Done
Each story must satisfy:
- [ ] Code reviewed and approved
- [ ] All tests passing (unit, integration, E2E)
- [ ] Type checking passing (TypeScript, mypy)
- [ ] Linting passing (eslint, black, flake8)
- [ ] Changes documented
- [ ] Related issues linked
- [ ] No critical/high security findings
- [ ] Ready for deployment (for FE/BE stories)

---

## 📚 Reference Documents

### In This Repository
- **Module Specifications:** `/01_docs/Modules/README.md` and individual module files
- **Platform Specification:** `/01_docs/Saas_Module_List/SaaS_ModuleList.md`
- **Architecture Guidance:** Platform spec sections 5-7

### External References
- **SPARC Methodology:** Platform spec section 6
- **Global Architecture Rules:** Platform spec section 5
- **API Conventions:** Platform spec section 7
- **Tech Stack:** Platform spec section 3

---

## 🛠️ Customization

### Modifying Epic Files

If you need to customize epic descriptions or acceptance criteria:

1. Open the individual epic file (e.g., ISO_01_EPIC_Authentication_Identity.md)
2. Edit the content directly
3. Re-export to JSON if using bulk import
4. Update related documentation

### Custom Fields

If your Jira instance has custom fields, update the JSON mapping:

```json
{
  "customfield_10000": "Epic Name",
  "customfield_10001": "Domain",
  "customfield_10002": "Module ID"
}
```

### Workflow States

Configure your Jira workflow to support:
- **To Do** → Stories awaiting work
- **In Progress** → Active development
- **In Review** → Awaiting review/approval
- **Done** → Completed and merged

---

## 📞 Support

### Questions About Epic Structure
→ Refer to **EPIC_INDEX.md** for overview and **individual epic files** for details

### Questions About Module Scope
→ Check `/01_docs/Modules/` directory for detailed module specifications

### Questions About SPARC Methodology
→ See Platform Spec section 6 and individual epic "SPARC Execution Phases" section

### Questions About Technical Architecture
→ See Platform Spec sections 5, 7, and individual module specifications

---

## 📝 Version History

- **v1.0** (2026-08-24) — Initial generation of 53 epics with SPARC methodology
- Generated from: SaaS_ModuleList.md v2.0
- Source: `/01_docs/Modules/` (individual module specifications)

---

## 📊 Statistics

- **Total Epics:** 53
- **Total Stories (6 per epic):** 318
- **Domains:** 10 (A-J)
- **Priorities:** 8 levels (P0, P1, P2, P3, P0/P2, P0/P4, P3/P4, P4)
- **JSON File Size:** 43.3 KB
- **Total Markdown Content:** ~850 KB (53 epic files)

---

**Ready to import! Choose your method above and get started.**
