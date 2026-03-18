---
layout: page
title: "J01-98: Sprint-relevant preview migration from J01-91 phase 2"
jira_key: J01-98
permalink: /en/jira/issues/J01-98/
---

**Stand:** 2026-03-17

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-98`.
This issue narrows the phase-2 work from `J01-91` to the `docs/agile`
migration that is immediately relevant for `SCRUM Sprint 1` and the
preview-deployment path.

## Goal

Implement only the sprint-relevant part of the phase-2 follow-up from `J01-91`:

- preview/deployment-related leftovers from `docs/agile`
- target paths for `J01-9`, `J01-13`, `J01-16`, and `J01-31`
- a clear boundary against later migrations outside this sprint

## Implemented now

- `J01-98` created as the dedicated follow-up issue for `J01-91`
- placed into the active sprint and labeled `sprint-support`
- scope narrowed now:
  only the `docs/agile` migration that supports the current preview sprint
- the remaining phase-2 leftovers were moved into the backlog follow-up
  [J01-100]({{ "/en/jira/issues/J01-100/" | relative_url }})
- the deeper work doc for the sprint-relevant topic blocks is now kept in
  [migration map and public rationale]({{ "/en/jira/issues/J01-98/migration-map/" | relative_url }})
- the four canonical target locations from `J01-98` are now publicly filled:
  preview runbook, test matrix, HTTP runtime, and CLI/build area
- the local Pages preview path was checked on 2026-03-17 against `J01-98`
  and the four target pages; all affected pages return `HTTP 200` in preview

## Deeper work doc

This page remains the compact public work status.
The detailed rationale, target-location mapping, and the scope boundary against
`J01-100` are written out in
[migration map and public rationale]({{ "/en/jira/issues/J01-98/migration-map/" | relative_url }}).
Internal work notes are mentioned there only as provenance, never as public
reading targets; the public statement itself always lives in the docs.
That rationale additionally uses the commit history of the branches `preview`,
`feature/iss-005-preview`, and `dev`.

## Working rules

- Do not move work back into `J01-91`; it remains the closure snapshot only.
- Sprint focus first:
  preview deployment before general `docs/agile` cleanup.
- Only work on topics that visibly support the `SCRUM Sprint 1` scope.
- Move everything else into [J01-100]({{ "/en/jira/issues/J01-100/" | relative_url }})
  and keep it in the backlog until after this sprint.

## Closure status

- The sprint-relevant preview scope from `J01-91` is publicly implemented for
  `J01-98` and locally verified in the Pages preview.
- Further `docs/agile` leftovers no longer stay in this issue, but in
  [J01-100]({{ "/en/jira/issues/J01-100/" | relative_url }}).
- Future additions belong to `J01-98` only if the sprint scope changes again;
  in the current boundary, this issue is functionally complete.

## Links

- [J01-91: status/snapshot (closure)]({{ "/en/jira/issues/J01-91/" | relative_url }})
- [J01-100: docs/agile leftovers after sprint 1]({{ "/en/jira/issues/J01-100/" | relative_url }})
- [J01-98: migration map and public rationale]({{ "/en/jira/issues/J01-98/migration-map/" | relative_url }})
- [Docs policy]({{ "/en/policies/doku-richtlinie/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
