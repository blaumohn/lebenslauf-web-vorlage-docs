#!/bin/sh
# Rauchtest: pre-commit-Hook
# Prüft: _data/recent_commits.yml wird erzeugt und gestagert.
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
BASE="${TMPDIR:-/tmp}/hooktest-$$"

cleanup() { rm -rf "$BASE"; }
trap cleanup EXIT

fail() { printf 'FAIL: %s\n' "$1" >&2; exit 1; }
pass() { printf 'PASS: %s\n' "$1"; }

setup_docs_repo() {
    DOCS="$BASE/lebenslauf-web-vorlage-docs"
    mkdir -p "$DOCS/scripts/hooks" "$DOCS/_data"
    cp "$REPO_ROOT/scripts/generate-recent-commits.sh" "$DOCS/scripts/"
    cp "$REPO_ROOT/scripts/hooks/pre-commit" "$DOCS/scripts/hooks/"
    git init "$DOCS" --quiet
    git -C "$DOCS" config user.name "Test"
    git -C "$DOCS" config user.email "test@example.invalid"
}

run_hook() {
    DOCS="$BASE/lebenslauf-web-vorlage-docs"
    sh "$DOCS/scripts/hooks/pre-commit" 2>/dev/null || true
}

check_output() {
    DOCS="$BASE/lebenslauf-web-vorlage-docs"
    OUT="$DOCS/_data/recent_commits.yml"
    [ -f "$OUT" ] || fail "_data/recent_commits.yml wurde nicht erzeugt"
    pass "_data/recent_commits.yml erzeugt"

    staged=$(git -C "$DOCS" diff --cached --name-only 2>/dev/null || true)
    printf '%s\n' "$staged" | grep -q "_data/recent_commits.yml" \
        && pass "_data/recent_commits.yml ist gestagert" \
        || fail "_data/recent_commits.yml ist nicht gestagert"
}

setup_docs_repo
run_hook
check_output
