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
   - For sprint work, also verify the active sprint, set sprint labels, and
     update the public sprint docs.

2) Generate the Jira mirror:

```bash
sh scripts/update-jira-mirror.sh
```

Optional (full refresh):

```bash
sh scripts/update-jira-mirror.sh --full
```

3) Verify GitHub Pages targets from Jira locally:

```bash
sh scripts/verify-jira-ghpages-links.sh
```

The URL conversion from Jira follows these rules:

- `https://docs.template.ysdani.com/...` becomes a site-relative URI
- neutral pages remain only `/` or `/index.html`
- language-bound pages are verified as `/de/...` in DE context and `/en/...`
  in EN context
- verification runs against this local GitHub Pages repo

4) Spot check:
   - Subtasks without public details do **not** get their own page.
   - Subtasks with public details do get a step page.

5) Hygiene:
  - No `atlassian.net` links in the output
  - No email addresses in the output
  - Remote links are rendered as relative site links
  - Remote links follow the language context of the page
    (`/de/...` on DE pages, `/en/...` on EN pages)
  - The sprint board groups current sprint work by category labels
    (`sprint-goal`, `sprint-support`, `sprint-admin`, `sprint-unplanned`)
  - The sprint board only shows the same top-level issues as the Jira board;
    steps stay visible on parent and step pages.
  - The EN mirror is synchronized after the DE render

## Rollback

- Revert the affected mirror files and generate again.

## Monitoring

- Sprint board, backlog, and done match Jira status categories.
- The sprint board has dedicated row groups for sprint categories.
- Issue and step pages carry an `Updated` timestamp from Jira.
- `git` remains the reliable history: diffs only appear when content changes.
- `scripts/verify-jira-ghpages-links.sh` verifies imported GitHub Pages targets
  locally for both DE and EN.
