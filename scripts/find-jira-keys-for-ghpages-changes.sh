#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
repo_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
cd "$repo_root"

strip_domain() {
  printf '%s\n' "$1" | sed -E 's#^https://docs\.template\.ysdani\.com##'
}

extract_key() {
  path=$1
  case "$path" in
    mirror/issues/*/steps/*/index.md)
      printf '%s\n' "$path" | awk -F/ '{print $(NF-1)}'
      ;;
    mirror/issues/*/index.md)
      printf '%s\n' "$path" | awk -F/ '{print $(NF-1)}'
      ;;
    *)
      return 0
      ;;
  esac
}

main() {
  if [ $# -ne 1 ]; then
    printf 'Usage: %s <changes-json>\n' "$0" >&2
    exit 2
  fi

  changes_file=$1
  tmp_paths=$(mktemp)
  tmp_hits=$(mktemp)

  jq -r '
    .[]
    | (.old_urls[]?, .url?)
    | select(. != null and . != "")
  ' <"$changes_file" | while read -r url; do
    strip_domain "$url"
  done | sort -u >"$tmp_paths"

  while read -r path; do
    [ -n "$path" ] || continue
    rg -l -F "\"$path\"" mirror/issues >>"$tmp_hits" || true
  done <"$tmp_paths"

  sort -u "$tmp_hits" | while read -r hit; do
    [ -n "$hit" ] || continue
    extract_key "$hit"
  done | sed -E '/^$/d' | sort -u

  rm -f "$tmp_paths" "$tmp_hits"
}

main "$@"
