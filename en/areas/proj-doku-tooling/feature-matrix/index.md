---
layout: page
title: "Feature matrix: Jira and docs tooling"
permalink: /en/areas/proj-doku-tooling/feature-matrix/
---

## Purpose

This matrix documents the current state of tooling features in the Jira/docs
tooling area.
Rows describe operations or sub-features, not single files.

## Instance rules

- Topic: Jira, docs, and agent tooling in the project group
- Required columns stay unchanged
- Extra columns in this instance:
  - `Target-home candidate`
  - `Direct dependency`
- Allowed values for `State in the tooling sequence`:
  - `Skill instructions`
  - `Skill script`
  - `Script outside skills`

## Matrix

| Feature / operation | Parent feature | Purpose | State in the tooling sequence | Current home | Implementation locations | Current rationale | Candidate for later maturation | Move only after | Target-home candidate | Direct dependency | Note |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Prepare site | Local GitHub Pages preview | prepare the docs tree before local preview runs | Script outside skills | `lebenslauf-web-vorlage-docs/scripts` | `scripts/prepare-site.sh`, `scripts/sync-en-jira-pages.sh` | called directly by the preview container and therefore stays in the repo workflow for now | yes | separate architecture decision | docs repo or tooling repo | `ghpages-container.sh`, Docker preview | only current container/build prereqs stay in the docs repo |
| Render Jira pages | Update the public Jira area | generate and incrementally refresh the public Jira area | Skill script | project skill repo | `shared-tooling/jira-pages/update-public-jira-pages.sh`, `shared-tooling/jira-pages/jira-adf-to-text.jq` | built as agent-facing helper logic and not yet agreed as a permanent home | yes | decomposition and architecture review | docs repo or tooling repo | Jira data, `jira/`, EN derivation | the parent feature itself is not scored as a row |
| Refresh Jira snapshot cache | Journal Jira/pages sync | refresh local Jira snapshots for known changes | Skill script | project skill repo | `shared-tooling/jira-pages/update-jira-sync-cache.sh` | journal helper without an approved long-term repo home yet | yes | decomposition and architecture review | tooling repo | Jira API, `.local/jira-sync-cache/` | candidate for later decoupling |
| Detect GitHub Pages changes | Journal Jira/pages sync | derive changed GitHub Pages targets from a Git diff | Skill script | project skill repo | `shared-tooling/jira-pages/detect-ghpages-link-changes.sh` | helper for agent flows, not a standalone docs-repo operation | yes | decomposition and architecture review | tooling repo | Git history, front matter | modelled as a sub-feature rather than a file |
| Derive Jira keys from pages changes | Journal Jira/pages sync | map changed pages targets back to affected Jira keys | Skill script | project skill repo | `shared-tooling/jira-pages/find-jira-keys-for-ghpages-changes.sh` | belongs to the journaled sync flow, not to the standard docs-repo runtime | yes | decomposition and architecture review | tooling repo | `jira/`, pages URLs | still only marked as a candidate |
| Verify GitHub Pages targets against Jira | Journal Jira/pages sync | validate imported docs targets from Jira against local permalinks | Skill script | project skill repo | `shared-tooling/jira-pages/verify-public-jira-pages.sh` | skill-side validation helper without an agreed permanent home yet | yes | decomposition and architecture review | tooling repo | Jira remote links, local permalinks | do not treat as a canonical docs-repo operation |

## Assessment

- In this topic, the docs repo only keeps the container/build prereqs that are
  currently required.
- The remaining helpers now live in the project skill repo first.
- Any later move into target or tooling repos stays an explicit candidate and
  is not part of `J01-92`.
