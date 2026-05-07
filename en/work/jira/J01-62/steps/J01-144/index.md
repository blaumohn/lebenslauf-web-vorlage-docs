---
layout: page
title: "62-1 — Enable mail in deployment"
permalink: /en/jira/issues/J01-62/steps/J01-144/
jira_key: J01-144
jira_parent_key: J01-62
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Goal

Enable mail in deployment so preview and later production can use SMTP through
pipeline config and environment values.

Parent: [J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }}).

## Current State

The first PR prepares the CI path:

- static CI infrastructure values for SMTP and SFTP live in
  `docker-compose.ci.yml`
- the local SFTP smoke uses a fixed CI test host key and a fixed
  `SSH_KNOWN_HOST_LINE`
- the SMTP smoke reads runtime config through `pipeline_config runtime`
- the SMTP smoke checks Mailpit directly with auth and TLS, without coupling
  to `src/Http`

The real preview proof with Mailtrap remains open and may trigger further
corrections to environment or workflow values.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| CI smoke | `composer run ci:preview` passes with SFTP, HTTP, SMTP, and contact smokes | app repo, PR for `J01-144` | done |
| SMTP auth | wrong SMTP password is rejected in CI smoke, correct password sends test mail | `tests/ci/smtp-smoke.py` | done |
| SFTP host key | preview CI no longer needs dynamic `ssh-keyscan` | `docker-compose.ci.yml`, `bin/ci` | done |
| Preview Mailtrap | preview deployment sends through Mailtrap with real environment values | pending manual preview test | open |
| Follow-up fix | deviations from the Mailtrap test are fixed in this step or a follow-up PR | PR / evidence note | open |

## Links

- [Parent J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }})
