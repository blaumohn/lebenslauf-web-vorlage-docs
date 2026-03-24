---
layout: page
title: "Spec: tagebuch"
permalink: /en/specs/systems/tagebuch/
---

The `tagebuch` is the provenance, search, and derivation system of the project.

## What it is

- a Markdown-based raw notes system
- the place for search cases, exchange notes, round logs, and registers
- a derived but non-public source base for later docs

## What it is not

- not the canonical public project docs
- not Jira
- not the product repo

## Why

- decisions and derivations should remain traceable
- raw material needs a place that does not force early classification

## Structure

- `notes/inbox/`
- `notes/meta/`
- `notes/index/`
- `notes/raw/`

## Roles

- humans and AI store raw material and search notes
- registers bundle relevant source cases
- public docs derive only stable statements from it

## Interfaces

- provides provenance to the [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- is used by skills as a source location
- stays separate from the [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})

## Current state and target picture

- Current state:
  - raw material and registers are present
- Target picture:
  - the `tagebuch` remains raw material and does not become a second domain docs system

## Parent systems

- [Project overall system]({{ "/en/specs/project/" | relative_url }})

## Child systems

- source register
- meta notes
- inbox notes

## Related systems

- [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- [AI/skill framework]({{ "/en/specs/systems/ai-skill-framework/" | relative_url }})

## Sources

- `tagebuch/notes/meta/system.md`
- `tagebuch/notes/index/quellenregister.md`
- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
- [J01-96]({{ "/en/jira/issues/J01-96/" | relative_url }})
