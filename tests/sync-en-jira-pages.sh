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
    mkdir -p "$DOCS/work/jira/J01-62" "$DOCS/en/work/jira/J01-62"
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

    cat > "$DOCS/work/jira/J01-62/index.md" <<'EOF'
---
layout: page
permalink: /de/jira/issues/J01-62/
---
<!-- generated:jira:subtasks_cksum=1 -->

## Beschreibung

Ziel: Production-Branch und Environment-Regeln verbindlich setzen.

## Aktueller Stand

Deutscher Stand.

## Unteraufgaben

- **62-1 Beispiel** — Erledigt

## Überprüfungsplan

| Prüfpunkt | Status |
| --- | --- |
| Beispiel | erledigt |
EOF

    cat > "$DOCS/en/work/jira/J01-62/index.md" <<'EOF'
---
layout: page
permalink: /en/jira/issues/J01-62/
---
<!-- generated:jira:subtasks_cksum=0 -->

## Description

Goal: make the production branch and environment rules binding.

## Current State

English state.

## Subtasks

- **62-1 Example** — Done

## Verification Plan

| Check | Status |
| --- | --- |
| Example | done |
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

check_generated_page_keeps_english_sections() {
    OUT="$DOCS/en/work/jira/J01-62/index.md"

    grep -q "Goal: make the production branch" "$OUT" \
        || fail "generierte EN-Description wurde nicht erhalten"

    grep -q "English state." "$OUT" \
        || fail "generierter EN-Current-State wurde nicht erhalten"

    grep -q "| Check | Status |" "$OUT" \
        || fail "generierter EN-Verification-Plan wurde nicht erhalten"

    if grep -q "Ziel: Production-Branch" "$OUT"; then
        fail "DE-Description wurde in generierte EN-Seite kopiert"
    fi

    pass "generierte EN-Abschnitte bleiben erhalten"
}

setup_docs_tree
run_script
check_manual_page
check_generated_page_keeps_english_sections
