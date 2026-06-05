---
layout: page
title: "62-8 — Derive home and index content from site data"
permalink: /en/jira/issues/J01-62/steps/J01-154/
jira_key: J01-154
jira_parent_key: J01-62
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Goal

Run production with a valid public profile and real site data.

## Completion State

Functionally implemented and set to `Erledigt` in Jira.

The production pipeline config uses `LEBENSLAUF_PUBLIC_PROFILE: gueltig`
instead of the dev profile. HTTP smokes read the expected CV name dynamically
from the content YAML.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Production profile | Production uses an existing public profile | Commit `d5202b6`, `src/resources/pipeline-config/prod.yaml` | done |
| Content smoke | Smoke expectations come from content YAML | Commits `4498f3c`, `4c5f63c` | done |
| Jira status | Jira shows the functional completion | `J01-154` | done |

## Links

- [Parent J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }})
