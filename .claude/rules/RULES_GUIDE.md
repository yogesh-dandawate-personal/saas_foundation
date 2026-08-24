# Rules and Behavior Guidelines

This directory contains rules that govern Claude Code behavior, automation decisions, and interaction patterns.

## Rule Types

### Automation Rules
Control when Claude automatically takes actions:
- Code formatting and linting
- Commit strategies
- Push policies
- Test execution

### Approval Rules
Define when user approval is required:
- Destructive operations
- Shared system changes
- External notifications
- Financial transactions

### Quality Rules
Enforce quality standards:
- Test coverage thresholds
- Code review requirements
- Documentation standards
- Performance benchmarks

### Safety Rules
Prevent risky operations:
- File deletion limits
- Branch protection
- Secret detection
- Resource limits

## Rule Format

### YAML Rules
```yaml
rule:
  id: rule-identifier
  name: Human readable name
  description: Detailed description
  
  trigger:
    event: file-changed | code-review | commit | deploy
    pattern: "**/*.ts"
    condition: "branch == 'main'"
  
  action:
    type: allow | require-approval | block
    execute: "command --with-args"
    
  override:
    role: admin
    force-flag: --force
```

### JSON Rules
```json
{
  "rule": {
    "id": "rule-id",
    "name": "Rule Name",
    "trigger": {
      "event": "commit",
      "pattern": "**/*.js"
    },
    "action": {
      "type": "require-approval",
      "message": "Production code changes require review"
    }
  }
}
```

## Example Rules

### Code Quality Rules

#### TypeScript Compilation Required
```yaml
rule:
  id: typescript-check
  name: Require TypeScript compilation
  trigger:
    event: file-changed
    pattern: "**/*.ts"
  action:
    type: require-approval
    execute: "tsc --noEmit"
    message: "TypeScript compilation must pass"
```

#### Test Coverage Threshold
```yaml
rule:
  id: coverage-threshold
  name: Maintain test coverage above 80%
  trigger:
    event: code-review
  action:
    type: require-approval
    execute: "jest --coverage"
    threshold: 80
```

#### Lint Before Commit
```yaml
rule:
  id: pre-commit-lint
  name: Lint code before commit
  trigger:
    event: commit
  action:
    type: allow
    execute: "eslint --fix"
    auto-stage: true
```

### Safety Rules

#### Protect Main Branch
```yaml
rule:
  id: main-branch-protection
  name: Prevent direct commits to main
  trigger:
    event: commit
    condition: "branch == 'main'"
  action:
    type: block
    message: "Direct commits to main are not allowed. Use pull requests."
```

#### Require Code Review
```yaml
rule:
  id: require-code-review
  name: Require code review before push
  trigger:
    event: pre-push
  action:
    type: require-approval
    threshold: 1
    message: "At least one code review is required"
```

#### Prevent Secret Leaks
```yaml
rule:
  id: secret-detection
  name: Detect and prevent secret commits
  trigger:
    event: commit
  action:
    type: block
    execute: "truffleHog filesystem ."
    message: "Potential secrets detected. Commit blocked."
```

#### File Deletion Confirmation
```yaml
rule:
  id: deletion-confirmation
  name: Require confirmation for file deletions
  trigger:
    event: file-changed
    condition: "file-deleted"
  action:
    type: require-approval
    message: "Please confirm file deletion"
```

### SaaS Module Rules

#### Module Spec Validation
```yaml
rule:
  id: sparc-validation
  name: Validate SPARC module specs
  trigger:
    event: file-changed
    pattern: "01_docs/Modules/*.md"
  action:
    type: require-approval
    execute: "claude module-spec --validate"
    message: "Module specs must pass SPARC validation"
```

#### Epic Consistency
```yaml
rule:
  id: epic-consistency
  name: Keep epics in sync with modules
  trigger:
    event: file-changed
    pattern: "01_docs/Modules/*.md"
  action:
    type: allow
    execute: "claude epic-sync"
    auto-commit: true
```

#### Documentation Completeness
```yaml
rule:
  id: module-doc-complete
  name: Require complete module documentation
  trigger:
    event: code-review
  action:
    type: require-approval
    checklist:
      - SPARC spec present
      - Dependencies documented
      - Example usage provided
      - Risks identified
```

### Data Engineering Rules

#### Schema Changes Require Review
```yaml
rule:
  id: schema-review
  name: Require review for schema changes
  trigger:
    event: file-changed
    pattern: "**/schemas/**/*.sql"
  action:
    type: require-approval
    execute: "claude schema-validate --backwards-compat"
    message: "Schema changes must be backwards compatible"
```

#### Pipeline Performance Testing
```yaml
rule:
  id: pipeline-perf-test
  name: Test pipeline performance before deployment
  trigger:
    event: pre-push
    pattern: "pipelines/**"
  action:
    type: require-approval
    execute: "pytest tests/pipelines/performance/"
    message: "Pipeline must pass performance tests"
```

#### Data Quality Checks
```yaml
rule:
  id: data-quality-check
  name: Run data quality checks
  trigger:
    event: commit
    pattern: "transformations/**"
  action:
    type: allow
    execute: "claude quality-check --auto-fix"
```

### Deployment Rules

#### Production Deployments
```yaml
rule:
  id: prod-deployment
  name: Require approval for production deploys
  trigger:
    event: deploy
    condition: "environment == 'production'"
  action:
    type: require-approval
    threshold: 2
    roles: [admin, lead]
    message: "Production deployments require 2 approvals from admin/lead"
```

#### Staged Rollout
```yaml
rule:
  id: staged-rollout
  name: Deploy to staging first
  trigger:
    event: deploy
    condition: "environment == 'production'"
  action:
    type: block
    execute: "deploy --environment staging --wait 24h"
    message: "Must deploy to staging first and wait 24 hours"
```

## Rule Management

### List All Rules
```bash
claude rule list
```

### Enable/Disable Rule
```bash
claude rule enable rule-id
claude rule disable rule-id
```

### Test Rule
```bash
claude rule test rule-id --scenario "file-changed"
```

### View Rule Details
```bash
claude rule show rule-id
```

### Override Rule
```bash
git commit --force-override-rule
```

## Rule Precedence

1. **Critical Safety Rules** - Always enforced
2. **Project-Specific Rules** - Team decisions
3. **Personal Preferences** - Individual overrides

## Best Practices

1. **Start permissive** - Add restrictive rules as needed
2. **Document intent** - Clear descriptions matter
3. **Make rules clear** - No ambiguous conditions
4. **Test automation** - Verify rules work as intended
5. **Provide escape hatches** - Allow overrides with justification
6. **Monitor compliance** - Track rule violations
7. **Review regularly** - Update rules as practices evolve
8. **Communicate changes** - Notify team of new rules

## Rule Examples by Role

### Developer
```yaml
# Format on save, lint on commit, test before push
- typescript-check
- pre-commit-lint
- sparc-validation
```

### Code Reviewer
```yaml
# Ensure quality standards
- coverage-threshold
- module-doc-complete
- secret-detection
```

### DevOps/SRE
```yaml
# Deployment and infrastructure
- prod-deployment
- staged-rollout
- schema-review
```

### Team Lead
```yaml
# Team standards and best practices
- main-branch-protection
- require-code-review
- epic-consistency
```

---

**Last Updated**: 2026-08-24