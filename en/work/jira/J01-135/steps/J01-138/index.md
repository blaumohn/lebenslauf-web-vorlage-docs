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

Success criterion: The planned trigger path is documented and can later be
implemented without a freely parameterized operations endpoint.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| SFTP flag | Pending action is modeled as a file or equivalent runtime artifact | Design or implementation | open |
| HTTP trigger | Trigger reads only prepared actions | Code or runbook | open |
| Locking | Runtime locks remain part of the execution path | Code path / test | open |

## Links

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }})
