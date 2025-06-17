#!/bin/bash
# Basic test for install.sh functionality

set -uo pipefail  # Remove -e to continue on failures

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "ℹ️  $1"; }
log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }

# Test counter
TESTS_RUN=0
TESTS_PASSED=0

run_test() {
    local test_name="$1"
    local test_command="$2"
    
    ((TESTS_RUN++))
    log_info "Running test: $test_name"
    log_info "Command: $test_command"
    
    if eval "$test_command" 2>&1; then
        log_success "PASS: $test_name"
        ((TESTS_PASSED++))
        return 0
    else
        local exit_code=$?
        log_error "FAIL: $test_name (exit code: $exit_code)"
        log_error "Failed command: $test_command"
        # Continue with other tests, don't exit
        return 0  # Return 0 to not fail the overall script
    fi
}

# Get the directory of this script to find project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Debug: Print paths for troubleshooting
log_info "SCRIPT_DIR: $SCRIPT_DIR"
log_info "PROJECT_ROOT: $PROJECT_ROOT"
log_info "Contents of PROJECT_ROOT:"
ls -la "$PROJECT_ROOT" || true

# Create a temporary test directory
TEST_DIR=$(mktemp -d)
cd "$TEST_DIR"

# Initialize a git repo for testing
git init
git config user.email "test@example.com"
git config user.name "Test User"
git remote add origin https://github.com/test/test-repo.git

log_info "Running install.sh tests in $TEST_DIR"

# Test 1: Check install script exists and is executable
run_test "install.sh exists and is executable" "[ -x \"$PROJECT_ROOT/scripts/install.sh\" ]"

# Test 2: Check required templates exist
run_test "claude-session.yml template exists" "[ -f \"$PROJECT_ROOT/templates/claude-session.yml\" ]"
run_test "CLAUDE_STATE.md.template exists" "[ -f \"$PROJECT_ROOT/templates/CLAUDE_STATE.md.template\" ]"
run_test "CLAUDE.md.snippet exists" "[ -f \"$PROJECT_ROOT/templates/CLAUDE.md.snippet\" ]"

# Test 3: Test install script dry run (without actually running it)
# We'll test the prerequisite checking function
run_test "install script has proper bash shebang" "head -1 \"$PROJECT_ROOT/scripts/install.sh\" | grep -q '^#!/bin/bash'"

# Test 4: Test template file validity
run_test "YAML template is valid" "python3 -c 'import yaml; yaml.safe_load(open(\"$PROJECT_ROOT/templates/claude-session.yml\"))'"

# Test 5: Test that templates contain expected placeholders
run_test "State template contains repository placeholder" "grep -q '\\[REPO_OWNER\\]/\\[REPO_NAME\\]' \"$PROJECT_ROOT/templates/CLAUDE_STATE.md.template\""

# Cleanup
cd "$PROJECT_ROOT"
rm -rf "$TEST_DIR"

# Results
echo ""
log_info "Test Results: $TESTS_PASSED/$TESTS_RUN tests passed"

if [ $TESTS_PASSED -eq $TESTS_RUN ]; then
    log_success "All tests passed! 🎉"
    exit 0
else
    log_error "Some tests failed!"
    exit 1
fi