---
layout: page
title: "135-5 — Define the zero-downtime deploy switch as an admin operation"
permalink: /en/jira/issues/J01-135/steps/J01-142/
jira_key: J01-142
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Goal: Plan the deploy switch point so normal SFTP deploys only prepare a
running site and the visible switch later happens as a local, locked, atomic
PHP admin operation.

- `deploy_fresh` remains the administrative rebuild path without a protected
  active runtime state.
- `deploy_swap` uploads the app and vendor slots, migrates tokens, and writes
  a uniquely named prepared-state file.
- During `deploy_swap`, SFTP does not write runtime files:
  `.htaccess`, `index.php`, and `.deploy-state.ini` remain untouched.
- The admin task references the prepared file unambiguously.
- The later PHP operation switches visibly under a lock through temporary files
  and `rename()` on `.deploy-state.ini`.

Success criterion: The boundary between SFTP preparation and PHP runtime
switching is described so every intermediate state remains runnable and the
visible switch depends on exactly one atomic file operation.

## Planned Boundary

```text
deploy_fresh:
  Rebuild. No active runtime state must be protected.

deploy_swap:
  Running site remains active. SFTP only prepares; PHP switches atomically.
```

The normal CI/CD path decides automatically from the active deploy state
whether `deploy_fresh` or `deploy_swap` applies. The admin workflow can still
force `deploy_fresh` when the server state is deliberately rebuilt.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Fresh boundary | `deploy_fresh` is described as an administrative rebuild without a zero-downtime swap | Design or implementation | open |
| Swap preparation | `deploy_swap` writes only slots, tokens, prepared state, and admin task | Design or implementation | open |
| Prepared state | Prepared files have unique names and are referenced by admin tasks | Code or spec | open |
| Atomic PHP operation | PHP sets the visible switch point with a lock and `rename()` on `.deploy-state.ini` | Code path / test | open |
| Runtime safety | Old state remains functional until the state switch; new state remains functional afterwards | Review / test | open |
| Remote link | Jira points to the public working note | Jira remote link | done |

## Links

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }})
