#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
repo_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
cd "$repo_root"

docs_base='https://docs.template.ysdani.com'

read_file_at_ref() {
  ref=$1
  file=$2

  if [ -f "$file" ] && [ "$ref" = "WORKTREE" ]; then
    cat "$file"
    return 0
  fi

  git show "${ref}:${file}" 2>/dev/null || true
}

extract_frontmatter() {
  key=$1
  sed -nE "s/^${key}:[[:space:]]*\"?([^\"]+)\"?$/\\1/p" | head -n 1
}

to_url() {
  permalink=$1

  if [ -z "$permalink" ]; then
    return 0
  fi

  printf '%s%s' "$docs_base" "$permalink"
}

should_skip() {
  path=$1
  case "$path" in
    mirror/*|en/mirror/*)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

build_change_json() {
  file=$1
  base_ref=$2
  current_content=$(read_file_at_ref WORKTREE "$file")
  old_content=$(read_file_at_ref "$base_ref" "$file")

  current_permalink=$(printf '%s' "$current_content" | extract_frontmatter permalink)
  old_permalink=$(printf '%s' "$old_content" | extract_frontmatter permalink)
  current_title=$(printf '%s' "$current_content" | extract_frontmatter title)
  old_title=$(printf '%s' "$old_content" | extract_frontmatter title)

  if [ -z "$current_permalink" ] && [ -z "$old_permalink" ]; then
    return 0
  fi

  if [ "$current_permalink" = "$old_permalink" ] && [ "$current_title" = "$old_title" ]; then
    return 0
  fi

  old_url=$(to_url "$old_permalink")
  new_url=$(to_url "$current_permalink")

  jq -n \
    --arg file "$file" \
    --arg old_url "$old_url" \
    --arg url "$new_url" \
    --arg title "$current_title" \
    '{
      file: $file,
      old_urls: ([ $old_url ] | map(select(length > 0))),
      url: (if ($url | length) == 0 then null else $url end),
      title: (if ($title | length) == 0 then null else $title end)
    }'
}

main() {
  if [ $# -ne 1 ]; then
    printf 'Usage: %s <base-ref>\n' "$0" >&2
    exit 2
  fi

  base_ref=$1
  tmp_file=$(mktemp)

  {
    git diff --name-only "$base_ref" -- '*.md'
    git ls-files --others --exclude-standard -- '*.md'
  } | sort -u | while read -r path; do
    [ -n "$path" ] || continue
    if should_skip "$path"; then
      continue
    fi

    build_change_json "$path" "$base_ref" >>"$tmp_file"
  done

  if [ ! -s "$tmp_file" ]; then
    printf '[]\n'
    rm -f "$tmp_file"
    exit 0
  fi

  jq -s '.' <"$tmp_file"
  rm -f "$tmp_file"
}

main "$@"
