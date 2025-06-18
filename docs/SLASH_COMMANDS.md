# Claude Checkpoint System - Slash Commands

You can create convenient slash commands for the checkpoint system operations.

## Setup

Create these files in your project's `.claude/commands/checkpoint/` directory:

### `/checkpoint:save`
```markdown
# Save Checkpoint

Update CLAUDE_STATE.md with current progress. Add a new checkpoint entry with:
- What was completed since last checkpoint
- Current work in progress  
- Next steps planned
- Files that were modified
- Any important context or decisions

Use the checkpoint format from CLAUDE.md and include a timestamp.
```

### `/checkpoint:restore`  
```markdown
# Restore From Checkpoint

Read CLAUDE_STATE.md and continue from the last checkpoint. This is used when context has been lost or when resuming work after a break.
```

### `/checkpoint:status`
```markdown
# Show Checkpoint Status

Read and display the current contents of CLAUDE_STATE.md to show the current project status, active tasks, and recent checkpoints.
```

## Usage

The checkpoint system auto-starts when Claude reads your CLAUDE.md file. Available commands:

- `/checkpoint:save` - Manually save current progress
- `/checkpoint:restore` - Restore lost context  
- `/checkpoint:status` - Check current status

**No start command needed** - the system bootstraps automatically from CLAUDE.md!

## Global Commands

To make these available across all projects, put them in `~/.claude/commands/checkpoint/` instead of `.claude/commands/checkpoint/`.

## File Structure

```
.claude/
└── commands/
    └── checkpoint/
        ├── save.md
        ├── restore.md
        └── status.md
```

This makes the checkpoint system even more convenient to use!