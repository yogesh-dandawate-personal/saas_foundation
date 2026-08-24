# Permissions and Allowlist Guide

Optimized permission allowlist strategy for full-stack SaaS and data engineering workflows.

## Overview

The `settings.json` includes a comprehensive allowlist that eliminates permission prompts for common development tasks while maintaining security.

**Permissions Strategy**: Allow specific, safe commands with exact patterns rather than overly broad wildcards.

## Allowlist Categories

### 1. Git Operations (22 rules)
```bash
git add, git commit, git push, git pull
git branch, git checkout, git merge, git rebase
git status, git log
```

**Why**: Essential for version control and workflow. All read-only and reversible operations.

### 2. Node.js / TypeScript (11 rules)
```bash
npm install, npm run, npm start, npm test, npm build
npx, tsx, ts-node
tsc (TypeScript compiler)
```

**Why**: Standard development workflow. Package management and script execution.

### 3. Python (10 rules)
```bash
python, python3, python -m
pip, pip3, pip install
pytest, poetry
```

**Why**: Data engineering and script workflows. Testing and package management.

### 4. Databases (3 rules)
```bash
psql (PostgreSQL)
mysql
mongosh (MongoDB)
```

**Why**: Data pipeline and schema work. Query and migration operations.

### 5. Docker (8 rules)
```bash
docker ps, docker logs, docker exec
docker build, docker run, docker-compose
```

**Why**: Container management for services and deployments.

### 6. Code Quality (6 rules)
```bash
eslint, eslint --fix
prettier, prettier --write
black, ruff (Python linters)
```

**Why**: Automatic code formatting and linting. No harmful side effects.

### 7. Testing Frameworks (3 rules)
```bash
jest, mocha, vitest
pytest
```

**Why**: Running test suites. Safe, repeatable, non-destructive.

### 8. Build Tools (5 rules)
```bash
webpack, vite, esbuild, tsup
make (Makefile)
```

**Why**: Project compilation and bundling. Safe development tasks.

### 9. File Operations (16 rules)
```bash
cp, mv, rm, mkdir
cd, pwd, ls
find, grep, sed, awk
echo, cat, head, tail
```

**Why**: File management and inspection. Commonly needed utilities.

### 10. Network Operations (2 rules)
```bash
curl, wget
```

**Why**: Downloading resources, API testing. Common development tasks.

### 11. Claude Code (6 rules)
```bash
claude --version
claude loop, claude mem, claude plugin
claude rule, claude workflow
```

**Why**: Managing Claude Code itself. Essential for automation setup.

## Security Considerations

### What's NOT Allowed (Intentionally)
- ❌ `sudo` - Prevents privilege escalation
- ❌ `rm -rf /` - Prevents catastrophic deletion
- ❌ `dd` - Prevents disk manipulation
- ❌ `curl | bash` - Prevents arbitrary code execution
- ❌ `*` wildcards on dangerous commands

### Pattern Strategy
Each permission uses **specific command patterns** rather than blanket `*`:
- ✅ `git commit *` - Allow with any args
- ❌ `git *` - Too broad (includes git rm, git reset --hard)
- ✅ `npm run *` - Run any npm script safely
- ❌ `npm *` - Includes npm uninstall, which could break things

## Customization

### Add More Permissions
Edit `settings.json` → `permissions.allow`:

```json
"permissions": {
  "allow": [
    "Bash(mycommand *)",
    "Bash(mycommand --flag)"
  ]
}
```

### Add Project-Specific Rules
```json
"Bash(cargo *)",
"Bash(rustc *)",
"Bash(go run *)",
"Bash(java *)"
```

### Add File Operations
```json
"Read(**/*.json)",
"Edit(**/src/**/*.ts)",
"Write(**/config/**)"
```

## Testing Your Allowlist

### Test a Command
```bash
# This should NOT prompt
npm run build

# This SHOULD prompt (not in allowlist)
npm uninstall somepackage
```

### View Current Permissions
```bash
grep -A 100 '"permissions"' .claude/settings.json
```

### Reload Permissions
Permissions refresh automatically, but you can restart Claude Code to force reload.

## Common Workflows (No Prompts)

### Full Development Cycle
```bash
# All these work without permission prompts:
npm install
npm run dev
npm run build
npm test
eslint --fix src/
prettier --write src/
git add .
git commit -m "message"
git push
```

### Data Pipeline Development
```bash
# Python workflow
python3 -m venv venv
pip install -r requirements.txt
pytest tests/
python scripts/transform.py

# Database work
psql -h localhost -U user -d database
# (SQL commands in psql)

# Docker deployment
docker-compose up
docker logs -f service-name
```

### Module Development
```bash
# TypeScript module
tsx scripts/generate-module.ts
npm run build
npm test
git add .claude/
git commit -m "module update"
```

## Permission Levels

### Level 1: Read-Only (No Risk)
- `ls`, `cat`, `find`, `grep`
- `git status`, `git log`
- `node --version`

### Level 2: Safe Operations (Reversible)
- `npm install` (package.json controls what installs)
- `git commit`, `git push`
- `npm run build`, `npm test`
- `eslint --fix` (can be undone)

### Level 3: Potentially Destructive (But Specific)
- `rm -rf` - Specific path only, not `rm -rf /`
- `docker rm` - Must specify container
- `git reset` - Specific operations only

### Level 4: Never Allowed
- `sudo` - Privilege escalation
- `curl | bash` - Arbitrary code execution
- `dd`, `mkfs` - System destruction
- `rm *` - Pattern too broad

## Troubleshooting

### Permission Prompt When It Shouldn't Show
1. Check exact command you're running
2. Compare against allowlist patterns
3. Verify case sensitivity (bash is case-sensitive)
4. Restart Claude Code to reload permissions

Example:
```bash
# Works (allowed)
npm run test

# Prompts (not in allowlist)
npm run  test  (extra space)
NPM RUN TEST   (uppercase)
```

### Need a Command Not in Allowlist
1. Add to `settings.json` → `permissions.allow`
2. Use specific pattern, not `*` wildcard
3. Document why it's needed
4. Commit to `.claude/settings.json` for team

## Best Practices

1. **Be Specific**: Use exact patterns, not wildcards
2. **Be Safe**: Avoid dangerous commands entirely
3. **Be Documented**: Comment why each permission exists
4. **Be Consistent**: Follow the pattern strategy
5. **Be Minimal**: Only allow what you actually use

## Comparison: Before vs After

### Before (Lots of Prompts)
```
Running: npm install
❌ Permission prompt - Allow? (Bash: npm *)

Running: git commit
❌ Permission prompt - Allow? (Bash: git *)

Running: pytest
❌ Permission prompt - Allow? (Bash: pytest)
```

### After (No Prompts)
```
Running: npm install
✅ Auto-allowed (Bash: npm install)

Running: git commit
✅ Auto-allowed (Bash: git commit *)

Running: pytest
✅ Auto-allowed (Bash: pytest *)
```

## Team Configuration

### Share Safe Allowlist
The `settings.json` is committed to git, so the allowlist is shared with your team automatically.

### Override Locally
Edit `settings.local.json` for personal permissions (not committed):
```json
{
  "permissions": {
    "allow": [
      "Bash(my-custom-tool *)"
    ]
  }
}
```

### Review with Team
Discuss which commands should be auto-allowed before committing changes.

---

**Last Updated**: 2026-08-24
**Permissions Count**: 100+ specific rules
**Strategy**: Specific patterns over wildcards
**Security Level**: Production-ready