# Custom Agents

This directory contains definitions for specialized agents used in Claude Code workflows.

## Available Agent Types

### System Agents (Built-in)
- `general-purpose` - Default catch-all agent
- `claude-code-guide` - Claude Code and SDK questions
- `Explore` - Fast code search and discovery
- `Plan` - Architecture and implementation planning
- `code-reviewer` - Code review and quality analysis

### Custom Agents (Define Below)

Add your own agent definitions using the frontmatter format:

```markdown
---
name: agent-name
type: general-purpose | specialized
description: One-line description
model: claude-haiku-4-5-20251001 | claude-sonnet-5
reasoning_effort: low | medium | high | xhigh
tools:
  - Bash
  - Read
  - Edit
  - Write
  - Agent
---

Agent system prompt and instructions here.
```

## Agent Specifications

### SaaS Engineering Agent
- **Purpose**: Full-stack SaaS development workflows
- **Skills**: Architecture, API design, deployment
- **Model**: Opus for complex decisions
- **Tools**: All development tools

### Data Engineering Agent
- **Purpose**: Data pipelines, ETL, transformations
- **Skills**: Schema design, performance optimization
- **Model**: Sonnet for analysis
- **Tools**: Bash, Read, Edit, SQL tools

### Integration Agent
- **Purpose**: MCP integrations, external services
- **Skills**: API integration, protocol handling
- **Model**: Haiku for efficiency
- **Tools**: Network, MCP tools

### Graph Orchestration Agent
- **Purpose**: Multi-agent workflow coordination
- **Skills**: Workflow design, agent management
- **Model**: Opus for complex coordination
- **Tools**: Agent, Workflow, Process tools

## Usage

Reference agents in:
- Workflow scripts: `agent(prompt, {agentType: 'agent-name'})`
- Skills: Via `skill:invoke`
- Loops: For specialized task execution

---

**Last Updated**: 2026-08-24