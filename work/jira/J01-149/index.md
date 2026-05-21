---
layout: page
title: "J01-149 — RuleBasedStateMachine für DeployMachine"
permalink: /de/jira/issues/J01-149/
jira_key: J01-149
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schritt 3 der Deploy-Zustandsmaschine: property-based Stateful-Tests mit
Hypothesis `RuleBasedStateMachine` als Komplexitätskontrolle für alle
weiteren Deploy-Schritte.

## Ergebnis

Neue Datei `tests/py/test_deploy_machine_stateful.py` mit
`DeployMachineStateMachine(RuleBasedStateMachine)`.

Neue Abhängigkeit `hypothesis>=6.0,<7` in `requirements.txt`
(Installation via `composer setup`).

## Design-Entscheidungen

**`RuleBasedStateMachine` statt einfacher Property-Tests**
Hypothesis generiert Sequenzen von `@rule`-Aufrufen und prüft nach jeder
Sequenz die `@invariant`s. Damit können zusammengesetzte Abläufe
(mehrere Läufe hintereinander) systematisch getestet werden — nicht nur
Einzelläufe.

**`ControllableOps` als injizierter Fake**
Gleiche Injektionsgrenze wie in `test_deploy_machine.py`, aber mit
steuerbarem `fail_at` und `smoke`-Flag. Kein Zustand außerhalb der
Maschine nötig.

**4 Regeln, 4 Invarianten**
Regeln decken die vier Ergebnistypen ab (happy, upload-fehler,
smoke-fehler, konflikt). Invarianten prüfen die zentralen
Vertragseigenschaften aus J01-147.

## Geprüfte Invarianten

| Invariante (Contract) | `@invariant` |
|---|---|
| Jeder Lauf endet terminal | `endet_in_terminalem_zustand` |
| `failed_run_keeps_previous_live` | `switch_nur_wenn_vorphasen_ok` |
| `rollback_preserves_last_good` | `rollback_nur_nach_smoke_fehler` |
| History beginnt mit STARTED | `history_beginnt_mit_started` |

## Abhängigkeit

Setzt J01-148 (`DeployMachine`-Skeleton) voraus.

## Links

- [J01-147 — Deploy-Contract]({{ "/de/jira/issues/J01-147/" | relative_url }})
- [J01-148 — DeployMachine-Skeleton]({{ "/de/jira/issues/J01-148/" | relative_url }})
- [J01-62 — Production: Branch- und Environment-Regeln]({{ "/de/jira/issues/J01-62/" | relative_url }})
