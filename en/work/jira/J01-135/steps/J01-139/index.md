---
layout: page
title: "135-5 — Implement CV-token rotation as a runtime-admin action"
permalink: /en/jira/issues/J01-135/steps/J01-139/
jira_key: J01-139
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Goal: Define CV-token generation as a bounded runtime-admin action instead of
leaving it as loose manual work beside CI/CD.

This step is now ordered after the admin scaffold: J01-142 defines the generic
runtime-admin operations scaffold and the first concrete `deploy_switch`;
J01-139 uses those boundaries for the CV-token rotation action.

- Token rotation remains profile-bound.
- The action uses the existing runtime persistence and locking logic.
- Token program paths and CLI orchestration belong here; they are not UI
  changes from `J01-137`.
- The README quick start uses the current setup switch
  `--with-sample-content`.
- New tokens are not written to uncontrolled logs.
- The operations flow is reproducible and checkable.

Success criterion: CV tokens can be generated through a documented admin flow
without bypassing profile validation or runtime protection.

## Follow-up 2026-05-09: State Before Production Preparation

The latest Codex and Claude sessions have advanced the technical core of
J01-139:

- `cv_token_rotation` exists as a fixed runtime-admin task type in app code.
- The handler rotates tokens through `TokenRotationService`, uses existing
  profile validation, and writes through `TokenService` under runtime lock.
- The result uses the mail return channel from J01-140.
- A feature test covers: place task file, run `/admin/run`, read the token from
  mail output, and use it to access private CV content.
- Pipeline config was moved to grouped structure and `--overrides`; GitHub
  workflows pass SFTP/SMTP secrets as YAML heredoc to `bin/cd`.

The actual preview operations command for token admin remains open:

- local trusted execution instead of a general GitHub workflow
- credentials from a local file with restrictive permissions
- SFTP step to place the task file under `var/admin/tasks/`
- HTTP GET against `/admin/run`
- E2E proof against preview, including mail return channel

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Profile binding | Rotation is possible only for existing CV profiles | `TokenRotationService`, feature test | implemented |
| Program paths | CLI/handler separate token mechanics from profile availability | `TokenCommand`, `CvTokenRotationTaskHandler` | partly implemented |
| Quick start | README uses the valid sample-content switch | `README.md`, `README.en.md` | done |
| Runtime protection | Existing locks and atomic writes remain effective | `TokenService`, `RuntimeLockRunner`, feature test | implemented |
| Operability | Admin action is reproducibly triggerable | local preview admin command | open |
| Preview E2E | Preview generates tokens, reports them by mail, and allows private CV access | manual preview test | open |

## Links

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }})
