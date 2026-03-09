#!/bin/sh
set -eu

docs_repo=${DOCS_REPO:-}
if [ -z "$docs_repo" ]; then
  printf 'Fehler: DOCS_REPO ist nicht gesetzt.\n' >&2
  printf 'Beispiel: DOCS_REPO=/pfad/zum/lebenslauf-web-vorlage-docs %s HEAD~1\n' "$0" >&2
  exit 2
fi

if [ ! -d "$docs_repo" ]; then
  printf 'Fehler: DOCS_REPO ist kein Verzeichnis: %s\n' "$docs_repo" >&2
  exit 2
fi

base_ref=${1:-}
if [ -z "$base_ref" ]; then
  printf 'Usage: DOCS_REPO=... %s <base-ref>\n' "$0" >&2
  printf 'Beispiel: DOCS_REPO=... %s HEAD~1\n' "$0" >&2
  exit 2
fi

cd "$docs_repo"

# Extrahiert Jira-Keys aus geänderten Pfaden/Dateinamen.
# Bewusst simpel: wir nehmen alles, was wie "J01-<zahl>" aussieht.
git diff --name-only "$base_ref"...HEAD \
  | sed -nE 's/.*(J01-[0-9]+).*/\1/p' \
  | sort -u

