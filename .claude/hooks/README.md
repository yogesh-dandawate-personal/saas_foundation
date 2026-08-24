# Hooks and Automation

This directory defines automation rules and hooks that trigger Claude-driven workflows.

## Hook Types

### Git Hooks
- `pre-commit` - Before committing changes
- `post-commit` - After commit created
- `pre-push` - Before pushing to remote
- `post-push` - After push completes

### File Hooks
- `on-save` - When files are saved
- `on-change` - When files change
- `on-create` - When new files created
- `on-delete` - When files deleted

### Time Hooks
- `on-schedule` - Cron-style triggers
- `on-interval` - Recurring intervals
- `on-startup` - When session starts
- `on-shutdown` - When session ends

### Event Hooks
- `on-pr-open` - Pull request created
- `on-pr-comment` - Comment on PR
- `on-issue-open` - Issue created
- `on-test-fail` - Test failure

## Automation Examples

### Pre-commit Hook
```json
{
  "hooks": {
    "pre-commit": {
      "stage": "format and lint all changed files",
      "command": "/code-review --level medium --fix",
      "on-failure": "warn"
    }
  }
}
```

### On-save Hook
```json
{
  "hooks": {
    "on-save": {
      "pattern": "**/*.ts",
      "stage": "type-check TypeScript files",
      "command": "tsc --noEmit",
      "on-failure": "ignore"
    }
  }
}
```

### Scheduled Hook
```json
{
  "hooks": {
    "on-schedule": {
      "cron": "0 9 * * 1-5",
      "stage": "daily code quality check",
      "command": "/code-review --level high",
      "description": "Run daily quality check at 9am weekdays"
    }
  }
}
```

### Data Pipeline Hook
```json
{
  "hooks": {
    "on-change": {
      "pattern": "**/schemas/**/*.sql",
      "stage": "validate data schemas",
      "command": "/pipeline-check --validate",
      "on-failure": "block"
    }
  }
}
```

## Hook Configuration

### Trigger Patterns
- `pattern` - File glob patterns
- `cron` - Cron expression
- `event` - Git or system event
- `condition` - Boolean expression

### Execution
- `stage` - Named phase in workflow
- `command` - Command to execute
- `agent` - Agent type to use
- `timeout` - Max execution time

### Failure Handling
- `on-failure: block` - Prevent action (hard fail)
- `on-failure: warn` - Log warning, allow
- `on-failure: ignore` - Silent failure
- `on-failure: retry` - Retry with backoff

## Best Practices

1. **Keep hooks fast** - Use `level: low` for code review
2. **Be specific** - Use precise file patterns
3. **Handle failures** - Define appropriate failure modes
4. **Document purpose** - Add description field
5. **Monitor logs** - Check `logs/hooks.log`

## Examples from SaaS Development

### Module Documentation Validation
```json
{
  "on-change": {
    "pattern": "**/Modules/*.md",
    "command": "claude module-spec --validate",
    "on-failure": "warn"
  }
}
```

### Epic File Integrity
```json
{
  "on-change": {
    "pattern": "**/jira/*.md",
    "command": "claude epic-validate",
    "on-failure": "block"
  }
}
```

### Pre-push Quality
```json
{
  "pre-push": {
    "stage": "pre-push quality check",
    "command": "/code-review --level high",
    "on-failure": "warn"
  }
}
```

---

**Last Updated**: 2026-08-24