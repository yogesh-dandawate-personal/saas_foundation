# MCP (Model Context Protocol) Integrations

This directory contains configurations for MCP servers that integrate external services and data sources with Claude Code.

## MCP Overview

MCP servers enable:
- **External APIs**: GitHub, Jira, Linear, etc.
- **Databases**: SQL, NoSQL, data warehouses
- **Cloud Services**: AWS, GCP, Azure
- **Custom Tools**: Internal systems and services
- **Knowledge Systems**: Documentation, wikis, search

## MCP Server Configuration

### Format
```json
{
  "mcpServers": {
    "server-name": {
      "command": "path/to/executable",
      "args": ["arg1", "arg2"],
      "env": {
        "VAR_NAME": "value"
      },
      "disabled": false
    }
  }
}
```

## Available MCP Servers

### Built-in Servers
- `claude-mem` - Memory and knowledge management
- `project-manager` - Project tracking

### External Integrations

#### GitHub (git operations)
```json
{
  "github": {
    "command": "mcp-github",
    "env": {
      "GITHUB_TOKEN": "ghp_..."
    }
  }
}
```
**Tools**: List repos, create issues, manage PRs, access code

#### Jira (project management)
```json
{
  "jira": {
    "command": "mcp-jira",
    "env": {
      "JIRA_URL": "https://your-jira.atlassian.net",
      "JIRA_TOKEN": "..."
    }
  }
}
```
**Tools**: Create epics, stories, manage sprints

#### Linear (issue tracking)
```json
{
  "linear": {
    "command": "mcp-linear",
    "env": {
      "LINEAR_API_KEY": "..."
    }
  }
}
```
**Tools**: Issue creation, status updates, team management

#### AWS (cloud operations)
```json
{
  "aws": {
    "command": "mcp-aws",
    "args": ["--region", "us-east-1"],
    "env": {
      "AWS_ACCESS_KEY": "...",
      "AWS_SECRET_KEY": "..."
    }
  }
}
```
**Tools**: EC2, S3, Lambda, RDS, CloudWatch

#### PostgreSQL (database)
```json
{
  "postgres": {
    "command": "mcp-postgres",
    "env": {
      "DATABASE_URL": "postgresql://user:pass@localhost/db"
    }
  }
}
```
**Tools**: Execute queries, inspect schema, migrations

#### Slack (communication)
```json
{
  "slack": {
    "command": "mcp-slack",
    "env": {
      "SLACK_TOKEN": "xoxb-..."
    }
  }
}
```
**Tools**: Send messages, read channels, create threads

### SaaS-Specific Integrations

#### Module Documentation System
```json
{
  "module-docs": {
    "command": "mcp-module-docs",
    "args": ["--base-path", "01_docs/Modules"],
    "env": {
      "SPARC_VALIDATOR": "true"
    }
  }
}
```
**Tools**: 
- Validate SPARC specs
- Generate module indexes
- Cross-reference modules
- Extract requirements

#### Epic Management
```json
{
  "epic-manager": {
    "command": "mcp-epic-manager",
    "args": ["--source", "01_docs/jira"],
    "env": {
      "JIRA_INTEGRATION": "true"
    }
  }
}
```
**Tools**:
- Create epics from specs
- Sync documentation
- Generate story breakdowns
- Track dependencies

### Data Engineering Integrations

#### Data Catalogue
```json
{
  "data-catalog": {
    "command": "mcp-data-catalog",
    "env": {
      "CATALOG_URL": "https://catalog.internal"
    }
  }
}
```
**Tools**: Schema discovery, lineage tracking, ownership

#### Pipeline Orchestrator
```json
{
  "pipeline-orch": {
    "command": "mcp-pipeline-orchestrator",
    "env": {
      "AIRFLOW_URL": "...",
      "AIRFLOW_TOKEN": "..."
    }
  }
}
```
**Tools**: Trigger runs, monitor pipelines, view logs

## Configuration in settings.json

```json
{
  "mcpServers": {
    "github": {
      "command": "mcp-github",
      "env": {"GITHUB_TOKEN": "..."}
    },
    "jira": {
      "command": "mcp-jira",
      "env": {
        "JIRA_URL": "...",
        "JIRA_TOKEN": "..."
      }
    },
    "postgres": {
      "command": "mcp-postgres",
      "env": {"DATABASE_URL": "..."}
    },
    "slack": {
      "command": "mcp-slack",
      "env": {"SLACK_TOKEN": "..."}
    }
  }
}
```

## Environment Variables

Store sensitive credentials in:
1. **settings.local.json** (not committed)
2. **OS environment variables**
3. **.env file** (if configured)

### Example: settings.local.json
```json
{
  "mcpServers": {
    "github": {
      "env": {
        "GITHUB_TOKEN": "ghp_xxxxxxxxxxxx"
      }
    },
    "jira": {
      "env": {
        "JIRA_TOKEN": "ATATT3xxxxxxxxxxxxxyyy"
      }
    }
  }
}
```

## Usage in Workflows

### From Agent Prompts
```javascript
// GitHub: List repositories
const repos = await agent('List all GitHub repositories');

// Jira: Create epic
const epic = await agent('Create Jira epic for Authentication module');

// Slack: Send notification
const msg = await agent('Send Slack message to #engineering');
```

### Direct Tool Calls
```javascript
// Query database
const result = await tool('postgres', 'query', {
  sql: 'SELECT * FROM users WHERE active = true'
});

// AWS operations
await tool('aws', 'invoke-lambda', {
  function: 'process-data',
  payload: {...}
});
```

## Security Best Practices

1. **Never commit secrets** - Use settings.local.json
2. **Rotate tokens regularly** - Update credentials
3. **Use IAM roles when possible** - Avoid long-lived tokens
4. **Audit access** - Monitor MCP usage logs
5. **Limit scopes** - Grant minimal permissions
6. **Encrypt storage** - Protect credentials at rest

## Troubleshooting

### MCP Server Not Connecting
```bash
# Check if server is running
ps aux | grep mcp

# View MCP logs
tail -f .claude/logs/mcp.log

# Test connection
claude mcp test --server github
```

### Authentication Errors
```bash
# Verify token is set
echo $GITHUB_TOKEN

# Update in settings.local.json
claude --config settings.local.json
```

### Permission Denied
- Check token scope/permissions
- Verify API endpoint is correct
- Check firewall/network access

## Example: Complete Setup

```json
{
  "mcpServers": {
    "github": {
      "command": "mcp-github"
    },
    "jira": {
      "command": "mcp-jira"
    },
    "postgres": {
      "command": "mcp-postgres"
    },
    "slack": {
      "command": "mcp-slack"
    },
    "aws": {
      "command": "mcp-aws",
      "args": ["--region", "us-east-1"]
    },
    "module-docs": {
      "command": "mcp-module-docs",
      "args": ["--base-path", "01_docs/Modules"]
    },
    "epic-manager": {
      "command": "mcp-epic-manager",
      "args": ["--source", "01_docs/jira"]
    }
  }
}
```

---

**Last Updated**: 2026-08-24