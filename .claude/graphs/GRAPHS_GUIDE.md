# Workflow Graphs and Orchestration

This directory contains workflow graph definitions and orchestration patterns for complex multi-agent processes.

## Graph Concepts

### Nodes
- **Agent Nodes**: Specialized agents executing tasks
- **Decision Nodes**: Conditional branches
- **Aggregation Nodes**: Merge results from parallel work
- **Data Nodes**: Pass data between stages

### Edges
- **Sequential**: Node A → Node B (B waits for A)
- **Parallel**: [A || B] → C (A and B run in parallel, C waits)
- **Conditional**: A → (condition) → B or C

### Patterns
- **Pipeline**: Sequential processing stages
- **Fan-out/Fan-in**: Parallel processing with aggregation
- **Loop-until-dry**: Iterate until convergence
- **Barrier**: Synchronization point

## Graph Examples

### SaaS Module Development Workflow
```
┌──────────┐
│ Discover │ ← Find new requirements
│ Modules  │
└────┬─────┘
     ↓
┌──────────────────────────────────────┐
│ SPARC Spec Generation (Parallel)     │
│ ┌──┐ ┌──┐ ┌──┐ ┌──┐ ┌──┐            │
│ │M1│ │M2│ │M3│ │M4│ │M5│ ... (N)   │
│ └──┘ └──┘ └──┘ └──┘ └──┘            │
└────┬─────────────────────────────────┘
     ↓
┌─────────────────────────────┐
│ Multi-Dimensional Review    │
│ ├─ Correctness              │
│ ├─ Completeness             │
│ ├─ Consistency              │
│ └─ Compliance               │
└────┬────────────────────────┘
     ↓
┌──────────────────────────────┐
│ Fix Issues (Parallel)        │
│ (Loop until dry)             │
└────┬───────────────────────────┘
     ↓
┌──────────────────────────────┐
│ Generate Jira Epics          │
│ (Based on SPARC Specs)       │
└────┬────────────────────────┘
     ↓
┌──────────────────────────────┐
│ Validate and Deploy to Jira  │
└──────────────────────────────┘
```

### Data Pipeline Engineering Workflow
```
┌──────────────────┐
│ Schema Analysis  │
└────┬─────────────┘
     ↓
┌─────────────────────────────────────┐
│ Pipeline Design (Parallel)          │
│ ├─ Source Connectors                │
│ ├─ Transformations                  │
│ ├─ Aggregations                     │
│ └─ Quality Checks                   │
└─────┬───────────────────────────────┘
      ↓
┌──────────────────────────────┐
│ Performance Analysis         │
│ (Volume, Latency, Cost)      │
└────┬─────────────────────────┘
     ↓
┌──────────────────────────────┐
│ Optimization Loop            │
│ (Iterate if needed)          │
└────┬─────────────────────────┘
     ↓
┌──────────────────────────────┐
│ Validation Testing           │
│ (Data Quality, Integrity)    │
└────┬─────────────────────────┘
     ↓
┌──────────────────────────────┐
│ Deployment to Production     │
└──────────────────────────────┘
```

### Code Review and Quality Workflow
```
┌──────────────────────────┐
│ Identify Changed Files   │
└────┬─────────────────────┘
     ↓
┌──────────────────────────────────────────┐
│ Multi-Dimensional Review (Parallel)      │
│ ├─ Correctness & Bugs                    │
│ ├─ Performance & Efficiency              │
│ ├─ Security & Compliance                 │
│ ├─ Testing & Coverage                    │
│ └─ Style & Maintainability               │
└────┬──────────────────────────────────────┘
     ↓
┌──────────────────────────────┐
│ Adversarial Verification     │
│ (Vote on findings)           │
└────┬─────────────────────────┘
     ↓
┌──────────────────────────────┐
│ Filter False Positives       │
└────┬─────────────────────────┘
     ↓
┌──────────────────────────────┐
│ Generate & Post Reports      │
└──────────────────────────────┘
```

## Graph Configuration Format

### YAML Definition
```yaml
workflow:
  name: saas-module-development
  description: Complete SaaS module development workflow
  
  nodes:
    discover:
      type: agent
      agent: requirements-discovery
      description: Find new module requirements
      
    spec-gen:
      type: parallel
      agent: sparc-generator
      parallelism: 8
      description: Generate SPARC specs
      
    review:
      type: agent
      agent: multi-reviewer
      dimensions:
        - correctness
        - completeness
        - consistency
      description: Multi-dimensional review
      
  edges:
    - from: discover
      to: spec-gen
      
    - from: spec-gen
      to: review
      type: barrier
      
  error-handling:
    on-failure: log-and-continue
    on-critical: escalate-to-user
```

### JavaScript Definition (in Workflow Scripts)
```javascript
const graph = {
  nodes: [
    {id: 'discover', type: 'agent', agent: 'requirements-discovery'},
    {id: 'spec-gen', type: 'parallel', agent: 'sparc-generator'},
    {id: 'review', type: 'agent', agent: 'multi-reviewer'},
  ],
  edges: [
    {from: 'discover', to: 'spec-gen'},
    {from: 'spec-gen', to: 'review', type: 'barrier'},
  ],
}
```

## Orchestration Patterns

### Pipeline Pattern
Sequential stages, each depends on previous:
```
A → B → C → D → E
```
**Use for**: Linear workflows, sequential requirements

### Fan-out/Fan-in Pattern
Parallel workers, then aggregate:
```
A → [B || C || D || E] → F
```
**Use for**: Independent tasks that need aggregation

### Loop-until-dry Pattern
Keep iterating until no new findings:
```
A → (Loop) → [B || C || D] → Dedup → (Dry?) → E
```
**Use for**: Discovery, issue finding, quality checks

### Barrier Pattern
Synchronize before continuing:
```
[A || B || C] ─barrier─ D
```
**Use for**: Need all results before next phase

### Conditional Pattern
Branch based on condition:
```
A → (condition) → B or C
```
**Use for**: Decision-based workflows

## Graph Management

### Create Graph
Define in `.claude/graphs/` directory:
- `saas-module-dev.yaml`
- `data-pipeline-engineering.yaml`
- `code-quality.yaml`

### Visualize Graph
```bash
claude graph-viz --input graphs/module-dev.yaml --output mermaid
```

### Execute Graph
```bash
/workflow --graph graphs/module-dev.yaml --module AuthenticationModule
```

### Monitor Execution
```bash
claude workflow status [workflow-id]
claude workflow logs [workflow-id]
```

## Best Practices

1. **Break into agents** - Each node should be clear responsibility
2. **Parallelize safely** - Ensure independent work
3. **Use barriers wisely** - Minimize synchronization points
4. **Handle errors early** - Define error handling at each node
5. **Monitor performance** - Track execution times per node
6. **Document purpose** - Clear descriptions for each node
7. **Test locally** - Run workflows before scheduling

---

**Last Updated**: 2026-08-24