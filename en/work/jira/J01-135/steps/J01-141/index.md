---
layout: page
title: "135-4 — Bound the admin action list and access protection"
permalink: /en/jira/issues/J01-135/steps/J01-141/
jira_key: J01-141
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Goal: Bound the admin trigger so it does not become a freely parameterized
command interface.

- Only fixed admin actions are allowed.
- Parameters are limited and validated per action.
- Existing HTTP security remains part of the protection model.
- Error paths and auditability are documented.

Success criterion: The runtime-admin trigger can execute only defined,
checkable actions and does not unnecessarily expand the attack surface.

## Open Hardening Boundary Before Production

The current app state already has fixed handlers for `deploy_switch` and
`cv_token_rotation`; production preparation still needs explicit hardening of
this boundary:

- document allowed task types publicly and check them deliberately in code
- bound parameters per task, especially profile name and token count for
  `cv_token_rotation`
- report error cases without leaking tokens or secrets into logs
- check access protection of the `/admin/run` endpoint against the existing
  HTTP-security model
- make successful and failed runs auditable

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Action list | Allowed admin actions are explicitly named | `deploy_switch`, `cv_token_rotation`, docs/code review | partly implemented |
| Parameter boundaries | Every action validates its inputs | Test or code path | open |
| Access protection | Trigger remains attached to the existing protection model | Review / test | open |
| Auditability | Success and failure are traceable without exposing secrets | Runbook / test | open |

## Links

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }})
