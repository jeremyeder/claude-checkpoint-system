# Demo Project

This is a demo project to show how the Claude Checkpoint System works when embedded directly in CLAUDE.md.

## Project Overview
- Demo web application
- Uses React and TypeScript
- Has basic testing setup
- Follows standard project structure

## Claude Checkpoint System

### 🚀 Bootstrap Instructions

**FIRST: If CLAUDE_STATE.md doesn't exist in this project, create it now using the template below.**

When Claude reads this, please check if CLAUDE_STATE.md exists. If not, create it with this exact content (replace placeholders):

```markdown
# Claude Code Session State

## 🎯 Current Focus
Working on demo-project development.

## ⏰ Recent Checkpoints
### [TODAY'S_DATE] - Session started
- Initialized checkpoint system from CLAUDE.md
- Ready to begin work on demo-project

## 📋 Active Tasks
- [ ] Review project structure and goals
- [ ] Identify next development priorities

## 🧠 Key Context
- **Branch:** [CURRENT_BRANCH]
- **Status:** Checkpoint system initialized
- **Setup:** Self-contained from CLAUDE.md

---
*Recovery: "Read CLAUDE_STATE.md and continue from the last checkpoint"*
```

### Session Management Instructions

**At Every Session Start:**
1. Read `CLAUDE_STATE.md` to understand current state
2. Continue work from where the last session ended

**During Work:**
1. Update `CLAUDE_STATE.md` frequently with:
   - Completed tasks
   - Current work in progress
   - Next steps
   - Modified files
   - Important decisions or context

**Before Session Ends:**
1. Update `CLAUDE_STATE.md` with final status
2. Ensure all progress is documented
3. Note any blockers or pending tasks

### Checkpoint Format

Use this format when updating CLAUDE_STATE.md:

```markdown
### [TIMESTAMP] - [Brief Description]
**Completed:**
- Task 1
- Task 2

**In Progress:**
- Current task

**Next Steps:**
- Upcoming task 1
- Upcoming task 2

**Modified Files:**
- file1.js
- file2.py

**Notes:**
- Any important context or decisions
```

### Lost Context Recovery

If context is lost, say: "Read CLAUDE_STATE.md and continue from the last checkpoint"

## Why This Matters

This checkpoint system helps:
- Avoid token waste from repeated context building
- Maintain continuity across sessions
- Track progress systematically
- Enable quick session recovery

**IMPORTANT**: Always use this checkpoint system to maintain project continuity.

## Development Guidelines

- Use TypeScript for all new code
- Write tests for new features
- Follow existing code patterns
- Update documentation as needed