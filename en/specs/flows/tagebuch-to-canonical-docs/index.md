---
layout: page
title: "Spec: tagebuch to canonical docs"
permalink: /en/specs/flows/tagebuch-to-canonical-docs/
---

This flow describes how raw material from the `tagebuch` is turned into
canonical public docs.

## Purpose

- make derivation visible without turning raw material into public docs

## Trigger

- provenance question, new research, or a needed public justification

## Participating systems

- [`tagebuch`]({{ "/en/specs/systems/tagebuch/" | relative_url }})
- [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- [AI/skill framework]({{ "/en/specs/systems/ai-skill-framework/" | relative_url }})

## Inputs and outputs

- Inputs:
  - search case, notes, registers, exchange logs
- Outputs:
  - evidenced public statement or updated work doc

## Flow

1. check the source register or matching notes in the `tagebuch`
2. read the relevant raw sources selectively
3. separate stable statement from raw material
4. anchor the statement in public docs or an issue page
5. extend the source register or round log if needed

## Handovers

- search case -> raw note
- raw note -> derived statement
- derived statement -> canonical docs

## Boundaries and non-goals

- do not copy raw notes 1:1 into public docs
- do not create a second public SSOT next to GitHub Pages

## Links to operational docs

- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
- [J01-96]({{ "/en/jira/issues/J01-96/" | relative_url }})

## Sources

- `tagebuch/notes/meta/system.md`
- `tagebuch/notes/index/quellenregister.md`
- [J01-96]({{ "/en/jira/issues/J01-96/" | relative_url }})
