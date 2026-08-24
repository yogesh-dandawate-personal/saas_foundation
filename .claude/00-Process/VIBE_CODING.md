# Vibe Coding: Building Applications with Flow

## What is Vibe Coding?

Vibe coding is a development approach where you work in a **conversational flow** with Claude Code, letting momentum and intuition guide your application development rather than following rigid, pre-planned structures.

**Core Idea:** Instead of "plan first, code second," you **think out loud** with Claude, discover patterns as you go, and let the application architecture emerge naturally from the conversation.

### Key Characteristics
- Conversational and exploratory process
- Continuous feedback and iteration
- Architecture emerges from implementation
- Rapid prototyping and validation
- Natural flow with the AI assistant
- Responsive to discovery and learning
- Less upfront planning, more adaptive design

---

## The Vibe Coding Workflow

### 1. Start with a Vision (Not a Plan)
Describe the outcome you want, the problem you're solving, or the feeling you want to create.

**Example:** "I want to build a module that discovers and documents data sources automatically"

### 2. Have a Conversation
Talk through the approach with Claude. Ask questions. Explore options. Let Claude suggest patterns.

This is **dialogue**, not commands.

### 3. Build in Small Steps
Don't ask for the entire application at once. Build one feature, one component, one piece at a time.

Each step informs the next.

### 4. Test Continuously
Run the code after each meaningful addition. See what works, what breaks, what feels right.

Use `/run` to test the app in real-time.

### 5. Refine Based on Reality
Once you see the code working, ideas become clearer. Refine based on what you actually see.

### 6. Iterate the Loop
New feature → Build → Test → Learn → Refine → Next feature

Keep the cycle moving.

### 7. Commit Milestones
After each meaningful chunk (feature, refactor, milestone), commit to git.

Don't wait for perfection.

### 8. Share and Celebrate
Push to GitHub, share progress, get feedback.

Vibe coding benefits from external perspectives.

---

## Core Principles

### 💭 Think Out Loud
Describe what you're thinking, not just what you want built. Claude responds to direction, not commands.

### 🔄 Iterate Continuously
Each message is a step forward. Build, test, refine. Don't plan everything upfront.

### 🎨 Follow the Emergence
Let good ideas surface naturally. Be willing to change direction based on what you discover.

### ⚡ Move Fast
Vibe coding prioritizes momentum over perfection. Ship something, then refine.

### 🤝 Collaborate with Claude
You and Claude are a team. Leverage Claude's strengths: pattern recognition, code generation, problem-solving.

### 🔍 Stay in the Flow
Keep conversations focused. Don't switch contexts abruptly. Build momentum.

---

## When to Vibe Code

### ✅ Best For
- **🚀 Startups & MVPs** - Rapid iteration and discovery phase
- **🧪 Experiments** - Trying new technologies and patterns
- **📚 Learning** - Building while learning new domains
- **✨ Features** - New unexplored feature development
- **🎯 Prototypes** - Quick proof-of-concept builds

### ❌ Not For
- Large, well-defined enterprise projects
- Systems with fixed scope and strict deadlines
- Regulated applications requiring extensive documentation
- Large team coordination (use structured planning)
- Projects where upfront design is critical for success

---

## Vibe Coding vs Structured Planning

| Aspect | Vibe Coding 🎵 | Structured Planning 📋 |
|--------|---|---|
| Planning | Minimal, emerges as you build | Comprehensive upfront design |
| Timeline | Unknown, discovery-based | Estimated, fixed scope |
| Testing | Continuous, real-time feedback | Phase-based, formal QA |
| Flexibility | High, pivot quickly | Low, changes are expensive |
| Communication | Conversational with Claude | Formal requirements docs |
| Risk | Learn and adjust quickly | Mitigate upfront |
| Best For | Exploration, startups, features | Large systems, enterprises |

**Key Point:** Use **structured planning for large systems**, **vibe coding for features and exploration**. Many successful projects use both!

---

## Best Practices: DO ✓

- ✓ Think out loud and describe your reasoning
- ✓ Build incrementally, test frequently
- ✓ Embrace discovery and learning
- ✓ Ask "why" and "what if" questions
- ✓ Commit progress regularly to git
- ✓ Test features in the real app (/run)
- ✓ Share context and constraints clearly
- ✓ Be specific about what's working and what's not
- ✓ Refactor when patterns emerge
- ✓ Document decisions as you go

## Best Practices: DON'T ✗

- ✗ Ask for the entire application at once
- ✗ Over-specify before trying anything
- ✗ Ignore test failures or warnings
- ✗ Jump between completely different features
- ✗ Skip commits (git checkpoints matter)
- ✗ Go silent when things break
- ✗ Assume architecture without testing
- ✗ Avoid feedback and course correction
- ✗ Build in isolated branches for weeks
- ✗ Plan architecture in a vacuum

---

## Example: Vibe Coding a Feature

### You (Thinking Out Loud)
"I want to create a module that can automatically detect and document data schemas from raw data files. It should understand the structure, suggest data types, and identify potential issues."

### Claude (Collaborative Response)
"Great idea! I see a few approaches: 1) Scan files and infer schema, 2) Use statistical profiling, 3) Create a validation layer. Which resonates most?"

### You (Building Momentum)
"Let's start simple - sample a file, infer basic types (string, number, date), and generate a schema. Then add complexity."

### Claude (Implementation)
[Writes code for basic schema inference]
"Try running this with your test data."

### You (Testing & Learning)
`/run` → Test → "It works for CSV, but JSON needs a recursive parser. Can we add that?"

### Claude (Iteration)
[Adds JSON support, handles nesting]
"Now it handles both. Should we add auto-documentation?"

### You (Refining)
"Yes! And better error messages."

### Claude
[Adds documentation and error handling]
"Feature complete. Ready to commit!"

---

## Common Vibe Coding Patterns

### Pattern 1: The Iterative Build
**Scenario:** Building a new SaaS module  
**Approach:** Core logic → Validation → UI → Integration → Optimize  
**Vibe:** Each step is a conversation. After each step, test and ask "what's next?"

### Pattern 2: The Discovery Build
**Scenario:** Solving a problem you don't fully understand yet  
**Approach:** Prototype quickly → Understand the problem → Rebuild properly → Iterate  
**Vibe:** "Prototype first, understand second." Rapid spikes to learn.

### Pattern 3: The Feature Factory
**Scenario:** Building many similar features  
**Approach:** Build one fully → Extract pattern → Generate others → Customize each  
**Vibe:** "Build one beautifully, then scale it."

### Pattern 4: The Refactoring Flow
**Scenario:** Code is working but messy  
**Approach:** Extract patterns → Simplify → Test → Commit → Document  
**Vibe:** "Make this elegant." Refactor when you see the problem clearly.

### Pattern 5: The Learning Loop
**Scenario:** Building with unfamiliar technology  
**Approach:** Small example → Understand concept → Build feature → Master pattern  
**Vibe:** "Teach me as we build." Learn in context.

---

## Handling Challenges

### Challenge 1: "I Lost the Plot"
**Problem:** Too many conversations, unclear where you are

**Solution:**
1. Commit current state to git with clear message
2. Ask Claude to summarize progress
3. Refocus: "What's the next smallest step?"
4. Check `/run` to see actual app state

### Challenge 2: "Too Many Ideas"
**Problem:** Feature creep, trying to do everything at once

**Solution:**
1. Write ideas down in memory (`claude mem save`)
2. Focus on ONE feature to completion
3. Commit, then move to next
4. Vibe coding works best with laser focus per cycle

### Challenge 3: "Code Quality Sliding"
**Problem:** Moving fast means skipping tests or best practices

**Solution:**
1. Use `/code-review --level medium` regularly
2. Commit frequently (forces modularity thinking)
3. Run `/run` after each change
4. Refactor patterns when you see them

### Challenge 4: "Stuck on a Problem"
**Problem:** Something isn't working, feels stuck

**Solution:**
1. Step back and describe the actual error
2. Test a simpler version (spike approach)
3. Ask Claude: "What are other ways to solve this?"
4. Sometimes pivoting is faster than persisting

### Challenge 5: "Collaboration Friction"
**Problem:** Multiple people in repo, conflicting changes

**Solution:**
1. Use branches for features (`feature/my-feature`)
2. Commit and push frequently
3. Communicate: "I'm working on X"
4. Merge when feature is complete and tested

---

## Mental Models for Vibe Coding

### 🌊 The River, Not the Map
Don't plan the entire journey upfront. Wade into the river, feel the current, adjust as you go.

### 🔄 Spike → Build → Refactor
1. **Spike:** Quick exploration to understand
2. **Build:** Real implementation based on learning
3. **Refactor:** Polish when patterns are clear

This cycle, repeated, is vibe coding.

### 📍 Commit-Driven Development
Think of each commit as a checkpoint. "I built X, it works, moving to Y."

This keeps momentum and creates natural stopping points.

### 💬 Conversation as Design
The design doesn't live in a document. It lives in conversation with Claude.

Each message refines understanding and direction.

### 🧪 Test-Driven Vibes
Not TDD in the strict sense, but: build → test → observe → learn → refine

Real-time feedback loop.

---

## Anti-Patterns to Avoid

### ❌ Silent Building
Building for hours without dialogue. Vibe coding requires constant communication.

### ❌ Perfectionism
"I'll refactor later." You won't. Refactor patterns as they emerge.

### ❌ Mega-Commits
5,000 lines of code in one commit. Defeats the purpose. Small, frequent commits.

### ❌ Planning Without Building
Detailed plans without validation. Plans change when you build. Design through building.

### ❌ Ignoring Feedback
Dismissing errors or Claude's suggestions. Vibe coding thrives on feedback loops.

### ❌ Feature Creep
Adding features mid-build. Finish one thing, then start next.

---

## Your Vibe Coding Toolkit

### 📝 Git & Commits
Checkpoint your progress. Tell the story of building through commit messages.

### /run
See your code working. The reality check. Do this after every meaningful change.

### /code-review
Quick feedback on quality without slowing momentum. Medium level is perfect.

### claude mem
Remember patterns, decisions, insights. Build on your own previous learning.

### Keybindings
Set up shortcuts for most-used commands. Speed up iteration.

### /loop
Autonomous checking and monitoring. Let things run while you're in the flow.

### /workflow
For complex multi-phase work. Orchestrate multiple agents working together.

### Terminal & Bash
Direct access to your tools. Sometimes fastest path is just running a command.

---

## Real-World Example: SaaS Modules

### The Vision
Build 53 different SaaS modules with complete SPARC specifications, Jira epics, and documentation.

### Phase 1: Discovery Build
Create one module (Authentication) with full spec. Figure out structure, sections, format. Test.

### Phase 2: Pattern Extraction
Identify pattern: requirements → architecture → dependencies → risks → examples

Extract a template.

### Phase 3: Feature Factory
Use template to generate 52 more modules. Each customized but following structure.

### Phase 4: Enhancement Loop
Add Jira epic generation. Then auto-documentation. Each feature built iteratively.

### Phase 5: Polish & Organize
Create README indexes, organize directories, add cross-references.

### Result
53 complete modules, 100s of Jira stories, comprehensive documentation—all through vibe coding and iterative discovery.

---

## Getting Started

### 1. Pick a Feature or Problem
Something you want to build or explore. Don't overthink it.

### 2. Describe It (Not as a Command)
"I want to... because... I'm thinking..." → Conversation, not requirements.

### 3. Start Small
"Let's start with the core logic" → Build something that works, then expand.

### 4. Test Immediately
Use `/run` to see your code working. This makes vibe coding work.

### 5. Iterate Based on Reality
Once you see it working, ideas get clearer. Refine based on what you see.

### 6. Commit Regularly
After each feature or chunk, commit to git. Keep momentum high.

### 7. Keep the Conversation Going
Each message builds on the last. Stay in the flow. Don't jump around.

---

## The Heart of Vibe Coding

**Vibe coding is about flow.**

It's the difference between making a video game where you find and write directions, versus playing the game, discovering the path as you go.

It's collaboration with an AI that understands code, context, and intent. It's fast iteration. It's learning by building. It's architecture emerging from implementation.

**Most importantly: it works.**

You can build real, complex, beautiful applications this way. Not despite skipping upfront planning, but often **because** you skip it and let design emerge through conversation and iteration.

---

## Remember

- Think out loud, not in commands
- Build small, test often, commit frequently
- Let architecture emerge from building
- Stay in the flow—don't break momentum
- Real feedback beats theoretical planning
- You and Claude are a team, not user and tool
- Done is better than perfect (but keep quality high)

---

✨ **Now go vibe. Build something beautiful.** 🚀

---

*Vibe Coding Guide | Part of the SaaS Foundation Claude Code Configuration | Last Updated: 2026-08-24*