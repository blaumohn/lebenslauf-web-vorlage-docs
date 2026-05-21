---
layout: page
title: "J01-148 — DeployPhase-Enum und DeployMachine-Skeleton"
permalink: /de/jira/issues/J01-148/
jira_key: J01-148
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schritt 2 der Deploy-Zustandsmaschine: formale Python-Typen für Phasen
und Übergänge, als Grundlage für Schritt 3 (RuleBasedStateMachine).

## Ergebnis

Zwei neue Dateien in `lebenslauf-web-vorlage`:

| Datei | Inhalt |
|---|---|
| `src/cli/py/deploy/machine.py` | `DeployPhase`, `DeployConflictError`, `DeployOps`, `DeployMachine` |
| `tests/py/test_deploy_machine.py` | 7 Unit-Tests gegen `DeployMachine` mit `FakeOps` |

## Design-Entscheidungen

**`DeployPhase` als Enum mit `is_terminal`-Property**
Terminale Phasen (`VERIFIED`, `ROLLED_BACK`, `FAILED_SAFE`,
`MANUAL_INTERVENTION_REQUIRED`) sind in `_TERMINAL_PHASES` gebündelt.
`transition()` bricht bei terminalem Zustand ab — keine doppelten Seiteneffekte.

**`DeployOps` als Protocol**
Klare Grenze zwischen Zustandsmaschine und I/O-Operationen.
Ermöglicht Injektion von `FakeOps` in Tests und später `RuleBasedStateMachine`.

**Fehlerbehandlung in `transition()`**
- `DeployConflictError` → `MANUAL_INTERVENTION_REQUIRED`
- alle anderen Exceptions → `FAILED_SAFE`

**`_verify_or_rollback()` als expliziter Verzweigungspunkt**
Smoke-Ergebnis (`smoke_ok()`) bestimmt, ob `VERIFIED` oder `ROLLED_BACK`
erreicht wird — nicht durch Exception, sondern durch Rückgabewert.

## Invarianten geprüft (durch Tests)

| Invariante | Test |
|---|---|
| `failed_run_keeps_previous_live` | `test_failed_safe_verhindert_switch` |
| `post_switch_smoke_required` | `test_smoke_fehler_fuehrt_zu_rollback` |
| `rollback_preserves_last_good` | `test_rollback_wird_nach_smoke_fehler_aufgerufen` |
| `manual_conflicts_are_reported` | `test_konflikt_fuehrt_zu_manual_intervention` |

## Commit

`feat: DeployPhase-Enum und DeployMachine-Skeleton hinzufuegen (J01-147)`
Branch: `feature/J01-144-deployment-mail-ci-smoke`

## Links

- [J01-147 — Deploy-Contract]({{ "/de/jira/issues/J01-147/" | relative_url }})
- [J01-149 — RuleBasedStateMachine Schritt 3]({{ "/de/jira/issues/J01-149/" | relative_url }})
- [J01-62 — Production: Branch- und Environment-Regeln]({{ "/de/jira/issues/J01-62/" | relative_url }})
