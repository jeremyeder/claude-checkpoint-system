#!/bin/bash
# Claude Checkpoint System Installer
# Version: 2.0.0

set -euo pipefail  # Strict error handling

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }
log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Cleanup function
cleanup() {
    if [ -n "${BACKUP_DIR:-}" ] && [ -d "$BACKUP_DIR" ]; then
        log_warning "Installation failed. Backup available at: $BACKUP_DIR"
    fi
}
trap cleanup EXIT

# Prerequisite checking
check_prerequisites() {
    local missing_tools=()
    
    for tool in git sed mkdir cp cat date; do
        if ! command -v "$tool" &> /dev/null; then
            missing_tools+=("$tool")
        fi
    done
    
    if [ ${#missing_tools[@]} -ne 0 ]; then
        log_error "Missing required tools: ${missing_tools[*]}"
        log_error "Please install these tools and try again."
        exit 1
    fi
}

# Validate git repository
validate_git_repo() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        log_error "Not in a git repository. Please run this script from your project root."
        exit 1
    fi
    
    # Check for uncommitted changes
    if ! git diff-index --quiet HEAD -- 2>/dev/null; then
        log_warning "You have uncommitted changes. Consider committing them first."
        read -p "Continue anyway? (y/N): " -r
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            log_info "Installation cancelled."
            exit 0
        fi
    fi
}

# Validate and extract git remote info
get_git_remote_info() {
    local remote_url
    
    if ! remote_url=$(git remote get-url origin 2>/dev/null); then
        log_warning "No origin remote found. You'll need to update repository links manually."
        echo "unknown/unknown"
        return
    fi
    
    # Validate GitHub URL format
    if [[ ! "$remote_url" =~ ^(https://github\.com/|git@github\.com:)([^/]+)/([^/]+)(\.git)?/?$ ]]; then
        log_warning "Origin remote is not a GitHub repository. You'll need to update repository links manually."
        echo "unknown/unknown"
        return
    fi
    
    # Extract owner/repo safely
    if [[ "$remote_url" =~ github\.com[:/]([^/]+)/([^/.]+) ]]; then
        local owner="${BASH_REMATCH[1]}"
        local repo="${BASH_REMATCH[2]}"
        echo "$owner/$repo"
    else
        echo "unknown/unknown"
    fi
}

# Create backup of existing files
create_backup() {
    BACKUP_DIR="./claude-checkpoint-backup-$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    local files_to_backup=("CLAUDE.md" "CLAUDE_STATE.md" ".github/ISSUE_TEMPLATE/claude-session.yml")
    local backed_up=0
    
    for file in "${files_to_backup[@]}"; do
        if [ -f "$file" ]; then
            cp "$file" "$BACKUP_DIR/"
            ((backed_up++))
        fi
    done
    
    if [ $backed_up -gt 0 ]; then
        log_info "Backed up $backed_up existing files to $BACKUP_DIR"
    else
        rmdir "$BACKUP_DIR" 2>/dev/null || true
        unset BACKUP_DIR
    fi
}

# Get script directory safely
get_script_dir() {
    local source="${BASH_SOURCE[0]}"
    while [ -L "$source" ]; do
        local dir="$(cd -P "$(dirname "$source")" && pwd)"
        source="$(readlink "$source")"
        [[ $source != /* ]] && source="$dir/$source"
    done
    cd -P "$(dirname "$source")" && pwd
}

# Validate template files exist
validate_templates() {
    local template_dir="$1"
    local required_templates=("claude-session.yml" "CLAUDE_STATE.md.template" "CLAUDE.md.snippet")
    
    for template in "${required_templates[@]}"; do
        if [ ! -f "$template_dir/$template" ]; then
            log_error "Missing required template: $template_dir/$template"
            exit 1
        fi
    done
}

# Safe string replacement
safe_replace() {
    local file="$1"
    local search="$2"
    local replace="$3"
    
    # Escape special characters for sed
    local escaped_search=$(printf '%s\n' "$search" | sed 's/[[\.*^$()+?{|]/\\&/g')
    local escaped_replace=$(printf '%s\n' "$replace" | sed 's/[[\.*^$(){}+?|/]/\\&/g')
    
    if [ -f "$file" ]; then
        sed -i.bak "s/$escaped_search/$escaped_replace/g" "$file" || {
            log_error "Failed to update $file"
            exit 1
        }
        rm -f "$file.bak"
    fi
}

# Main installation logic
main() {
    log_info "🚀 Installing Claude Checkpoint System v2.0..."
    
    # Prerequisites
    log_info "Checking prerequisites..."
    check_prerequisites
    
    # Validate environment
    log_info "Validating git repository..."
    validate_git_repo
    
    # Get project info
    local git_info
    git_info=$(get_git_remote_info)
    local project_name
    project_name=$(basename "$(pwd)")
    
    log_info "Project: $project_name"
    log_info "Repository: $git_info"
    
    # Get template directory
    local script_dir
    script_dir=$(get_script_dir)
    local template_dir="$script_dir/../templates"
    
    # Validate templates
    log_info "Validating templates..."
    validate_templates "$template_dir"
    
    # Create backup
    log_info "Creating backup of existing files..."
    create_backup
    
    # Create directories
    log_info "Creating directories..."
    mkdir -p .github/ISSUE_TEMPLATE
    
    # Copy and customize templates
    log_info "Installing templates..."
    
    # Copy issue template
    cp "$template_dir/claude-session.yml" .github/ISSUE_TEMPLATE/ || {
        log_error "Failed to copy issue template"
        exit 1
    }
    
    # Copy and customize state template
    cp "$template_dir/CLAUDE_STATE.md.template" ./CLAUDE_STATE.md || {
        log_error "Failed to copy state template"
        exit 1
    }
    
    # Update placeholders in state file
    safe_replace "CLAUDE_STATE.md" "[REPO_OWNER]/[REPO_NAME]" "$git_info"
    safe_replace "CLAUDE_STATE.md" "Working on creating a checkpoint/restore system using GitHub issues to avoid auto-compaction token costs." "Working on $project_name development."
    
    # Handle CLAUDE.md
    if [ -f "CLAUDE.md" ]; then
        log_info "Appending to existing CLAUDE.md..."
        {
            echo ""
            echo "---"
            echo ""
            cat "$template_dir/CLAUDE.md.snippet"
        } >> CLAUDE.md
    else
        log_info "Creating new CLAUDE.md..."
        cp "$template_dir/CLAUDE.md.snippet" CLAUDE.md
    fi
    
    # Success
    log_success "Claude Checkpoint System installed successfully!"
    echo ""
    log_info "📋 Next steps:"
    echo "1. Review and commit the new files:"
    echo "   git add .github/ CLAUDE.md CLAUDE_STATE.md"
    echo "   git commit -m 'Add Claude Checkpoint System'"
    echo ""
    echo "2. Create GitHub session tracking issue:"
    echo "   • Go to: https://github.com/$git_info/issues/new/choose"
    echo "   • Select: 'Claude Code Session Tracker'"
    echo "   • Keep the issue open throughout development"
    echo ""
    echo "3. Update CLAUDE_STATE.md with your issue number"
    echo ""
    log_warning "💡 Remember: Update CLAUDE_STATE.md frequently and create checkpoint comments!"
    
    # Clean up backup if everything succeeded
    if [ -n "${BACKUP_DIR:-}" ] && [ -d "$BACKUP_DIR" ]; then
        log_info "Installation successful. Removing backup directory."
        rm -rf "$BACKUP_DIR"
        unset BACKUP_DIR
    fi
}

# Run main function
main "$@"