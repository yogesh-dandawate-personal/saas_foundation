# Loops and Recurring Workflows

This directory contains definitions for autonomous and scheduled loops that run recurring tasks.

## Loop Types

### Dynamic Loops
Self-paced loops that determine their own cadence:
```bash
/loop /my-workflow-command
```
The model self-paces iterations based on work remaining.

### Interval Loops
Fixed-interval recurring tasks:
```bash
/loop 5m /check-status
/loop 1h /daily-summary
/loop 24h /weekly-review
```

### Scheduled Loops
Cron-style scheduled execution:
```bash
/schedule "0 9 * * *" /morning-briefing
```

### Conditional Loops
Run until a condition is met:
```bash
/loop /find-bugs --until-dry 2
```
Continue finding until 2 consecutive dry runs.

## Loop Examples

### Code Quality Monitoring
```bash
/loop 1h /code-review --level medium
```
Checks code every hour, auto-fixes issues.

### Data Pipeline Health
```bash
/loop 30m /pipeline-check --validate
```
Validates data pipeline integrity every 30 minutes.

### Documentation Sync
```bash
/loop 6h /doc-sync --validate
```
Keeps documentation in sync with code, 4x daily.

### Daily SaaS Briefing
```bash
/schedule "0 8 * * 1-5" /saas-daily-briefing
```
Runs weekdays at 8am with status summary.

### Weekly Architecture Review
```bash
/schedule "0 10 * * 1" /architecture-review
```
Runs Mondays at 10am with full architecture audit.

## Loop Configuration

### Execution Model
```json
{
  "loops": {
    "my-loop": {
      "command": "/check-status",
      "interval": "5m",
      "timeout": "10m",
      "max-iterations": 100,
      "on-error": "log-and-continue",
      "description": "Check system status every 5 minutes"
    }
  }
}
```

### Parameters
- `command` - Loop command to execute
- `interval` - Fixed interval (5m, 1h, etc)
- `cron` - Cron expression (for scheduled)
- `timeout` - Max time per iteration
- `max-iterations` - Stop after N iterations
- `on-error` - How to handle failures
- `description` - Purpose and details

### Error Handling
- `log-and-continue` - Log error, keep running
- `log-and-backoff` - Log, increase interval
- `stop-on-error` - Halt loop on failure
- `alert` - Send alert to user

## Loop Patterns

### Discovery Loops (Loop-Until-Dry)
```bash
/loop /find-bugs --report-format json
```
Continues finding issues until no new ones found in 2 consecutive runs.

### Accumulation Loops
```bash
/loop /collect-metrics --aggregate
```
Accumulates data until budget exhausted or limit reached.

### Polling Loops
```bash
/loop 30s /check-deployment-status
```
Polls external service at fixed interval.

### Autonomous Loops
```bash
/loop /babyist-prs
```
Self-paces iterations based on workload.

## SaaS Module Workflows

### Module Validation Loop
```bash
/loop 2h /module-validate --all
```
Validates all SPARC module specs every 2 hours.

### Epic Sync Loop
```bash
/loop 6h /epic-sync --jira
```
Keeps module epics in sync with Jira, 4x daily.

### Documentation Quality Loop
```bash
/loop 12h /doc-quality-check --fix
```
Checks doc quality and auto-fixes, twice daily.

## Data Engineering Workflows

### Pipeline Monitor Loop
```bash
/loop 15m /pipeline-monitor --alert-on-fail
```
Monitors data pipelines every 15 minutes.

### Schema Evolution Loop
```bash
/loop 1h /schema-validate --backwards-compat
```
Validates schema changes hourly.

### Data Quality Loop
```bash
/loop 30m /quality-check --report
```
Runs quality checks every 30 minutes with reports.

## Monitoring and Control

### View Active Loops
```bash
/loop list
```

### Stop a Loop
```bash
/loop stop [loop-id]
```

### View Loop Logs
```bash
tail -f .claude/logs/loops.log
```

### Loop Status
```json
{
  "loop-id": "pipeline-monitor",
  "status": "running",
  "iterations": 42,
  "last-run": "2026-08-24T15:30:00Z",
  "next-run": "2026-08-24T15:45:00Z",
  "error-rate": 0.02
}
```

## Best Practices

1. **Start with intervals** - Use fixed intervals before autonomous loops
2. **Use appropriate timeouts** - Allow enough time for work
3. **Monitor error rates** - Check logs regularly
4. **Set limits** - Use max-iterations to prevent runaway
5. **Document purpose** - Add clear descriptions
6. **Test locally first** - Run manually before scheduling
7. **Review logs** - Check `.claude/logs/` for issues

---

**Last Updated**: 2026-08-24