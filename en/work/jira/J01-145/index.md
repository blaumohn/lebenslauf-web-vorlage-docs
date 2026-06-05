---
layout: page
title: "J01-145 — Ongoing documentation maintenance"
permalink: /en/jira/issues/J01-145/
jira_key: J01-145
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public working note for ongoing documentation maintenance in the
current sprint context.

## Goal

- Small documentation corrections and policy sharpenings are collected in one
  ongoing Sprint issue when no specific domain issue fits.
- Every related change carries `J01-145` in the commit title so later
  assignment can be automated.
- The issue page keeps a simple change list as a traceable maintenance log.

## Current Status

- `J01-145` exists as an ongoing documentation maintenance issue.
- Jira metadata:
  - Status: `In Bearbeitung`
  - Sprints: `SCRUM Sprint 4`, `SCRUM Sprint 5`, and active `SCRUM Sprint 6`
  - Labels: `docs`, `policy`, `sprint-admin`, `sprint-unplanned`
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
| 2026-05-28 | open | `J01-145` | Skills / Markdown reduction | The second reduction pass removes hook-checkable detailed checklists from shared and project skills; the skills keep scope, canonical flows, authoritative sources, and decisions that cannot be automated. |
| 2026-06-04 | open | `J01-145` | README/docs sync | The docs repo now installs a `pre-commit` hook in the main repo that checks `README.md` and `README.en.md` against the tagged public docs sections. |
| 2026-06-04 | open | `J01-145` | README UX source | Quickstart and private view sections in README and public docs are copied from `tests/ci/readme-dev-user-flow.sh`; missing source functions block the generator. |
| 2026-06-04 | open | `J01-145` | README/docs entry | `getting-started/` is updated as a visible hub; README sections point to docs and supporting source/domain pages, including computed line anchors for tested flows. |

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
| Skill Markdown reduction | Hook-checkable detailed rules no longer appear as operational checklists in the affected skills | `.agents/skills/shared/`, `.agents/skills/lebenslauf-web-vorlage/skills/`, `scripts/verify-skills.sh --check-index` | done |
| README sync hook | Main-repo READMEs are checked against the public docs before commit | `scripts/hooks/project-pre-commit`, `scripts/sync-readme.py --check`, `tests/project-pre-commit-hook.sh` | done |
| README UX source | README program paths come from the executable README UX test | `tests/ci/readme-dev-user-flow.sh`, `scripts/sync-readme.py`, `tests/project-pre-commit-hook.sh` | done |
| README/docs hub | `getting-started/` links the README-adjacent entry perspectives directly | `getting-started/index.md`, `en/getting-started/index.md` | done |
| Evidence links | Overview and technical highlights support central claims with links to specs, areas, or work docs | `de/getting-started/*`, `en/getting-started/*`, `README.md`, `README.en.md` | done |
| Line anchors | Source references for tested README flows include computed GitHub or local line ranges | `scripts/sync-readme.py`, `tests/ci/readme-dev-user-flow.sh` | done |

## Open Points

- Sprint 6 provides the deliberate follow-up scope. Small ongoing
  documentation maintenance can continue here.
- Larger domain changes still get their own issue.

## Source Review

All sections were checked against `tagebuch` and commit history. The change
and verification lists remain current; only the active-sprint statement was
outdated after 2026-06-04.

## Links

- [Programming guidelines]({{ "/en/policies/programmierleitlinien/" | relative_url }})
- [J01-113 — Rule cleanup]({{ "/en/jira/issues/J01-113/" | relative_url }})
- [SCRUM Sprint 4]({{ "/en/work/sprints/scrum-sprint-4/" | relative_url }})
- [SCRUM Sprint 5]({{ "/en/work/sprints/scrum-sprint-5/" | relative_url }})
