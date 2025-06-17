# Claude Checkpoint System - Usage Examples

This guide provides practical examples of using the Claude Checkpoint System in real projects.

## Table of Contents
- [Installation Example](#installation-example)
- [Creating Your First Checkpoint](#creating-your-first-checkpoint)
- [Restoring Context](#restoring-context)
- [Real-World Workflow](#real-world-workflow)

## Installation Example

### 1. Install the System
```bash
# In your project directory
curl -sSL https://raw.githubusercontent.com/jeremyeder/claude-checkpoint-system/main/scripts/install.sh | bash
```

### 2. Create Session Tracking Issue
1. Go to your GitHub repository
2. Navigate to Issues → New Issue
3. Select "Claude Code Session Tracker" template
4. Create the issue and keep it open

### 3. Update State File
Edit `CLAUDE_STATE.md` with your issue number:
```markdown
## 📊 Session Info
- **Session Issue:** #42  <!-- Your actual issue number -->
```

## Creating Your First Checkpoint

### Example 1: Feature Development Checkpoint
```markdown
## 🔖 Checkpoint: 2025-01-20 14:30

**Completed:**
- Implemented user authentication system
- Added JWT token generation
- Created login/logout endpoints

**In Progress:**
- Writing tests for auth endpoints
- Currently working on edge cases

**Next Steps:**
- Add password reset functionality
- Implement rate limiting
- Update API documentation

**Modified Files:**
- `src/auth/controller.js`
- `src/auth/middleware.js`
- `src/models/user.js`
- `tests/auth.test.js`
```

### Example 2: Bug Fix Checkpoint
```markdown
## 🔖 Checkpoint: 2025-01-20 16:45

**Completed:**
- Identified memory leak in WebSocket handler
- Fixed event listener cleanup
- Verified fix with memory profiler

**In Progress:**
- Running full test suite
- Monitoring production metrics

**Next Steps:**
- Deploy fix to staging
- Monitor for 24 hours
- Create regression test

**Modified Files:**
- `src/websocket/handler.js`
- `tests/websocket.test.js`
```

## Restoring Context

### Scenario: Starting a New Session
Tell Claude: "Restore context from checkpoint system"

Claude will then:
1. Read `CLAUDE_STATE.md` for current status
2. Check the session issue for recent checkpoints
3. Continue from where the last session ended

### Example State File Update
```markdown
# Claude Code Session State

## 🎯 Current Focus
Implementing real-time notifications feature with WebSocket support

## 📊 Session Info
- **Started:** 2025-01-18
- **Last Updated:** 2025-01-20
- **Active Branch:** feature/notifications
- **Session Issue:** #42

## ✅ Completed Tasks
- WebSocket server setup
- Client connection handling
- Basic message broadcasting
- Authentication integration

## 🔄 In Progress
- Implementing message persistence
- Adding retry logic for failed deliveries

## 📋 TODO Queue
```
[ ] Add notification preferences
[ ] Implement notification grouping
[ ] Create admin dashboard
[ ] Write comprehensive tests
```
```

## Real-World Workflow

### Day 1: Project Setup
```bash
# Clone project
git clone https://github.com/yourname/yourproject
cd yourproject

# Install checkpoint system
curl -sSL https://raw.githubusercontent.com/jeremyeder/claude-checkpoint-system/main/scripts/install.sh | bash

# Create session issue on GitHub
# Update CLAUDE_STATE.md with issue number
```

### Day 2: Feature Development
1. Start Claude Code session
2. Tell Claude: "Restore context from checkpoint system"
3. Work on features
4. Create checkpoint before lunch:
```markdown
## 🔖 Checkpoint: 2025-01-21 12:00
**Completed:** Morning work summary...
```

### Day 3: Context Switch
1. Different developer takes over
2. They start Claude: "Restore context from checkpoint system"
3. Claude reads state and continues seamlessly
4. Developer adds their own checkpoints

### Best Practices Examples

#### Frequent Checkpoints
Create checkpoints:
- Every 2-3 hours of work
- Before switching tasks
- After completing features
- Before complex refactoring

#### Clear State Updates
Keep `CLAUDE_STATE.md` updated with:
- Current focus (one-line summary)
- Active branch name
- Blocker issues
- Next immediate steps

#### Descriptive Checkpoint Comments
Include:
- What was accomplished
- Any decisions made and why
- Problems encountered
- Specific files changed

## Troubleshooting Examples

### Lost Context Mid-Session
```
User: "I think you lost context. Please restore from checkpoint"
Claude: *Reads CLAUDE_STATE.md and session issue*
Claude: "I've restored context. You were working on [specific task] and had completed [X, Y, Z]..."
```

### Multiple Active Features
Use separate sections in TODO Queue:
```markdown
## 📋 TODO Queue
### Feature: Notifications
[ ] Add sound preferences
[ ] Test mobile notifications

### Feature: User Profiles  
[ ] Add avatar upload
[ ] Implement privacy settings

### Bug Fixes
[ ] Fix date formatting (#38)
[ ] Resolve memory leak (#41)
```

### Team Collaboration
Add team context to checkpoints:
```markdown
## 🔖 Checkpoint: 2025-01-21 15:00
**For Team:** 
- API changes require frontend updates
- New environment variable needed: `NOTIFICATION_SERVICE_URL`
- Database migration required before deployment

**Completed:** ...
```

## Tips for Success

1. **Be Consistent**: Create checkpoints at regular intervals
2. **Be Specific**: Include file paths and function names
3. **Be Concise**: Focus on what matters for continuity
4. **Be Proactive**: Update state before issues arise
5. **Be Collaborative**: Write checkpoints others can understand

Remember: The goal is to minimize token usage while maintaining perfect continuity across sessions!