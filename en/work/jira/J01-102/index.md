---
layout: page
title: "J01-102: Sharpen the project map and skill/docs split"
permalink: /en/work/jira/J01-102/
---

**Stand:** 2026-03-17

Canonical public work status for `J01-102`.
This issue sharpens the split between public project docs, the `tagebuch`, and
project-specific AI skills so skills can find project requirements from
canonical sources first.

## Goal

Define a small project map for AI skills that clearly separates always-on
rules, canonical project docs, provenance in the `tagebuch`, and skill-local
helpers.

## Current state

- `AGENTS.md`, public docs, the `tagebuch`, and the skills already carry
  partial rules, but there was no single compact project entry point for
  skills.
- The new policy page
  [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
  now provides that canonical entry point.
- Project skills are expected to point from there to the matching domain
  sources instead of restating project requirements.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Canonical project entry point for skills exists | The project map explains the responsibilities of `AGENTS.md`, public docs, the `tagebuch`, and the skills | [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }}) | done |
| Project skills point to canonical sources | Relevant skills mention the project map instead of duplicating project rules | project skill repo under `skills/` | done |
| Public work doc is reachable directly from Jira | Jira keeps one canonical remote link to `work/jira/J01-102/` | Jira remote links for `J01-102` | done |

## Closure picture or open points

- The project map now exists as the canonical entry point.
- Further tightening of single skills or policy pages only continues as
  targeted follow-up work inside this issue.

## Links

- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
- [J01-92: Shared-agent rules and skill versioning]({{ "/en/work/jira/J01-92/" | relative_url }})
- [J01-96: Anchor the source register and raw chat inputs]({{ "/en/work/jira/J01-96/" | relative_url }})
