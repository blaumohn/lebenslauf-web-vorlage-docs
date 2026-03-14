#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
repo_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
cd "$repo_root"

require_bin() {
  if command -v "$1" >/dev/null 2>&1; then
    return
  fi

  printf 'Fehler: fehlendes Kommando: %s\n' "$1" >&2
  exit 1
}

log() {
  printf '== %s ==\n' "$1" >&2
}

fetch_issues() {
  atlassian jira http get \
    '/rest/api/3/search/jql?jql=project%3DJ01%20AND%20issuetype%20!%3D%20Subtask&maxResults=5000&fields=key,summary,issuetype,status,updated,parent,labels,customfield_10020'
}

fetch_subtasks() {
  atlassian jira http get \
    '/rest/api/3/search/jql?jql=project%3DJ01%20AND%20issuetype%3DSubtask&maxResults=5000&fields=key,summary,status,updated,parent,description,labels'
}

fetch_open_sprint() {
  atlassian jira http get \
    '/rest/api/3/search/jql?jql=project%3DJ01%20AND%20sprint%20in%20openSprints%28%29&maxResults=5000&fields=key'
}

fetch_issue() {
  issue_key=$1
  atlassian jira http get \
    "/rest/api/3/issue/${issue_key}?fields=key,summary,issuetype,status,updated,parent,labels,customfield_10020,description"
}

ensure_cache() {
  cache_dir=$1
  mkdir -p "$cache_dir"
}

ensure_full_cache() {
  cache_dir=$1

  if [ -f "$cache_dir/issues.json" ] && [ -f "$cache_dir/subtasks.json" ] && [ -f "$cache_dir/sprint.json" ]; then
    return
  fi

  refresh_full_cache "$cache_dir"
}

refresh_full_cache() {
  cache_dir=$1

  log "Cache: Vollabzug Issues"
  fetch_issues >"$cache_dir/issues.json"
  log "Cache: Vollabzug Subtasks"
  fetch_subtasks >"$cache_dir/subtasks.json"
  log "Cache: Vollabzug Sprint"
  fetch_open_sprint >"$cache_dir/sprint.json"
}

issue_type_name() {
  issue_file=$1
  jq -r '.fields.issuetype.name' <"$issue_file"
}

replace_cache_issue() {
  cache_file=$1
  issue_file=$2
  issue_key=$3
  tmp_file=$4

  jq --arg key "$issue_key" --slurpfile item "$issue_file" '
    .issues = (
      ((.issues // []) | map(select(.key != $key))) + [$item[0]]
      | sort_by(.key)
    )
  ' <"$cache_file" >"$tmp_file"
  mv "$tmp_file" "$cache_file"
}

apply_change() {
  cache_dir=$1
  change=$2
  issue_key=${change%%:*}
  issue_file=$(mktemp)
  tmp_file=$(mktemp)

  fetch_issue "$issue_key" >"$issue_file"
  issue_type=$(issue_type_name "$issue_file")

  if [ "$issue_type" = "Subtask" ]; then
    replace_cache_issue "$cache_dir/subtasks.json" "$issue_file" "$issue_key" "$tmp_file"
  else
    replace_cache_issue "$cache_dir/issues.json" "$issue_file" "$issue_key" "$tmp_file"
  fi

  rm -f "$issue_file"
}

collect_changes() {
  csv=$1
  file=$2
  out=$3

  {
    if [ -n "$csv" ]; then
      printf '%s\n' "$csv"
    fi
    if [ -n "$file" ] && [ -f "$file" ]; then
      cat "$file"
    fi
  } | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//' \
    | sed -E '/^$/d' \
    | sort -u >"$out"
}

append_change() {
  existing=$1
  next=$2

  if [ -z "$existing" ]; then
    printf '%s' "$next"
    return
  fi

  printf '%s\n%s' "$existing" "$next"
}

main() {
  require_bin atlassian
  require_bin jq
  require_bin sed
  require_bin sort
  require_bin cat
  require_bin mkdir

  cache_dir=''
  full=0
  changes_csv=''
  changes_file=''

  while [ $# -gt 0 ]; do
    case "$1" in
      --cache-dir)
        cache_dir=${2:-}
        shift 2
        ;;
      --full)
        full=1
        shift
        ;;
      --change)
        changes_csv=$(append_change "$changes_csv" "${2:-}")
        shift 2
        ;;
      --changes-file)
        changes_file=${2:-}
        shift 2
        ;;
      *)
        printf 'Fehler: unbekanntes Argument: %s\n' "$1" >&2
        exit 1
        ;;
    esac
  done

  if [ -z "$cache_dir" ]; then
    printf 'Fehler: --cache-dir fehlt.\n' >&2
    exit 1
  fi

  ensure_cache "$cache_dir"
  if [ "$full" = "1" ]; then
    refresh_full_cache "$cache_dir"
    exit 0
  fi

  ensure_full_cache "$cache_dir"

  tmp_changes=$(mktemp)
  collect_changes "$changes_csv" "$changes_file" "$tmp_changes"
  while read -r change; do
    [ -n "$change" ] || continue
    log "Cache: Update ${change}"
    apply_change "$cache_dir" "$change"
  done <"$tmp_changes"

  rm -f "$tmp_changes"
}

main "$@"
