# Simple CLAUDE.md Installation

## The Tiny Installation

Just add these 4 lines to your project's CLAUDE.md:

```markdown
## Claude Checkpoint System

@templates/CLAUDE_SELF_CONTAINED.md

**IMPORTANT**: This system auto-initializes when Claude reads this CLAUDE.md file. No manual setup required!
```

## Setup Steps

1. **Download the template**: Copy [`CLAUDE_SELF_CONTAINED.md`](../templates/CLAUDE_SELF_CONTAINED.md) to your project's `templates/` directory

2. **Add to CLAUDE.md**: Add the 4 lines above to your project's CLAUDE.md

3. **Done!** Claude will auto-bootstrap the system when it reads your CLAUDE.md

## Benefits

- **4 lines** instead of 100+ lines to copy
- **Clean CLAUDE.md** - instructions are imported, not embedded
- **Easy updates** - modify the template file independently
- **Same functionality** - full checkpoint system with auto-bootstrap

## File Structure

```
your-project/
├── CLAUDE.md                     # Your project instructions + 4-line import
├── templates/
│   └── CLAUDE_SELF_CONTAINED.md  # The checkpoint system template
└── CLAUDE_STATE.md               # Auto-created by Claude
```

This gives you all the power of the self-contained system with minimal copy-paste!