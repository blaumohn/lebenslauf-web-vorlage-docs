---
layout: page
title: "J01-95: Build a journaled Jira/pages sync with resume"
jira_key: J01-95
jira_parent_key: J01-72
permalink: /en/jira/issues/J01-95/
---

**Stand:** 2026-03-14

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-95`.
This step adds a local journal and resume path to the Jira/pages workflow for
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
- `verify-public-jira-pages.sh` can now verify only affected keys
- new Pages helpers to:
  - derive link changes from Git diffs
  - find affected Jira keys locally from `mirror/`
- `atlassian jira ext remotelink sync` for targeted docs link synchronization
- The issue is now set to `Done` in Jira; targeted status and remote-link runs
  for `J01-95` were pulled through successfully.

## V1 Rules

- Jira changes are recorded as `KEY:CLASS`.
- V1 classes:
  `status`, `summary`, `description`, `step_meta`, `remote_links`
- GitHub Pages changes are detected from a Git base ref.
- In V1, `jira/` is treated as the complete public view of docs-domain links
  imported from Jira; other Jira content stays outside this path.
- Full sync remains a repair mode, not the default path.

## Completion

- V1 delivers a journaled normal mode for known Jira and GitHub Pages changes.
- Resume, targeted verification, and the full-sync repair path are now part of
  the workflow.
- Any further work is about later extensions, not the core capability.

## Links

- [Jira work docs]({{ "/en/jira/" | relative_url }})
- [Runbook: update the public Jira area]({{ "/en/operations/runbook/" | relative_url }})
