#!/bin/bash
# Claude Checkpoint System Installer

set -e

echo "🚀 Installing Claude Checkpoint System..."

# Check if we're in a git repo
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: Not in a git repository"
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TEMPLATE_DIR="$SCRIPT_DIR/../templates"

# Create directories
echo "📁 Creating directories..."
mkdir -p .github/ISSUE_TEMPLATE

# Copy files
echo "📄 Copying templates..."
cp "$TEMPLATE_DIR/claude-session.yml" .github/ISSUE_TEMPLATE/
cp "$TEMPLATE_DIR/CLAUDE_STATE.md.template" ./CLAUDE_STATE.md

# Update CLAUDE.md if it exists, otherwise create it
if [ -f "CLAUDE.md" ]; then
    echo "📝 Updating existing CLAUDE.md..."
    echo "" >> CLAUDE.md
    cat "$TEMPLATE_DIR/CLAUDE.md.snippet" >> CLAUDE.md
else
    echo "📝 Creating CLAUDE.md..."
    cat "$TEMPLATE_DIR/CLAUDE.md.snippet" > CLAUDE.md
fi

# Initialize CLAUDE_STATE.md with project name
PROJECT_NAME=$(basename "$(pwd)")
sed -i.bak "s/\[Create after first checkpoint\]/Not created yet/" CLAUDE_STATE.md
sed -i.bak "s/\[username\]\/life-with-llm-d-book/$(git remote get-url origin | sed 's/.*github.com[:/]\(.*\)\.git/\1/')/g" CLAUDE_STATE.md 2>/dev/null || true
rm -f CLAUDE_STATE.md.bak

echo "✅ Claude Checkpoint System installed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Commit the new files to your repository"
echo "2. Go to GitHub Issues → New Issue → 'Claude Code Session Tracker'"
echo "3. Create your session tracking issue and keep it open"
echo "4. Update the issue number in CLAUDE_STATE.md"
echo ""
echo "💡 Remember to update CLAUDE_STATE.md and add checkpoint comments regularly!"