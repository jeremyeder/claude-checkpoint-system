# For Your Project's CLAUDE.md File

Add this section to any project's CLAUDE.md:

```markdown
## Always Use Checkpoint System

To avoid auto-compaction token costs, ALWAYS use this checkpoint/restore process:

### At Session Start:
1. First, read `CLAUDE_STATE.md` to understand current state
2. Check the open "[CLAUDE SESSION]" issue for recent checkpoint comments
3. Continue work from where the last session ended

### During Work:
1. Frequently update `CLAUDE_STATE.md` with progress
2. Create checkpoint comments on the session issue when:
   - Completing major features
   - Before complex operations  
   - At natural stopping points
   - When token usage is high

### Checkpoint Format:
When creating a checkpoint, add a comment to the session issue:
```
## 🔖 Checkpoint: [timestamp]
**Completed:** [what was done]
**In Progress:** [current work]
**Next Steps:** [what's next]
**Modified Files:** [list files changed]
```

### Before Session Ends:
1. Update `CLAUDE_STATE.md` with final status
2. Create a checkpoint comment on the session issue
3. Commit any uncommitted changes

### If Context is Lost:
Tell me: "Restore context from checkpoint system" and I will read CLAUDE_STATE.md and the session issue.

**IMPORTANT**: This is required for all work in this repository to maintain continuity and avoid token waste.
```