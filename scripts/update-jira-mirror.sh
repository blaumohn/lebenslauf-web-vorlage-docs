#!/bin/sh
set -eu

require_bin() {
  if ! command -v "$1" >/dev/null 2>&1; then
    printf 'Fehler: fehlendes Kommando: %s\n' "$1" >&2
    exit 1
  fi
}

log() {
  printf '== %s ==\n' "$1" >&2
}

write_if_changed() {
  target=$1
  tmp=$2

  if [ -f "$target" ] && cmp -s "$tmp" "$target"; then
    rm -f "$tmp"
    return 0
  fi

  mkdir -p "$(dirname "$target")"
  mv "$tmp" "$target"
}

split_csv_keys() {
  # Input: "J01-1,J01-2 , J01-3"
  # Output: one key per line (trimmed), empty lines removed.
  printf '%s' "${1:-}" \
    | tr ',' '\n' \
    | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//' \
    | sed -E '/^$/d'
}

build_keys_file() {
  csv=$1
  file=$2
  out=$3

  {
    split_csv_keys "$csv"
    if [ -n "${file:-}" ] && [ -f "$file" ]; then
      cat "$file"
    fi
  } \
    | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//' \
    | sed -E '/^$/d' \
    | sort -u >"$out"
}

key_in_file() {
  key=$1
  file=$2
  [ -n "${file:-}" ] && [ -f "$file" ] && grep -Fxq "$key" "$file"
}

extract_existing_meta_value() {
  # Extract a generated meta marker from an existing file.
  # Format: <!-- mirror:<name>=<value> -->
  #
  # Usage: extract_existing_meta_value path subtasks_cksum
  path=$1
  name=$2

  if [ ! -f "$path" ]; then
    return 0
  fi

  grep -E "^<!-- mirror:${name}=" "$path" 2>/dev/null \
    | sed -E "s/^<!-- mirror:${name}=([^[:space:]]+) -->$/\\1/" \
    | head -n 1 \
    || true
}

extract_existing_updated() {
  # Extract: "- **Aktualisiert:** <value>"
  path=$1

  if [ ! -f "$path" ]; then
    return 0
  fi

  grep -E '^- \\*\\*Aktualisiert:\\*\\* ' "$path" 2>/dev/null \
    | sed -E 's/^- \\*\\*Aktualisiert:\\*\\* (.+)$/\\1/' \
    | head -n 1 \
    || true
}

render_public_remotelinks_md() {
  issue_key=$1

  # Jira Remote Links können alles Mögliche enthalten. Für Public Mirror zeigen
  # wir nur eine harte Allowlist (Doku-Domain).
  json=$(atlassian jira http get "/rest/api/3/issue/$issue_key/remotelink" 2>/dev/null || printf '[]')

  printf '%s' "$json" | jq -r --arg base 'https://docs.template.ysdani.com/' '
    [ .[]?
      | .object?
      | select(.url? != null)
      | {
          url: .url,
          title: (.title // .url)
        }
      | select(.url | startswith($base))
      | .title |= (gsub("\\n"; " ") | gsub("\\["; "(") | gsub("\\]"; ")"))
      | select((.title | test("@")) | not)
    ]
    | unique_by(.url)
    | sort_by(.url)
    | if length == 0 then
        "-"
      else
        map(
          "- ["
          + .title
          + "]({{ \""
          + (.url | sub($base; "/"))
          + "\" | relative_url }})"
        )
        | join("\n")
      end
  ' 2>/dev/null || printf '%s\n' "-"
}

cleanup_steps_dirs() {
  : # deprecated (ersetzt durch cleanup_stale_step_dirs)
}

cleanup_stale_issue_dirs() {
  issues_file=$1

  # Issue-Seiten sind vollständig abgeleitet. Wir löschen Issue-Ordner, die in
  # Jira nicht mehr existieren, damit der Mirror "sauber voll gespiegelt" bleibt.
  if [ ! -d mirror/issues ]; then
    return
  fi

  tmp_dir=${TMPDIR:-/tmp}
  keys_file="$tmp_dir/j01-issue-keys.txt"
  jq -r '.issues[].key' <"$issues_file" | sort >"$keys_file"

  find mirror/issues -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
    key=$(basename "$dir")
    # Sicherheitsgurt: nur Projekt-Keys anrühren.
    case "$key" in
      J01-*)
        if ! grep -Fxq "$key" "$keys_file"; then
          rm -rf "$dir"
        fi
        ;;
      *)
        ;;
    esac
  done
}

cleanup_stale_step_dirs() {
  subtasks_file=$1

  if [ ! -d mirror/issues ]; then
    return
  fi

  tmp_dir=${TMPDIR:-/tmp}
  allow_file="$tmp_dir/j01-step-allow.txt"

  jq -r '
    .issues[]
    | select(.fields.description != null)
    | .fields.summary as $s
    | (if ($s | test("^[0-9]+-[0-9]+\\s")) then .fields.parent.key + "/" + .key else empty end)
  ' <"$subtasks_file" | sort -u >"$allow_file"

  find mirror/issues -mindepth 4 -maxdepth 4 -type d -path '*/steps/*' | while read -r dir; do
    parent=$(printf '%s' "$dir" | awk -F/ '{print $(NF-2)}')
    key=$(basename "$dir")
    pair="$parent/$key"
    if ! grep -Fxq "$pair" "$allow_file"; then
      rm -rf "$dir"
    fi
  done
}

sanitize_public_description_text() {
  awk '
    /Ausschlussliste/ { next }
    /Confluence-Seiten ohne Nutzen/ { next }
    {
      gsub(/Jira-Spiegel/, "Jira-Übersicht")
      if ($0 ~ /\/mirror\/vorgaenge\//) {
        gsub(/, *\/mirror\/vorgaenge\/\./, ".")
        gsub(/, *\/mirror\/vorgaenge\//, "")
      }
      print
    }
  '
}

main() {
  require_bin atlassian
  require_bin jq
  require_bin sort
  require_bin mkdir
  require_bin awk
  require_bin sed
  require_bin grep
  require_bin head
  require_bin cat
  require_bin find
  require_bin rm
  require_bin mv
  require_bin cmp
  require_bin mktemp
  require_bin cksum

  full=0
  touched_keys_csv=''
  touched_keys_file=''

  while [ $# -gt 0 ]; do
    case "$1" in
      --full)
        full=1
        shift
        ;;
      --touched-keys)
        touched_keys_csv=${2:-}
        shift 2
        ;;
      --touched-keys-file)
        touched_keys_file=${2:-}
        shift 2
        ;;
      -*)
        printf 'Fehler: unbekanntes Argument: %s\n' "$1" >&2
        exit 1
        ;;
      *)
        printf 'Fehler: unerwartetes Argument: %s\n' "$1" >&2
        exit 1
        ;;
    esac
  done

  tmp_dir=${TMPDIR:-/tmp}
  issues_file="$tmp_dir/j01-non-subtasks.json"
  subtasks_file="$tmp_dir/j01-subtasks.json"
  sprint_file="$tmp_dir/j01-open-sprint.json"
  touched_file="$tmp_dir/j01-touched-keys.txt"

  build_keys_file "$touched_keys_csv" "$touched_keys_file" "$touched_file"

  log "Jira: Issues laden"
  fetch_issues "$issues_file"
  log "Jira: Subtasks laden"
  fetch_subtasks "$subtasks_file"
  log "Jira: Open Sprint laden"
  fetch_open_sprint "$sprint_file"

  log "Mirror: Index"
  update_mirror_index
  log "Mirror: Backlog"
  update_backlog "$issues_file" "$subtasks_file"
  log "Mirror: Erledigt"
  update_erledigt "$issues_file" "$subtasks_file"
  log "Mirror: Sprint-Board"
  update_sprint_board "$issues_file" "$sprint_file"

  log "Mirror: Issue-Seiten"
  cleanup_stale_issue_dirs "$issues_file"
  update_issue_pages "$issues_file" "$subtasks_file" "$full" "$touched_file"
  log "Mirror: Subtask-Seiten (mit Angaben)"
  cleanup_stale_step_dirs "$subtasks_file"
  update_subtask_pages_with_description "$subtasks_file" "$full" "$touched_file"
}

fetch_issues() {
  out_file=$1
  atlassian jira http get \
    '/rest/api/3/search/jql?jql=project%3DJ01%20AND%20issuetype%20!%3D%20Subtask&maxResults=5000&fields=key,summary,issuetype,status,updated,parent' \
    >"$out_file"
}

fetch_subtasks() {
  out_file=$1
  atlassian jira http get \
    '/rest/api/3/search/jql?jql=project%3DJ01%20AND%20issuetype%3DSubtask&maxResults=5000&fields=key,summary,status,updated,parent,description' \
    >"$out_file"
}

fetch_open_sprint() {
  out_file=$1
  atlassian jira http get \
    '/rest/api/3/search/jql?jql=project%3DJ01%20AND%20issuetype%20!%3D%20Subtask%20AND%20sprint%20in%20openSprints%28%29&maxResults=5000&fields=key' \
    >"$out_file"
}

update_mirror_index() {
  tmp=$(mktemp)
  cat >"$tmp" <<EOF
---
layout: page
title: "Jira-Übersicht"
permalink: /mirror/
---

Die Jira-Übersicht zeigt einen statischen Snapshot (ohne öffentliches Jira).

- [Sprint-Board]({{ "/mirror/sprint-board/" | relative_url }})
- [Backlog]({{ "/mirror/backlog/" | relative_url }})
- [Erledigt]({{ "/mirror/erledigt/" | relative_url }})
EOF
  write_if_changed mirror/index.md "$tmp"
}

update_backlog() {
  issues_file=$1
  subtasks_file=$2
  tmp=$(mktemp)

  render_vorgaenge_page \
    "Jira-Übersicht: Backlog" \
    "/mirror/backlog/" \
    "$issues_file" \
    "$subtasks_file" \
    "select(.statusCategory != \"done\")" \
    >"$tmp"

  write_if_changed mirror/backlog/index.md "$tmp"
}

update_erledigt() {
  issues_file=$1
  subtasks_file=$2
  tmp=$(mktemp)

  render_vorgaenge_page \
    "Jira-Übersicht: Erledigt" \
    "/mirror/erledigt/" \
    "$issues_file" \
    "$subtasks_file" \
    "select(.statusCategory == \"done\")" \
    >"$tmp"

  write_if_changed mirror/erledigt/index.md "$tmp"
}

update_sprint_board() {
  issues_file=$1
  sprint_file=$2
  tmp=$(mktemp)

  sprint_keys=$(jq -r '.issues[].key' <"$sprint_file" | sort | tr '\n' ' ')

  jq \
    --raw-output \
    --arg keys "$sprint_keys" \
    '
      def keyset:
        ($keys | split(" ") | map(select(length>0)) | {keys: .}) | .keys;

      def in_sprint($k):
        (keyset | index($k)) != null;

      def issue_line:
        "- [\(.key) — \(.summary)]({{ \"/mirror/issues/\(.key)/\" | relative_url }})";

      def issues:
        [ .issues[]
          | {
              key: .key,
              summary: (.fields.summary | gsub("\\(SSOT\\)"; "(SSOT: Jira)")),
              statusCategory: .fields.status.statusCategory.key
            }
          | select(in_sprint(.key))
        ];

      def bucket($cat):
        (issues | map(select(.statusCategory == $cat)) | map(issue_line) | join("<br>"));

      def bucket_or_dash($cat):
        (bucket($cat) | if length == 0 then "-" else . end);

      "---",
      "layout: page",
      "title: \"Jira-Übersicht: Sprint-Board\"",
      "permalink: /mirror/sprint-board/",
      "---",
      "",
      "Sprint-Board als statische Jira-Übersicht (ohne Jira-Cloud-Links).",
      "",
      "| Zu erledigen | In Bearbeitung | In Überprüfung | Erledigt |",
      "|---|---|---|---|",
      "| \(bucket_or_dash("new")) | \(bucket_or_dash("indeterminate")) | - | \(bucket_or_dash("done")) |"
    ' <"$issues_file" >"$tmp"

  write_if_changed mirror/sprint-board/index.md "$tmp"
}

render_vorgaenge_page() {
  title=$1
  permalink=$2
  issues_file=$3
  subtasks_file=$4
  issue_filter=$5

  jq \
    --raw-output \
    --arg title "$title" \
    --arg permalink "$permalink" \
    --arg issue_filter "$issue_filter" \
    --slurpfile subtasks "$subtasks_file" \
    '
      def norm_summary($s):
        ($s | gsub("\\(SSOT\\)"; "(SSOT: Jira)"));

      def prefix_from_summary($s):
        if ($s | test("^[0-9]+-[0-9]+\\s")) then
          ($s | capture("^(?<p>[0-9]+-[0-9]+)\\s").p)
        else
          null
        end;

      def prefix_parts($p):
        if $p == null then
          [999999, 999999]
        else
          ($p | capture("^(?<a>[0-9]+)-(?<b>[0-9]+)$") | [(.a | tonumber), (.b | tonumber)])
        end;

      def strip_prefix($s):
        if ($s | test("^[0-9]+-[0-9]+\\s")) then
          ($s | sub("^[0-9]+-[0-9]+\\s+"; ""))
        else
          $s
        end;

      def norm_issue:
        {
          key: .key,
          summary: norm_summary(.fields.summary),
          issuetype: .fields.issuetype.name,
          status: .fields.status.name,
          statusCategory: .fields.status.statusCategory.key,
          parent: (.fields.parent.key // null)
        };

      def norm_subtask:
        {
          key: .key,
          parent: .fields.parent.key,
          summary: norm_summary(.fields.summary),
          status: .fields.status.name,
          prefix: prefix_from_summary(.fields.summary),
          prefixParts: prefix_parts(prefix_from_summary(.fields.summary)),
          summaryNoPrefix: strip_prefix(norm_summary(.fields.summary)),
          hasDescription: (.fields.description != null)
        };

      def issue_link_line($i):
        "- [\($i.key) — \($i.summary)]({{ \"/mirror/issues/\($i.key)/\" | relative_url }})";

      def subtask_line($s):
        if ($s.prefix == null) then
          "  - \($s.summary) — \($s.status)"
        elif ($s.hasDescription) then
          "  - [**\($s.prefix) \($s.summaryNoPrefix)**]({{ \"/mirror/issues/\($s.parent)/steps/\($s.key)/\" | relative_url }}) — \($s.status)"
        else
          "  - \($s.prefix) \($s.summaryNoPrefix) — \($s.status)"
        end;

      def subtasks_for_parent($parentKey):
        (($subtasks[0].issues // [])
          | map(norm_subtask)
          | map(select(.parent == $parentKey))
          | sort_by(.prefixParts, .summary)
        );

      def apply_filter($items):
        if ($issue_filter | length) == 0 then
          $items
        elif ($issue_filter == "select(.statusCategory != \"done\")") then
          ($items | map(select(.statusCategory != "done")))
        elif ($issue_filter == "select(.statusCategory == \"done\")") then
          ($items | map(select(.statusCategory == "done")))
        else
          $items
        end;

      (. as $root
        | ([ ($root.issues // [])[] | norm_issue | select(.issuetype != "Subtask") ]) as $all
        | (apply_filter($all | map(select(.issuetype == "Epic")) | sort_by(.key))) as $epics
        | (apply_filter($all | map(select(.issuetype != "Epic")) | sort_by(.key))) as $tasks
        | {
            epics: $epics,
            tasks_without_epic: ($tasks | map(select(.parent == null)) | sort_by(.key)),
            render_epics: (
              $epics
              | map(
                  . as $e
                  | ($tasks | map(select(.parent == $e.key)) | sort_by(.key)) as $tasksForEpic
                  | [
                      "",
                      "### [\($e.key) — \($e.summary)]({{ \"/mirror/issues/\($e.key)/\" | relative_url }})",
                      "",
                      ($tasksForEpic
                        | if length == 0 then
                            "Keine Vorgänge."
                          else
                            map(
                              issue_link_line(.)
                              + (
                                  (subtasks_for_parent(.key) | map(subtask_line(.)) | join("\n"))
                                  | if length == 0 then "" else "\n" + . end
                                )
                            )
                            | join("\n")
                          end
                      )
                    ] | join("\n")
                )
              | join("\n")
            )
          }
      ) as $ctx
      |
      "---",
      "layout: page",
      "title: \"\($title)\"",
      "permalink: \($permalink)",
      "---",
      "",
      "Statische Jira-Übersicht (ohne Jira-Cloud-Links).",
      "",
      "- [Sprint-Board]({{ \"/mirror/sprint-board/\" | relative_url }})",
      "- [Backlog]({{ \"/mirror/backlog/\" | relative_url }})",
      "- [Erledigt]({{ \"/mirror/erledigt/\" | relative_url }})",
      "",
      "## Epics",
      ($ctx.render_epics | if length == 0 then "Keine Vorgänge." else . end),
      "",
      "## Ohne Epic",
      "",
      ($ctx.tasks_without_epic
        | if length == 0 then
            "Keine Vorgänge."
          else
            map(issue_link_line(.)) | join("\n")
          end
      )
    ' <"$issues_file"
}

update_issue_pages() {
  issues_file=$1
  subtasks_file=$2
  full=$3
  touched_file=$4

  compute_child_tasks_cksum() {
    local_issues_file=$1
    epic_key=$2

    sig=$(jq -r --arg epic "$epic_key" '
      .issues[]
      | select(.fields.parent.key? == $epic)
      | .key
    ' <"$local_issues_file" | sort || true)

    printf '%s' "$sig" | cksum | awk '{print $1}'
  }

  compute_subtasks_cksum() {
    local_subtasks_file=$1
    parent_key=$2

    sig=$(jq -r --arg parent "$parent_key" '
      .issues[]
      | select(.fields.parent.key == $parent)
      | [
          .key,
          (.fields.updated // ""),
          (.fields.status.name // ""),
          (.fields.summary // ""),
          (if .fields.description != null then "desc" else "-" end)
        ]
      | @tsv
    ' <"$local_subtasks_file" | sort || true)

    printf '%s' "$sig" | cksum | awk '{print $1}'
  }

  jq -r '
    .issues[]
    | {
        key: .key,
        summary: (.fields.summary | gsub("\\(SSOT\\)"; "(SSOT: Jira)")),
        issuetype: .fields.issuetype.name,
        status: .fields.status.name,
        updated: .fields.updated,
        parent: (.fields.parent.key // null)
      }
    | @base64
  ' <"$issues_file" | while read -r row; do
    issue=$(printf '%s' "$row" | base64 -D 2>/dev/null || printf '%s' "$row" | base64 -d)
    key=$(printf '%s' "$issue" | jq -r '.key')
    summary=$(printf '%s' "$issue" | jq -r '.summary')
    issuetype=$(printf '%s' "$issue" | jq -r '.issuetype')
    status=$(printf '%s' "$issue" | jq -r '.status')
    updated=$(printf '%s' "$issue" | jq -r '.updated')
    parent=$(printf '%s' "$issue" | jq -r '.parent // empty')

    out_file="mirror/issues/$key/index.md"

    dirty=0
    if [ "$full" = "1" ] || [ ! -f "$out_file" ]; then
      dirty=1
    else
      existing_updated=$(extract_existing_updated "$out_file")
      if [ "$existing_updated" != "$updated" ]; then
        dirty=1
      elif key_in_file "$key" "$touched_file"; then
        dirty=1
      fi
    fi

    if [ "$dirty" = "0" ]; then
      if [ "$issuetype" = "Epic" ]; then
        new_cksum=$(compute_child_tasks_cksum "$issues_file" "$key")
        old_cksum=$(extract_existing_meta_value "$out_file" child_tasks_cksum)
        if [ "$new_cksum" != "$old_cksum" ]; then
          dirty=1
        fi
      else
        new_cksum=$(compute_subtasks_cksum "$subtasks_file" "$key")
        old_cksum=$(extract_existing_meta_value "$out_file" subtasks_cksum)
        if [ "$new_cksum" != "$old_cksum" ]; then
          dirty=1
        fi
      fi
    fi

    if [ "$dirty" = "0" ]; then
      continue
    fi

    links_md=$(render_public_remotelinks_md "$key")

    tmp=$(mktemp)
    if [ "$issuetype" = "Epic" ]; then
      child_cksum=$(compute_child_tasks_cksum "$issues_file" "$key")
      tasks=$(jq -r --arg epic "$key" '
        def norm_summary($s):
          ($s | gsub("\\(SSOT\\)"; "(SSOT: Jira)"));

        .issues[]
        | select(.fields.parent.key? == $epic)
        | "- [\(.key) — \(norm_summary(.fields.summary))]({{ \"/mirror/issues/\(.key)/\" | relative_url }})"
      ' <"$issues_file" || true)

      if [ -z "$tasks" ]; then
        tasks='Keine Aufgaben.'
      fi

      cat >"$tmp" <<EOF
---
layout: page
title: "$key — $summary"
permalink: /mirror/issues/$key/
---
<!-- mirror:child_tasks_cksum=$child_cksum -->

Keine Jira-Cloud-Links, keine E-Mail-Adressen.

## Metadaten

- **Key:** \`$key\`
- **Typ:** $issuetype
- **Status:** $status
- **Sprint:** -
- **Aktualisiert:** $updated

## Aufgaben

$tasks

## Links

$links_md

## Beschreibung

-

## Unteraufgaben

Keine Unteraufgaben.
EOF
    else
      subtasks_cksum=$(compute_subtasks_cksum "$subtasks_file" "$key")

      parent_line=''
      if [ -n "$parent" ]; then
        parent_summary=$(jq -r --arg pk "$parent" '
          .issues[]
          | select(.key == $pk)
          | (.fields.summary | gsub("\\(SSOT\\)"; "(SSOT: Jira)"))
        ' <"$issues_file" || true)
        parent_line="- **Parent:** [$parent — $parent_summary]({{ \"/mirror/issues/$parent/\" | relative_url }})"
      fi

      subtasks_md=$(jq -r --arg parent "$key" --slurpfile st "$subtasks_file" '
        def prefix_from_summary($s):
          if ($s | test("^[0-9]+-[0-9]+\\s")) then ($s | capture("^(?<p>[0-9]+-[0-9]+)\\s").p) else null end;
        def prefix_parts($p):
          if $p == null then [999999, 999999] else ($p | capture("^(?<a>[0-9]+)-(?<b>[0-9]+)$") | [(.a | tonumber), (.b | tonumber)]) end;
        def strip_prefix($s):
          if ($s | test("^[0-9]+-[0-9]+\\s")) then ($s | sub("^[0-9]+-[0-9]+\\s+"; "")) else $s end;
        $st[0].issues
        | map(select(.fields.parent.key == $parent))
        | map({
            key: .key,
            summary: (.fields.summary | gsub("\\(SSOT\\)"; "(SSOT: Jira)")),
            status: .fields.status.name,
            prefix: prefix_from_summary(.fields.summary),
            prefixParts: prefix_parts(prefix_from_summary(.fields.summary)),
            summaryNoPrefix: strip_prefix(.fields.summary | gsub("\\(SSOT\\)"; "(SSOT: Jira)")),
            hasDescription: (.fields.description != null)
          })
        | sort_by(.prefixParts, .summary)
        | map(
          if .prefix == null then
            "- **" + .summary + "** — " + .status
          elif .hasDescription then
            "- [**" + .prefix + " " + .summaryNoPrefix + "**]({{ \"/mirror/issues/" + $parent + "/steps/" + .key + "/\" | relative_url }}) — " + .status
          else
            "- **" + .prefix + " " + .summaryNoPrefix + "** — " + .status
          end
        )
        | if length == 0 then "Keine Unteraufgaben." else join("\n") end
      ' <"$issues_file" || true)

      cat >"$tmp" <<EOF
---
layout: page
title: "$key — $summary"
permalink: /mirror/issues/$key/
---
<!-- mirror:subtasks_cksum=$subtasks_cksum -->

Keine Jira-Cloud-Links, keine E-Mail-Adressen.

## Metadaten

- **Key:** \`$key\`
- **Typ:** $issuetype
- **Status:** $status
- **Sprint:** -
- **Aktualisiert:** $updated
EOF
      if [ -n "$parent_line" ]; then
        printf '%s\n\n' "$parent_line" >>"$tmp"
      else
        printf '\n' >>"$tmp"
      fi

      cat >>"$tmp" <<EOF
## Links

$links_md

## Beschreibung

-

## Unteraufgaben

$subtasks_md
EOF
    fi

    write_if_changed "$out_file" "$tmp"
  done
}

update_subtask_pages_with_description() {
  subtasks_file=$1
  full=$2
  touched_file=$3

  jq -r '
    .issues[]
    | select(.fields.description != null)
    | {
        key: .key,
        parent: .fields.parent.key,
        summary: (.fields.summary | gsub("\\(SSOT\\)"; "(SSOT: Jira)")),
        status: .fields.status.name,
        updated: .fields.updated,
        description: .fields.description
      }
    | @base64
  ' <"$subtasks_file" | while read -r row; do
    subtask=$(printf '%s' "$row" | base64 -D 2>/dev/null || printf '%s' "$row" | base64 -d)
    key=$(printf '%s' "$subtask" | jq -r '.key')
    parent=$(printf '%s' "$subtask" | jq -r '.parent')
    summary=$(printf '%s' "$subtask" | jq -r '.summary')
    status=$(printf '%s' "$subtask" | jq -r '.status')
    updated=$(printf '%s' "$subtask" | jq -r '.updated')

    prefix=$(printf '%s' "$summary" | sed -nE 's/^([0-9]+-[0-9]+) .*/\1/p')
    summary_no_prefix=$(printf '%s' "$summary" | sed -E 's/^[0-9]+-[0-9]+[[:space:]]+//')

    if [ -z "$prefix" ]; then
      continue
    fi

    out_dir="mirror/issues/$parent/steps/$key"
    out_file="$out_dir/index.md"

    dirty=0
    if [ "$full" = "1" ] || [ ! -f "$out_file" ]; then
      dirty=1
    else
      existing_updated=$(extract_existing_updated "$out_file")
      if [ "$existing_updated" != "$updated" ]; then
        dirty=1
      elif key_in_file "$key" "$touched_file"; then
        dirty=1
      fi
    fi

    if [ "$dirty" = "0" ]; then
      continue
    fi

    links_md=$(render_public_remotelinks_md "$key")

    description_text=$(printf '%s' "$subtask" | jq -r '.description' | jq -r -f scripts/jira-adf-to-text.jq || true)
    if [ -z "$description_text" ]; then
      description_text='-'
    fi
    if [ "$description_text" != "-" ]; then
      description_text=$(printf '%s\n' "$description_text" | sanitize_public_description_text)
    fi

    tmp=$(mktemp)
    cat >"$tmp" <<EOF
---
layout: page
title: "$prefix — $summary_no_prefix"
permalink: /mirror/issues/$parent/steps/$key/
---

Keine Jira-Cloud-Links, keine E-Mail-Adressen.

## Metadaten

- **Parent:** [$parent]({{ "/mirror/issues/$parent/" | relative_url }})
- **Schritt:** $prefix
- **Status:** $status
- **Aktualisiert:** $updated

## Angaben

$description_text

## Links

$links_md
EOF

    write_if_changed "$out_file" "$tmp"
  done
}

main "$@"
