---
layout: page
title: "J01-98: Sprint-relevant preview migration from J01-91 phase 2"
permalink: /en/work/jira/J01-98/
---

**Stand:** 2026-03-16

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
  [J01-100]({{ "/en/work/jira/J01-100/" | relative_url }})

## Working rules

- Do not move work back into `J01-91`; it remains the closure snapshot only.
- Sprint focus first:
  preview deployment before general `docs/agile` cleanup.
- Only work on topics that visibly support the `SCRUM Sprint 1` scope.
- Move everything else into [J01-100]({{ "/en/work/jira/J01-100/" | relative_url }})
  and keep it in the backlog until after this sprint.

## Next implementation blocks

1. Pull preview/deployment-related leftovers from `docs/agile` only for
   `J01-9`, `J01-13`, `J01-16`, and `J01-31` into today's target locations.
2. Anchor sprint-path evidence in matching work docs or `quality/testmatrix/`.
3. Keep everything that does not directly support this sprint inside
   [J01-100]({{ "/en/work/jira/J01-100/" | relative_url }}).

## Links

- [J01-91: status/snapshot (closure)]({{ "/en/work/jira/J01-91/" | relative_url }})
- [J01-100: docs/agile leftovers after sprint 1]({{ "/en/work/jira/J01-100/" | relative_url }})
- [Docs policy]({{ "/en/policies/doku-richtlinie/" | relative_url }})
- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
