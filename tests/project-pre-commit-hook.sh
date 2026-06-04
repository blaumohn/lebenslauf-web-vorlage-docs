#!/bin/sh
# Rauchtest: Projekt-Pre-Commit-Hook für README-Sync
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
BASE="${TMPDIR:-/tmp}/project-readme-hook-$$"

cleanup() { rm -rf "$BASE"; }
trap cleanup EXIT

fail() { printf 'FAIL: %s\n' "$1" >&2; exit 1; }
pass() { printf 'PASS: %s\n' "$1"; }

setup_repos() {
    DOCS="$BASE/lebenslauf-web-vorlage-docs"
    APP="$BASE/lebenslauf-web-vorlage"
    mkdir -p "$DOCS/scripts/hooks" "$DOCS/de/start" "$DOCS/en/start" "$APP"
    cp "$REPO_ROOT/scripts/sync-readme.py" "$DOCS/scripts/"
    cp "$REPO_ROOT/scripts/hooks/project-pre-commit" "$DOCS/scripts/hooks/"
    git init "$APP" --quiet
    write_page "$DOCS/de/start/index.md" "Einstieg" "/de/start/" "1" "Hallo Doku."
    write_page "$DOCS/en/start/index.md" "Start" "/en/start/" "1" "Hello docs."
}

write_page() {
    path="$1"
    title="$2"
    permalink="$3"
    order="$4"
    body="$5"
    cat > "$path" <<EOF
---
title: "$title"
permalink: $permalink
readme_order: $order
---
$body
EOF
}

run_sync() {
    tools-python "$DOCS/scripts/sync-readme.py" --app-repo "$APP" >/dev/null
}

check_clean_readme_passes() {
    (cd "$APP" && sh "$DOCS/scripts/hooks/project-pre-commit") >/dev/null
    pass "synchrone README-Dateien akzeptiert"
}

check_stale_readme_fails() {
    printf 'veraltet\n' > "$APP/README.md"
    if (cd "$APP" && sh "$DOCS/scripts/hooks/project-pre-commit") >/dev/null 2>&1; then
        fail "veraltete README wurde akzeptiert"
    fi
    pass "veraltete README wurde abgelehnt"
}

setup_repos
run_sync
check_clean_readme_passes
check_stale_readme_fails
