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

cleanup_steps_dirs() {
  # Schritt-Seiten sind vollständig abgeleitet. Wir löschen sie vor dem
  # Generieren, damit keine veralteten Pfade (z.B. nach Schemawechsel) bleiben.
  if [ -d mirror/issues ]; then
    find mirror/issues -mindepth 2 -maxdepth 2 -type d -name steps -exec rm -rf {} +
  fi
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
  require_bin date

  stand=$(date '+%Y-%m-%d %H:%M %z')

  tmp_dir=${TMPDIR:-/tmp}
  issues_file="$tmp_dir/j01-non-subtasks.json"
  subtasks_file="$tmp_dir/j01-subtasks.json"
  sprint_file="$tmp_dir/j01-open-sprint.json"

  log "Jira: Issues laden"
  fetch_issues "$issues_file"
  log "Jira: Subtasks laden"
  fetch_subtasks "$subtasks_file"
  log "Jira: Open Sprint laden"
  fetch_open_sprint "$sprint_file"

  log "Mirror: Index"
  update_mirror_index "$stand"
  log "Mirror: Backlog"
  update_backlog "$issues_file" "$subtasks_file" "$stand"
  log "Mirror: Erledigt"
  update_erledigt "$issues_file" "$subtasks_file" "$stand"
  log "Mirror: Sprint-Board"
  update_sprint_board "$issues_file" "$sprint_file" "$stand"

  log "Mirror: Issue-Seiten"
  update_issue_pages "$issues_file" "$subtasks_file" "$stand"
  log "Mirror: Subtask-Seiten (mit Angaben)"
  cleanup_steps_dirs
  update_subtask_pages_with_description "$subtasks_file" "$stand"
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
  stand=$1
  cat >mirror/index.md <<EOF
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
}

update_backlog() {
  issues_file=$1
  subtasks_file=$2
  stand=$3

  mkdir -p mirror/backlog
  render_vorgaenge_page \
    "Jira-Übersicht: Backlog" \
    "/mirror/backlog/" \
    "$issues_file" \
    "$subtasks_file" \
    "$stand" \
    "select(.statusCategory != \"done\")" \
    >mirror/backlog/index.md
}

update_erledigt() {
  issues_file=$1
  subtasks_file=$2
  stand=$3

  mkdir -p mirror/erledigt
  render_vorgaenge_page \
    "Jira-Übersicht: Erledigt" \
    "/mirror/erledigt/" \
    "$issues_file" \
    "$subtasks_file" \
    "$stand" \
    "select(.statusCategory == \"done\")" \
    >mirror/erledigt/index.md
}

update_sprint_board() {
  issues_file=$1
  sprint_file=$2
  stand=$3

  sprint_keys=$(jq -r '.issues[].key' <"$sprint_file" | sort | tr '\n' ' ')

  jq \
    --raw-output \
    --arg stand "$stand" \
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
              summary: .fields.summary,
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
      "**Stand:** \($stand)",
      "",
      "Sprint-Board als statische Jira-Übersicht (ohne Jira-Cloud-Links).",
      "",
      "| Zu erledigen | In Bearbeitung | In Überprüfung | Erledigt |",
      "|---|---|---|---|",
      "| \(bucket_or_dash("new")) | \(bucket_or_dash("indeterminate")) | - | \(bucket_or_dash("done")) |"
    ' <"$issues_file" >mirror/sprint-board/index.md
}

render_vorgaenge_page() {
  title=$1
  permalink=$2
  issues_file=$3
  subtasks_file=$4
  stand=$5
  issue_filter=$6

  jq \
    --raw-output \
    --arg stand "$stand" \
    --arg title "$title" \
    --arg permalink "$permalink" \
    --arg issue_filter "$issue_filter" \
    --slurpfile subtasks "$subtasks_file" \
    '
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
          summary: .fields.summary,
          issuetype: .fields.issuetype.name,
          status: .fields.status.name,
          statusCategory: .fields.status.statusCategory.key,
          parent: (.fields.parent.key // null)
        };

      def norm_subtask:
        {
          key: .key,
          parent: .fields.parent.key,
          summary: .fields.summary,
          status: .fields.status.name,
          prefix: prefix_from_summary(.fields.summary),
          prefixParts: prefix_parts(prefix_from_summary(.fields.summary)),
          summaryNoPrefix: strip_prefix(.fields.summary),
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
      "**Stand:** \($stand)",
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
  stand=$3

  jq -r '
    .issues[]
    | {
        key: .key,
        summary: .fields.summary,
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

    mkdir -p "mirror/issues/$key"
    out_file="mirror/issues/$key/index.md"

    if [ "$issuetype" = "Epic" ]; then
      tasks=$(jq -r --arg epic "$key" '
        .issues[]
        | select(.fields.parent.key? == $epic)
        | "- [\(.key) — \(.fields.summary)]({{ \"/mirror/issues/\(.key)/\" | relative_url }})"
      ' <"$issues_file" || true)

      if [ -z "$tasks" ]; then
        tasks='Keine Aufgaben.'
      fi

      cat >"$out_file" <<EOF
---
layout: page
title: "$key — $summary"
permalink: /mirror/issues/$key/
---

**Stand:** $stand

Keine Jira-Cloud-Links, keine E-Mail-Adressen.

## Metadaten

- **Key:** \`$key\`
- **Typ:** $issuetype
- **Status:** $status
- **Sprint:** -
- **Aktualisiert:** $updated

## Aufgaben

$tasks

## Beschreibung

-

## Unteraufgaben

Keine Unteraufgaben.
EOF
    else
      parent_line=''
      if [ -n "$parent" ]; then
        parent_summary=$(jq -r --arg pk "$parent" '
          .issues[]
          | select(.key == $pk)
          | .fields.summary
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
            summary: .fields.summary,
            status: .fields.status.name,
            prefix: prefix_from_summary(.fields.summary),
            prefixParts: prefix_parts(prefix_from_summary(.fields.summary)),
            summaryNoPrefix: strip_prefix(.fields.summary),
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

      cat >"$out_file" <<EOF
---
layout: page
title: "$key — $summary"
permalink: /mirror/issues/$key/
---

**Stand:** $stand

Keine Jira-Cloud-Links, keine E-Mail-Adressen.

## Metadaten

- **Key:** \`$key\`
- **Typ:** $issuetype
- **Status:** $status
- **Sprint:** -
- **Aktualisiert:** $updated
EOF
      if [ -n "$parent_line" ]; then
        printf '%s\n\n' "$parent_line" >>"$out_file"
      else
        printf '\n' >>"$out_file"
      fi

      cat >>"$out_file" <<EOF
## Beschreibung

-

## Unteraufgaben

$subtasks_md
EOF
    fi
  done
}

update_subtask_pages_with_description() {
  subtasks_file=$1
  stand=$2

  jq -r '
    .issues[]
    | select(.fields.description != null)
    | {
        key: .key,
        parent: .fields.parent.key,
        summary: .fields.summary,
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
    mkdir -p "$out_dir"
    out_file="$out_dir/index.md"

    description_text=$(printf '%s' "$subtask" | jq -r '.description' | jq -r -f scripts/jira-adf-to-text.jq || true)
    if [ -z "$description_text" ]; then
      description_text='-'
    fi
    if [ "$description_text" != "-" ]; then
      description_text=$(printf '%s\n' "$description_text" | sanitize_public_description_text)
    fi

    cat >"$out_file" <<EOF
---
layout: page
title: "$prefix — $summary_no_prefix"
permalink: /mirror/issues/$parent/steps/$key/
---

**Stand:** $stand

Keine Jira-Cloud-Links, keine E-Mail-Adressen.

## Metadaten

- **Parent:** [$parent]({{ "/mirror/issues/$parent/" | relative_url }})
- **Schritt:** $prefix
- **Status:** $status
- **Aktualisiert:** $updated

## Angaben

$description_text
EOF
  done
}

main "$@"
