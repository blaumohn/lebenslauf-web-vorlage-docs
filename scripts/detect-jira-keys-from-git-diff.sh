#!/bin/sh
set -eu

base_ref=${1:-}
if [ -z "$base_ref" ]; then
  printf 'Usage: %s <base-ref>\n' "$0" >&2
  printf 'Beispiel: %s HEAD~1\n' "$0" >&2
  exit 2
fi

# Extrahiert Jira-Keys aus geänderten Pfaden/Dateinamen.
# Bewusst simpel: wir nehmen alles, was wie "J01-<zahl>" aussieht.
git diff --name-only "$base_ref"...HEAD \
  | sed -nE 's/.*(J01-[0-9]+).*/\1/p' \
  | sort -u

