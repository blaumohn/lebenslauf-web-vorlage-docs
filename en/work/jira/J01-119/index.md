---
layout: page
title: "J01-119: Harden the targeted Jira/pages sync against silent regressions"
jira_key: J01-119
jira_parent_key: J01-84
permalink: /en/jira/issues/J01-119/
---

**Stand:** 2026-04-01

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-119`.
This issue continues the hardening work after the completed V1 base in
`J01-95`: a guard against partially stale local working state, a visible
failure path, and the missing command-cache recipe for targeted Jira issue
reads.

## Goal

- Targeted Jira/pages runs must no longer let untouched issues silently fall
  back to older metadata.
- Inconsistencies are reported as a real system gap and require a deliberate
  full refresh instead of a silent overwrite.
- The recurring read path for single Jira issues is documented in the command
  cache.
- `J01-95` stays readable as the completed V1 base without silently carrying
  later hardening work.

## Current status

- `J01-119` now exists as a new follow-up issue under `J01-84`.
- `J01-95` remains `Done` in Jira and is linked to `J01-119`.
- The missing command-cache recipe
  `shared-tooling/jira-pages/cache-recipes/issue-read.md` has been added.
- This public work doc and the `tagebuch` now mirror the guard work and the
  sharper boundary to `J01-95`.
- Sprint assignment remains open for now because Jira still reports the
  time-expired `SCRUM Sprint 1` as `active` on 2026-04-01, and the sprint
  policy requires that cleanup first.

## Verification plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Follow-up issue exists | `J01-119` exists in Jira and names the guard/recipe follow-up | Jira `J01-119`, this page | open |
| Boundary to `J01-95` is visible | `J01-95` stays completed but points to `J01-119` for follow-up work | Jira issue link, `work/jira/J01-95/` | open |
| Command recipe is added | `issue-read.md` documents the valid REST read path and the missing shortcut | skill repo `cache-recipes/issue-read.md` | open |
| Sprint risk is documented | Public docs state that sprint assignment must wait for stale active sprint cleanup | this page, sprint policy | open |

## Completion picture or open points

- The Jira reference for the follow-up work is now cleanly separated from the
  completed V1 issue.
- The new issue makes it explicit that `Done` on `J01-95` refers to the
  completed base scope, not every later hardening task.
- Sprint cleanup remains open before `J01-119` can be placed into a normal
  active sprint.

## Links

- [J01-95: Build a journaled Jira/pages sync with resume]({{ "/en/jira/issues/J01-95/" | relative_url }})
- [J01-84: Prepare the Atlassian system (SSOT: Jira)]({{ "/en/jira/issues/J01-84/" | relative_url }})
- [Sprint policy]({{ "/en/policies/sprint-richtlinie/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
