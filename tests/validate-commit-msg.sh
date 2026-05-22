#!/bin/sh
# Rauchtest: validate-commit-msg.sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
BASE="${TMPDIR:-/tmp}/commit-msg-test-$$"

cleanup() { rm -rf "$BASE"; }
trap cleanup EXIT

fail() { printf 'FAIL: %s\n' "$1" >&2; exit 1; }
pass() { printf 'PASS: %s\n' "$1"; }

write_message() {
    file="$1"
    shift
    printf '%s\n' "$@" > "$file"
}

check_valid_message() {
    msg="$BASE/valid.txt"
    write_message "$msg" \
        "docs(tooling): Commit-Sync dokumentieren (J01-143)" \
        "" \
        "- Full-Sync ergänzt"
    sh "$REPO_ROOT/scripts/validate-commit-msg.sh" "$msg"
    pass "gültige Commit-Nachricht akzeptiert"
}

check_invalid_type() {
    msg="$BASE/invalid-type.txt"
    write_message "$msg" "wip(tooling): unfertige Änderung (J01-143)"
    if sh "$REPO_ROOT/scripts/validate-commit-msg.sh" "$msg" 2>/dev/null; then
        fail "ungültiger Typ wurde akzeptiert"
    fi
    pass "ungültiger Typ abgelehnt"
}

check_invalid_body() {
    msg="$BASE/invalid-body.txt"
    write_message "$msg" \
        "docs(tooling): Commit-Sync dokumentieren (J01-143)" \
        "" \
        "kein Stichpunkt"
    if sh "$REPO_ROOT/scripts/validate-commit-msg.sh" "$msg" 2>/dev/null; then
        fail "ungültiger Body wurde akzeptiert"
    fi
    pass "ungültiger Body abgelehnt"
}

mkdir -p "$BASE"
check_valid_message
check_invalid_type
check_invalid_body
