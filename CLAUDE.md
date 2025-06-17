# Claude Checkpoint System Project Instructions

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

## Project-Specific Context

### Current Focus
This is the Claude Checkpoint System project itself. We are improving the system's quality based on a comprehensive code review.

### Key Priority Areas
1. **Security**: Fix vulnerabilities in install.sh script
2. **Quality**: Remove hardcoded references and improve error handling
3. **Documentation**: Add missing files (LICENSE, etc.)
4. **Testing**: Add integration tests

### Session Issue
- **GitHub Issue:** [To be created]
- **Repository:** https://github.com/jeremyeder/claude-checkpoint-system

### Development Guidelines
- Always run tests before committing (when they exist)
- Follow security best practices in all scripts
- Update CLAUDE_STATE.md frequently
- Create checkpoints before major changes

### Quality Standards
- No hardcoded values in templates
- Proper input validation in scripts
- Error handling with rollback capabilities
- Cross-platform compatibility considerations