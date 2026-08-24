# Claude Code Configuration Guide

Complete guide to the `.claude` folder structure and configuration for multi-disciplinary SaaS and data engineering workflows.

## Quick Start

### 1. Core Files
- **`settings.json`** - Main configuration (models, permissions, features)
- **`keybindings.json`** - Keyboard shortcuts for common commands
- **`README.md`** - Directory overview
- **`CONFIGURATION_GUIDE.md`** - This file

### 2. Main Directories

| Directory | Purpose | Best For |
|-----------|---------|----------|
| `agents/` | Custom agent definitions | Specialized task executors |
| `skills/` | Reusable skill definitions | Workflow building blocks |
| `commands/` | CLI-style commands | Quick task shortcuts |
| `hooks/` | Automation rules | Event-driven workflows |
| `loops/` | Recurring workflows | Scheduled/autonomous tasks |
| `graphs/` | Workflow orchestration | Multi-phase processes |
| `mcp/` | External integrations | Services and APIs |
| `plugins/` | Feature extensions | Custom functionality |
| `rules/` | Behavior guidelines | Quality/safety standards |
| `memory/` | Knowledge base | Cross-session learning |
| `logs/` | Logging config | Monitoring and debugging |

## Configuration Overview

### Model Selection

```json
"model": {
  "default": "claude-haiku-4-5-20251001",
  "overrides": {
    "code-review": "claude-opus-5",
    "architecture-planning": "claude-opus-5",
    "data-pipeline-design": "claude-sonnet-5"
  }
}
```

**Recommended:**
- **Haiku** - Fast, lightweight tasks (default)
- **Sonnet** - Balanced performance/cost (data analysis)
- **Opus** - Complex reasoning (architecture, code review)

### Permissions

Whitelist safe commands in `settings.json`:
```json
"permissions": {
  "allow": [
    "Bash(git *)",
    "Bash(npm *)",
    "Bash(python*)"
  ]
}
```

### Environment Variables

Set in `settings.json` or `settings.local.json`:
```json
"environment": {
  "NODE_ENV": "development",
  "DEBUG": false
}
```

## Workflow Patterns

### Pattern 1: Pipeline (Sequential)
For linear workflows with dependencies:
```
Discover → Generate → Review → Validate → Deploy
```
**Use:** Module development, data transformations

### Pattern 2: Fan-out/Fan-in (Parallel)
For independent parallel tasks:
```
[Task1 || Task2 || Task3] → Aggregate
```
**Use:** Multi-dimensional reviews, batch processing

### Pattern 3: Loop-until-dry (Iterative)
For convergent discovery:
```
Find Issues → (Loop until no new issues) → Resolve
```
**Use:** Bug discovery, quality checks

## Working with Modules

### Module Development Workflow
1. **Discovery** - Identify new modules
2. **SPARC Generation** - Auto-generate specs
3. **Multi-dimensional Review** - Correctness, completeness, consistency
4. **Jira Sync** - Create epics and stories
5. **Validation** - Test and deploy

**Key Files:**
- `skills/` - Module generation skills
- `agents/` - Specialized reviewers
- `graphs/` - Module dev workflow graph
- `rules/` - SPARC validation rules

### Commands
```bash
/module-spec                    # Generate SPARC spec
/module-validate               # Validate existing spec
/epic-sync                     # Sync with Jira
/workflow --graph module-dev   # Run full workflow
```

## Data Engineering Workflows

### Data Pipeline Development
1. **Schema Analysis** - Understand data
2. **Pipeline Design** - Parallel design phase
3. **Performance Analysis** - Volume, latency, cost
4. **Optimization** - Iterate if needed
5. **Validation** - Quality and integrity tests
6. **Production Deployment** - Safe rollout

**Key Files:**
- `skills/` - Pipeline design skills
- `rules/` - Schema validation rules
- `mcp/` - Database/catalog connections
- `loops/` - Pipeline monitoring

### Commands
```bash
/pipeline-check --validate     # Validate pipeline
/schema-validate              # Check schema compatibility
/quality-check                # Run quality checks
/pipeline-monitor             # Monitor pipeline health
```

## Code Quality and Review

### Automated Review Setup
```bash
# Medium-level review (quick)
/code-review --level medium

# High-level review (thorough)
/code-review --level high

# Ultra review (cloud, comprehensive)
/code-review --level ultra --comment
```

### Pre-commit Hook
```json
"hooks": {
  "pre-commit": {
    "command": "/code-review --level medium --fix",
    "on-failure": "warn"
  }
}
```

## Loops and Scheduling

### Autonomous Loop (Self-paced)
```bash
/loop /find-bugs --report-format json
```
Continues until no new bugs found.

### Interval Loop
```bash
/loop 1h /code-review --level medium
```
Runs every hour.

### Scheduled Loop (Cron)
```bash
/schedule "0 9 * * 1-5" /daily-briefing
```
Runs weekdays at 9am.

### Monitor Loops
```bash
/loop list                     # View active loops
/loop stop <loop-id>          # Stop specific loop
tail -f .claude/logs/loops.log # View loop logs
```

## Memory and Knowledge

### Automatic Memory Saving
The memory system automatically saves:
- User preferences and context
- Project-specific information
- Feedback and learned patterns
- External resource references

### Memory Search
```bash
claude mem search "SaaS modules"
claude mem search "data pipeline patterns"
```

### Memory Types
1. **User** - Your role, preferences, expertise
2. **Feedback** - What works, what doesn't
3. **Project** - Goals, deadlines, constraints
4. **Reference** - External resources, links

## Performance Tuning

### Token Budget
Set budget for expensive operations:
```json
"workflows": {
  "budget": {
    "enabled": true,
    "tokens": 500000
  }
}
```

### Cache Configuration
```json
"performance": {
  "cache-enabled": true,
  "cache-ttl": "1h",
  "prefetch": true
}
```

### Log Levels
```json
"logging": {
  "level": "info",
  "components": {
    "workflows": "info",
    "mcp": "warn"
  }
}
```

## Security and Safety

### Secret Detection
```json
"security": {
  "secret-detection": true,
  "auto-redact-logs": true
}
```

### Branch Protection
```yaml
rule:
  id: main-branch-protection
  trigger:
    event: commit
    condition: "branch == 'main'"
  action:
    type: block
```

### Approval Requirements
```yaml
rule:
  id: require-code-review
  trigger:
    event: pre-push
  action:
    type: require-approval
    threshold: 1
```

## Keyboard Shortcuts

### Quick Commands
- `Cmd+Shift+R` - Code review (medium)
- `Cmd+Shift+T` - Run/test
- `Cmd+Shift+M` - Generate module spec
- `Cmd+Shift+E` - Sync epics

### Chord Sequences (Cmd+K then...)
- `Cmd+K Cmd+R` - Deep review (high)
- `Cmd+K Cmd+U` - Ultra review (cloud)
- `Cmd+K Cmd+W` - List workflows
- `Cmd+K Cmd+L` - View logs
- `Cmd+K Cmd+M` - Search memory

## Troubleshooting

### MCP Connection Issues
```bash
# Check MCP server status
claude mcp test --server github

# View MCP logs
tail -f .claude/logs/mcp.log

# Update credentials in settings.local.json
```

### Workflow Timeout
```bash
# Increase timeout in settings.json
"agents": {
  "timeout": "60m"
}

# Or set per-workflow
/workflow --name my-workflow --timeout 60m
```

### Hook Not Triggering
```bash
# Check hook configuration
cat .claude/hooks/*.json

# View hook logs
tail -f .claude/logs/hooks.log

# Test hook manually
claude hook test pre-commit
```

### Memory Not Saving
```bash
# Check memory is enabled
grep -A5 '"memory"' .claude/settings.json

# View memory logs
tail -f .claude/logs/memory.log

# Force memory save
claude mem save
```

## Best Practices

### 1. Start Simple
- Begin with basic settings
- Add features as needed
- Don't over-configure initially

### 2. Document Everything
- Add descriptions to rules
- Comment complex configurations
- Keep this guide updated

### 3. Monitor Logs
- Regular log review
- Set up critical alerts
- Track performance metrics

### 4. Version Control
- Commit settings.json (but NOT settings.local.json)
- Document changes with git messages
- Keep configurations synchronized with team

### 5. Security First
- Store secrets in settings.local.json
- Never commit credentials
- Rotate tokens regularly
- Use minimal permissions

### 6. Performance Focus
- Use appropriate log levels
- Cache when possible
- Batch operations
- Monitor agent timeouts

## Advanced Configuration

### Custom Agents
Define in `agents/` directory with frontmatter:
```markdown
---
name: my-agent
type: specialized
model: claude-opus-5
tools:
  - Bash
  - Read
  - Edit
---

Custom system prompt and instructions.
```

### Complex Workflows
Use graph definitions in `graphs/`:
- Sequential pipelines
- Parallel fan-out/fan-in
- Loop-until-dry patterns
- Conditional branches

### Integration Scripts
Create MCP servers for:
- Custom APIs
- Internal tools
- Database access
- Proprietary systems

## Support and Resources

### Within Claude Code
- `/help` - General help
- `/claude-code-guide` - SDK and features
- `/code-review` - Code review help

### Command Help
```bash
claude --help
claude <command> --help
claude mem search --help
```

### This Configuration
- All directories have `README.md`
- `settings.json` is self-documented
- Check `keybindings.json` for shortcuts

---

**Last Updated**: 2026-08-24
**Version**: 2.0
**Status**: Production-Ready

For questions or issues, refer to specific directory READMEs or use `/claude-code-guide`.