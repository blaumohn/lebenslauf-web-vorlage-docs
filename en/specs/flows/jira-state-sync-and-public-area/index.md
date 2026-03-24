---
layout: page
title: "Spec: Jira state sync and public area"
permalink: /en/specs/flows/jira-state-sync-and-public-area/
---

This flow describes the targeted follow-up between Jira changes and the public
Jira area in GitHub Pages.

## Purpose

- maintain the public Jira view in a targeted, traceable way without full syncs

## Trigger

- known Jira or Pages change on an issue

## Participating systems

- [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- [`atlassian-tools`]({{ "/en/specs/systems/atlassian-tools/" | relative_url }})
- [AI/skill framework]({{ "/en/specs/systems/ai-skill-framework/" | relative_url }})

## Inputs and outputs

- Inputs:
  - Jira diff or known Pages change
- Outputs:
  - updated public Jira area and canonical remote links

## Flow

1. create or resume a journal run
2. initialize or refresh the local Jira cache
3. determine the touched keys
4. update the public Jira area only for these keys
5. verify remote links and result

## Handovers

- Jira change -> local cache
- local cache -> targeted Pages update
- Pages update -> remote link verification

## Boundaries and non-goals

- no unnecessary full sync
- no second parallel skill for the same flow

## Links to operational docs

- [Runbook: update public Jira pages]({{ "/en/operations/runbook/" | relative_url }})
- [J01-106]({{ "/en/jira/issues/J01-106/" | relative_url }})

## Sources

- `skills/jira-state-sync/SKILL.md`
- [Jira]({{ "/en/jira/" | relative_url }})
- [Jira and docs tooling: public Jira overview]({{ "/en/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})
