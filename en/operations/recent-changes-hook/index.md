---
layout: page
title: "Runbook: Git Hooks for Docs Sync and Commit Format"
permalink: /en/operations/recent-changes-hook/
---

This runbook describes one-time setup and ongoing operation of the Git hooks
that update public docs data and validate commit messages.

## Overview

When committing in the docs repo, a pre-commit hook updates:

- `_data/recent_commits.yml` for the “Recent changes” homepage section
- `_data/jira_commits.json` for the commit section on Jira issue pages

Two hooks are also installed for the project repos:

- `commit-msg` enforces commit messages in the format
  `<type>(<scope>): <title> (J01-123)`.
- `post-commit` adds the current commit to `_data/jira_commits.json` if the
  commit title ends with a Jira key in parentheses.

## Flow

```
git commit (in docs repo)
 └─ pre-commit hook
     └─ generate-recent-commits.sh → _data/recent_commits.yml
     └─ sync-jira-commits.py full → _data/jira_commits.json
     └─ git add _data/recent_commits.yml _data/jira_commits.json
 └─ generated data is included in the commit
```

```
git commit (in project repos)
 └─ commit-msg hook
     └─ validate-commit-msg.sh
 └─ post-commit hook
     └─ sync-jira-commits.py current --commit HEAD
```

## Repo List

The script reads commits from the following repos on the same parent directory
level as this repo:

| Directory                      | GitHub slug                             |
|--------------------------------|-----------------------------------------|
| `lebenslauf-web-vorlage`       | `blaumohn/lebenslauf-web-vorlage`       |
| `lebenslauf-web-vorlage-docs`  | `blaumohn/lebenslauf-web-vorlage-docs`  |
| `pipeline-config-spec-php`     | `blaumohn/pipeline-config-spec-php`     |

A missing repo is skipped without error.

## Commit Section on Issue Pages

`scripts/sync-jira-commits.py full` scans the complete local Git history of the
project repos. A commit is assigned to an issue when its subject ends with
`(J01-123)`. The output is written to `_data/jira_commits.json`.

Jira issue pages include the data through `_includes/jira-commits.html`
automatically. The same commit section appears on German and English issue
pages without editing each page individually.

For individual commits, the `post-commit` hook uses:

```sh
python3 scripts/sync-jira-commits.py current --repo "$PWD" --commit HEAD
```

The hook adds only the current commit and keeps existing entries.

## Commit Messages

The `commit-msg` hook accepts these types:

`feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`,
`chore`, `revert`

Expected format:

```text
<type>(<scope>): <title> (J01-123)
```

Optional body lines must be empty or start as bullets with `- `.

## One-Time Setup

```sh
sh scripts/install-hooks.sh
```

The script creates symlinks from `.git/hooks/` to the versioned hooks under
`scripts/hooks/`. For the docs repo it installs `pre-commit` and
`commit-msg`. For project repos on the same directory level it installs
`commit-msg` and `post-commit`.

The `.git/` directory is not versioned, so this step must be repeated after
every fresh clone.

## Verification

```sh
sh scripts/generate-recent-commits.sh
python3 scripts/sync-jira-commits.py full
cat _data/recent_commits.yml
cat _data/jira_commits.json
```

The commit data should contain entries with the fields `repo`, `sha`,
`short_sha`, `datetime`, `github_url`, and `subject`.

## Tests

```sh
sh tests/generate-recent-commits.sh
sh tests/pre-commit-hook.sh
sh tests/sync-jira-commits.sh
sh tests/validate-commit-msg.sh
```

## Important

- `_data/recent_commits.yml` is generated. Never edit it manually.
- `_data/jira_commits.json` is generated. Never edit it manually.
- Commits that only change `_data/recent_commits.yml` are excluded from the
  feed through a pathspec filter.
