---
layout: page
title: "J01-147 — Deploy Contract: state machine"
permalink: /en/jira/issues/J01-147/
jira_key: J01-147
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical deploy state-machine specification for `lebenslauf-web-vorlage`.
It is the shared language for documentation, tests, and code.

## Result Types

Every deploy run ends in exactly one of these states:

| State | Meaning |
|---|---|
| `deploy_success` | New deploy validated and active |
| `no_change` | Previous deploy remains active because no run was needed |
| `rollback_success` | Smoke failed; last valid deploy was restored |
| `failed_safe` | Run aborted; active deploy stayed untouched |
| `manual_intervention_required` | Incompatible state detected; no write operations |

## Invariants

| Name | Statement |
|---|---|
| `active_slots_never_overwritten` | An active app or vendor slot is never written or deleted |
| `switch_only_to_valid_target` | `.deploy-state.ini` only points to slots with complete sentinels |
| `failed_run_keeps_previous_live` | A failed run does not damage the previous active deploy |
| `partial_target_is_never_valid` | A slot without complete sentinels is not deployable |
| `next_run_can_recover` | A later run can clean up allowed residual states or abort cleanly |
| `manual_conflicts_are_reported` | Incompatible states are reported, not repaired automatically |
| `post_switch_smoke_required` | A deploy is verified only after successful smoke |
| `rollback_preserves_last_good` | The last known good deploy remains rollback-capable |

## Phase Model

```text
STARTED
  └─ STATE_LOADED
       └─ TARGET_SELECTED
            └─ TARGET_PREPARED
                 └─ APP_UPLOADED
                      └─ VENDOR_READY
                           └─ TOKENS_MIGRATED
                                └─ SWITCHED
                                     ├─ VERIFIED          (smoke ok)
                                     └─ ROLLED_BACK       (smoke failed)
  ├─ FAILED_SAFE                     (active slot intact)
  └─ MANUAL_INTERVENTION_REQUIRED    (conflict detected)
```

## Sentinels And Markers

| File | Slot | Meaning |
|---|---|---|
| `app-{x}/.deploy-run` | App | Slot fully written; content is the run ID |
| `vendor-{x}/.meta` | Vendor | Slot fully written; contains Composer checksum |
| `.deploy-state.ini` | Remote root | Active state: app slot, vendor slot, run ID, checksum |
| `.deploy-history.log` | Remote root | Append-only: one entry per terminal state |

An app slot is **complete** when `.deploy-run` exists. A vendor slot is
**complete** when `.meta` exists. If the respective sentinel is missing, the
slot is **incomplete** and must not be switched live.

## Rollback Unit

The rollback target is the `SlotState` loaded from `.deploy-state.ini` at the
start of the run. It is kept in process memory.

Rollback means writing this state back to `.deploy-state.ini`.

**Limit:** there is no cross-process rollback cursor. A second run cannot
restore the first run's previous state after the first run has overwritten
`.deploy-state.ini`.

## Post-Switch Smoke

Smoke is an HTTP GET against `APP_ROOT_URL`; the expected result is HTTP 200.

The smoke runs **inside the deploy run**, after the switch. If it fails,
rollback starts immediately.

The separate `sftp-verify-deploy.py` check (run ID and checksum over SFTP) is a
**CI integrity step** after deploy. It is not part of the smoke in this
contract.
