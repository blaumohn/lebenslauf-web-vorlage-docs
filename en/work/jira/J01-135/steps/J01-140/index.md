---
layout: page
title: "135-3 — Define the mail return channel for runtime-admin results"
permalink: /en/jira/issues/J01-135/steps/J01-140/
jira_key: J01-140
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Goal: Define a controlled return channel for runtime-admin results so
sensitive results such as new CV tokens do not appear only on stdout or in
uncontrolled logs.

- `mail_stdout` remains possible as a dev helper.
- Preview and production-like flows should use SMTP.
- Result return and error output are treated separately.
- Log leaks remain an explicit checkpoint.

Success criterion: Runtime-admin results have a documented return channel that
does not rely on uncontrolled console output for preview/production.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| SMTP path | Preview/production use a mail return channel | Configuration or test | open |
| Dev path | `mail_stdout` remains clearly bounded as a dev helper | Runbook or config docs | open |
| Log protection | Sensitive results do not appear in uncontrolled logs | Test or review | open |

## Links

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }})
