---
layout: page
title: "J01-148 — DeployPhase enum and DeployMachine skeleton"
permalink: /en/jira/issues/J01-148/
jira_key: J01-148
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Step 2 of the deploy state machine: formal Python types for phases and
transitions, as the basis for step 3 (`RuleBasedStateMachine`).

## Result

Two new files in `lebenslauf-web-vorlage`:

| File | Content |
|---|---|
| `src/cli/py/deploy/machine.py` | `DeployPhase`, `DeployConflictError`, `DeployOps`, `DeployMachine` |
| `tests/py/test_deploy_machine.py` | 7 unit tests for `DeployMachine` with `FakeOps` |

## Design Decisions

**`DeployPhase` as enum with `is_terminal` property**
Terminal phases (`VERIFIED`, `ROLLED_BACK`, `FAILED_SAFE`,
`MANUAL_INTERVENTION_REQUIRED`) are grouped in `_TERMINAL_PHASES`.
`transition()` stops on terminal states, preventing duplicate side effects.

**`DeployOps` as protocol**
Clear boundary between state machine and I/O operations. This allows injecting
`FakeOps` in tests and later `RuleBasedStateMachine`.

**Error handling in `transition()`**

- `DeployConflictError` -> `MANUAL_INTERVENTION_REQUIRED`
- all other exceptions -> `FAILED_SAFE`

**`_verify_or_rollback()` as explicit branch point**
The smoke result (`smoke_ok()`) decides whether `VERIFIED` or `ROLLED_BACK` is
reached. This uses a return value, not an exception.

## Invariants Covered By Tests

| Invariant | Test |
|---|---|
| `failed_run_keeps_previous_live` | `test_failed_safe_verhindert_switch` |
| `post_switch_smoke_required` | `test_smoke_fehler_fuehrt_zu_rollback` |
| `rollback_preserves_last_good` | `test_rollback_wird_nach_smoke_fehler_aufgerufen` |
| `manual_conflicts_are_reported` | `test_konflikt_fuehrt_zu_manual_intervention` |

## Commit

`feat: DeployPhase-Enum und DeployMachine-Skeleton hinzufuegen (J01-147)`
Branch: `feature/J01-144-deployment-mail-ci-smoke`

## Links

- [J01-147 — Deploy Contract]({{ "/en/jira/issues/J01-147/" | relative_url }})
- [J01-149 — RuleBasedStateMachine step 3]({{ "/en/jira/issues/J01-149/" | relative_url }})
- [J01-62 — Production: branch and environment rules]({{ "/en/jira/issues/J01-62/" | relative_url }})
