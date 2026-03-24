---
layout: page
title: "J01-117: Project docs: spec map for project, systems, and flows"
jira_key: J01-117
permalink: /en/jira/issues/J01-117/
---

**Stand:** 2026-03-24

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work state for `J01-117`.
This issue introduces a new spec layer in GitHub Pages so the project becomes
visible not only through individual area or issue pages, but as a connected map
of the project, its systems, and its flows.

## Goal

- approve the new doc type `Spec` with templates and policy rule
- create a project spec as the public answer to “What is this project?”
- derive the first system and flow specs from existing sources
- sharpen the start page and project map so HR, Product, Tech, and Dev can
  orient themselves quickly

## Current state

- issue created, assigned to the active sprint, and moved to
  `In Bearbeitung`
- sources from GitHub Pages, skills, the `tagebuch`, and archived `docs/agile`
  pulled together deliberately
- `specs/` decided as the new canonical layer
- first implementation started in the dedicated docs worktree
  `feature/j01-117-spec-landkarte`
- external-facing wording tightened after first feedback so the start page and
  project spec stay definitional instead of promotional

## Source base

- current public docs:
  - [Docs policy]({{ "/en/policies/doku-richtlinie/" | relative_url }})
  - [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
  - [CLI / Build]({{ "/en/areas/cli-build/" | relative_url }})
  - [HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }})
- project and skill sources:
  - `lebenslauf-web-vorlage/README.md`
  - `pipeline-config-spec-php/README.de.md`
  - `skills/koordination/SKILL.md`
  - `skills/jira-state-sync/SKILL.md`
  - `skills/docs-i18n/SKILL.md`
- provenance:
  - `tagebuch/notes/meta/system.md`
  - `tagebuch/notes/index/quellenregister.md`
  - targeted exchange notes on project map, skill home, and `docs/agile`
    migration
- archive sources:
  - `docs/agile` export inside the `tagebuch`
  - [J01-91: archive topic extraction]({{ "/en/jira/issues/J01-91/archive-topics/" | relative_url }})
  - [J01-98: migration map]({{ "/en/jira/issues/J01-98/migration-map/" | relative_url }})

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| `Spec` approved | Policy names `Spec` as an allowed new type | docs policy DE/EN | in progress |
| Templates available | System and flow spec templates exist in DE/EN | `templates/spec-system/`, `templates/spec-ablauf/` | in progress |
| Project spec visible | A public project spec exists as the project entry point | `specs/project/` | in progress |
| First spec wave created | Project, system, and flow specs are present | `specs/` and `en/specs/` | in progress |
| Public framing sharpened | Start page explains the dual role as website template and portfolio piece | `/de/`, `/en/` | in progress |
| Sources derived cleanly | Public docs, skills, `tagebuch`, and `docs/agile` are all evidenced | this page + spec pages | in progress |

## Closure picture or open points

- After this issue, the spec layer should be a stable entry point for readers
  and skills, not just a one-off migration target.
- Follow-up work in the skill repo or the `tagebuch` stays separate and only
  happens where real references or new source-register entries are needed.

## Links

- [Specs]({{ "/en/specs/" | relative_url }})
- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
- [J01-102: sharpen the project map and skill/docs separation]({{ "/en/jira/issues/J01-102/" | relative_url }})
- [J01-111: AI rule coherence and verification architecture]({{ "/en/jira/issues/J01-111/" | relative_url }})
