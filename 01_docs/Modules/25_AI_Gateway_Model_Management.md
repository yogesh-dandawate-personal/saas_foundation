## Module 25 — AI Gateway and Model Management

**Catalogue domain:** E. Enterprise Intelligence and Agentic Operations  
**Delivery priority:** P2  
**Owning domain:** Enterprise Intelligence and APEX  
**Primary personas:** AI administrator; agent builder; process owner; approver; employee; risk reviewer  
**Dependencies:** Enterprise Brain prerequisites, AI Gateway, knowledge services, policy engine, approvals and audit

### Purpose and outcome

Central, policy-controlled access to AI models. The module succeeds when authorized users can complete the governed lifecycle end to end, understand status and evidence, and recover safely from failures without bypassing tenant, privacy or approval controls.

### Scope and functional requirements

- Support Model catalogue and providers.
- Support local/hosted models.
- Support routing and fallback.
- Support policies.
- Support redaction.
- Support token budgets.
- Support rate and cost limits.
- Support evaluations.
- Support latency and quality.
- Support versions.
- Support approvals.
- Support retirement and tenant permissions.
- Store and expose agent/model/prompt definitions, policies, tool contracts, runs, evidence, decisions, costs and outcomes.
- Support draft, validation, approved/published or active, suspended/failed and archived states where applicable.
- Enforce tenant context, entitlements, RBAC/ABAC policy and field-level masking on every read and mutation.
- Produce immutable domain and audit events for material state changes.

**Out of scope:** bypassing source-system authority, storing provider secrets in the client, silent cross-tenant sharing, irreversible autonomous action without policy, and unversioned production changes.

### Frontend specification

**Routes**

- `/app/ai-gateway` — catalogue or operational overview
- `/app/ai-gateway/new` — permission-gated creation wizard
- `/app/ai-gateway/:id` — details, activity and related evidence
- `/app/ai-gateway/:id/edit` — version-aware configuration editor
- `/app/ai-gateway/:id/audit` — immutable history and trace view

**Primary screens:** Models, routes, policies, evaluations, usage, cost, versions.

**Component contract**

- `ModuleHeader`: title, lifecycle badge, owner, environment, version and permitted actions.
- `FilterBar` and `DataGrid`: server-side filters, saved views, cursor pagination, bulk selection and accessible keyboard controls.
- `DetailPanel`: summary, configuration, dependencies, activity, evidence and audit tabs.
- `ActionPanel`: policy explanation, impact preview, maker/checker gate, confirmation and resulting job status.
- `HealthCard`: freshness, SLO, last successful operation, quota/usage and remediation link.
- Use React + TypeScript + Vite, Tailwind, ShadCN and Storybook; use TanStack Query for server state and typed route loaders for access checks.

**Mandatory UI states**

- Loading skeleton, first-use empty state, no-results state, partial-data warning, stale-data warning, validation failure, access restricted, quota/entitlement blocked, offline/degraded and retryable/non-retryable error.
- Destructive or high-impact actions show affected records, approval requirement and rollback/compensation behavior before confirmation.
- Every async command exposes queued, running, waiting-for-approval, succeeded, partially-succeeded, failed, cancelled and retry states where relevant.
- Meet WCAG 2.2 AA for focus order, contrast, labels, keyboard navigation, status announcements and reduced motion.

### Backend specification

**Service boundary:** a FastAPI bounded context owns `ai-gateway` commands, queries, validation and lifecycle rules. It stores authoritative ModelProvider, ModelDeployment, ModelRoute records in PostgreSQL and emits integration events through the transactional outbox. Large binaries remain in encrypted object storage; graph, vector, search or analytical projections are derived stores, never the sole system of record.

**Core entities:** `ModelProvider`, `ModelDeployment`, `ModelRoute`, `ModelPolicy`, `ModelEvaluation`, `TokenUsage`.

**Required backend layers**

- FastAPI router and Pydantic request/response schemas; application command/query handlers; domain model and policy rules; repositories; provider adapters; background jobs; outbox/event consumers.
- Inject `tenant_id`, `actor_id`, `request_id`, `correlation_id`, locale and entitlement snapshot from verified gateway claims; never trust client-supplied tenant identity.
- Use PostgreSQL row-level security plus repository tenant predicates. Encrypt sensitive columns and use vault references for credentials.
- Use Redis only for bounded caches, rate limits and locks with tenant-prefixed keys; cache invalidation follows committed domain events.
- Emit OpenTelemetry spans, RED/USE metrics, structured redacted logs, business counters, cost/usage meters and append-only audit events.
- Background execution is retry-safe, idempotent and resumable; failed work enters a visible remediation or dead-letter queue.

### API specification

| Method | Endpoint | Responsibility | Authorization | Idempotency |
|---|---|---|---|---|
| GET | `/api/v1/ai-gateway` | List/search authorized resources with cursor pagination | Bearer + tenant scope | No |
| POST | `/api/v1/ai-gateway` | Create a draft resource after policy validation | Create permission | Required |
| GET | `/api/v1/ai-gateway/{id}` | Read resource, version, permissions and links | Read permission | No |
| PATCH | `/api/v1/ai-gateway/{id}` | Update using optimistic concurrency | Edit permission | Required |
| POST | `/api/v1/ai-gateway/{id}/actions/evaluate-route` | Execute `evaluate-route` through a governed command | Action-specific policy | Required |
| GET | `/api/v1/ai-gateway/{id}/audit` | Return scoped lifecycle and decision evidence | Audit/read permission | No |

**Contract rules**

- JSON responses use `{ data, meta: { request_id, tenant_id, version, next_cursor }, errors: [] }`; errors use stable codes, safe detail and a traceable request ID.
- Mutations require `Idempotency-Key`; updates require `If-Match` or `expected_version`; conflicts return `409`, validation `422`, policy denial `403`, missing entitlement `402/403` with upgrade metadata, and throttling `429` with retry guidance.
- Publish OpenAPI 3.1 and generate TypeScript/Python clients in CI. Breaking changes require a new API version and migration plan.
- Domain events follow `isource.ai-gateway.<event>.v1` and contain event, tenant, actor, resource, correlation, causation, schema version and occurred-at fields.

### Agent-ready implementation contract

**Outcome stories**

- As a ai administrator, I want to redact request, enforce policy and budget, select route, invoke model, evaluate response, meter cost, so that the business outcome is achieved with visible evidence and controlled risk.
- As a tenant administrator, I want to configure ownership, entitlements, quotas, policies and lifecycle behavior for AI Gateway and Model Management, so that each department receives only approved capability.
- As an auditor or operational owner, I want to reconstruct every material decision and failure from correlated evidence, so that compliance, support and recovery do not depend on developer access.

**Lifecycle state machine:** `Draft → Validating → Approved → Active → Degraded|Suspended → Superseded → Archived`. State transitions are server-authoritative, policy-checked, versioned and recorded in audit. Invalid transitions return a stable `409 INVALID_STATE_TRANSITION` response and do not emit completion events.

**Permission model**

| Permission | Allows | Explicitly does not allow |
|---|---|---|
| `ai-gateway:read` | View authorized records and safe metadata | Secret values, masked fields or other tenants |
| `ai-gateway:create` | Create a tenant-scoped draft | Publish, execute or approve it |
| `ai-gateway:update` | Edit an allowed draft/version | Bypass optimistic concurrency or policy |
| `ai-gateway:evaluate-route` | Request the governed primary command | Self-approve when segregation is required |
| `ai-gateway:approve` | Approve within assigned authority | Alter the maker's submitted evidence |
| `ai-gateway:admin` | Configure module-level policy and quotas | Disable platform audit, privacy or isolation controls |
| `ai-gateway:audit:read` | Read scoped evidence and traces | Read protected payload content without purpose authorization |

**Event catalogue**

- Emits: `isource.ai-gateway.created.v1`, `isource.ai-gateway.updated.v1`, `isource.ai-gateway.evaluate-route-requested.v1`, `isource.ai-gateway.evaluate-route-completed.v1`, `isource.ai-gateway.operation-failed.v1`.
- Consumes: `isource.tenant.entitlements-changed.v1`, `isource.identity.access-changed.v1`, `isource.policy.published.v1`.
- Consumers must be idempotent, tolerate duplication and ordering gaps, quarantine schema-invalid events, and expose replay checkpoints. Personally identifiable or secret data is excluded unless the event contract explicitly classifies and encrypts it.

**Initial production SLO objectives**

| Measure | Target | Evidence |
|---|---|---|
| Availability | 99.9% monthly control-plane availability | Synthetic checks and SLI dashboard |
| Interactive latency | p95 API ≤ 700 ms; streamed first useful response ≤ 2.5 s excluding provider outage | Server and browser p50/p95/p99 |
| Processing | 99% accepted commands enter execution ≤ 5 s | Queue age, start lag and completion metrics |
| Recovery | RPO ≤ 15 min; RTO ≤ 60 min | Backup/restore and failover drill |
| Correctness | ≥ 99.5% successful eligible operations; 100% audit durability for accepted material mutations | Business outcome and audit reconciliation |

The targets are release baselines. Product and SRE owners may tighten them by plan or criticality, but weakening them requires an approved ADR and customer-impact assessment.

**Failure and recovery cases**

- Dependency unavailable: apply bounded timeout/circuit breaker, preserve idempotency, queue only when policy permits, and show degraded status with retry guidance.
- Partial completion: record completed and uncompensated steps separately; run compensation or require an explicit human resolution task.
- Concurrency conflict: reject stale writes, return the current version and support a user-visible compare/reapply flow.
- Authorization or entitlement change during execution: re-evaluate before every material side effect and stop safely when authority is lost.
- Poison message or invalid projection: quarantine with tenant-safe diagnostics, alert the owner, preserve checkpoint and permit controlled replay.
- Data retention or legal hold conflict: prefer legal hold, block deletion, record policy basis and notify the privacy owner.

**Agent ticket slices and dependencies**

1. `ISO-25-CONTRACT` — domain glossary, states, permissions, OpenAPI/event schemas and architecture decision records.
2. `ISO-25-DATA` — migrations, tenant/RLS policies, repositories, seed fixtures, retention and recovery.
3. `ISO-25-BE` — commands, queries, policy enforcement, outbox, jobs and provider adapters.
4. `ISO-25-FE` — routes, components, accessibility, error states, analytics and typed client integration.
5. `ISO-25-QA` — unit/integration/contract/E2E/isolation/performance/recovery and abuse test packs.
6. `ISO-25-OPS` — dashboards, SLO alerts, runbooks, deployment flag, migration and rollback evidence.

Contract and threat-model tickets must close before implementation tickets merge. Backend contract stubs may unblock frontend work; production rollout waits for QA and OPS gates.


### SPARC agent work package

#### S — Specify

- Convert this module scope into a Jira epic with stories for Models, routes, policies, evaluations, usage, cost, versions, domain services, APIs, policy checks, telemetry and documentation.
- Write Given/When/Then acceptance criteria for happy path, denial, quota, validation, concurrency, dependency outage and recovery.
- Confirm data classification, residency, retention, ownership, SoD/approval policy, trial behavior and measurable SLOs before implementation.
- Produce a traceability matrix linking each requirement to UI, endpoint, domain rule, test and evidence artifact.

#### P — Plan

1. Resolve verified tenant, actor, role, entitlements and policy context for `AI Gateway and Model Management`.
2. Model ModelProvider, ModelDeployment, ModelRoute, ModelPolicy, lifecycle transitions, invariants and compensating actions.
3. Implement the primary flow: redact request, enforce policy and budget, select route, invoke model, evaluate response, meter cost.
4. Persist the state change and outbox event in one transaction; update read projections asynchronously.
5. Return a stable resource or job representation; surface progress, evidence and remediation in the UI.
6. Add contract, unit, integration, end-to-end, isolation, security, performance and recovery tests before release review.

#### A — Act

- Frontend agent implements routes, components, typed API client, all UI states, Storybook cases and Playwright journeys under `apps/web/src/modules/ai-gateway`.
- Backend agent implements domain/application/infrastructure layers under `services/ai-gateway`, Alembic migrations, outbox events and background jobs.
- Contract agent publishes `/api/v1/ai-gateway` OpenAPI schemas, examples, error codes, permissions and generated clients.
- Security agent adds Casbin/Keycloak policy fixtures, tenant-isolation tests, threat cases, secret handling and log-redaction assertions.
- QA agent builds deterministic fixtures and test matrices; documentation agent adds operator, admin, user and recovery runbooks.

#### R — Review

- Maker self-review: lint, types, unit tests, migrations, local smoke test and requirement traceability.
- Checker review: API/schema compatibility, negative paths, concurrency/idempotency, cross-tenant denial, accessibility and performance budgets.
- Reviewer review: architecture boundary, data ownership, security/privacy, operability, trial behavior and product acceptance.
- Approver gate: feature-audit packet, unresolved-risk disposition, rollback evidence and production readiness sign-off.
- Refinement loop returns failed findings to the responsible agent with exact evidence; only the failing scope is changed and all affected tests rerun.

#### C — Close

- Merge only after protected-branch checks and checker/reviewer/approver evidence pass.
- Deploy behind a default-off feature flag, run migrations and smoke tests, then progressively enable internal, pilot and tenant cohorts.
- Monitor SLOs, error rate, latency, saturation, cost, business outcome and support signals; rollback automatically when guardrails breach.
- Close Jira only after documentation, release notes, ownership, dashboards, alerts, runbooks and post-release verification are linked.

### Module-specific Definition of Done

The **AI Gateway and Model Management** work package is done only when every item below has objective evidence:

- [ ] All listed capabilities and the primary flow—redact request, enforce policy and budget, select route, invoke model, evaluate response, meter cost—pass approved Given/When/Then acceptance tests.
- [ ] All primary screens (Models, routes, policies, evaluations, usage, cost, versions) and mandatory loading, empty, error, denied, quota and degraded states are implemented and accessibility-tested.
- [ ] `ai-gateway` APIs match OpenAPI 3.1, generated clients compile, examples pass contract tests, and idempotency/concurrency behavior is proven.
- [ ] The `Draft → Validating → Approved → Active → Degraded|Suspended → Superseded → Archived` lifecycle and every `ai-gateway:*` permission are covered by positive, negative and invalid-transition tests.
- [ ] Emitted and consumed event contracts pass schema, duplication, ordering-gap, replay and protected-data tests; consumer lag and dead-letter alerts are operational.
- [ ] The module meets its initial availability, latency, processing, correctness and recovery SLOs under representative tenant load.
- [ ] ModelProvider, ModelDeployment, ModelRoute, ModelPolicy, ModelEvaluation, TokenUsage schemas, migrations, tenant predicates, retention rules and rollback/forward-fix procedures are reviewed.
- [ ] Cross-tenant, horizontal/vertical privilege escalation, injection, secret leakage, unsafe logging and abuse-rate tests pass with no open critical/high finding.
- [ ] Unit, integration, consumer-contract and critical Playwright journeys pass; agreed coverage thresholds and performance budgets are met.
- [ ] OpenTelemetry traces connect browser, API, job and provider calls; dashboards, actionable alerts, SLOs and operator runbooks work in a failure drill.
- [ ] Every material mutation appears in immutable audit with tenant, actor, policy decision, before/after reference, correlation ID and evidence link.
- [ ] Trial behavior is verified: Available according to the trial plan; mutations and consumption are quota-controlled, premium actions may require upgrade, and expiry preserves configuration while disabling new execution.
- [ ] Maker, independent checker, reviewer and approver have signed the feature-audit packet; no unresolved blocking acceptance or architecture finding remains.
- [ ] Feature flag, progressive rollout, rollback/compensation, release notes, user/admin/API documentation, ownership and support handoff are complete.

---
**Module Metadata:** E — Enterprise Intelligence and Agentic Operations | Priority: P2
