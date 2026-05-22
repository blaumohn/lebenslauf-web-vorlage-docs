#!/bin/sh
# Rauchtest: sync-jira-commits.py
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
BASE="${TMPDIR:-/tmp}/jira-commit-sync-$$"

cleanup() { rm -rf "$BASE"; }
trap cleanup EXIT

fail() { printf 'FAIL: %s\n' "$1" >&2; exit 1; }
pass() { printf 'PASS: %s\n' "$1"; }

setup_source_repo() {
    SRC="$BASE/lebenslauf-web-vorlage"
    git init "$SRC" --quiet
    git -C "$SRC" config user.name "Test"
    git -C "$SRC" config user.email "test@example.invalid"

    printf 'content\n' > "$SRC/file.txt"
    git -C "$SRC" add file.txt
    git -C "$SRC" commit -m "feat(app): sichtbaren Commit speichern (J01-143)" --quiet

    printf 'other\n' > "$SRC/other.txt"
    git -C "$SRC" add other.txt
    git -C "$SRC" commit -m "docs(app): Commit ohne Jira-Key" --quiet
}

setup_docs_repo() {
    DOCS="$BASE/lebenslauf-web-vorlage-docs"
    mkdir -p "$DOCS/scripts" "$DOCS/_data"
    cp "$REPO_ROOT/scripts/sync-jira-commits.py" "$DOCS/scripts/"
}

run_full_sync() {
    DOCS="$BASE/lebenslauf-web-vorlage-docs"
    python3 "$DOCS/scripts/sync-jira-commits.py" full
}

check_output() {
    OUT="$BASE/lebenslauf-web-vorlage-docs/_data/jira_commits.json"
    [ -f "$OUT" ] || fail "Output-Datei nicht erzeugt"

    grep -q '"J01-143"' "$OUT" \
        && pass "Jira-Key wurde übernommen" \
        || fail "Jira-Key fehlt"

    grep -q 'sichtbaren Commit speichern' "$OUT" \
        && pass "Commit-Titel wurde übernommen" \
        || fail "Commit-Titel fehlt"

    if grep -q 'Commit ohne Jira-Key' "$OUT"; then
        fail "Commit ohne Jira-Key wurde übernommen"
    fi
    pass "Commit ohne Jira-Key wurde übersprungen"
}

setup_source_repo
setup_docs_repo
run_full_sync
check_output
