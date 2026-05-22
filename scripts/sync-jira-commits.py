#!/usr/bin/env python3
"""Synchronisiert Git-Commits mit Jira-Vorgangsseiten."""

from __future__ import annotations

import argparse
import json
import re
import subprocess
from dataclasses import asdict, dataclass
from pathlib import Path


REPOS = {
    "lebenslauf-web-vorlage": "blaumohn/lebenslauf-web-vorlage",
    "lebenslauf-web-vorlage-docs": "blaumohn/lebenslauf-web-vorlage-docs",
    "pipeline-config-spec-php": "blaumohn/pipeline-config-spec-php",
}
JIRA_SUFFIX_RE = re.compile(r"\((J01-\d+)\)\s*$")


@dataclass(frozen=True)
class CommitEntry:
    repo: str
    sha: str
    short_sha: str
    datetime: str
    github_url: str
    subject: str


def main() -> int:
    args = parse_args()
    docs_root = Path(__file__).resolve().parents[1]
    output = docs_root / "_data" / "jira_commits.json"

    if args.mode == "full":
        entries = collect_all_commits(docs_root.parent)
        write_entries(output, entries)
        print(f"Geschrieben: {output}")
        return 0

    current = collect_current_commit(args)
    existing = read_entries(output)
    merged = merge_entries(existing, current)
    write_entries(output, merged)
    print(f"Aktualisiert: {output}")
    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="mode", required=True)

    subparsers.add_parser("full", help="gesamte lokale Git-Historie scannen")

    current = subparsers.add_parser("current", help="einen Commit ergänzen")
    current.add_argument("--repo", required=True, help="Quell-Repo")
    current.add_argument("--commit", default="HEAD", help="Commit-Ref")
    return parser.parse_args()


def collect_all_commits(parent_dir: Path) -> dict[str, list[CommitEntry]]:
    result: dict[str, list[CommitEntry]] = {}
    for repo_name, slug in REPOS.items():
        repo_path = parent_dir / repo_name
        if not (repo_path / ".git").exists():
            continue
        for entry in scan_repo_history(repo_path, repo_name, slug):
            add_entry(result, entry)
    return sort_entries(result)


def scan_repo_history(repo_path: Path, repo_name: str, slug: str) -> list[CommitEntry]:
    format_spec = "%H%x09%aI%x09%s"
    lines = git_lines(repo_path, ["log", "--all", f"--format={format_spec}"])
    entries = []
    for line in lines:
        parsed = parse_git_line(line, repo_name, slug)
        if parsed is not None:
            entries.append(parsed)
    return entries


def collect_current_commit(args: argparse.Namespace) -> dict[str, list[CommitEntry]]:
    repo_path = Path(args.repo).resolve()
    repo_name = repo_path.name
    slug = REPOS.get(repo_name, f"local/{repo_name}")
    line = git_text(repo_path, ["show", "-s", "--format=%H%x09%aI%x09%s", args.commit])
    entry = parse_git_line(line.strip(), repo_name, slug)
    if entry is None:
        return {}
    return {extract_jira_key(entry.subject): [entry]}


def parse_git_line(line: str, repo_name: str, slug: str) -> CommitEntry | None:
    parts = line.split("\t", 2)
    if len(parts) != 3:
        return None
    sha, authored_at, subject = parts
    if extract_jira_key(subject) == "":
        return None
    return CommitEntry(
        repo=repo_name,
        sha=sha,
        short_sha=sha[:7],
        datetime=authored_at,
        github_url=f"https://github.com/{slug}/commit/{sha}",
        subject=subject,
    )


def extract_jira_key(subject: str) -> str:
    match = JIRA_SUFFIX_RE.search(subject)
    if match is None:
        return ""
    return match.group(1)


def read_entries(output: Path) -> dict[str, list[CommitEntry]]:
    if not output.exists():
        return {}
    data = json.loads(output.read_text(encoding="utf-8"))
    result: dict[str, list[CommitEntry]] = {}
    for key, entries in data.items():
        result[key] = [CommitEntry(**entry) for entry in entries]
    return result


def merge_entries(
    existing: dict[str, list[CommitEntry]],
    incoming: dict[str, list[CommitEntry]],
) -> dict[str, list[CommitEntry]]:
    result: dict[str, list[CommitEntry]] = {}
    for key, entries in existing.items():
        result[key] = list(entries)
    for entries in incoming.values():
        for entry in entries:
            add_entry(result, entry)
    return sort_entries(result)


def add_entry(result: dict[str, list[CommitEntry]], entry: CommitEntry) -> None:
    key = extract_jira_key(entry.subject)
    if key == "":
        return
    bucket = result.setdefault(key, [])
    identity = (entry.repo, entry.sha)
    if any((item.repo, item.sha) == identity for item in bucket):
        return
    bucket.append(entry)


def sort_entries(entries: dict[str, list[CommitEntry]]) -> dict[str, list[CommitEntry]]:
    result = {}
    for key in sorted(entries):
        result[key] = sorted(entries[key], key=lambda item: item.datetime, reverse=True)
    return result


def write_entries(output: Path, entries: dict[str, list[CommitEntry]]) -> None:
    output.parent.mkdir(parents=True, exist_ok=True)
    payload = {
        key: [asdict(entry) for entry in value]
        for key, value in sort_entries(entries).items()
    }
    output.write_text(json.dumps(payload, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def git_lines(repo_path: Path, args: list[str]) -> list[str]:
    output = git_text(repo_path, args)
    if output == "":
        return []
    return output.splitlines()


def git_text(repo_path: Path, args: list[str]) -> str:
    command = ["git", "-C", str(repo_path), *args]
    completed = subprocess.run(command, check=True, text=True, capture_output=True)
    return completed.stdout


if __name__ == "__main__":
    raise SystemExit(main())
