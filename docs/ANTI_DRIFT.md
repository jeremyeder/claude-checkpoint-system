# Anti-Drift Strategy for Claude Checkpoint System

## Recommended Solution: Central Template Repository

1. **Create `claude-templates` repo** with:
   ```
   claude-templates/
   ├── checkpoint-system/
   │   ├── CLAUDE.md.snippet
   │   ├── CLAUDE_STATE.md.template
   │   ├── claude-session.yml
   │   └── VERSION
   ├── install.sh
   └── README.md
   ```

2. **Version your templates**:
   ```
   # In VERSION file
   1.0.0
   ```

3. **Create installer script**:
   ```bash
   #!/bin/bash
   # install.sh - Run from your project root
   
   TEMPLATE_VERSION="1.0.0"
   
   # Install checkpoint system
   mkdir -p .github/ISSUE_TEMPLATE
   curl -s https://raw.githubusercontent.com/YOU/claude-templates/main/checkpoint-system/claude-session.yml > .github/ISSUE_TEMPLATE/claude-session.yml
   curl -s https://raw.githubusercontent.com/YOU/claude-templates/main/checkpoint-system/CLAUDE_STATE.md.template > CLAUDE_STATE.md
   
   # Append to CLAUDE.md
   echo "" >> CLAUDE.md
   echo "<!-- CHECKPOINT-SYSTEM-START v$TEMPLATE_VERSION -->" >> CLAUDE.md
   curl -s https://raw.githubusercontent.com/YOU/claude-templates/main/checkpoint-system/CLAUDE.md.snippet >> CLAUDE.md
   echo "<!-- CHECKPOINT-SYSTEM-END -->" >> CLAUDE.md
   
   echo "✅ Checkpoint system v$TEMPLATE_VERSION installed"
   ```

4. **Update mechanism**:
   ```bash
   # update-claude-templates.sh
   # Finds version markers and updates sections
   ```

## Alternative: Use Your Global CLAUDE.md

Add to your `~/.claude/CLAUDE.md`:
```markdown
## Checkpoint System Check

For projects with CLAUDE_STATE.md:
1. Always read CLAUDE_STATE.md first
2. Check for open "[CLAUDE SESSION]" issues
3. Follow checkpoint process if these exist

This ensures I use checkpoints when available without requiring per-project configuration.
```

## Hybrid Approach (Best of Both)

1. **Global CLAUDE.md**: General checkpoint awareness
2. **Project CLAUDE.md**: Just a version marker
   ```markdown
   <!-- Using claude-checkpoint v1.0.0 -->
   ```
3. **Actual files**: CLAUDE_STATE.md and issue template

This way:
- Claude knows to look for checkpoint files
- You can track which version each project uses
- Updates are easier to manage
- Less drift between projects