#!/bin/bash
# Basic test for install.sh functionality

set -euo pipefail

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
    
    if eval "$test_command"; then
        log_success "PASS: $test_name"
        ((TESTS_PASSED++))
    else
        log_error "FAIL: $test_name"
        return 1
    fi
}

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
run_test "install.sh exists and is executable" "[ -x \"$OLDPWD/scripts/install.sh\" ]"

# Test 2: Check required templates exist
run_test "claude-session.yml template exists" "[ -f \"$OLDPWD/templates/claude-session.yml\" ]"
run_test "CLAUDE_STATE.md.template exists" "[ -f \"$OLDPWD/templates/CLAUDE_STATE.md.template\" ]"
run_test "CLAUDE.md.snippet exists" "[ -f \"$OLDPWD/templates/CLAUDE.md.snippet\" ]"

# Test 3: Test install script dry run (without actually running it)
# We'll test the prerequisite checking function
run_test "install script has proper bash shebang" "head -1 \"$OLDPWD/scripts/install.sh\" | grep -q '^#!/bin/bash'"

# Test 4: Test template file validity
run_test "YAML template is valid" "python3 -c 'import yaml; yaml.safe_load(open(\"$OLDPWD/templates/claude-session.yml\"))'"

# Test 5: Test that templates contain expected placeholders
run_test "State template contains repository placeholder" "grep -q '\\[REPO_OWNER\\]/\\[REPO_NAME\\]' \"$OLDPWD/templates/CLAUDE_STATE.md.template\""

# Cleanup
cd "$OLDPWD"
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