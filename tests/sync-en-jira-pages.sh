#!/bin/sh
# Rauchtest: sync-en-jira-pages.sh
# Prüft: manuell gepflegte EN-Seiten werden nicht überschrieben.
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
BASE="${TMPDIR:-/tmp}/sync-en-test-$$"

cleanup() { rm -rf "$BASE"; }
trap cleanup EXIT

fail() { printf 'FAIL: %s\n' "$1" >&2; exit 1; }
pass() { printf 'PASS: %s\n' "$1"; }

setup_docs_tree() {
    DOCS="$BASE/lebenslauf-web-vorlage-docs"
    mkdir -p "$DOCS/scripts" "$DOCS/work/jira/J01-34" "$DOCS/en/work/jira/J01-34"
    cp "$REPO_ROOT/scripts/sync-en-jira-pages.sh" "$DOCS/scripts/"

    cat > "$DOCS/work/jira/J01-34/index.md" <<'EOF'
---
layout: page
permalink: /de/jira/issues/J01-34/
---
<!-- generated:jira:subtasks_cksum=1 -->

## Beschreibung

Deutsch.
EOF

    cat > "$DOCS/en/work/jira/J01-34/index.md" <<'EOF'
---
layout: page
permalink: /en/jira/issues/J01-34/
---

## Description

English.
EOF
}

run_script() {
    sh "$DOCS/scripts/sync-en-jira-pages.sh"
}

check_manual_page() {
    OUT="$DOCS/en/work/jira/J01-34/index.md"

    grep -q "English." "$OUT" \
        && pass "manuelle EN-Seite bleibt erhalten" \
        || fail "manuelle EN-Seite wurde überschrieben"

    if grep -q "Deutsch." "$OUT"; then
        fail "DE-Inhalt wurde in manuelle EN-Seite kopiert"
    fi
}

setup_docs_tree
run_script
check_manual_page
