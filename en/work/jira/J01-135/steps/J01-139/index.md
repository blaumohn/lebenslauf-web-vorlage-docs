---
layout: page
title: "135-2 — Implement CV-token rotation as a runtime-admin action"
permalink: /en/jira/issues/J01-135/steps/J01-139/
jira_key: J01-139
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Goal: Define CV-token generation as a bounded runtime-admin action instead of
leaving it as loose manual work beside CI/CD.

- Token rotation remains profile-bound.
- The action uses the existing runtime persistence and locking logic.
- Token program paths and CLI orchestration belong here; they are not UI
  changes from `J01-137`.
- New tokens are not written to uncontrolled logs.
- The operations flow is reproducible and checkable.

Success criterion: CV tokens can be generated through a documented admin flow
without bypassing profile validation or runtime protection.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Profile binding | Rotation is possible only for existing CV profiles | Test or code path | open |
| Program paths | CLI/handler separate token mechanics from profile availability | `src/cli/php/Token/TokenRotateHandler.php` | open |
| Runtime protection | Existing locks and atomic writes remain effective | Test or code path | open |
| Operability | Admin action is reproducibly triggerable | Runbook or CI/CD evidence | open |

## Links

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }})
