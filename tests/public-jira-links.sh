#!/bin/sh
# Rauchtest: öffentliche Jira-Links
# Prüft: generierte Jira-Seiten verlinken nur vorhandene lokale Permalinks.
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

tools-python - "$REPO_ROOT" <<'PY'
from pathlib import Path
import re
import sys

root = Path(sys.argv[1])
permalinks = set()
frontmatter_pattern = re.compile(r"^---\n(.*?)\n---\n", re.S)
link_pattern = re.compile(r'\[[^\]]+\]\(\{\{ "([^"]+)" \| relative_url \}\}\)')


def is_relevant(path):
    parts = path.relative_to(root).parts
    return parts[:2] == ("work", "jira") or parts[:3] == ("en", "work", "jira")


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
    head = text[:300]
    return "generated:jira:" in head or "generated:jira:overview" in head


def collect_permalinks():
    for path in root.rglob("*.md"):
        if ".local" in path.parts or "_site" in path.parts:
            continue

        text = path.read_text(encoding="utf-8")
        permalink = permalink_from(text)
        if permalink:
            permalinks.add(permalink)


def collect_missing_links():
    missing = []
    for path in root.rglob("*.md"):
        if not is_relevant(path):
            continue

        text = path.read_text(encoding="utf-8")
        if not is_generated_jira_page(text):
            continue

        for line_no, line in enumerate(text.splitlines(), 1):
            for target in link_pattern.findall(line):
                if target not in permalinks:
                    rel_path = path.relative_to(root)
                    missing.append(f"{rel_path}:{line_no}: {target}")

    return missing


collect_permalinks()
missing_links = collect_missing_links()
if missing_links:
    for missing in missing_links:
        print(f"FAIL: {missing}", file=sys.stderr)
    sys.exit(1)

print("PASS: generierte Jira-Seiten verlinken nur vorhandene Permalinks")
PY
