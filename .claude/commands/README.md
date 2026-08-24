# Custom Commands

This directory contains custom CLI-style commands for Claude Code workflows.

## Command Types

### Development Commands
- `code-review` - Automated code review
- `test-run` - Run test suites
- `build` - Build project
- `deploy` - Deploy to environment

### Documentation Commands
- `doc-generate` - Generate documentation
- `doc-sync` - Sync documentation
- `module-spec` - Generate SPARC module specs

### Data Commands
- `pipeline-validate` - Validate data pipelines
- `schema-generate` - Generate data schemas
- `data-quality-check` - Run quality checks

### Graph Commands
- `workflow-create` - Create workflow graphs
- `workflow-visualize` - Visualize processes
- `dependency-map` - Map dependencies

## Command Format

Each command has:
- **Name**: Short, kebab-case identifier
- **Trigger**: `/name` or `claude name`
- **Description**: One-line purpose
- **Inputs**: Parameters and options
- **Outputs**: Result format
- **Error Handling**: Failure modes and recovery

## Example Commands

### Code Review
```
/code-review [--level low|medium|high|ultra] [--fix] [--comment] [path]
```
- Level: Review depth
- Fix: Auto-apply findings
- Comment: Post PR comments
- Path: Target file or directory

### Module Documentation
```
/module-spec [--format sparc|markdown|json] [module-name]
```
- Format: Output format
- Module: Module to document

### Data Pipeline
```
/pipeline-check [--validate] [--fix] [pipeline-id]
```
- Validate: Check integrity
- Fix: Auto-fix issues
- Pipeline: Pipeline identifier

### Workflow Graph
```
/workflow-viz [--output mermaid|svg|json] [process-name]
```
- Output: Graph format
- Process: Process to visualize

## Hook Integration

Commands can be triggered by:
- Direct CLI invocation
- Commit hooks (pre-commit, pre-push)
- File watching (on-save)
- Scheduled loops
- Manual invocation via `/command`

## Usage

### Direct
```bash
claude code
/code-review --level high
```

### In Workflows
```javascript
await agent('prompt', {command: 'code-review'})
```

### In Hooks
```json
{
  "hooks": {
    "pre-commit": "claude code-review --fix --level medium"
  }
}
```

---

**Last Updated**: 2026-08-24