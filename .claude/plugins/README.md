# Plugins

This directory contains plugin configurations that extend Claude Code functionality.

## Plugin Types

### Built-in Plugins
- `claude-mem` - Memory and knowledge management
- `claude-code-guide` - Claude Code documentation
- `claude-api` - Claude API reference

### Custom Plugins

Plugins can extend:
- **Commands** - Add new `/command` syntax
- **Workflows** - Add workflow capabilities
- **Tools** - Wrap or extend tools
- **UI** - Add terminal/IDE features
- **Integration** - Connect external services

## Plugin Configuration

### Format
```json
{
  "plugins": {
    "plugin-name": {
      "enabled": true,
      "config": {
        "option1": "value1",
        "option2": "value2"
      }
    }
  }
}
```

## Available Plugins

### Memory Plugin (`claude-mem`)
Persistent knowledge management:
- Automatic memory saving
- Cross-session recall
- Structured knowledge bases
- Memory search capabilities

**Configuration:**
```json
{
  "claude-mem": {
    "enabled": true,
    "config": {
      "auto-save": true,
      "max-memories": 1000,
      "cleanup-interval": "7d"
    }
  }
}
```

### SaaS Module Plugin
Module documentation management:
- SPARC spec validation
- Cross-module dependency tracking
- Automatic index generation
- Epic synchronization

**Configuration:**
```json
{
  "saas-modules": {
    "enabled": true,
    "config": {
      "base-path": "01_docs/Modules",
      "auto-validate": true,
      "generate-indexes": true,
      "jira-sync": true
    }
  }
}
```

### Data Pipeline Plugin
Pipeline management and monitoring:
- Schema validation
- Pipeline visualization
- Quality monitoring
- Lineage tracking

**Configuration:**
```json
{
  "data-pipelines": {
    "enabled": true,
    "config": {
      "catalog-url": "https://catalog.internal",
      "monitor-interval": "30m",
      "alert-on-failure": true
    }
  }
}
```

### Code Quality Plugin
Continuous code analysis:
- Automated code review
- Test coverage tracking
- Dependency audits
- Performance monitoring

**Configuration:**
```json
{
  "code-quality": {
    "enabled": true,
    "config": {
      "review-level": "medium",
      "auto-fix": true,
      "track-coverage": true,
      "audit-dependencies": true
    }
  }
}
```

## Plugin Development

### Structure
```
my-plugin/
├── plugin.json
├── index.js
├── commands/
│   └── my-command.js
├── workflows/
│   └── my-workflow.js
└── README.md
```

### plugin.json
```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "Plugin description",
  "author": "Your Name",
  "commands": [
    {
      "name": "my-command",
      "description": "Command description",
      "triggers": ["my-cmd", "mycommand"],
      "help": "Usage and examples"
    }
  ],
  "workflows": [
    {
      "name": "my-workflow",
      "description": "Workflow description"
    }
  ],
  "config": {
    "option1": {
      "type": "string",
      "default": "value",
      "description": "Option description"
    }
  }
}
```

### index.js
```javascript
module.exports = {
  name: 'my-plugin',
  
  async onLoad(context) {
    // Initialize plugin
    console.log('Plugin loaded');
  },
  
  async onCommand(name, args, context) {
    // Handle command
    return result;
  },
  
  async onWorkflow(name, params, context) {
    // Handle workflow
    return result;
  },
  
  async onUnload(context) {
    // Cleanup
  }
}
```

## Plugin Examples

### Workflow Graph Visualizer
```json
{
  "graph-visualizer": {
    "enabled": true,
    "config": {
      "output-formats": ["mermaid", "svg", "json"],
      "auto-layout": true
    }
  }
}
```

### Automated Release Manager
```json
{
  "release-manager": {
    "enabled": true,
    "config": {
      "auto-changelog": true,
      "tag-format": "v{version}",
      "bump-strategy": "semver"
    }
  }
}
```

### Team Communication Bridge
```json
{
  "team-bridge": {
    "enabled": true,
    "config": {
      "slack-integration": true,
      "email-notifications": true,
      "status-updates": "1h"
    }
  }
}
```

### Compliance Checker
```json
{
  "compliance-checker": {
    "enabled": true,
    "config": {
      "frameworks": ["SOC2", "GDPR", "HIPAA"],
      "audit-frequency": "weekly",
      "auto-report": true
    }
  }
}
```

## Plugin Management

### Enable Plugin
```bash
claude plugin enable my-plugin
```

### Disable Plugin
```bash
claude plugin disable my-plugin
```

### List Plugins
```bash
claude plugin list
```

### View Plugin Info
```bash
claude plugin info my-plugin
```

### Update Configuration
```bash
claude plugin config my-plugin --option value
```

## Best Practices

1. **Minimize dependencies** - Keep plugins lightweight
2. **Clear configuration** - Document all options
3. **Error handling** - Graceful failure modes
4. **Performance** - Avoid blocking operations
5. **Testing** - Include plugin tests
6. **Documentation** - Clear README and examples
7. **Versioning** - Semantic versioning
8. **Logging** - Use structured logs

## Plugin Lifecycle

### Loading
1. Read plugin.json
2. Validate configuration
3. Execute onLoad()
4. Register commands
5. Register workflows

### Usage
1. User triggers command/workflow
2. Plugin processes request
3. Return result

### Unloading
1. Execute onUnload()
2. Cleanup resources
3. Remove registrations

---

**Last Updated**: 2026-08-24