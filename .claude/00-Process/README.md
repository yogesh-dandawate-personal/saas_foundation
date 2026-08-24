# 00-Process: Claude Code Development Processes

This directory contains guides and documentation for development processes using Claude Code.

## Contents

### 📖 VIBE_CODING_GUIDE.html
Interactive, beautifully formatted HTML guide to vibe coding. Open in a browser for the full visual experience.

**Features:**
- Light/dark theme toggle
- Comprehensive sections with examples
- Real-world case studies
- Best practices and anti-patterns
- Mental models and patterns
- Challenge handling guide
- Interactive navigation

**Open it:** Open `VIBE_CODING_GUIDE.html` in your browser.

### 📝 VIBE_CODING.md
Markdown version of the vibe coding guide for terminal/editor reading.

**Includes:**
- What is vibe coding
- The workflow (8 steps)
- Core principles
- When to use vibe coding
- Best practices
- Common patterns
- Real examples
- Getting started

**Read it:** `cat VIBE_CODING.md` or open in your editor.

### 📄 README.md
This file. Index of process documentation.

---

## What is Vibe Coding?

**Vibe coding** is a development approach where you work in a conversational flow with Claude Code, letting momentum and intuition guide your application development.

Instead of: Plan → Design → Code → Test

You: Describe → Discuss → Build → Test → Iterate

---

## Quick Start

1. **Read:** Open `VIBE_CODING_GUIDE.html` in a browser (recommended) or read `VIBE_CODING.md`
2. **Understand:** The key is conversational flow, not command-driven development
3. **Try:** Pick a feature, start talking to Claude, build in small steps
4. **Test:** Use `/run` to see your code working after each change
5. **Commit:** Checkpoint progress regularly

---

## Key Concepts

### 🎯 The Flow
```
Idea → Conversation → Build → Test → Learn → Refine → Repeat
```

### 📍 The Mindset
- Think out loud, not in commands
- Build incrementally, test frequently
- Let architecture emerge
- Stay in the flow
- Real feedback beats theory

### 🔧 The Tools
- `/run` - See your app working
- `/code-review` - Quick quality checks
- `git commit` - Checkpoint progress
- `claude mem` - Remember patterns
- `/loop` - Autonomous tasks

---

## Processes Documented

### Vibe Coding
How to build applications through conversational, iterative development with Claude Code.

**Best for:**
- New features
- Exploration and learning
- Rapid prototyping
- MVPs and startups
- Discovering solutions

**Use alongside:** Structured planning for large systems.

---

## When to Use Each Guide

### Use VIBE_CODING_GUIDE.html when...
- You want visual, interactive learning
- You prefer a browser experience
- You want theme toggle (light/dark mode)
- You're exploring the concepts deeply

### Use VIBE_CODING.md when...
- You're in the terminal
- You prefer plain text
- You want to grep/search easily
- You need quick reference

---

## Adding More Processes

To add a new process to this directory:

1. **Create guide file(s)**
   - `PROCESS_NAME.md` for markdown version
   - `PROCESS_NAME.html` for interactive version (optional)

2. **Add to this README.md**
   - Link and description
   - When to use
   - Key concepts

3. **Commit to git**
   ```bash
   git add .claude/00-Process/
   git commit -m "Add process: [name]"
   git push
   ```

---

## The Philosophy

These processes aren't rigid prescriptions. They're **frameworks and mental models** that work well with Claude Code's capabilities.

**Vibe coding works because:**
- Claude can understand context and intent
- Iterative feedback is instant
- You can see code working in real-time
- Conversation beats documentation for discovery
- Flow state is productive state

Use these guides as inspiration, not dogma. Adapt them to your style.

---

## Tips for Better Vibe Coding

1. **Stay conversational** - Describe, don't command
2. **Test early and often** - `/run` is your friend
3. **Commit frequently** - Every feature, every refinement
4. **Think in flows** - Build → Test → Learn → Build
5. **Use keyboard shortcuts** - Set up common commands
6. **Keep the loop tight** - Minimize context switches
7. **Document as you go** - Not after
8. **Share progress** - External feedback helps

---

## Resources

- [VIBE_CODING_GUIDE.html](VIBE_CODING_GUIDE.html) - Interactive guide
- [VIBE_CODING.md](VIBE_CODING.md) - Markdown reference
- [../.claude/](../) - Main configuration directory
- [../CONFIGURATION_GUIDE.md](../CONFIGURATION_GUIDE.md) - Claude Code setup
- [../PERMISSIONS_GUIDE.md](../PERMISSIONS_GUIDE.md) - Permission allowlists

---

**Last Updated:** 2026-08-24  
**Part of:** SaaS Foundation Claude Code Configuration  
**Philosophy:** Flow over planning, iteration over perfection, conversation over commands