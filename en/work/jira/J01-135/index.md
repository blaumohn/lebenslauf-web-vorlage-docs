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
- Work has started.
- The architecture follow-up in `tagebuch` has been split into four
  verifiable subtasks:
  - [J01-138]({{ "/en/jira/issues/J01-135/steps/J01-138/" | relative_url }})
    — model runtime-admin triggering through an SFTP flag and HTTP trigger
  - [J01-139]({{ "/en/jira/issues/J01-135/steps/J01-139/" | relative_url }})
    — implement CV-token rotation as a runtime-admin action
  - [J01-140]({{ "/en/jira/issues/J01-135/steps/J01-140/" | relative_url }})
    — define the mail return channel for runtime-admin results
  - [J01-141]({{ "/en/jira/issues/J01-135/steps/J01-141/" | relative_url }})
    — bound the admin action list and access protection

## Content Key

- [Goal](#goal)
- [Current State](#current-state)
- [Subtasks](#subtasks)
- [Verification Plan](#verification-plan)
- [Target State or Open Points](#target-state-or-open-points)
- [Links](#links)
- Public steps:
  [J01-138]({{ "/en/jira/issues/J01-135/steps/J01-138/" | relative_url }}),
  [J01-139]({{ "/en/jira/issues/J01-135/steps/J01-139/" | relative_url }}),
  [J01-140]({{ "/en/jira/issues/J01-135/steps/J01-140/" | relative_url }}),
  [J01-141]({{ "/en/jira/issues/J01-135/steps/J01-141/" | relative_url }})

## Subtasks

| Issue | Work package | Status |
| --- | --- | --- |
| [J01-138]({{ "/en/jira/issues/J01-135/steps/J01-138/" | relative_url }}) | Runtime-admin triggering through an SFTP flag and HTTP trigger | open |
| [J01-139]({{ "/en/jira/issues/J01-135/steps/J01-139/" | relative_url }}) | CV-token rotation as a runtime-admin action | open |
| [J01-140]({{ "/en/jira/issues/J01-135/steps/J01-140/" | relative_url }}) | Mail return channel for admin results | open |
| [J01-141]({{ "/en/jira/issues/J01-135/steps/J01-141/" | relative_url }}) | Fixed admin action list and access protection | open |

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Triggering | Waiting admin operations are detected through a bounded trigger path | [J01-138]({{ "/en/jira/issues/J01-135/steps/J01-138/" | relative_url }}) | open |
| CV-token generation | Workflow is reproducible, profile-bound, and documented | [J01-139]({{ "/en/jira/issues/J01-135/steps/J01-139/" | relative_url }}) | open |
| Return channel | Admin results are reported through a controlled channel | [J01-140]({{ "/en/jira/issues/J01-135/steps/J01-140/" | relative_url }}) | open |
| Boundaries | The admin trigger runs only fixed, checkable actions | [J01-141]({{ "/en/jira/issues/J01-135/steps/J01-141/" | relative_url }}) | open |
| Sprint assignment | Issue is in `SCRUM Sprint 4` with `sprint-goal` | Jira sprint board | done |

## Target State or Open Points

- It remains open whether token generation runs directly in CI/CD or stays a
  controlled admin operation with clear checkpoints.

## Links

- [SCRUM Sprint 4]({{ "/en/work/sprints/scrum-sprint-4/" | relative_url }})
- [J01-5]({{ "/en/jira/issues/J01-5/" | relative_url }})
