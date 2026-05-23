#!/bin/sh
# Rauchtest: Jira-Kontext und Commits
# Prüft: Commits hängen am Inhalts-Schlüssel, nicht am Zustandskopf.
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
STATE_HEAD="$REPO_ROOT/_includes/jira-state-head.html"
WORK_CONTEXT="$REPO_ROOT/_includes/jira-work-context.html"
PAGE_LAYOUT="$REPO_ROOT/_layouts/page.html"

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

    if grep -q '{% include jira-commits.html %}' "$WORK_CONTEXT"; then
        fail "Arbeitskontext rendert weiterhin die Commit-Tabelle"
    fi
    pass "Arbeitskontext bleibt ohne Commit-Tabelle"
}

check_order() {
    link_line=$(grep -n 'href="#jira-commits-{{ current_key }}"' "$WORK_CONTEXT" | cut -d: -f1)
    content_line=$(grep -n '{{ content }}' "$PAGE_LAYOUT" | cut -d: -f1)
    include_line=$(grep -n '{% include jira-commits.html %}' "$PAGE_LAYOUT" | cut -d: -f1)

    [ -n "$link_line" ] || fail "Commit-Link wurde nicht gefunden"
    [ "$content_line" -lt "$include_line" ] \
        && pass "Commit-Ausgabe steht nach Seiteninhalt" \
        || fail "Commit-Ausgabe steht vor dem Seiteninhalt"
}

check_state_head
check_work_context
check_order
