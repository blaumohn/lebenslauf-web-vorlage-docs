---
layout: page
title: "62-9 — Publish path and ongoing content changes"
permalink: /en/jira/issues/J01-62/steps/J01-153/
jira_key: J01-153
jira_parent_key: J01-62
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Goal

Publish CV content changes through a clear publish path without requiring a
full deployment for every content update.

## Completion State

Functionally implemented; Jira update remains open.

The publish command builds CV HTML, uploads it to a staging path, submits the
bounded `cv_publish` task, writes files atomically, and then checks the public
URL through HTTP smoke.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Upload and task | Publish uploads HTML and submits `cv_publish` | Commits `33768cf`, `5ad711f` | done |
| Atomic writes | Published HTML files are replaced atomically | Commit `5ad711f`, PHP feature tests | done |
| Tests | Publish path and failures are covered | Commit `97a3cdb` | done |
| Configuration | Publish uses `PIPELINE_CFG_JSON` correctly | Commit `7341f10` | done |
| Jira status | Jira shows the functional completion | `J01-153` | open |

## Links

- [Parent J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }})
