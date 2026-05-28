#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
cd "$script_dir/.."

is_generated_file() {
  sed -n '1,20p' "$1" | grep 'generated:jira:' >/dev/null 2>&1
}

is_managed_en_file() {
  [ ! -f "$1" ] || is_generated_file "$1"
}

is_container_environment() {
  if [ -f /.dockerenv ]; then
    return 0
  fi

  if [ -r /proc/1/cgroup ] && grep -E 'docker|containerd|kubepods' /proc/1/cgroup >/dev/null 2>&1; then
    return 0
  fi

  return 1
}

python_for_sync() {
  if is_container_environment && command -v python3 >/dev/null 2>&1; then
    printf '%s\n' python3
    return
  fi

  if command -v tools-python >/dev/null 2>&1; then
    printf '%s\n' tools-python
    return
  fi

  printf '%s\n' "Lokal tools-python oder im Container python3 erwartet" >&2
  return 1
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
    if ! is_managed_en_file "$dest"; then
      continue
    fi

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
      s/## Jira-Zustandsbild/## Jira state snapshot/g;
      s/## Unteraufgaben/## Subtasks/g;
      s/Keine Unteraufgaben\./No subtasks\./g;
      s/Keine Aufgaben\./No tasks\./g;
      s/Öffentliche Schritte/Public steps/g;
      s/Verknüpfte Vorgänge/Linked issues/g;
      s/Übergeordnet/Parent/g;
      s/Kontext/Context/g;
      s/Sprint-Rolle/Sprint role/g;
      s/Aktiver Sprint/Active sprint/g;
      s/Bearbeitung/Assignee/g;
      s/Blockiert durch/Blocked by/g;
      s/Blockiert/Blocks/g;
      s/Verknüpft mit/Relates to/g;
      s/\*\*Aktualisiert:\*\*/**Updated:**/g;
      s/Keine E-Mail-Adressen\./No email addresses\./g;
      s/Keine Jira-Cloud-Links\./No Jira Cloud links\./g;
    ' "$dest"
  done
}

sanitize_generated_en_links() {
  "$(python_for_sync)" - <<'PY'
from pathlib import Path
import re

root = Path(".")
frontmatter_pattern = re.compile(r"^---\n(.*?)\n---\n", re.S)
link_pattern = re.compile(r'\[([^\]]+)\]\(\{\{ "(/en/[^"]+)" \| relative_url \}\}\)')


def permalink_from(text):
    match = frontmatter_pattern.match(text)
    if not match:
        return None

    for line in match.group(1).splitlines():
        if line.startswith("permalink:"):
            value = line.split(":", 1)[1].strip().strip("\"'")
            return value if value.startswith("/") else "/" + value

    return None


def is_generated_jira_page(text):
    return "generated:jira:" in text[:300]


def collect_permalinks():
    permalinks = set()
    for path in root.rglob("*.md"):
        if ".local" in path.parts or "_site" in path.parts:
            continue

        permalink = permalink_from(path.read_text(encoding="utf-8"))
        if permalink:
            permalinks.add(permalink)

    return permalinks


def sanitize_text(text, permalinks):
    sanitized = text
    matches = list(link_pattern.finditer(text))
    for match in reversed(matches):
        label = match.group(1)
        target = match.group(2)
        if target in permalinks:
            continue

        sanitized = sanitized[:match.start()] + label + sanitized[match.end():]

    return sanitized


permalinks = collect_permalinks()
for path in Path("en/work/jira").rglob("*.md"):
    text = path.read_text(encoding="utf-8")
    if not is_generated_jira_page(text):
        continue

    sanitized = sanitize_text(text, permalinks)
    if sanitized != text:
        path.write_text(sanitized, encoding="utf-8")
PY
}

main() {
  delete_generated_en_pages
  sync_generated_pages
  sanitize_generated_en_links
}

main "$@"
