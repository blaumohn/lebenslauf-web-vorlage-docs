---
layout: page
title: "J01-96: Add a source register and raw chat inputs"
permalink: /en/work/jira/J01-96/
---

**Stand:** 2026-03-16

{% include jira-work-context.html %}

Canonical public work status for `J01-96`.
This issue adds a small source register for search cases to the `tagebuch`
repo and keeps raw chat inputs as a separate provenance layer for round notes.

## Goal

Keep `tagebuch` as a sense-making and source repo without forcing single notes
into normative status.
The model separates three layers:

- `notes/raw/` for raw inputs
- `notes/inbox/` for smoothed round notes
- `notes/index/` for a minimal source register for search cases

## Implemented now

- created the new Jira issue `J01-96` for the journal/register topic
- added a `tagebuch` round note for this decision and implementation line
- added raw inputs for this topic under `notes/raw/2026-03-16.md`
- created `notes/index/quellenregister.md` as the first active register
- linked the new register from the `tagebuch` start index
- updated `notes/meta/system.md`:
  registers are derived views for search cases, not the source
- updated the project skill:
  for origin and source questions, check the register
  first, then search `tagebuch`, and add new finds back into the register
- moved Jira issue `J01-96` to `Done`

## Working model

- Individual `tagebuch` notes stay append-only.
- The register contains only `search case`, `search notes`, and `sources`.
- A register entry changes when a search request changes the search state.
- This happens in exactly two cases:
  - an important relevant source was previously missing
  - a search request produces new relevant sources and new search notes
- Skills point to the register but do not duplicate topic history or create a
  meta-register.
- Jira keeps only one canonical remote link for the same public work doc; the
  mirror and GitHub Pages still stay fully DE/EN.

## Source basis

- Local:
  - `tagebuch/notes/meta/system.md`
  - `tagebuch/notes/inbox/2026-02-25-dialektik-j01-83-cache-skill-notizsystem.md`
  - `tagebuch/notes/inbox/idee-spiegelung-rueckmeldung.md`
- External precedents:
  - [IETF RFC 2223](https://www.rfc-editor.org/rfc/rfc2223) for
    `Updates`/`Obsoletes` as a relationship model
  - [GDS: Documenting architecture decisions](https://gds-way.digital.cabinet-office.gov.uk/standards/architecture-decisions.html)
    for visible successor links in ADRs
  - [HHS: Content Lifecycle Management and Archive Guidance](https://www.hhs.gov/web/building-and-managing-websites/managing-websites/content-management-lifecycle-and-archive-policy/index.html)
    for separating historical records from the current entry point

## V1 Rules

- No fields like `current`, `superseded`, or `valid` inside individual
  journal notes.
- No daily mandatory indexes.
- No general development-line or meta-register.
- Create registers only where real retrieval failures or new source findings
  occur.
- No automatic index generation in V1.
- No duplicate DE/EN remote links in Jira for the same work doc.

## Links

- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
