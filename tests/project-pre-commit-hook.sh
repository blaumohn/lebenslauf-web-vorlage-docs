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
    mkdir -p "$DOCS/scripts/hooks" "$DOCS/de/start" "$DOCS/en/start" \
        "$DOCS/de/getting-started/schnellstart" \
        "$DOCS/en/getting-started/quickstart" \
        "$DOCS/de/getting-started/private-ansicht" \
        "$DOCS/en/getting-started/private-view" \
        "$APP/tests/ci"
    cp "$REPO_ROOT/scripts/sync-readme.py" "$DOCS/scripts/"
    cp "$REPO_ROOT/scripts/hooks/project-pre-commit" "$DOCS/scripts/hooks/"
    git init "$APP" --quiet
    write_page "$DOCS/de/start/index.md" "Einstieg" "/de/start/" "1" "Hallo Doku."
    write_page "$DOCS/en/start/index.md" "Start" "/en/start/" "1" "Hello docs."
    write_quickstart_page "$DOCS/de/getting-started/schnellstart/index.md" \
        "Schnellstart" "/de/getting-started/schnellstart/"
    write_quickstart_page "$DOCS/en/getting-started/quickstart/index.md" \
        "Quickstart" "/en/getting-started/quickstart/"
    write_quickstart_page "$DOCS/de/getting-started/private-ansicht/index.md" \
        "Private Ansicht einrichten" "/de/getting-started/private-ansicht/"
    write_quickstart_page "$DOCS/en/getting-started/private-view/index.md" \
        "Set up private view" "/en/getting-started/private-view/"
    write_flow_script
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

write_quickstart_page() {
    path="$1"
    title="$2"
    permalink="$3"
    cat > "$path" <<EOF
---
layout: page
title: "$title"
permalink: $permalink
readme_order: 0
---

alt

## Mehr

bleibt
EOF
}

write_flow_script() {
    cat > "$APP/tests/ci/readme-dev-user-flow.sh" <<'EOF'
schnellstart() {
  git clone "$REPLACE_WITH_REPOSITORY_URL" lebenslauf-web-vorlage
  cd lebenslauf-web-vorlage
  PATH="$PWD/bin:$PATH"  # Hinweis: alternativ `php bin/cli ...` verwenden.
  composer install
  cli setup dev --with-sample-content
  cli build dev
  cli start dev > /tmp/readme-dev-ux-server.log 2>&1 &
  dev_server_pid="$!"
  wait_for_dev_server
}

private_ansicht_einrichten() {
  local token
  token="$(cli token dev rotate default)"
  curl --fail --silent --show-error "http://127.0.0.1:8080/cv?token=${token}" \
    | grep -q '</html>'
}
EOF
}

run_sync() {
    tools-python "$DOCS/scripts/sync-readme.py" --app-repo "$APP" >/dev/null
}

check_clean_readme_passes() {
    (cd "$APP" && sh "$DOCS/scripts/hooks/project-pre-commit") >/dev/null
    pass "synchrone README-Dateien akzeptiert"
}

check_flow_sections_copied() {
    grep -q 'Doku: \[Schnellstart\]' "$APP/README.md" \
        || fail "Doku-Link für Schnellstart fehlt im README"
    grep -q 'Doku: \[Private Ansicht einrichten\]' "$APP/README.md" \
        || fail "Doku-Link für private Ansicht fehlt im README"
    if grep -q 'schnellstart() {' "$APP/README.md"; then
        fail "Funktionshülle wurde in README kopiert"
    fi
    grep -q 'REPLACE_WITH_REPOSITORY_URL' "$APP/README.md" \
        || fail "REPLACE_WITH_REPOSITORY_URL fehlt im README"
    grep -q 'readme-dev-user-flow.sh#L1-L11' "$APP/README.md" \
        || fail "Zeilenanker für Schnellstart fehlt im README"
    pass "Flow-Funktionen wurden in README übernommen"
}

check_stale_readme_fails() {
    printf 'veraltet\n' > "$APP/README.md"
    if (cd "$APP" && sh "$DOCS/scripts/hooks/project-pre-commit") >/dev/null 2>&1; then
        fail "veraltete README wurde akzeptiert"
    fi
    pass "veraltete README wurde abgelehnt"
}

check_missing_flow_function_fails() {
    sed '/private_ansicht_einrichten()/,$d' \
        "$APP/tests/ci/readme-dev-user-flow.sh" \
        > "$APP/tests/ci/readme-dev-user-flow.missing.sh"
    if tools-python "$DOCS/scripts/sync-readme.py" \
        --app-repo "$APP" \
        --flow-script "$APP/tests/ci/readme-dev-user-flow.missing.sh" \
        >/dev/null 2>&1; then
        fail "fehlende Flow-Funktion wurde akzeptiert"
    fi
    pass "fehlende Flow-Funktion wurde abgelehnt"
}

setup_repos
run_sync
check_clean_readme_passes
check_flow_sections_copied
check_stale_readme_fails
check_missing_flow_function_fails
