---
layout: page
title: "J01-149 - RuleBasedStateMachine for DeployMachine"
permalink: /en/jira/issues/J01-149/
jira_key: J01-149
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Step 3 of the deploy state machine: property-based stateful tests with
Hypothesis `RuleBasedStateMachine` as complexity control for all further
deploy steps.

## Result

New file `tests/py/test_deploy_machine_stateful.py` with
`DeployMachineStateMachine(RuleBasedStateMachine)`.

The stateful tests were sharpened: Hypothesis now generates failure points
across all deploy steps from `load_state` to `switch`. There is also a
deterministic matrix for runtime errors and `DeployConflictError` per step.

The deploy strategy was moved into the machine as well: `DeployMachine`
now decides `DeploymentPlan.fresh()` or `DeploymentPlan.swap(...)`, the
conflict case for missing state with occupied app slots, and vendor reuse.

After the state-machine work, the SFTP deploy implementation was split into
domain modules. The old mixed module `sftp_deploy_state.py` was replaced by
`slots.py`, `slot_store.py`, `tree_uploader.py`, `token_migrator.py`,
`slot_switch.py`, and `sftp_deploy_ops.py`. `scripts/sftp-deploy.py` now
remains the runner and component wiring, no longer the carrier of slot,
upload, token, and dispatch details.

New dependency `hypothesis>=6.0,<7` in `requirements.txt`
(installation via `composer setup`).

## Design Decisions

**`RuleBasedStateMachine` instead of simple property tests**
Hypothesis generates sequences of `@rule` calls and checks the `@invariant`s
after each sequence. This systematically tests composed workflows, not only
single runs.

**`ControllableOps` as injected fake**
Same injection boundary as in `test_deploy_machine.py`, but with controllable
`state`, `both_slots`, `include_vendor`, `fail_at`, and `smoke` flag. This
lets Hypothesis test not only failure points, but also domain plan variants.

**`DeploymentPlan` in the machine**
`SftpDeployOps` reads state and performs I/O. The machine decides whether a
fresh deploy or swap deploy runs and whether the vendor slot has to change.
The domain if-then rules therefore live in the workflow model.

**Generated rules instead of four example scenarios**
The `run_generated` rule varies failure point, failure kind, and smoke
result. The machine therefore checks generic deploy phase guarantees instead
of only example paths.

**Separation of workflow and side effects**
The machine tests check only order, terminal states, and call contracts. SFTP
tests remain responsible for concrete side effects: state file, sentinels,
slot cleanup, dispatch, and rollback writes.

**SlotMap and SlotStore separated**
`SlotMap` describes only the currently published app and vendor slots with
label and directory name. `SlotStore` encapsulates the persisted SFTP files,
including `.htaccess`, `.deploy-run`, metadata, and vendor checksum. The
previous duplicate vendor-checksum logic is consolidated in
`SlotStore.vendor_checksum_for_slot(...)`.

**Deploy operations as adapter**
`SftpDeployOps` is the I/O boundary of the machine. Upload, token migration,
slot switching, and slot persistence live in their own classes; the machine
sees only domain operations such as loading state, deploying a plan,
switching, checking, and rolling back.

## Checked Invariants

- Every run ends in the expected terminal state:
  `endet_in_erwartetem_terminalzustand`.
- History follows the deploy phase order:
  `history_folgt_phasenordnung`.
- No further ops run after a terminal state:
  `calls_stoppen_nach_erster_terminalphase`.
- `switch` runs only after all pre-phases:
  `switch_nur_nach_vorphasen`.
- `smoke_ok` runs only after a successful switch:
  `smoke_nur_nach_erfolgreichem_switch`.
- `rollback` runs only after a failed smoke:
  `rollback_nur_nach_smoke_fehler`.
- The generated `DeploymentPlan` matches state and vendor decision:
  `plan_passt_zu_state_und_vendor`.

## Verification Plan

- Machine tests:
  Existing cases remain green; evidence is `.venv/bin/pytest` for the
  machine tests. Status: done.
- SFTP side effects:
  Integration remains green; evidence is `.venv/bin/pytest` for the
  SFTP deploy tests. Status: done.
- Style for changed Python files:
  Ruff and line length fit; Pylint was checked specifically for the machine
  and stateful test files. Status: done.
- SFTP deploy module separation:
  `.venv/bin/python -m pytest tests/py` runs green with `177 passed`.
  Ruff was checked for the changed deploy and test files. Status: done.

## Dependency

Requires J01-148 (`DeployMachine` skeleton).

## Links

- J01-147 - Deploy contract:
  {{ "/en/jira/issues/J01-147/" | relative_url }}
- J01-148 - DeployMachine skeleton:
  {{ "/en/jira/issues/J01-148/" | relative_url }}
- J01-62 - Production: branch and environment rules:
  {{ "/en/jira/issues/J01-62/" | relative_url }}
