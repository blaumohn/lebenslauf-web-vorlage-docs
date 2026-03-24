---
layout: page
title: "Spec: Docs system"
permalink: /en/specs/systems/docs-system/
---

The docs system is the canonical public project surface in GitHub Pages.
It publishes rules, area docs, runbooks, work docs, and specs.

## What it is

- the `lebenslauf-web-vorlage-docs` repo
- the public documentation under `/de/...` and `/en/...`
- the canonical place for public project rules and stable explanation pages

## What it is not

- not Jira itself
- not the raw notes system
- not the product repo

## Why

- the project needs a public, static, canonical docs location
- skills and readers should not need to assemble project knowledge from
  scattered sources

## Structure

- `areas/`
- `policies/`
- `operations/`
- `decisions/`
- `work/`
- `specs/`

## Roles

- readers orient themselves here in public
- authors maintain stable rules and explanations
- Jira work docs make work steps publicly traceable

## Interfaces

- mirrors work states from the [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- points to repos in the [GitHub and PR system]({{ "/en/specs/systems/github-collaboration/" | relative_url }})
- uses the `tagebuch` only as a provenance source

## Current state and target picture

- Current state:
  - public docs, Jira area, and rules already exist
- Target picture:
  - additional clear project, system, and flow specs as a map

## Parent systems

- [Project overall system]({{ "/en/specs/project/" | relative_url }})

## Child systems

- area docs
- policies and runbooks
- public Jira work docs
- specs

## Related systems

- [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- [`tagebuch`]({{ "/en/specs/systems/tagebuch/" | relative_url }})

## Sources

- [Docs policy]({{ "/en/policies/doku-richtlinie/" | relative_url }})
- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
- [Jira]({{ "/en/jira/" | relative_url }})
- `lebenslauf-web-vorlage-docs/README.md`
