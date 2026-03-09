#!/bin/sh
set -eu

docs_repo=${DOCS_REPO:-}
if [ -z "$docs_repo" ]; then
  printf 'Fehler: DOCS_REPO ist nicht gesetzt.\n' >&2
  printf 'Beispiel: DOCS_REPO=/pfad/zum/lebenslauf-web-vorlage-docs %s --full\n' "$0" >&2
  exit 2
fi

if [ ! -d "$docs_repo" ]; then
  printf 'Fehler: DOCS_REPO ist kein Verzeichnis: %s\n' "$docs_repo" >&2
  exit 2
fi

cd "$docs_repo"
exec sh scripts/update-jira-mirror.sh "$@"

