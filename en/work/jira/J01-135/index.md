---
layout: page
title: "J01-135 — CI/CD tools: CV-token generation and runtime-admin operations"
permalink: /en/jira/issues/J01-135/
jira_key: J01-135
jira_parent_key: J01-5

---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public working note for the Sprint 4 goal line covering
CI/CD/runtime-admin operations.

## Goal

- Define CV-token generation as a reproducible CI/CD or operations workflow.
- Describe runtime-admin work so it does not remain private manual work beside
  the pipeline.
- Connect the workflow to the existing quality and deployment boundaries.

## Current State

- The issue was created for `SCRUM Sprint 4` and classified as `sprint-goal`.
- Work has started; implementation and evidence are still open.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| CV-token generation | Workflow is reproducible and documented | CI/CD or runbook evidence | open |
| Runtime-admin operations | Admin steps are bounded and checkable | Operations docs or script path | open |
| Sprint assignment | Issue is in `SCRUM Sprint 4` with `sprint-goal` | Jira sprint board | done |

## Target State or Open Points

- It remains open whether token generation runs directly in CI/CD or stays a
  controlled admin operation with clear checkpoints.

## Links

- [SCRUM Sprint 4]({{ "/en/work/sprints/scrum-sprint-4/" | relative_url }})
- [J01-5]({{ "/en/jira/issues/J01-5/" | relative_url }})
