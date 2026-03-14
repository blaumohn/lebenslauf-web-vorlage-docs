---
layout: page
title: "J01-95: Build a journaled Jira/pages sync with resume"
permalink: /en/work/jira/J01-95/
---

**Stand:** 2026-03-14

Canonical public work status for `J01-95`.
This step adds a local journal and resume path to the Jira/mirror workflow for
known Jira and GitHub Pages changes.

## Goal

Replay known Jira or GitHub Pages changes in a targeted way, without relying on
project-wide Jira list queries in the normal mode.

## Implemented now

- new project-specific skill `jira-state-sync/` for journaled and resumed runs
- local Jira snapshot cache under `.local/jira-sync-cache/`
- local run journal under `.local/jira-sync-journal/`
- the mirror generator now accepts local snapshot files instead of only fresh
  Jira list queries
- `verify-jira-ghpages-links.sh` can now verify only affected keys
- new Pages helpers to:
  - derive link changes from Git diffs
  - find affected Jira keys locally from `mirror/`
- `atlassian jira ext remotelink sync` for targeted docs link synchronization

## V1 Rules

- Jira changes are recorded as `KEY:CLASS`.
- V1 classes:
  `status`, `summary`, `description`, `step_meta`, `remote_links`
- GitHub Pages changes are detected from a Git base ref.
- In V1, `mirror/` is treated as the complete local view of docs-domain links
  imported from Jira; other Jira content stays outside this path.
- Full sync remains a repair mode, not the default path.

## Next steps

1. Dry-run the journal path against real Jira and pages changes.
2. Tighten resume behavior for interrupted runs and verify explicit failure
   cases.
3. Decide later whether extra change classes or a stronger remote-link
   reconcile mode are needed.

## Links

- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
- [Runbook: update the Jira mirror]({{ "/en/operations/runbook/" | relative_url }})
