---
layout: page
title: "J01-106: Skill repo: merge jira-pages-sync into jira-state-sync"
jira_key: J01-106
permalink: /en/jira/issues/J01-106/
---

**Status:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for Jira task `J01-106`.
This task removes the obsolete split between `jira-pages-sync` and
`jira-state-sync` so that the public Jira area has only one canonical skill
workflow.

## Goal

- `jira-state-sync` is the only canonical skill for targeted refreshes of the
  public Jira area.
- `jira-pages-sync` is removed as a standalone skill and no longer creates a
  double-trigger risk.
- Active skill and README references point only to the journaled sync path.

## Current status

- Jira task created (`J01-106`).
- Skill consolidation is in progress.
- Public work docs in DE/EN are being added in parallel.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Only one canonical sync skill remains | `jira-pages-sync` is removed, `jira-state-sync` covers the public Jira refresh path | Skill repo under `skills/` | open |
| Legacy name still works as a pointer | `jira-mirror-sync` points directly to `jira-state-sync` | Skill repo under `skills/jira-mirror-sync/` | open |
| Active references cleaned up | README and coordination skill no longer name an active `jira-pages-sync` | Skill repo | open |
| Public work docs exist | `/de/jira/issues/J01-106/` and `/en/jira/issues/J01-106/` exist | GitHub Pages docs | open |

## Open points

- Check whether any live references to `jira-pages-sync` remain outside
  historical notes.
- Merge the skill-repo edits cleanly with already open local changes.

## Links

- [J01-95: Build a journaled Jira/pages sync with resume]({{ "/en/jira/issues/J01-95/" | relative_url }})
- [J01-105: Pipeline-Spec: Simplify manifest for clear parameter flow]({{ "/en/jira/issues/J01-105/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
