---
layout: page
title: "AI project map: where skills find project requirements"
permalink: /en/policies/ki-projektkarte/
---

## Goal

Provide a small canonical map for project-specific AI skills so project
requirements do not need to be duplicated inside the skill itself.

## System roles

- **Workspace and repo `AGENTS.md`**:
  always-on rules and repo-local runtime add-ons.
- **GitHub Pages docs**:
  canonical project requirements, issue rules, link rules, and mirror rules.
- **`tagebuch`**:
  provenance, search cases, round notes, and derivation.
- **Skills**:
  a small pointer map, skill-internal tools, command caches, and recurring
  operational workflows.

## What a skill should find here

- where issue-specific public work lives under `work/jira/J01-<KEY>/`
- where canonical project rules live under `policies/`, `operations/`,
  `areas/`, and `decisions/`
- where the mirror is only a derived view and not the SSOT
- where provenance and source history should be checked in the `tagebuch`

## What a skill may carry itself

- a short project map with links to canonical sources
- skill-internal helpers such as cache recipes and script paths
- the concrete recurring workflow of that skill

## What a skill should not duplicate

- project-wide requirements that already live canonically in GitHub Pages
- full issue definitions from `work/jira/`
- topic history or meta-registers when a doc or source register already exists

## Canonical entry points

- [Docs policy]({{ "/en/policies/doku-richtlinie/" | relative_url }})
- [Runbook: update the Jira mirror]({{ "/en/operations/runbook/" | relative_url }})
- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
- [Jira and docs tooling: public Jira overview]({{ "/en/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})

## Sources and provenance

- The `tagebuch` remains the place for search cases, round notes, and
  derivation.
- Skills point to the source register or to specific notes, but do not carry a
  duplicate project history.
