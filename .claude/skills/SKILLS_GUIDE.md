# Custom Skills

This directory contains reusable skill definitions for Claude Code workflows.

## Skill Types

### Workflow Skills
Structured commands that orchestrate complex tasks:
- Code review and auditing
- Deployment and release management
- Documentation generation
- Testing and validation

### Tool Skills
Wrapper skills around existing tools:
- Database operations
- CI/CD integration
- File operations
- Configuration management

### Integration Skills
Connect external services:
- MCP integrations
- API clients
- Webhook handlers
- Event processors

## Available Skills

### Built-in Skills
- `code-review` - Multi-level code review (low/medium/high/xhigh/ultra)
- `simplify` - Code simplification and efficiency
- `design` - UI/UX design canvas
- `dataviz` - Data visualization and charting
- `run` - Launch and drive the app
- `loop` - Recurring task management
- `schedule` - Scheduled cloud agents

### Custom Skills (Define Below)

#### Format
```yaml
name: skill-name
description: One-line description
triggers:
  - keyword: pattern
    description: When to trigger
inputs:
  - name: param
    type: string | array | object
    required: true
    description: Parameter description
outputs:
  - format: text | markdown | json | artifact
    description: Output format
```

## Skill Templates

### SaaS Module Documentation
- **Trigger**: `saas-doc`, `module-doc`
- **Purpose**: Generate SPARC format module documentation
- **Inputs**: Module name, requirements, constraints
- **Output**: Markdown documentation

### Data Pipeline Design
- **Trigger**: `pipeline-design`, `etl-design`
- **Purpose**: Design data pipelines and transformations
- **Inputs**: Data schema, transformations, volumes
- **Output**: Pipeline specification

### Workflow Graph Generation
- **Trigger**: `workflow-graph`, `process-flow`
- **Purpose**: Create workflow diagrams and orchestrations
- **Inputs**: Process steps, dependencies
- **Output**: Mermaid diagram

### Quality Assurance
- **Trigger**: `qa-review`, `test-plan`
- **Purpose**: Generate QA plans and test cases
- **Inputs**: Feature specification
- **Output**: Test matrix and cases

## Usage

### In Commands
```bash
/skill-name --param value
```

### In Workflows
```javascript
await agent('prompt', {skill: 'skill-name'})
```

### In Loops
```bash
/loop 1h /skill-name
```

---

**Last Updated**: 2026-08-24