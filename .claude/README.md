# Claude Code Configuration Directory

This `.claude` folder contains the complete configuration for Claude Code engineering workflows, including agents, skills, loops, hooks, MCP integrations, and memory management.

## Structure

```
.claude/
├── settings.json           # Main configuration file
├── settings.local.json     # Local overrides (not committed)
├── keybindings.json       # Custom keyboard shortcuts
├── agents/                 # Custom agent definitions
├── skills/                 # Reusable skill definitions
├── commands/               # Custom CLI commands
├── hooks/                  # Automation and event hooks
├── loops/                  # Recurring workflow definitions
├── graphs/                 # Workflow graphs and orchestrations
├── mcp/                    # MCP server configurations
├── plugins/                # Plugin configurations
├── rules/                  # Behavior and automation rules
├── memory/                 # Knowledge base and memories
├── logs/                   # Logging configuration
└── README.md               # This file
```

## Quick Start

### Enable Features
- **Loops**: Define recurring tasks in `loops/`
- **Skills**: Add custom workflows in `skills/`
- **Agents**: Create specialized agents in `agents/`
- **Hooks**: Automate actions in `hooks/`
- **MCP**: Connect external services in `mcp/`

### Key Files

#### `settings.json`
Main configuration for permissions, hooks, environment variables, and feature flags.

#### `keybindings.json`
Custom keyboard shortcuts for frequently used commands.

#### Memory System
The `memory/` folder uses the persistent memory system. See `memory/MEMORY.md` for structure.

## Architecture

### Graph Engineering Process
This setup supports graph-based workflow orchestration:
1. **Workflows** - Multi-phase, agent-driven processes
2. **Loops** - Recurring tasks with autonomous execution
3. **Skills** - Reusable workflow commands
4. **Agents** - Specialized task executors
5. **MCP** - External service integrations

### Multi-Disciplinary Workflows
Configured for:
- SaaS/Product Development
- Data Engineering
- Cross-functional Collaboration

## Documentation

Each subdirectory contains:
- Unique guide file (e.g., `AGENTS_GUIDE.md`, `SKILLS_GUIDE.md`)
- Example configurations
- Best practices

## Environment

- **Model**: Claude Haiku 4.5 (optimized)
- **Budget**: Configured in settings.json
- **Permissions**: Allowlist configured per workspace needs
- **Memory**: Persistent across sessions

---

**Last Updated**: 2026-08-24
**Version**: 1.0