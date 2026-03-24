---
layout: page
title: "Spec: AI/skill framework"
permalink: /en/specs/systems/ai-skill-framework/
---

The AI/skill framework is the versioned work and rule system for project-bound
AI work in the workspace.

## What it is

- the combination of workspace `AGENTS.md`, skill repos, and project-bound
  skills
- the layer for recurring AI workflows, repo coordination, and rule separation
- the home of reference and execution logic for AI work

## What it is not

- not the public long form of all project rules
- not the product itself
- not the raw notes system

## Why

- AI work needs versioned, reusable, project-bound workflows
- skills should link project knowledge instead of duplicating it

## Structure

- shared skills
- project-specific skill repos
- project-bound skills such as `koordination`, `docs-i18n`,
  `jira-state-sync`

## Roles

- shared skills carry general method
- project skills carry concrete workflows and project binding
- workspace `AGENTS.md` stays bootstrap instead of domain home

## Interfaces

- points to the [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }}) and [Specs]({{ "/en/specs/" | relative_url }})
- uses the `tagebuch` for provenance
- works with Jira and the repo system

## Current state and target picture

- Current state:
  - project map, skills, and rule work already exist
- Target picture:
  - specs become additional canonical targets for skill references

## Parent systems

- [Project overall system]({{ "/en/specs/project/" | relative_url }})

## Child systems

- shared skills
- project skills
- cache and script paths

## Related systems

- [`tagebuch`]({{ "/en/specs/systems/tagebuch/" | relative_url }})
- [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- [GitHub and PR system]({{ "/en/specs/systems/github-collaboration/" | relative_url }})

## Sources

- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
- `skills/koordination/SKILL.md`
- `skills/docs-i18n/SKILL.md`
- `skills/jira-state-sync/SKILL.md`
- [J01-111]({{ "/en/jira/issues/J01-111/" | relative_url }})
- [J01-113: rule inventory appendix]({{ "/en/jira/issues/J01-113/anlage-regelwerk-bestand/" | relative_url }})
