---
layout: page
title: "135-1 — Model runtime-admin triggering through an SFTP flag and HTTP trigger"
permalink: /en/jira/issues/J01-135/steps/J01-138/
jira_key: J01-138
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Goal: Model the runtime-admin trigger path so CI/CD can leave a pending action
through SFTP and the shared-hosting runtime executes only prepared actions
through an HTTP trigger.

- The admin flag lives in the controlled runtime area under `var/`.
- The HTTP trigger checks pending actions instead of accepting free commands.
- The flow remains compatible with the existing runtime locks.
- Error cases and idle runs must be clearly distinguishable.

Success criterion: The planned trigger path is documented and implemented
without a freely parameterized operations endpoint.

## Closure Note 2026-05-06

The trigger path was not completed as a separate implementation stream. It was
completed in practice through
[J01-142]({{ "/en/jira/issues/J01-135/steps/J01-142/" | relative_url }}):

- SFTP leaves prepared admin artifacts under `var/admin/`.
- The HTTP trigger `/admin/run` reads pending tasks.
- The trigger accepts no free commands and dispatches only known task types to
  fixed handlers.
- The concrete `deploy_switch` runs under the runtime lock and writes the
  visible state atomically.

J01-138 is therefore complete in substance. The concrete technical shape and
the evidence remain in J01-142 so the work state is not duplicated.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| SFTP flag | Pending action is modeled as a file or equivalent runtime artifact | `AdminTaskStore`, `var/admin/tasks/`, J01-142 | done |
| HTTP trigger | Trigger reads only prepared actions | `/admin/run`, `AdminTaskRunner`, J01-142 | done |
| Locking | Runtime locks remain part of the execution path | `DeploySwitcher`, `RuntimeLockRunner`, J01-142 | done |

## Links

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }})
- [J01-142]({{ "/en/jira/issues/J01-135/steps/J01-142/" | relative_url }})
