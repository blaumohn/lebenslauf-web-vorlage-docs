---
layout: page
title: "J01-65 — Production: Artefakt- und Smoke-Checks definieren"
permalink: /en/jira/issues/J01-65/
jira_key: J01-65

---
<!-- generated:jira:subtasks_cksum=3442621153 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Links

-

## Description

Goal: define binding checks for production deployments.

- Define the artifact list.
- Define the post-deploy smoke.

## Current State

Go-live has been achieved, but there is no reliable issue-specific completion
evidence for `J01-65`. Post-deploy smokes and rollback behavior exist
technically in the main repository; the formal artifact list and issue close
remain open.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Post-deploy smoke | Target system is checked through HTTP after deployment | `scripts/pipeline_lib.sh`, `scripts/sftp-deploy.py` | technically present |
| Smoke rollback | Smoke failures trigger the safe fallback | `tests/py/test_deploy_machine.py`, `tests/py/test_sftp_recovery_matrix.py` | technically present |
| Artifact list | Binding production artifact list is documented | `J01-65` | open |
| Jira close | Issue closes only with complete evidence | Jira | open |

## Source Review

The original goal remains valid. It is no longer a go-live blocker; technical
smoke evidence exists while the formal issue close remains open.

## Subtasks

- **65-1 Artefaktliste festlegen** — To Do
- **65-2 Post-Deploy-Smoke definieren** — To Do
