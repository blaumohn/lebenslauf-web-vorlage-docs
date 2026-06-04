---
layout: page
title: "62-3 — Activate environment"
permalink: /en/jira/issues/J01-62/steps/J01-64/
jira_key: J01-64
jira_parent_key: J01-62
status: "Done"
priority: "Medium"
labels:
  - production
  - sprint-goal
updated: 2026-06-03
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Step-specific public working state for
[62-3]({{ "/en/jira/issues/J01-62/steps/J01-64/" | relative_url }}) under
[J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }}).

## Goal

Preview and production use binding GitHub environments and one shared
deployment workflow. Branch, pipeline, and environment are derived traceably
from the branch context.

## Current State

`J01-64` is functionally complete. The main repository state activates the
generic deploy workflow for `preview` and `prod`; `PIPELINE` and the GitHub
environment are selected from the branch name.

The 2026-06-03 work run adds this public working page after the fact because
several main repository commits reference `J01-64` and the commit section is
only discoverable cleanly through a dedicated step page.

## Follow-up 2026-06-03: Pipeline Variables

The later deployment fix completes the workflow handover of pipeline variables
and filters empty values before further processing. The intended promotion path
therefore remains `dev -> preview -> prod`, without pushing the fix directly
and unreviewed onto production branches.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Branch mapping | `preview` and `prod` trigger the shared deploy workflow | `.github/workflows/deploy.yml`, branches `preview` and `prod` | done |
| Environment selection | GitHub environment and `PIPELINE` are derived from `github.ref_name` | `.github/workflows/deploy.yml` | done |
| Pipeline variables | Required pipeline variables are passed completely; empty values are filtered | Main repository commit `3cbdbae` | done |
| Commit section | `J01-64` commits appear on the public step page | `_data/jira_commits.json`, “Commits” section | done |

## Completion State

`62-3` remains documented as the completed environment activation step. New
go-live follow-up work does not belong to this page, but to the later follow-up
items of `J01-62`.

## Links

- [Parent J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }})
