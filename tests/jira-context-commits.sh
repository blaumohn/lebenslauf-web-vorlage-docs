#!/bin/sh
# Rauchtest: Jira-Kontext und Commits
# Prüft: Commits hängen am Inhalts-Schlüssel, nicht am Zustandskopf.
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
STATE_HEAD="$REPO_ROOT/_includes/jira-state-head.html"
WORK_CONTEXT="$REPO_ROOT/_includes/jira-work-context.html"

fail() { printf 'FAIL: %s\n' "$1" >&2; exit 1; }
pass() { printf 'PASS: %s\n' "$1"; }

check_state_head() {
    if grep -q 'jira-commits.html' "$STATE_HEAD"; then
        fail "Zustandskopf rendert weiterhin Commits"
    fi
    pass "Zustandskopf bleibt ohne Commit-Tabelle"
}

check_work_context() {
    grep -q 'href="#jira-commits-{{ current_key }}"' "$WORK_CONTEXT" \
        && pass "Inhalts-Schlüssel verlinkt Commit-Abschnitt" \
        || fail "Commit-Link fehlt im Inhalts-Schlüssel"

    grep -q '{% include jira-commits.html %}' "$WORK_CONTEXT" \
        && pass "Arbeitskontext rendert Commit-Tabelle" \
        || fail "Commit-Tabelle fehlt im Arbeitskontext"
}

check_order() {
    link_line=$(grep -n 'href="#jira-commits-{{ current_key }}"' "$WORK_CONTEXT" | cut -d: -f1)
    include_line=$(grep -n '{% include jira-commits.html %}' "$WORK_CONTEXT" | cut -d: -f1)

    [ "$link_line" -lt "$include_line" ] \
        && pass "Commit-Link steht vor Commit-Ausgabe" \
        || fail "Commit-Ausgabe steht vor dem Inhalts-Schlüssel"
}

check_state_head
check_work_context
check_order
