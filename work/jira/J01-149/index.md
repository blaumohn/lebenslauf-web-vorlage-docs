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

Die Stateful-Tests wurden nachgeschärft: Hypothesis erzeugt jetzt
Fehlerpunkte über alle Deploy-Schritte von `load_state` bis `switch`.
Zusätzlich gibt es eine deterministische Matrix für Runtime-Fehler und
`DeployConflictError` je Schritt.

Die Deploy-Strategie wurde zusätzlich in die Machine gezogen:
`DeployMachine` entscheidet jetzt `DeploymentPlan.fresh()` oder
`DeploymentPlan.swap(...)`, den Konfliktfall bei fehlendem State und
belegten App-Slots sowie die Vendor-Wiederverwendung.

Die SFTP-Deploy-Implementierung wurde nach der State-Machine-Arbeit in
fachliche Module getrennt. Das alte Mischmodul `sftp_deploy_state.py`
wurde ersetzt durch `slots.py`, `slot_store.py`, `tree_uploader.py`,
`token_migrator.py`, `slot_switch.py` und `sftp_deploy_ops.py`.
`scripts/sftp-deploy.py` bleibt damit Runner und Zusammensetzung der
Bausteine, nicht mehr Träger von Slot-, Upload-, Token- und
Dispatch-Details.

Neue Abhängigkeit `hypothesis>=6.0,<7` in `requirements.txt`
(Installation via `composer setup`).

## Design-Entscheidungen

**`RuleBasedStateMachine` statt einfacher Property-Tests**
Hypothesis generiert Sequenzen von `@rule`-Aufrufen und prüft
nach jeder Sequenz die `@invariant`s. Damit können
zusammengesetzte Abläufe systematisch getestet werden, nicht nur
Einzelläufe.

**`ControllableOps` als injizierter Fake**
Gleiche Injektionsgrenze wie in `test_deploy_machine.py`, aber mit
steuerbarem `state`, `both_slots`, `include_vendor`, `fail_at` und
`smoke`-Flag. Dadurch testet Hypothesis nicht nur Fehlerpunkte,
sondern auch fachliche Planvarianten.

**`DeploymentPlan` in der Machine**
`SftpDeployOps` liest Zustand und führt I/O aus. Die Machine
entscheidet, ob ein Fresh-Deploy oder Swap-Deploy läuft und ob der
Vendor-Slot wechseln muss. Damit liegen die fachlichen Wenn-dann-Regeln
im Ablaufmodell.

**Generierte Regeln statt vier Beispielszenarien**
Die `run_generated`-Regel variiert Fehlerpunkt, Fehlerart und
Smoke-Ergebnis. Damit prüft die Machine nicht nur exemplarische Pfade,
sondern die generischen Ablaufgarantien der Deploy-Phasen.

**Trennung von Ablauf und Seiteneffekten**
Die Machine-Tests prüfen nur Reihenfolge, Terminalzustände und
Aufrufverträge. SFTP-Tests bleiben für konkrete Seiteneffekte
zuständig: State-Datei, Sentinels, Slot-Bereinigung, Dispatch und
Rollback-Schreiben.

**SlotMap und SlotStore getrennt**
`SlotMap` beschreibt nur die aktuell publizierten App- und Vendor-Slots
mit Label und Verzeichnisname. `SlotStore` kapselt dagegen die
persistierten SFTP-Dateien inklusive `.htaccess`, `.deploy-run`,
Metadaten und Vendor-Checksum. Die frühere doppelte Vendor-Checksum-Logik
ist auf `SlotStore.vendor_checksum_for_slot(...)` zusammengeführt.

**Deploy-Operationen als Adapter**
`SftpDeployOps` ist die I/O-Grenze der Machine. Upload, Token-Migration,
Slot-Umschaltung und Slot-Persistenz liegen in eigenen Klassen; die
Machine sieht nur fachliche Operationen wie State laden, Plan deployen,
umschalten, prüfen und zurückrollen.

## Geprüfte Invarianten

- Jeder Lauf endet im erwarteten Terminalzustand:
  `endet_in_erwartetem_terminalzustand`.
- History folgt der Deploy-Phasenordnung:
  `history_folgt_phasenordnung`.
- Nach Terminalzustand laufen keine weiteren Ops:
  `calls_stoppen_nach_erster_terminalphase`.
- `switch` läuft erst nach allen Vorphasen:
  `switch_nur_nach_vorphasen`.
- `smoke_ok` läuft nur nach erfolgreichem Switch:
  `smoke_nur_nach_erfolgreichem_switch`.
- `rollback` läuft nur nach fehlgeschlagenem Smoke:
  `rollback_nur_nach_smoke_fehler`.
- Der erzeugte `DeploymentPlan` passt zu State und Vendor-Entscheidung:
  `plan_passt_zu_state_und_vendor`.

## Überprüfungsplan

- Machine-Tests:
  Bestehende Fälle bleiben grün; Nachweis ist `.venv/bin/pytest`
  für die Machine-Tests. Status: erledigt.
- SFTP-Seiteneffekte:
  Integration bleibt grün; Nachweis ist `.venv/bin/pytest` für die
  SFTP-Deploy-Tests. Status: erledigt.
- Stil geänderte Python-Dateien:
  Ruff und Zeilenlänge passen; Pylint wurde gezielt für Machine und
  Stateful-Testdatei geprüft. Status: erledigt.
- SFTP-Deploy-Modultrennung:
  `.venv/bin/python -m pytest tests/py` läuft grün mit `177 passed`.
  Ruff wurde für die geänderten Deploy- und Testdateien geprüft. Status:
  erledigt.

## Abhängigkeit

Setzt J01-148 (`DeployMachine`-Skeleton) voraus.

## Links

- J01-147 — Deploy-Contract:
  {{ "/de/jira/issues/J01-147/" | relative_url }}
- J01-148 — DeployMachine-Skeleton:
  {{ "/de/jira/issues/J01-148/" | relative_url }}
- J01-62 — Production: Branch- und Environment-Regeln:
  {{ "/de/jira/issues/J01-62/" | relative_url }}
