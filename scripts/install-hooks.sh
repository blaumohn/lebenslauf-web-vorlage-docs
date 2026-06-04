#!/bin/sh
# Richtet die versionierten Git-Hooks ein.
# Aufruf: sh scripts/install-hooks.sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
PARENT_DIR=$(CDPATH= cd -- "$REPO_ROOT/.." && pwd)
PROJECT_REPOS="lebenslauf-web-vorlage pipeline-config-spec-php"

main() {
    check_sources
    install_docs_hooks
    install_project_hooks
}

check_sources() {
    check_source "pre-commit"
    check_source "project-pre-commit"
    check_source "commit-msg"
    check_source "post-commit"
}

check_source() {
    hook="$1"
    src="$SCRIPT_DIR/hooks/$hook"
    [ -f "$src" ] || fail "Hook-Quelle nicht gefunden: $src"
    chmod +x "$src"
}

install_docs_hooks() {
    install_hook "$REPO_ROOT" "pre-commit"
    install_hook "$REPO_ROOT" "commit-msg"
}

install_project_hooks() {
    for repo in $PROJECT_REPOS; do
        repo_path="$PARENT_DIR/$repo"
        [ -d "$repo_path/.git" ] || continue
        install_hook "$repo_path" "commit-msg"
        install_hook "$repo_path" "post-commit"
        [ "$repo" = "lebenslauf-web-vorlage" ] || continue
        install_named_hook "$repo_path" "project-pre-commit" "pre-commit"
    done
}

install_hook() {
    repo_path="$1"
    hook="$2"
    install_named_hook "$repo_path" "$hook" "$hook"
}

install_named_hook() {
    repo_path="$1"
    source_hook="$2"
    target_hook="$3"
    src="$SCRIPT_DIR/hooks/$source_hook"
    dst="$repo_path/.git/hooks/$target_hook"
    ln -sf "$src" "$dst"
    printf 'Hook eingerichtet: %s\n' "$dst"
}

fail() {
    printf 'Fehler: %s\n' "$1" >&2
    exit 1
}

main
