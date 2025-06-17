#!/bin/bash
# Claude Simple Checkpoint System - One File Installation

set -e

echo "🚀 Installing Simple Claude Checkpoint System..."

# Check if we're in a git repo (optional)
if git rev-parse --git-dir > /dev/null 2>&1; then
    PROJECT_NAME=$(basename "$(pwd)")
    echo "📁 Project: $PROJECT_NAME"
else
    PROJECT_NAME="your-project"
    echo "⚠️  Not in a git repo - using generic project name"
fi

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy simple template
if [ -f "$SCRIPT_DIR/templates/SIMPLE_CLAUDE_STATE.md" ]; then
    cp "$SCRIPT_DIR/templates/SIMPLE_CLAUDE_STATE.md" ./CLAUDE_STATE.md
    
    # Replace project name placeholder
    if command -v sed >/dev/null 2>&1; then
        sed -i.bak "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" CLAUDE_STATE.md
        rm -f CLAUDE_STATE.md.bak
    fi
    
    echo "✅ CLAUDE_STATE.md created successfully!"
else
    echo "❌ Template not found. Creating basic file..."
    cat > CLAUDE_STATE.md << 'EOF'
# Claude Code Session State

## 🎯 Current Focus
Working on development.

## ⏰ Recent Checkpoints
### $(date +"%Y-%m-%d %H:%M") - Session started
- Initialized simple checkpoint system
- Ready to begin work

## 📋 Active Tasks  
- [ ] Define project goals
- [ ] Start development

## 🧠 Key Context
- **Branch:** main
- **Status:** Just getting started

---
*Tell Claude: "Read CLAUDE_STATE.md and continue from the last checkpoint"*
EOF
fi

echo ""
echo "📋 That's it! No GitHub issues, no complex setup."
echo "📝 Just update CLAUDE_STATE.md as you work."
echo ""
echo "💡 Usage:"
echo "  • Start sessions: Tell Claude to read CLAUDE_STATE.md"
echo "  • During work: Update the file with progress"  
echo "  • Add checkpoints: Copy the format shown in the file"
echo ""
echo "🎉 Happy coding!"