# Logs and Monitoring

This directory contains logging configuration and log files for Claude Code workflows.

## Log Files

### Application Logs
- `claude.log` - Main Claude Code application logs
- `commands.log` - Command execution logs
- `hooks.log` - Automation hook logs
- `workflows.log` - Workflow execution logs
- `agents.log` - Agent activity logs

### Feature-Specific Logs
- `loops.log` - Recurring loop logs
- `mcp.log` - MCP integration logs
- `rules.log` - Rule enforcement logs
- `memory.log` - Memory system logs
- `plugins.log` - Plugin activity logs

### Operation Logs
- `git.log` - Git operations
- `deployments.log` - Deployment logs
- `errors.log` - Error tracking
- `performance.log` - Performance metrics

## Logging Configuration

### Format
```json
{
  "logging": {
    "level": "info | debug | warn | error",
    "format": "json | text | structured",
    "output": {
      "console": true,
      "files": true,
      "remote": false
    },
    "rotation": {
      "max-size": "100MB",
      "max-files": 10,
      "retention": "30d"
    }
  }
}
```

### Log Levels

#### DEBUG
- Detailed diagnostic information
- Variable values, flow paths
- Use for troubleshooting

#### INFO
- General informational messages
- Task completion, status updates
- Normal operation logging

#### WARN
- Warning conditions
- Non-critical failures, deprecations
- Attention needed but not blocking

#### ERROR
- Error conditions
- Critical failures, stack traces
- Requires investigation

### Log Format Options

#### JSON Format
```json
{
  "timestamp": "2026-08-24T15:30:45.123Z",
  "level": "INFO",
  "component": "workflow",
  "message": "Workflow completed",
  "metadata": {
    "workflow-id": "wf_abc123",
    "duration": "45s",
    "status": "success"
  }
}
```

#### Text Format
```
[2026-08-24 15:30:45] INFO [workflow] Workflow completed (wf_abc123) - 45s
```

#### Structured Format
```
timestamp=2026-08-24T15:30:45Z level=INFO component=workflow message="Workflow completed" workflow_id=wf_abc123 duration=45s
```

## Configuration

### settings.json
```json
{
  "logging": {
    "level": "info",
    "format": "json",
    "output": {
      "console": true,
      "files": true
    },
    "rotation": {
      "max-size": "100MB",
      "max-files": 10,
      "retention": "30d"
    },
    "components": {
      "claude": "info",
      "workflows": "debug",
      "hooks": "info",
      "mcp": "warn",
      "memory": "info"
    }
  }
}
```

## Viewing Logs

### Real-time Log Streaming
```bash
# Main logs
tail -f .claude/logs/claude.log

# Workflow logs
tail -f .claude/logs/workflows.log

# All logs
tail -f .claude/logs/*.log
```

### Search Logs
```bash
# Find errors
grep ERROR .claude/logs/*.log

# Find specific workflow
grep "wf_abc123" .claude/logs/workflows.log

# Time range
grep "2026-08-24 15" .claude/logs/claude.log
```

### Log Analysis
```bash
# Count events by level
grep -o "level=[A-Z]*" .claude/logs/claude.log | sort | uniq -c

# Find slowest operations
grep "duration=" .claude/logs/workflows.log | sort -t= -k2 -nr | head -10

# Track errors over time
grep ERROR .claude/logs/errors.log | cut -d' ' -f1 | uniq -c
```

## Log Rotation

### Automatic Rotation
- Triggered when log reaches max-size
- Max files kept (default: 10)
- Retention period (default: 30 days)

### Manual Rotation
```bash
# Archive current logs
claude logs rotate

# Clear old logs
claude logs cleanup --older-than 30d

# Archive to external storage
claude logs archive --output archive.tar.gz
```

## Monitoring

### Log Levels Over Time
```bash
# Daily summary
for file in .claude/logs/*.log; do
  echo "=== $file ==="
  grep "level=" "$file" | cut -d= -f2 | cut -d' ' -f1 | sort | uniq -c
done
```

### Performance Tracking
```bash
# Slowest operations
grep "duration=" .claude/logs/workflows.log | \
  awk -F'duration=' '{print $2}' | sort -nr | head -5
```

### Error Rate
```bash
# Error percentage
total=$(wc -l < .claude/logs/claude.log)
errors=$(grep ERROR .claude/logs/claude.log | wc -l)
echo "Error rate: $((errors * 100 / total))%"
```

## Integration

### Centralized Logging
Configure remote log shipping:
```json
{
  "logging": {
    "output": {
      "remote": true,
      "endpoint": "https://logs.internal/api",
      "batch": {
        "size": 100,
        "interval": "5s"
      }
    }
  }
}
```

### Datadog Integration
```json
{
  "logging": {
    "integrations": {
      "datadog": {
        "enabled": true,
        "api-key": "dd_xxxx",
        "site": "datadoghq.com"
      }
    }
  }
}
```

### Slack Alerts
```json
{
  "logging": {
    "alerts": {
      "slack": {
        "enabled": true,
        "webhook": "https://hooks.slack.com/...",
        "levels": ["ERROR"],
        "channel": "#alerts"
      }
    }
  }
}
```

## Log Examples

### Workflow Execution
```json
{
  "timestamp": "2026-08-24T15:30:45.123Z",
  "level": "INFO",
  "component": "workflows",
  "message": "Workflow started",
  "workflow": {
    "id": "wf_module_dev",
    "name": "SaaS Module Development",
    "phase": "spec-generation"
  }
}
```

### Hook Execution
```json
{
  "timestamp": "2026-08-24T15:31:15.456Z",
  "level": "INFO",
  "component": "hooks",
  "message": "Hook executed",
  "hook": {
    "event": "file-changed",
    "pattern": "*.md",
    "action": "validate",
    "status": "success",
    "duration": "2.5s"
  }
}
```

### MCP Integration
```json
{
  "timestamp": "2026-08-24T15:32:00.789Z",
  "level": "DEBUG",
  "component": "mcp",
  "message": "MCP call",
  "server": "github",
  "method": "list_repositories",
  "status": "success",
  "latency_ms": 245
}
```

### Error Log
```json
{
  "timestamp": "2026-08-24T15:33:30.123Z",
  "level": "ERROR",
  "component": "workflows",
  "message": "Workflow failed",
  "error": {
    "type": "TimeoutError",
    "message": "Agent timeout after 30s",
    "stack": "..."
  },
  "workflow": {
    "id": "wf_abc123",
    "recovery": "automatic_retry_scheduled"
  }
}
```

## Best Practices

1. **Appropriate levels** - Use correct log level
2. **Structured logging** - Include relevant context
3. **Monitor regularly** - Check logs for issues
4. **Clean up old logs** - Respect retention policies
5. **Alert on errors** - Setup critical alerts
6. **Performance tracking** - Monitor workflow durations
7. **Sensitive data** - Never log credentials or secrets
8. **Log aggregation** - Centralize logs for analysis

## Troubleshooting

### Logs not appearing
- Check log level is not too high
- Verify file permissions on log directory
- Check disk space availability

### Performance degradation
- Reduce log level (info → warn)
- Increase log rotation size
- Disable remote logging if slow

### Disk space issues
- Reduce retention period
- Lower max-size per log file
- Archive old logs to external storage

---

**Last Updated**: 2026-08-24