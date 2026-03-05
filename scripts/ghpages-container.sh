#!/bin/sh
set -eu

MODE=${1:-preview}

export TMPDIR=/tmp
export PATH="/usr/local/bundle/bin:$PATH"

main() {
  case "$MODE" in
    preview)
      run_preview
      ;;
    shell)
      run_shell
      ;;
    *)
      printf 'Fehler: unbekannter Modus: %s\n' "$MODE" >&2
      exit 1
      ;;
  esac
}

run_preview() {
  exec jekyll serve \
    --source /src/site \
    --destination /tmp/_site \
    --host 0.0.0.0 \
    --port 4000
}

run_shell() {
  echo "== PATH =="
  printf '%s\n' "$PATH"
  echo "== jekyll =="
  command -v jekyll || true
  echo "== /src/site =="
  ls -la /src/site || true
  exec /bin/bash
}

main
