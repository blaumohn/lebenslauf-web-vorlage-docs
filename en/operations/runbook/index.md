---
layout: page
title: "Runbook: update the Jira mirror"
permalink: /en/operations/runbook/
---

## Purpose

Update the public static Jira mirror in this repo:

- DE: `/de/mirror/`, `/de/mirror/sprint-board/`, `/de/mirror/backlog/`,
  `/de/mirror/erledigt/`, `/de/mirror/issues/J01-*/`
- EN: `/en/mirror/`, `/en/mirror/sprint-board/`, `/en/mirror/backlog/`,
  `/en/mirror/erledigt/`, `/en/mirror/issues/J01-*/`
- Step pages only for subtasks with public details:
  `/de/mirror/issues/<PARENT>/steps/<SUBTASK_KEY>/` and
  `/en/mirror/issues/<PARENT>/steps/<SUBTASK_KEY>/`
- Filtered Jira remote links are shown as relative links in the mirror.

## Requirements

- Access to the `atlassian` CLI (tool owner configured locally) and `jq`
- Write access in the repo
- Public policy: no Jira Cloud links, no email addresses

## Steps

1) Update issues and statuses in Jira (SSOT for issue state).

2) Generate the Jira mirror:

```bash
sh scripts/update-jira-mirror.sh
```

Optional (full refresh):

```bash
sh scripts/update-jira-mirror.sh --full
```

3) Spot check:
   - Subtasks without public details do **not** get their own page.
   - Subtasks with public details do get a step page.

4) Hygiene:
   - No `atlassian.net` links in the output
   - No email addresses in the output
   - Remote links are rendered as relative site links
   - The EN mirror is synchronized after the DE render

## Rollback

- Revert the affected mirror files and generate again.

## Monitoring

- Sprint board, backlog, and done match Jira status categories.
- Issue and step pages carry an `Updated` timestamp from Jira.
- `git` remains the reliable history: diffs only appear when content changes.
