# Claude Code Checkpoint System Setup Guide

> Avoid auto-compaction token costs by using GitHub issues as an external state management system.

## 🚀 Quick Setup (New Project)

1. **Create Issue Template** (save as `.github/ISSUE_TEMPLATE/claude-session.yml`):
```bash
mkdir -p .github/ISSUE_TEMPLATE
```

Then create the template file with this content:
```yaml
name: Claude Code Session Tracker
description: Persistent issue for tracking Claude Code session history
title: "[CLAUDE SESSION] Project Development Log"
labels: ["claude-session", "development-log"]
body:
  - type: markdown
    attributes:
      value: |
        ## 📋 Session Tracking Issue
        This issue serves as a persistent log for Claude Code sessions.
        
        ### Comment Format for Checkpoints:
        ```
        ## 🔖 Checkpoint: [Date] [Time]
        
        **Session Summary:** Brief description
        
        **Completed:**
        - ✅ Task 1
        
        **In Progress:**
        - 🔄 Task 2
        
        **Next Steps:**
        - ⏳ Task 3
        
        **Modified Files:**
        - file1.ts - Description
        
        **Commit Range:** abc123..def456
        ```
  
  - type: input
    id: project_name
    attributes:
      label: Project Name
    validations:
      required: true
```

2. **Create State File** (save as `CLAUDE_STATE.md`):
```markdown
# Claude Code Session State

## 🎯 Current Focus
[Current task/feature]

## 📊 Session Info
- **Started:** [Date]
- **Last Updated:** [Date]
- **Active Branch:** [branch]
- **Session Issue:** #[number]

## ✅ Completed Tasks
- [List completed items]

## 🔄 In Progress
- [Current work]

## 📋 TODO Queue
- [ ] Next task 1
- [ ] Next task 2

## 🧠 Context & Decisions
- [Important decisions and rationale]

## 📁 Key Files
- [Important files and their purposes]

---
*Last checkpoint: [timestamp]*
```

3. **Create the Session Issue**:
   - Go to Issues → New Issue → Claude Code Session Tracker
   - Fill in project details
   - Keep issue open throughout development

## 📝 Usage Instructions

### Creating Checkpoints

When you want to save state (before potential token limit):

1. **Update CLAUDE_STATE.md** with current status
2. **Add checkpoint comment** to your session issue:
```markdown
## 🔖 Checkpoint: 2025-06-17 14:30

**Session Summary:** Implemented authentication system

**Completed:**
- ✅ JWT token generation
- ✅ User registration endpoint
- ✅ Login functionality

**In Progress:**
- 🔄 Refresh token implementation

**Next Steps:**
- ⏳ Add password reset
- ⏳ Implement 2FA

**Modified Files:**
- src/auth/jwt.ts - JWT utilities
- src/routes/auth.ts - Auth endpoints
- tests/auth.test.ts - Auth tests

**Commit Range:** abc123..def456
```

### Restoring Context

When starting a new Claude Code session:

1. **Provide restore command**:
```
Please restore context from CLAUDE_STATE.md and check issue #[number] for checkpoint history
```

2. Claude will:
   - Read CLAUDE_STATE.md for current state
   - Review issue comments for history
   - Continue from last checkpoint

## 🎯 Best Practices

1. **Checkpoint Frequency**:
   - Before complex operations
   - At natural breaking points
   - When switching focus areas
   - Before expecting token limit

2. **State File Updates**:
   - Keep CLAUDE_STATE.md current
   - Update after major completions
   - Clear completed TODOs

3. **Issue Comments**:
   - Use consistent format
   - Include commit SHAs
   - Note key decisions
   - List affected files

## 🔧 Advanced Options

### Automation Script (Optional)

Create `claude-checkpoint.sh`:
```bash
#!/bin/bash
# Generate checkpoint comment format

echo "## 🔖 Checkpoint: $(date '+%Y-%m-%d %H:%M')"
echo ""
echo "**Session Summary:** [Fill in]"
echo ""
echo "**Completed:**"
git log --oneline -5
echo ""
echo "**Modified Files:**"
git status --short
echo ""
echo "**Commit Range:** $(git rev-parse --short HEAD~5)..$(git rev-parse --short HEAD)"
```

### Git Aliases (Optional)

Add to `.gitconfig`:
```
[alias]
    claude-checkpoint = !echo "Updated CLAUDE_STATE.md" && git add CLAUDE_STATE.md && git commit -m "🔖 Claude checkpoint: $(date '+%Y-%m-%d %H:%M')"
```

## 🚨 Important Notes

- **One Issue Per Project**: Don't create multiple session issues
- **Don't Close Issue**: Keep it open for entire project lifecycle
- **Commit State File**: Include CLAUDE_STATE.md in version control
- **Reference in PR**: Link to session issue in pull requests

## 💡 Benefits

- ✅ Avoids auto-compaction token costs
- ✅ Maintains full session history
- ✅ Easy context switching
- ✅ Searchable checkpoint history
- ✅ Works across Claude Code restarts
- ✅ No external dependencies

---

*Created for avoiding Claude Code auto-compaction token usage*