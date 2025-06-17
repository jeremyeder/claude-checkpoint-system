# Claude Checkpoint System

A token-efficient checkpoint/restore system for Claude Code that uses GitHub issues to maintain session state and avoid auto-compaction costs.

## 🎯 Problem Solved

Claude Code's auto-compaction feature consumes significant tokens. This system provides an external state management solution using GitHub issues, allowing you to preserve context across sessions without token overhead.

## 🚀 Quick Start

### 1. Install in Your Project

```bash
# Create required directories
mkdir -p .github/ISSUE_TEMPLATE

# Copy the issue template
cp templates/claude-session.yml .github/ISSUE_TEMPLATE/

# Copy the state file template
cp templates/CLAUDE_STATE.md.template ./CLAUDE_STATE.md

# Add checkpoint instructions to your CLAUDE.md
cat templates/CLAUDE.md.snippet >> CLAUDE.md
```

### 2. Create Session Issue

1. Go to GitHub Issues → New Issue
2. Select "Claude Code Session Tracker"
3. Fill in project details
4. Keep issue open throughout development

### 3. Use Checkpoints

During development:
- Update `CLAUDE_STATE.md` frequently
- Add checkpoint comments to your session issue
- Reference both when restoring context

## 📁 Repository Structure

```
claude-checkpoint-system/
├── README.md                          # This file
├── templates/
│   ├── claude-session.yml            # GitHub issue template
│   ├── CLAUDE_STATE.md.template      # State file template
│   └── CLAUDE.md.snippet             # Instructions for CLAUDE.md
├── docs/
│   ├── SETUP.md                      # Detailed setup guide
│   ├── ANTI_DRIFT.md                 # Strategies to prevent drift
│   └── EXAMPLES.md                   # Usage examples
└── scripts/
    └── install.sh                    # Automated installer
```

## 🔧 How It Works

1. **Persistent Issue**: One GitHub issue tracks all session checkpoints
2. **State File**: `CLAUDE_STATE.md` provides quick current status
3. **Checkpoint Comments**: Detailed progress history in issue comments
4. **Context Restoration**: Claude reads both to restore full context

## 📚 Documentation

- [Detailed Setup Guide](docs/SETUP.md)
- [Anti-Drift Strategies](docs/ANTI_DRIFT.md) 
- [Usage Examples](docs/EXAMPLES.md)

## 💡 Benefits

- ✅ Saves significant token costs
- ✅ Preserves complete session history
- ✅ Works across Claude Code restarts
- ✅ Searchable checkpoint history
- ✅ No external dependencies
- ✅ Version control friendly

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

MIT License - Use freely in your projects