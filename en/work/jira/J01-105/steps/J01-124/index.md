---
layout: page
title: "105-4: Prove test runs, J01-9 unblocking, and the closing picture"
jira_key: J01-124
jira_parent_key: J01-105
permalink: /en/jira/issues/J01-105/steps/J01-124/
---

**Status:** 2026-04-03

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Step-specific public work status for
[105-4]({{ "/en/jira/issues/J01-105/steps/J01-124/" | relative_url }}) under
[J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }}).
This page groups the closing evidence so unblocking `J01-9` can be checked,
not merely claimed.

## Goal

- The relevant test runs for the app repo and the lib are collected visibly.
- The local integration test against the local lib checkout is traceable.
- `J01-9` is unblocked only when `J01-105` is proven complete in both domain
  and technical terms.

## Report

- `J01-105` is visible in the active sprint as `sprint-support` because it
  blocks `J01-9`.
- Closing this issue depends on consistent evidence across multiple repos, not
  on one isolated file change.
- This step therefore records the closing criteria and the evidence location
  separately.

## Current status

- Jira subtask `J01-124` exists.
- The verification and unblocking logic is separated as its own public step.
- Concrete test runs and the final Jira transition are still open.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| App tests green | Target model runs reproducibly in the main repo | app repo, test run | open |
| Lib tests green | Expander and validation are covered against the target model | lib repo, test run | open |
| Integration test traceable | Main repo tests against the local lib checkout | `set-config-spec-repo`, work note | open |
| J01-9 unblocked | Jira shows no remaining blocker via `J01-105` | Jira | open |

## Open points

- Freeze the minimum test set required for closure.
- Check whether follow-up references to `J01-37` or `J01-31` must be carried
  into the final closing picture.

## Links

- [105-4 in the Jira mirror]({{ "/en/jira/issues/J01-105/steps/J01-124/" | relative_url }})
- [J01-105 in the Jira mirror]({{ "/en/jira/issues/J01-105/" | relative_url }})
- [J01-9: Preview — reactivate workflow]({{ "/en/jira/issues/J01-9/" | relative_url }})
