---
layout: page
title: "J01-145 — Ongoing documentation maintenance Sprint 4"
permalink: /en/jira/issues/J01-145/
jira_key: J01-145
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public working note for ongoing documentation maintenance in
`SCRUM Sprint 4`.

## Goal

- Small documentation corrections and policy sharpenings are collected in one
  ongoing Sprint issue when no specific domain issue fits.
- Every related change carries `J01-145` in the commit title so later
  assignment can be automated.
- The issue page keeps a simple change list as a traceable maintenance log.

## Current Status

- `J01-145` exists as an ongoing Sprint 4 issue.
- Jira metadata:
  - Status: `In Bearbeitung`
  - Sprint: `SCRUM Sprint 4`
  - Labels: `sprint-unplanned`, `docs`, `policy`
- The first change sharpens the programming guidelines under
  `policies/programmierleitlinien/#fachliche-stilregeln`.
- `J01-113` remains the general rule and architecture context; this concrete
  ongoing documentation maintenance is tracked here.

## Commit List

| Date | Commit trace | Affected issues | Area | Change |
| --- | --- | --- | --- | --- |
| 2026-05-11 | `docs: laufende doku-wartung verankern (J01-145)` | `J01-145`, `J01-113` | Programming guidelines | Domain style rules explain top-to-bottom readability for the main flow of program files without turning it into a rigid sorting rule; `J01-113` only points to this ongoing maintenance issue. |
| 2026-05-11 | `docs: doku-commits im recent-feed trennen (J01-145)` | `J01-145` | Recent changes | Documentation commits are shown in a separate table on `/recent/`. |

## Verification

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Ongoing issue | Documentation maintenance does not run through a general old issue | `J01-145` | done |
| DE/EN policy | German and English programming guidelines are content-equivalent | `policies/programmierleitlinien/`, `en/policies/programmierleitlinien/` | done |
| No rigid sorting rule | The rule describes readability and domain main flow instead of mechanical reordering | `Domain Style Rules` section | done |
| Remote link | Jira points to the canonical public work doc | Jira remote link to `/de/jira/issues/J01-145/` | done |

## Open Points

- The issue stays open while smaller related documentation maintenance items
  in the sprint do not need their own specific issue.
- Larger domain changes still get their own issue.

## Links

- [Programming guidelines]({{ "/en/policies/programmierleitlinien/" | relative_url }})
- [J01-113 — Rule cleanup]({{ "/en/jira/issues/J01-113/" | relative_url }})
- [SCRUM Sprint 4]({{ "/en/work/sprints/scrum-sprint-4/" | relative_url }})
