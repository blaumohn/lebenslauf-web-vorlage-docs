---
layout: page
title: "Runbook: pre-push hook for Recent Changes"
permalink: /en/operations/recent-changes-hook/
---

This runbook describes the one-time setup and ongoing operation of the
pre-push hook that automatically updates `_data/recent_commits.yml`.

## Overview

When the docs repo is pushed, a pre-push hook runs. It calls
`scripts/generate-recent-commits.sh`, which reads the latest commits from
the published project repos and writes `_data/recent_commits.yml`.
If the file has changed, it is committed automatically.

## Repo list

The script reads commits from the following repos (same parent directory as this repo):

| Directory                      | GitHub slug                             |
|--------------------------------|-----------------------------------------|
| `lebenslauf-web-vorlage`       | `blaumohn/lebenslauf-web-vorlage`       |
| `lebenslauf-web-vorlage-docs`  | `blaumohn/lebenslauf-web-vorlage-docs`  |
| `pipeline-config-spec-php`     | `blaumohn/pipeline-config-spec-php`     |

A missing repo is skipped without error.

## One-time setup

```sh
sh scripts/install-hooks.sh
```

This creates a symlink from `.git/hooks/pre-push` to
`scripts/hooks/pre-push`. The `.git/` directory is not versioned,
so this step must be repeated after each fresh clone.

## Verification

```sh
sh scripts/generate-recent-commits.sh
cat _data/recent_commits.yml
```

The file should contain 10 entries with the fields `repo`, `sha`, `short_sha`,
`datetime`, `github_url`, and `message`.

## Important

- `_data/recent_commits.yml` is generated. Never edit manually.
- The hook commits with the Claude Sonnet agent identity.
- Only pushed commits appear (via `git log --remotes`).
