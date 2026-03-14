#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
repo_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
cd "$repo_root"

require_bin() {
  if ! command -v "$1" >/dev/null 2>&1; then
    printf 'Fehler: fehlendes Kommando: %s\n' "$1" >&2
    exit 1
  fi
}

build_permalink_index() {
  out_file=$1

  rg -l '^permalink:' "$repo_root" \
    | while read -r file; do
        sed -nE 's/^permalink:[[:space:]]*(.+)$/\1/p' "$file" | head -n 1
      done \
    | sed -E 's/[[:space:]]+$//' \
    | sed -E '/^$/d' \
    | sort -u >"$out_file"
}

fetch_issue_keys() {
  /Users/usr2/edv/werk/atlassian-tools/cli/bin/atlassian jira http get \
    '/rest/api/3/search/jql?jql=project%3DJ01&maxResults=5000&fields=key' \
    | jq -r '.issues[].key'
}

fetch_remote_links() {
  issue_key=$1
  /Users/usr2/edv/werk/atlassian-tools/cli/bin/atlassian jira http get \
    "/rest/api/3/issue/$issue_key/remotelink" 2>/dev/null || printf '[]'
}

normalize_path() {
  lang=$1
  url=$2

  printf '%s\n' "$url" | jq -Rr --arg lang "$lang" '
    def docs_path:
      sub("^https://docs\\.template\\.ysdani\\.com"; "") as $path
      | if $path == "" then "/" else $path end;

    def is_neutral_path($path):
      ($path == "/" or $path == "/index.html");

    def is_localized_path($path):
      ($path | test("^/(de|en)(/|$)"));

    def is_language_bound_path($path):
      ($path | test("^/(areas|decisions|operations|policies|quality|templates|work|mirror)(/|$)"));

    docs_path as $path
    | if is_neutral_path($path) then
        $path
      elif is_localized_path($path) then
        ($path | sub("^/(de|en)(?=/|$)"; "/" + $lang))
      elif is_language_bound_path($path) then
        "/" + $lang + $path
      else
        $path
      end
  '
}

local_target_exists() {
  path=$1
  permalinks_file=$2

  if [ "$path" = "/index.html" ]; then
    grep -Fxq '/' "$permalinks_file"
    return
  fi

  grep -Fxq "$path" "$permalinks_file"
}

check_issue_links() {
  issue_key=$1
  permalinks_file=$2
  json=$(fetch_remote_links "$issue_key")

  printf '%s' "$json" | jq -r '
    .[]?
    | .object?
    | select(.url? != null)
    | select(.url | startswith("https://docs.template.ysdani.com"))
    | [.url, (.title // .url)]
    | @tsv
  ' | while IFS="$(printf '\t')" read -r url title; do
    check_one_link "$issue_key" "$url" "$title" "$permalinks_file"
  done
}

check_one_link() {
  issue_key=$1
  url=$2
  title=$3
  permalinks_file=$4

  de_path=$(normalize_path de "$url")
  en_path=$(normalize_path en "$url")

  if ! local_target_exists "$de_path" "$permalinks_file"; then
    printf 'FEHLT\t%s\tde\t%s\t%s\n' "$issue_key" "$de_path" "$title"
    return 1
  fi

  if ! local_target_exists "$en_path" "$permalinks_file"; then
    printf 'FEHLT\t%s\ten\t%s\t%s\n' "$issue_key" "$en_path" "$title"
    return 1
  fi

  printf 'OK\t%s\tde\t%s\t%s\n' "$issue_key" "$de_path" "$title"
  printf 'OK\t%s\ten\t%s\t%s\n' "$issue_key" "$en_path" "$title"
}

main() {
  require_bin jq
  require_bin rg
  require_bin sort
  require_bin sed
  require_bin grep

  failed=0
  keys_file=$(mktemp)
  permalinks_file=$(mktemp)
  fetch_issue_keys >"$keys_file"
  build_permalink_index "$permalinks_file"

  while read -r issue_key; do
    [ -n "$issue_key" ] || continue
    check_issue_links "$issue_key" "$permalinks_file" || failed=1
  done <"$keys_file"

  rm -f "$keys_file"
  rm -f "$permalinks_file"

  exit "$failed"
}

main "$@"
