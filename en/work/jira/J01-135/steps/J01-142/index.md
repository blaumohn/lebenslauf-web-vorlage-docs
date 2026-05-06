---
layout: page
title: "135-2 — Define the runtime-admin operations scaffold and zero-downtime deploy switch"
permalink: /en/jira/issues/J01-135/steps/J01-142/
jira_key: J01-142
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Goal: Define the generic runtime-admin operations scaffold and run the
zero-downtime deploy switch as its first concrete admin task.

J01-142 delivers two results:

- A generic runtime-admin operations scaffold with task files, handler
  interface, runner/dispatch, and runtime context.
- The concrete `deploy_switch` admin task that makes the prepared deploy state
  visible locally, under a lock, and atomically.

- `deploy_fresh` remains the administrative rebuild path without a protected
  active runtime state.
- `deploy_swap` uploads the app and vendor slots, migrates tokens, and writes
  a uniquely named prepared-state file.
- During `deploy_swap`, SFTP does not write runtime files:
  `.htaccess`, `index.php`, and `.deploy-state.ini` remain untouched.
- The admin task references the prepared file unambiguously.
- The later PHP operation switches visibly under a lock through temporary files
  and `rename()` on `.deploy-state.ini`.

Success criterion: The admin scaffold is separated from the concrete
`deploy_switch`, and the boundary between SFTP preparation and PHP runtime
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

## Update 2026-05-06: App-Repo Implementation

The boundary is now present in the app code. The admin scaffold picks up
pending tasks from the runtime area and dispatches them to concrete handlers.
`deploy_swap` prepares the next target state without replacing the visible
runtime file directly:

- `scripts/sftp-deploy.py` uploads the new app/vendor slot and migrates tokens
  from the active tree.
- `PreparedDeployStore` writes a prepared INI file under
  `var/admin/deploy-prepared/`.
- `AdminTaskStore` creates a `deploy_switch` task under `var/admin/tasks/` and
  references that prepared file.
- `AdminTaskRunner` reads pending tasks server-side and passes them to the
  matching handler.
- `DeploySwitchTaskHandler` loads `PreparedDeployState` and calls
  `DeploySwitcher`.
- `DeploySwitcher` writes `.deploy-state.ini` through `RuntimeAtomicWriter`
  under `RuntimeLockRunner`.

Evidence in the app repo:

- `src/Http/Admin/AdminTaskRunner.php`
- `src/Http/Admin/Deploy/DeploySwitchTaskHandler.php`
- `src/Http/Admin/Deploy/DeploySwitcher.php`
- `src/Http/Admin/Deploy/PreparedDeployState.php`
- `scripts/sftp_deploy_prepared.py`
- `tests/php/AdminDeployTest.php`
- `tests/py/test_sftp_deploy_prepared.py`

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Admin scaffold | Task file, handler interface, runner/dispatch, and runtime context are separated from the concrete deploy handler | `AdminTaskStore`, `AdminTaskRunner`, `DeploySwitchTaskHandler` | done |
| Fresh boundary | `deploy_fresh` is described as an administrative rebuild without a zero-downtime swap | `scripts/sftp-deploy.py` | done |
| Swap preparation | `deploy_swap` writes only slots, tokens, prepared state, and admin task | `scripts/sftp-deploy.py`, `scripts/sftp_deploy_prepared.py` | done |
| Prepared state | Prepared files have unique names and are referenced by admin tasks | `PreparedDeployStore`, `AdminTaskStore`, `PreparedDeployState` | done |
| Atomic PHP operation | PHP sets the visible switch point with a lock and `rename()` on `.deploy-state.ini` | `DeploySwitcher`, `RuntimeAtomicWriter`, `RuntimeLockRunner`, `AdminDeployTest` | done |
| Runtime safety | Old state remains functional until the state switch; new state remains functional afterwards | SFTP does not write runtime state during `deploy_swap`; the switch happens only in the admin task | done |
| Remote link | Jira points to the public working note | Jira remote link | done |

## Links

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }})
