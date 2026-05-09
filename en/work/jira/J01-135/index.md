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
- Work has started; J01-138 and J01-142 are complete as one connected
  trigger/switch foundation.
- J01-140 is done: the mail return channel now uses the generalized
  `MailService`, `MailMessage` carries module/title/body, and `MAIL_TO_EMAIL`
  is the central recipient from pipeline config.
- J01-144 prepares the preview mail path in the CI smoke; the real Mailtrap
  proof with preview environment values remains open before production.
- J01-139 has technically reached CV-token rotation within the runtime-admin
  scaffold: `cv_token_rotation` runs through a task file, `/admin/run`,
  runtime locks, and the mail return channel. The generic local preview admin
  command is still open: `php bin/cli python ...` receives the admin operation
  plus arguments, appends the admin-operation list by SFTP, and triggers the
  waiting operations by HTTP GET.
- J01-141 remains the open hardening point: fixed action list, parameter
  boundaries, access protection, and error/audit paths must be checkable before
  production.
- The architecture follow-up in `tagebuch` has been split into five
  verifiable subtasks:
  - [J01-138]({{ "/en/jira/issues/J01-135/steps/J01-138/" | relative_url }})
    — model runtime-admin triggering through an SFTP flag and HTTP trigger
  - [J01-142]({{ "/en/jira/issues/J01-135/steps/J01-142/" | relative_url }})
    — define the runtime-admin operations scaffold and zero-downtime deploy switch
  - [J01-140]({{ "/en/jira/issues/J01-135/steps/J01-140/" | relative_url }})
    — define the mail return channel for runtime-admin results
  - [J01-141]({{ "/en/jira/issues/J01-135/steps/J01-141/" | relative_url }})
    — bound the admin action list and access protection
  - [J01-139]({{ "/en/jira/issues/J01-135/steps/J01-139/" | relative_url }})
    — implement CV-token rotation as a runtime-admin action

## Content Key

- [Goal](#goal)
- [Current State](#current-state)
- [Subtasks](#subtasks)
- [Verification Plan](#verification-plan)
- [Target State or Open Points](#target-state-or-open-points)
- [Links](#links)
- Public steps:
  [J01-138]({{ "/en/jira/issues/J01-135/steps/J01-138/" | relative_url }}),
  [J01-142]({{ "/en/jira/issues/J01-135/steps/J01-142/" | relative_url }}),
  [J01-140]({{ "/en/jira/issues/J01-135/steps/J01-140/" | relative_url }}),
  [J01-141]({{ "/en/jira/issues/J01-135/steps/J01-141/" | relative_url }}),
  [J01-139]({{ "/en/jira/issues/J01-135/steps/J01-139/" | relative_url }})

## Subtasks

| Issue | Work package | Status |
| --- | --- | --- |
| [J01-138]({{ "/en/jira/issues/J01-135/steps/J01-138/" | relative_url }}) | Runtime-admin triggering through an SFTP flag and HTTP trigger | done |
| [J01-142]({{ "/en/jira/issues/J01-135/steps/J01-142/" | relative_url }}) | Runtime-admin operations scaffold and zero-downtime deploy switch | done |
| [J01-140]({{ "/en/jira/issues/J01-135/steps/J01-140/" | relative_url }}) | Mail return channel for admin results | done |
| [J01-141]({{ "/en/jira/issues/J01-135/steps/J01-141/" | relative_url }}) | Fixed admin action list and access protection | open |
| [J01-139]({{ "/en/jira/issues/J01-135/steps/J01-139/" | relative_url }}) | CV-token rotation as a runtime-admin action | in progress |

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Triggering | Waiting admin operations are detected through a bounded trigger path | [J01-138]({{ "/en/jira/issues/J01-135/steps/J01-138/" | relative_url }}) and [J01-142]({{ "/en/jira/issues/J01-135/steps/J01-142/" | relative_url }}) | done |
| Admin scaffold | Runtime-admin operations have a task file, handler interface, runner, and runtime context | [J01-142]({{ "/en/jira/issues/J01-135/steps/J01-142/" | relative_url }}) | done |
| Return channel | Admin results are reported through a controlled channel | [J01-140]({{ "/en/jira/issues/J01-135/steps/J01-140/" | relative_url }}) | done |
| Boundaries | The admin trigger runs only fixed, checkable actions | [J01-141]({{ "/en/jira/issues/J01-135/steps/J01-141/" | relative_url }}) | open |
| CV-token generation | Token rotation runs as a runtime-admin task and can be triggered reproducibly locally | [J01-139]({{ "/en/jira/issues/J01-135/steps/J01-139/" | relative_url }}) | partly implemented |
| Preview mail | Preview sends with real SMTP/Mailtrap values and without stdout fallback | [J01-144]({{ "/en/jira/issues/J01-62/steps/J01-144/" | relative_url }}) | open |
| Sprint assignment | Issue is in `SCRUM Sprint 4` with `sprint-goal` | Jira sprint board | done |

## Target State or Open Points

The last preparation before production consists of four concrete points:

- Run preview mail with real Mailtrap/environment values and track deviations
  in `J01-144`.
- Add the generic local admin command: `php bin/cli python ...` receives the
  operation plus arguments, SFTP writes the admin-operation list, then an
  HTTP GET triggers `/admin/run`.
- Finish `J01-141`: name allowed admin actions, validate parameters, and check
  access protection/auditability.
- Stabilize preview-CI config for mail in
  [J01-144]({{ "/en/jira/issues/J01-62/steps/J01-144/" | relative_url }}).

## Links

- [SCRUM Sprint 4]({{ "/en/work/sprints/scrum-sprint-4/" | relative_url }})
- [J01-5]({{ "/en/jira/issues/J01-5/" | relative_url }})
