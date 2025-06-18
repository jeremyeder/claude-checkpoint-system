# Claude Checkpoint System Project Instructions

## Project Overview
This is the Claude Checkpoint System project itself. We are building and improving a system to help maintain context across Claude sessions without token waste.

## Current Focus
We have successfully created a self-contained checkpoint system that can be installed with just 4 lines in any project's CLAUDE.md file.

## Claude Checkpoint System

@templates/CLAUDE_SELF_CONTAINED.md

**IMPORTANT**: This system auto-initializes when Claude reads this CLAUDE.md file. No manual setup required!

## Project-Specific Context

### Key Priority Areas
1. **Security**: Fix vulnerabilities in install.sh script
2. **Quality**: Remove hardcoded references and improve error handling
3. **Documentation**: Add missing files (LICENSE, etc.)
4. **Testing**: Add integration tests

### Repository
- **GitHub:** https://github.com/jeremyeder/claude-checkpoint-system
- **Main Branch:** main

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