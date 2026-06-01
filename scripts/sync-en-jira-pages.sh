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

sync_generated_pages() {
  expected_file=$1

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

    printf '%s\n' "$dest" >>"$expected_file"
    mkdir -p "$(dirname "$dest")"
    if ! is_managed_en_file "$dest"; then
      continue
    fi

    old_file=''
    if [ -f "$dest" ]; then
      old_file=$(mktemp)
      cp "$dest" "$old_file"
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
      s/## Aktueller Stand/## Current State/g;
      s/## Überprüfungsplan/## Verification Plan/g;
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

    if [ -n "$old_file" ]; then
      restore_preserved_en_sections "$old_file" "$dest"
      rm -f "$old_file"
    fi
  done
}

restore_preserved_en_sections() {
  old_file=$1
  dest=$2

  "$(python_for_sync)" - "$old_file" "$dest" <<'PY'
from pathlib import Path
import re
import sys

old_path = Path(sys.argv[1])
dest_path = Path(sys.argv[2])
old_text = old_path.read_text(encoding="utf-8")
dest_text = dest_path.read_text(encoding="utf-8")


def section_pattern(headings):
    names = "|".join(re.escape(heading) for heading in headings)
    return re.compile(rf"^## ({names})\n.*?(?=^## |\Z)", re.M | re.S)


def first_section(text, headings):
    match = section_pattern(headings).search(text)
    return match.group(0) if match else None


def replace_section(text, headings, replacement):
    pattern = section_pattern(headings)
    if pattern.search(text):
        return pattern.sub(replacement.rstrip() + "\n\n", text, count=1)

    marker = re.search(r"^## Subtasks\n", text, re.M)
    if marker:
        return text[:marker.start()] + replacement.rstrip() + "\n\n" + text[marker.start():]

    return text.rstrip() + "\n\n" + replacement.rstrip() + "\n"


sections = [
    (["Description", "Beschreibung"], ["Description"]),
    (["Current State", "Aktueller Stand"], ["Current State"]),
    (["Verification Plan", "Überprüfungsplan"], ["Verification Plan"]),
]

for target_headings, source_headings in sections:
    old_section = first_section(old_text, source_headings)
    if old_section:
        dest_text = replace_section(dest_text, target_headings, old_section)

dest_path.write_text(dest_text, encoding="utf-8")
PY
}

cleanup_stale_generated_en_pages() {
  expected_file=$1

  find en/work/jira -name '*.md' 2>/dev/null | while read -r file; do
    if ! is_generated_file "$file"; then
      continue
    fi

    if ! grep -Fxq "$file" "$expected_file"; then
      rm -f "$file"
    fi
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
  expected_file=$(mktemp)
  trap 'rm -f "$expected_file"' EXIT

  sync_generated_pages "$expected_file"
  cleanup_stale_generated_en_pages "$expected_file"
  sanitize_generated_en_links
}

main "$@"
