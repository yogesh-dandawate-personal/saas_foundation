# .claude Configuration Index

Complete index of all Claude Code configuration files and directories.

## File Organization

### Root Configuration Files
| File | Purpose | Status |
|------|---------|--------|
| `settings.json` | Main configuration | ✅ Ready |
| `settings.local.json` | Local overrides | 📝 Not committed |
| `keybindings.json` | Keyboard shortcuts | ✅ Ready |
| `README.md` | Directory overview | ✅ Ready |
| `CONFIGURATION_GUIDE.md` | How-to guide | ✅ Ready |
| `INDEX.md` | This file | ✅ Ready |

### Configuration Directories

#### `agents/` - Custom Agents
**Purpose**: Define specialized agent types for different tasks
- **README.md** - Agent definitions and specifications
- **Example**: SaaS Engineering Agent, Data Engineering Agent
- **Add**: Agent definitions following frontmatter format

#### `skills/` - Reusable Skills
**Purpose**: Define workflow commands and automation
- **README.md** - Skill types and templates
- **Examples**: Module documentation, data pipeline design
- **Add**: Skill definitions in `skills/` directory

#### `commands/` - CLI Commands
**Purpose**: Define custom CLI-style commands
- **README.md** - Command format and examples
- **Examples**: `/code-review`, `/module-spec`, `/pipeline-check`
- **Add**: Command definitions following format

#### `hooks/` - Automation Triggers
**Purpose**: Trigger workflows on events
- **README.md** - Hook types and configurations
- **Examples**: Pre-commit hooks, file change hooks, scheduled hooks
- **Add**: Hook definitions in JSON format

#### `loops/` - Recurring Workflows
**Purpose**: Define autonomous and scheduled loops
- **README.md** - Loop types and patterns
- **Examples**: Code monitoring, pipeline validation, daily briefings
- **Add**: Loop definitions for recurring tasks

#### `graphs/` - Workflow Orchestration
**Purpose**: Define multi-phase workflow graphs
- **README.md** - Graph patterns and orchestration
- **Examples**: Module development flow, code review flow, pipeline engineering
- **Add**: Workflow graph definitions (YAML or JavaScript)

#### `mcp/` - MCP Integrations
**Purpose**: Configure external service integrations
- **README.md** - MCP server setup and configurations
- **Examples**: GitHub, Jira, AWS, PostgreSQL, Slack
- **Add**: MCP server configs in settings.json

#### `plugins/` - Feature Extensions
**Purpose**: Extend Claude Code functionality
- **README.md** - Plugin development and configuration
- **Examples**: Memory plugin, SaaS modules plugin, code quality plugin
- **Add**: Plugin configurations in settings.json

#### `rules/` - Behavior Guidelines
**Purpose**: Define automation rules and quality standards
- **README.md** - Rule types and examples
- **Examples**: Type checking, branch protection, schema validation
- **Add**: Rule definitions in YAML format

#### `memory/` - Knowledge Management
**Purpose**: Persistent cross-session knowledge
- **MEMORY.md** - Memory index and system
- **Files**: Type-specific memory files
- **Add**: Memory entries following the memory system format

#### `logs/` - Logging Configuration
**Purpose**: Configure and monitor logs
- **README.md** - Logging setup and monitoring
- **Log files**: Claude, workflows, hooks, agents, MCP, etc.
- **Add**: Logging configuration in settings.json

## Configuration by Feature

### Code Review
```
settings.json → model.overrides.code-review (Opus)
keybindings.json → Cmd+Shift+R (/code-review)
rules/ → code quality rules
hooks/ → pre-commit-review
```

### Module Development
```
skills/README.md → Module spec generation
agents/README.md → SPARC validator agent
graphs/README.md → Module dev workflow
mcp/README.md → Jira integration
rules/README.md → SPARC validation rules
```

### Data Engineering
```
skills/README.md → Pipeline design skills
rules/README.md → Schema validation
mcp/README.md → Database connections
loops/README.md → Pipeline monitoring
graphs/README.md → Pipeline orchestration
```

### Continuous Monitoring
```
loops/README.md → Recurring tasks
hooks/README.md → Event triggers
rules/README.md → Automation rules
logs/README.md → Monitoring logs
plugins/README.md → Custom extensions
```

## Quick Reference

### Enable a Feature
1. Add configuration to `settings.json` or subdirectory
2. Reference in `keybindings.json` if it's a command
3. Check `README.md` in relevant directory
4. Restart Claude Code to apply changes

### Add a Custom Agent
1. Review `agents/README.md`
2. Create agent definition with frontmatter
3. Reference in workflow scripts: `agent(prompt, {agentType: 'my-agent'})`

### Create a Skill
1. Review `skills/README.md`
2. Define skill in YAML or JSON
3. Reference in commands or workflows

### Setup MCP Integration
1. Review `mcp/README.md`
2. Add server config to `settings.json`
3. Set credentials in `settings.local.json`
4. Test with `claude mcp test --server name`

### Define a Workflow Graph
1. Review `graphs/README.md`
2. Create YAML or JS definition
3. Execute with `/workflow --graph path`

### Create a Hook
1. Review `hooks/README.md`
2. Define in JSON in `settings.json`
3. Hook triggers on events (pre-commit, file-change, etc.)

### Add a Rule
1. Review `rules/README.md`
2. Define in YAML format
3. Rule enforces on specified triggers

### Start a Loop
1. Review `loops/README.md`
2. Use `/loop [interval] /command`
3. Monitor with `/loop list` and logs

## Directory Structure at a Glance

```
.claude/
├── 📄 settings.json ..................... Main config
├── 📄 settings.local.json .............. Local overrides (gitignored)
├── 📄 keybindings.json ................. Keyboard shortcuts
├── 📄 README.md ....................... Directory overview
├── 📄 CONFIGURATION_GUIDE.md ........... How-to guide
├── 📄 INDEX.md ........................ This file
│
├── 📁 agents/ ......................... Custom agents
│   └── README.md
│
├── 📁 skills/ ......................... Reusable skills
│   └── README.md
│
├── 📁 commands/ ....................... CLI commands
│   └── README.md
│
├── 📁 hooks/ .......................... Automation triggers
│   └── README.md
│
├── 📁 loops/ .......................... Recurring workflows
│   └── README.md
│
├── 📁 graphs/ ......................... Workflow graphs
│   └── README.md
│
├── 📁 mcp/ ............................ MCP integrations
│   └── README.md
│
├── 📁 plugins/ ........................ Feature extensions
│   └── README.md
│
├── 📁 rules/ .......................... Behavior rules
│   └── README.md
│
├── 📁 memory/ ......................... Knowledge base
│   └── MEMORY.md
│
└── 📁 logs/ ........................... Logging config
    └── README.md
```

## Common Tasks

### Task: Add a code review command to keyboard shortcuts
1. Edit `keybindings.json`
2. Add entry under `keybindings` array
3. Key: `cmd+shift+r`, command: `/code-review --level medium`

### Task: Create a data pipeline validation loop
1. Add loop definition to `settings.json` or separate file
2. Interval: `30m`, Command: `/pipeline-check --validate`
3. Start with `/loop 30m /pipeline-check`

### Task: Set up GitHub integration
1. Review `mcp/README.md` - GitHub section
2. Add to `settings.json`: MCP server config
3. Set `GITHUB_TOKEN` in `settings.local.json`
4. Test: `claude mcp test --server github`

### Task: Define a module development workflow
1. Review `graphs/README.md` - SaaS Module Workflow section
2. Create workflow graph in `graphs/module-dev.yaml`
3. Define nodes: discover → generate → review → validate → deploy
4. Run: `/workflow --graph graphs/module-dev.yaml`

### Task: Add a pre-commit quality check
1. Edit `settings.json` → `hooks.pre-commit`
2. Add command: `/code-review --level medium --fix`
3. Automatically runs before each commit

### Task: Create a memory entry for a project insight
1. Review `memory/MEMORY.md` - Memory format
2. Create file: `memory/insight_name.md`
3. Add frontmatter with metadata
4. Save insight content

## Configuration Checklist

### Initial Setup
- [ ] Review `CONFIGURATION_GUIDE.md`
- [ ] Read `settings.json` documentation
- [ ] Review `keybindings.json` shortcuts
- [ ] Set up `settings.local.json` with credentials

### Feature Configuration
- [ ] Configure `agents/` for task types
- [ ] Define `skills/` for automation
- [ ] Set up `mcp/` integrations
- [ ] Create `rules/` for quality standards
- [ ] Define `loops/` for recurring tasks

### Workflow Setup
- [ ] Create workflow `graphs/` for processes
- [ ] Configure `hooks/` for events
- [ ] Set up `plugins/` for extensions
- [ ] Configure `logging/` for monitoring

### Operations
- [ ] Monitor `logs/` regularly
- [ ] Review `memory/` entries
- [ ] Update `rules/` as needed
- [ ] Customize `keybindings.json`

## Performance Tips

1. **Use appropriate log levels** - Set to `warn` for production
2. **Cache external data** - Enable cache with `cache-ttl: "1h"`
3. **Batch operations** - Group related tasks
4. **Monitor agent timeouts** - Adjust `agents.timeout` as needed
5. **Review memory regularly** - Archive old memories

## Security Checklist

- [ ] Never commit `settings.local.json` with credentials
- [ ] Rotate API tokens regularly
- [ ] Use IAM roles instead of long-lived tokens
- [ ] Enable secret detection in `settings.json`
- [ ] Audit MCP access in logs

## Getting Help

### Within Configuration
- Each directory has comprehensive `README.md`
- `CONFIGURATION_GUIDE.md` has troubleshooting
- `settings.json` is inline documented

### Within Claude Code
- `/help` - General help
- `/claude-code-guide` - SDK documentation
- `claude --help` - CLI reference

### Support Commands
```bash
claude mcp test --server <name>
claude loop list
claude rule list
claude mem search <query>
```

---

**Quick Links**
- [Configuration Guide](CONFIGURATION_GUIDE.md)
- [Main README](README.md)
- [Settings File](settings.json)
- [Keyboard Bindings](keybindings.json)

**Last Updated**: 2026-08-24
**Version**: 1.0
**Status**: Complete