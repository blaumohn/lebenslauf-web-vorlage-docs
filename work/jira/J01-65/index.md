---
layout: page
title: "J01-65 — Production: Artefakt- und Smoke-Checks definieren"
permalink: /de/jira/issues/J01-65/
jira_key: J01-65

---
<!-- generated:jira:subtasks_cksum=3442621153 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Links

-

## Beschreibung

Ziel: Verbindliche Checks für Production-Deploys definieren.

- Artefaktliste festlegen
- Post-Deploy-Smoke definieren

## Aktueller Stand

Der Go-live ist erreicht, aber für `J01-65` liegt kein belastbarer
vorgangsspezifischer Abschlussnachweis vor. Post-Deploy-Smokes und
Rollback-Verhalten sind im Hauptrepo technisch vorhanden; die formale
Artefaktliste und der Abschluss dieses Vorgangs bleiben nachzuziehen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Post-Deploy-Smoke | Zielsystem wird nach Deployment per HTTP geprüft | `scripts/pipeline_lib.sh`, `scripts/sftp-deploy.py` | technisch vorhanden |
| Rollback bei Smoke-Fehler | Smoke-Fehler lösen den sicheren Rückfall aus | `tests/py/test_deploy_machine.py`, `tests/py/test_sftp_recovery_matrix.py` | technisch vorhanden |
| Artefaktliste | Verbindliche Production-Artefaktliste ist dokumentiert | `J01-65` | offen |
| Jira-Abschluss | Vorgang wird erst mit vollständigem Nachweis geschlossen | Jira | offen |

## Quellenprüfung

Die ursprüngliche Zielbeschreibung bleibt gültig. Sie ist jedoch keine
Go-live-Blockade mehr; technische Smoke-Nachweise existieren bereits, während
der formale Vorgangsabschluss offen bleibt.

## Unteraufgaben

- **65-1 Artefaktliste festlegen** — Zu erledigen
- **65-2 Post-Deploy-Smoke definieren** — Zu erledigen
