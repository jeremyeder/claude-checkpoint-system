# Claude Checkpoint System

[![CI](https://github.com/jeremyeder/claude-checkpoint-system/actions/workflows/ci.yml/badge.svg)](https://github.com/jeremyeder/claude-checkpoint-system/actions/workflows/ci.yml)

A token-efficient checkpoint/restore system for Claude Code. Choose your complexity level:

- **🚀 Simple Version**: One file, 30-second setup, zero dependencies
- **🏢 Full Version**: GitHub integration, templates, team collaboration

## 🎯 Problem Solved

Claude Code's auto-compaction feature consumes significant tokens. This system provides an external state management solution using GitHub issues, allowing you to preserve context across sessions without token overhead.

## 🚀 Quick Start

### Option 1: Simple Version (Recommended for most users)

```bash
# One-line install - creates just CLAUDE_STATE.md
curl -sSL https://raw.githubusercontent.com/jeremyeder/claude-checkpoint-system/main/simple-install.sh | bash
```

**Usage:**
1. Tell Claude: "Read CLAUDE_STATE.md and continue from the last checkpoint"
2. Update the file as you work
3. That's it!

### Option 2: Full Version (For teams and complex projects)

### 1. Install in Your Project

#### Automated Installation (Recommended)

```bash
# Clone the checkpoint system
git clone https://github.com/jeremyeder/claude-checkpoint-system.git

# Run the installer from your project directory
cd your-project
../claude-checkpoint-system/scripts/install.sh
```

#### Manual Installation

```bash
# Create required directories
mkdir -p .github/ISSUE_TEMPLATE

# Copy the issue template
cp claude-checkpoint-system/templates/claude-session.yml .github/ISSUE_TEMPLATE/

# Copy the state file template
cp claude-checkpoint-system/templates/CLAUDE_STATE.md.template ./CLAUDE_STATE.md

# Add checkpoint instructions to your CLAUDE.md
cat claude-checkpoint-system/templates/CLAUDE.md.snippet >> CLAUDE.md
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
- ✅ Version control friendly

## 📊 Version Comparison

| Feature | Simple | Full |
|---------|--------|------|
| **Setup time** | 30 seconds | 5+ minutes |
| **Files created** | 1 | 4+ |
| **GitHub dependency** | None | Issues required |
| **Offline usage** | ✅ | ❌ |
| **Team collaboration** | Basic | ✅ Advanced |
| **Maintenance** | Zero | Update issue + file |
| **Templates** | Minimal | Comprehensive |

**Choose Simple if:** Personal projects, quick setup, minimal maintenance  
**Choose Full if:** Team projects, structured history, GitHub integration

## 🧪 Testing

Run the test suite:

```bash
./tests/test_install.sh
```

The CI pipeline runs:
- Shell script linting with shellcheck
- Basic functionality tests
- Template validation

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

MIT License - Use freely in your projects