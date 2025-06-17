# Simple Claude Checkpoint System

The ultra-minimal version - just one file, zero setup complexity.

## 🎯 What This Solves
Claude Code loses context between sessions. This gives you a simple way to preserve state without token costs.

## 🚀 Quick Start (30 seconds)

```bash
# 1. Copy the template
curl -O https://raw.githubusercontent.com/jeremyeder/claude-checkpoint-system/main/templates/SIMPLE_CLAUDE_STATE.md
mv SIMPLE_CLAUDE_STATE.md CLAUDE_STATE.md

# 2. Start using it
# Tell Claude: "Read CLAUDE_STATE.md and continue from the last checkpoint"
```

That's it! No GitHub issues, no installation scripts, no complexity.

## 📝 How It Works

### Single File: `CLAUDE_STATE.md`
```markdown
# Claude Code Session State

## 🎯 Current Focus
Working on user authentication system.

## ⏰ Recent Checkpoints
### 2025-06-17 14:30 - Login API completed
- Added JWT authentication
- Created user model and routes  
- Next: Add password reset feature
- Files: auth.js, user.model.js, routes/auth.js

### 2025-06-17 12:00 - Started auth feature
- Set up basic project structure
- Next: Implement login endpoint

## 📋 Active Tasks
- [x] User login endpoint
- [ ] Password reset
- [ ] Email verification  
- [ ] Rate limiting

## 🧠 Key Context
- **Branch:** feature/auth
- **Database:** MongoDB with Mongoose
- **Framework:** Express.js
- **Important:** Using bcrypt for password hashing
```

### Usage Pattern
1. **Session Start:** "Read CLAUDE_STATE.md and continue from the last checkpoint"
2. **During Work:** Update the file as you progress
3. **Add Checkpoints:** When you complete something significant
4. **Session End:** Add final checkpoint with current status

## 🆚 Comparison with Full System

| Feature | Simple | Full System |
|---------|--------|-------------|
| **Files** | 1 | 4+ templates + docs |
| **Setup time** | 30 seconds | 5+ minutes |
| **GitHub dependency** | None | Requires issues |
| **Maintenance** | Zero | Update issue + file |
| **Works offline** | ✅ | ❌ |
| **Token efficiency** | ✅ | ✅ |

## 🎯 When to Use Which

**Use Simple when:**
- You want minimal overhead
- Working on personal projects
- Don't need GitHub integration
- Want to start immediately

**Use Full System when:**
- Team collaboration needed
- Want searchable history in GitHub
- Need structured templates
- Complex long-term projects

## 💡 Pro Tips

1. **Be specific in checkpoints** - Include file names and next steps
2. **Update frequently** - Don't let context get stale
3. **Use consistent format** - Makes it easier for Claude to parse
4. **Include key decisions** - Architecture choices, library selections

## 🔄 Migration

### From Full → Simple
```bash
# Keep just the essential parts of your CLAUDE_STATE.md
# Remove GitHub issue references
# Simplify the format
```

### From Simple → Full  
```bash
# Run the full installer
./scripts/install.sh
# Migrate your checkpoint history to the new format
```

---

**Perfect for:** Quick projects, personal use, minimal setup
**License:** MIT