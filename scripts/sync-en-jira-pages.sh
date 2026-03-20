#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
cd "$script_dir/.."

is_generated_file() {
  grep -q '^<!-- generated:jira-' "$1"
}

delete_generated_en_pages() {
  find en/work/jira -name '*.md' 2>/dev/null | while read -r file; do
    if is_generated_file "$file"; then
      rm -f "$file"
    fi
  done
}

sync_generated_pages() {
  find work/jira -name '*.md' | while read -r src; do
    if ! is_generated_file "$src"; then
      continue
    fi

    rel=${src#work/jira/}
    case "$rel" in
      backlog/*)
        dest="en/work/jira/backlog/${rel#backlog/}"
        ;;
      historie/*)
        dest="en/work/jira/history/${rel#historie/}"
        ;;
      sprint/*)
        dest="en/work/jira/sprint/${rel#sprint/}"
        ;;
      *)
        dest="en/work/jira/$rel"
        ;;
    esac

    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"

    perl -0pi -e '
      s#permalink: /de/#permalink: /en/#g;
      s#\{\{ "/de/#{{ "/en/#g;
      s/title: "Jira: Historie"/title: "Jira: History"/g;
      s/Öffentliche Jira-Fläche \(ohne Jira-Cloud-Links\)\./Public Jira area \(without Jira Cloud links\)\./g;
      s/Sprint-Board der öffentlichen Jira-Fläche \(ohne Jira-Cloud-Links\)\./Sprint board of the public Jira area \(without Jira Cloud links\)\./g;
      s/## Ohne Epic/## Without Epic/g;
      s/Keine Vorgänge\./No issues\./g;
      s/Zu erledigen/To Do/g;
      s/In Bearbeitung/In Progress/g;
      s/In Überprüfung/In Review/g;
      s/Erledigt/Done/g;
      s/Sprint-Ziel/Sprint Goal/g;
      s/Ungeplant/Unplanned/g;
      s/Unklassifiziert/Unclassified/g;
      s/Admin \/ Rahmen/Admin \/ Framework/g;
      s/Historie/History/g;
      s/## Angaben/## Details/g;
      s/## Beschreibung/## Description/g;
      s/## Unteraufgaben/## Subtasks/g;
      s/Keine Unteraufgaben\./No subtasks\./g;
      s/Keine Aufgaben\./No tasks\./g;
      s/Öffentliche Schritte/Public steps/g;
      s/Übergeordnet/Parent/g;
      s/Kontext/Context/g;
      s/\*\*Aktualisiert:\*\*/**Updated:**/g;
      s/Keine E-Mail-Adressen\./No email addresses\./g;
      s/Keine Jira-Cloud-Links\./No Jira Cloud links\./g;
    ' "$dest"
  done
}

main() {
  delete_generated_en_pages
  sync_generated_pages
}

main "$@"
