---
layout: page
title: "J01-137 — Ongoing CV UI adjustments Sprint 4"
permalink: /en/jira/issues/J01-137/
jira_key: J01-137
jira_parent_key: J01-6
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public working note for ongoing CV UI adjustments in
`SCRUM Sprint 4`.

## Goal

- Smaller CV UI and rendering corrections are collected in one ongoing Sprint
  issue while they remain part of the same work stream.
- Every related commit carries `J01-137` in the commit title so later
  assignment can be automated.
- The issue page keeps a simple commit list as a machine-friendly changelog.

## Current Status

- `J01-137` exists as an ongoing Sprint 4 issue under `J01-6`.
- Jira metadata:
  - Status: `In Bearbeitung`
  - Sprint: `SCRUM Sprint 4`
  - Labels: `sprint-unplanned`, `cv`, `twig`
- The previous education rendering fix remains part of the issue.
- The current UI adjustments to header, meta area, entry layout, fixture data,
  and renderer coverage are also grouped under this issue.

## Commit List

| Date | Commit | Title |
| --- | --- | --- |
| 2026-04-29 | `cb4c846` | `fix: CV-Ausbildungsdaten und Tagbreiten stabilisieren (J01-137)` |
| 2026-04-29 | `fefc79e` | `fix: laufende CV-UI-Anpassungen fortführen (J01-137)` |
| 2026-04-29 | `49edc6a` | `fix: CV-Abschnittslinien im Druck zusammenhalten (J01-137)` |

## Verification

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Schema | `grad` and `beschreibung` are individually optional, but not both absent together | `CvValidatorTest` | done |
| Twig output | Empty or absent fields do not render empty comma separators | `sections.html.twig` | done |
| UI layout | Entry metadata sits at the top right and long entry text can flow around it | `entry.html.twig`, `entry.css` | done |
| Print layout | Section lines are not separated immediately after the line when printed | `sections.css` | done |
| Renderer | The CV output remains renderable | `CvRendererTest` | done |
| CSS build | Built CV CSS contains the current layout rules | `npm run build:css` | done |

## Open Points

- The issue stays open while further related Sprint 4 UI adjustments continue
  under `J01-137`.
- The commit list can later be generated from commit titles containing
  `(J01-137)`.

## Links

- [J01-6 — i18n für Seitenvorlagen und Templates]({{ "/en/jira/issues/J01-6/" | relative_url }})
- [SCRUM Sprint 4]({{ "/en/work/sprints/scrum-sprint-4/" | relative_url }})
