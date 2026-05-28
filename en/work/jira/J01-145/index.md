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
| 2026-05-11 | `docs: recent-feed mit inhaltsliste erweitern (J01-145)` | `J01-145` | Recent changes | `/recent/` shows a contents list and up to 10 project/config commits plus 10 documentation commits. |
| 2026-05-11 | `fix: recent-ui-texte im include aufloesen (J01-145)` | `J01-145` | Recent changes | The include resolves the language before reading `_data/ui.yml` so contents links and section titles do not stay empty. |
| 2026-05-12 | open | `J01-145` | Programming guidelines | Domain style rules are split into reviewable subsections; fallbacks are described as separate program-path branches that must not hide errors. |
| 2026-05-12 | open | `J01-145`, `J01-34` | Jira page sync | The EN sync no longer overwrites manually maintained English Jira pages with generated DE pages; `J01-34` stays English after `prepare-site.sh`. |
| 2026-05-28 | open | `J01-145` | Skills / documentation hygiene | Local skills are inventoried; skill Markdown points more compactly to canonical sources and automated checks; pre-commit hooks check skill links, script references, `tools-python`, and shared/project separation. |
| 2026-05-28 | open | `J01-145` | Skill tooling / linting | Shellcheck is now a mandatory hook step in the skill repo; active shell scripts were updated to pass linting instead of hiding findings. |

## Verification

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Ongoing issue | Documentation maintenance does not run through a general old issue | `J01-145` | done |
| DE/EN policy | German and English programming guidelines are content-equivalent | `policies/programmierleitlinien/`, `en/policies/programmierleitlinien/` | done |
| No rigid sorting rule | The rule describes readability and domain main flow instead of mechanical reordering | `Domain Style Rules` section | done |
| Fallback rule | Fallbacks are only allowed as valid, named, and tested program-path branches | `Fallbacks Do Not Hide Errors` section | done |
| EN sync protects manual pages | Manually maintained EN Jira pages keep their translation after `prepare-site.sh` | `scripts/sync-en-jira-pages.sh`, `en/work/jira/J01-34/index.md` | done |
| Remote link | Jira points to the canonical public work doc | Jira remote link to `/de/jira/issues/J01-145/` | done |
| Skill inventory | Local skills are machine-readable and reproducibly generated | `.agents/skills/lebenslauf-web-vorlage/skills/README.md`, `scripts/verify-skills.sh --check-index` | done |
| Pre-commit hook | Hook template is versioned and installable through a setup script | `.agents/skills/lebenslauf-web-vorlage/scripts/hooks/pre-commit`, `scripts/install-hooks.sh` | done |
| Skill hygiene | Frontmatter, unique names, links, script references, `tools-python`, and project-free shared rules are checked automatically | `.agents/skills/lebenslauf-web-vorlage/scripts/verify-skills.sh` | done |
| Shellcheck | Active shell scripts pass Shellcheck and the hook blocks new findings | `.agents/skills/lebenslauf-web-vorlage/scripts/hooks/pre-commit` | done |

## Open Points

- The issue stays open while smaller related documentation maintenance items
  in the sprint do not need their own specific issue.
- Larger domain changes still get their own issue.

## Links

- [Programming guidelines]({{ "/en/policies/programmierleitlinien/" | relative_url }})
- [J01-113 — Rule cleanup]({{ "/en/jira/issues/J01-113/" | relative_url }})
- [SCRUM Sprint 4]({{ "/en/work/sprints/scrum-sprint-4/" | relative_url }})
