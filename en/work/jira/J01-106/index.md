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
- Active skill, README, and runbook references point only to the journaled
  sync path.
- Live operating docs distinguish clearly between filesystem paths and public
  URI paths.
- The docs repo and skill repo use direct `main` integration instead of a
  generic `dev`-/`preview` path.

## Current status

- Jira task created (`J01-106`).
- Skill consolidation implemented.
- Public work docs in DE/EN added.
- Live operating docs and skills aligned on path semantics and repo-class
  Git flow.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Only one canonical sync skill remains | `jira-pages-sync` is removed, `jira-state-sync` covers the public Jira refresh path | Skill repo under `skills/` | done |
| Legacy name removed | `jira-mirror-sync` and old wrappers are no longer part of the live operating model | Skill repo | done |
| Active references cleaned up | README, skills, and runbooks no longer name an active `jira-pages-sync` or `jira-mirror-sync` path | Skill repo + docs repo | done |
| Path semantics are explicit | Live docs distinguish filesystem paths from public URI paths | Skill repo + docs repo | done |
| Git flow is defined by repo class | Docs/skills use direct `main`; source repos keep their own stricter flows | Skill repo + docs repo | done |
| Public work docs exist | `/de/jira/issues/J01-106/` and `/en/jira/issues/J01-106/` exist | GitHub Pages docs | done |

## Open points

- Historical work docs and sprint retros that still carry older wording stay
  intentionally unchanged.

## Links

- [J01-95: Build a journaled Jira/pages sync with resume]({{ "/en/jira/issues/J01-95/" | relative_url }})
- [J01-105: Pipeline-Spec: Simplify manifest for clear parameter flow]({{ "/en/jira/issues/J01-105/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
