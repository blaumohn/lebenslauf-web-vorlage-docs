#!/bin/sh
# Rauchtest: lokale Preview-Links
# Prüft: Der Link-Rewriter ist nur im Jekyll-Development-Environment aktiv.
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
FOOTER="$REPO_ROOT/_includes/footer.html"
INCLUDE="$REPO_ROOT/_includes/local-preview-links.html"

fail() { printf 'FAIL: %s\n' "$1" >&2; exit 1; }
pass() { printf 'PASS: %s\n' "$1"; }

check_footer_guard() {
    grep -q 'jekyll.environment == "development"' "$FOOTER" \
        && pass "Preview-Rewriter ist auf development begrenzt" \
        || fail "Development-Guard fehlt"

    grep -q 'local-preview-links.html' "$FOOTER" \
        && pass "Footer bindet Preview-Rewriter ein" \
        || fail "Preview-Rewriter wird nicht eingebunden"
}

check_rewriter_target() {
    grep -q 'https://docs.template.ysdani.com' "$INCLUDE" \
        && pass "öffentliche Doku-Domain wird erkannt" \
        || fail "Doku-Domain fehlt im Rewriter"

    grep -q 'window.location.origin' "$INCLUDE" \
        && pass "lokaler Origin wird als Ziel verwendet" \
        || fail "lokaler Origin wird nicht verwendet"
}

check_footer_guard
check_rewriter_target
