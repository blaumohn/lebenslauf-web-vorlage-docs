#!/bin/sh
# Rauchtest: generate-recent-commits.sh
# Prüft: normaler Commit erscheint; Artefakt-Commit (nur recent_commits.yml) nicht.
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
BASE="${TMPDIR:-/tmp}/rctest-$$"

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
    git -C "$SRC" commit -m "feat: normale Änderung" --quiet

    mkdir -p "$SRC/_data"
    printf 'generated\n' > "$SRC/_data/recent_commits.yml"
    git -C "$SRC" add _data/recent_commits.yml
    git -C "$SRC" commit -m "chore: recent_commits.yml aktualisieren" --quiet
}

setup_docs_repo() {
    DOCS="$BASE/lebenslauf-web-vorlage-docs"
    mkdir -p "$DOCS/scripts" "$DOCS/_data"
    cp "$REPO_ROOT/scripts/generate-recent-commits.sh" "$DOCS/scripts/"
    git init "$DOCS" --quiet
    git -C "$DOCS" config user.name "Test"
    git -C "$DOCS" config user.email "test@example.invalid"
}

run_script() {
    DOCS="$BASE/lebenslauf-web-vorlage-docs"
    sh "$DOCS/scripts/generate-recent-commits.sh" 2>/dev/null || true
}

check_output() {
    OUT="$BASE/lebenslauf-web-vorlage-docs/_data/recent_commits.yml"
    [ -f "$OUT" ] || fail "Output-Datei nicht erzeugt"

    grep -q "feat: normale" "$OUT" \
        && pass "normaler Commit erscheint im Feed" \
        || fail "normaler Commit fehlt im Feed"

    if grep -q "recent_commits.yml aktualisieren" "$OUT" 2>/dev/null; then
        fail "Artefakt-Commit erscheint im Feed (sollte gefiltert sein)"
    else
        pass "Artefakt-Commit korrekt gefiltert"
    fi
}

setup_source_repo
setup_docs_repo
run_script
check_output
