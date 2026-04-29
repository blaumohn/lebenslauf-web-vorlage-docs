---
layout: page
title: "135-2 — CV-Token-Rotation als Runtime-Admin-Aktion umsetzen"
permalink: /de/jira/issues/J01-135/steps/J01-139/
jira_key: J01-139
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Angaben

Ziel: Die CV-Token-Erzeugung als begrenzte Runtime-Admin-Aktion festziehen,
statt sie als lose manuelle Bedienung neben CI/CD stehen zu lassen.

- Token-Rotation bleibt profilgebunden.
- Die Aktion verwendet die vorhandene Runtime-Persistenz und Locking-Logik.
- Token-Programmpfade und CLI-Orchestrierung gehören hierher; sie sind keine
  UI-Änderungen aus `J01-137`.
- Der README-Schnellstart verwendet den aktuellen Setup-Schalter
  `--with-sample-content`.
- Neue Tokens werden nicht unkontrolliert in Logs ausgegeben.
- Der Betriebsablauf ist reproduzierbar und überprüfbar.

Erfolgskriterium: CV-Tokens können über einen dokumentierten Admin-Ablauf
erzeugt werden, ohne Profilvalidierung oder Runtime-Schutz zu umgehen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Profilbindung | Rotation ist nur für vorhandene CV-Profile möglich | Test oder Codepfad | offen |
| Programmpfade | CLI/Handler trennen Token-Mechanik von Profilverfügbarkeit | `src/cli/php/Token/TokenRotateHandler.php` | offen |
| Schnellstart | README nutzt den gültigen Beispielinhalt-Schalter | `README.md` | offen |
| Runtime-Schutz | Bestehende Locks und atomare Writes bleiben wirksam | Test oder Codepfad | offen |
| Bedienbarkeit | Admin-Aktion ist reproduzierbar auslösbar | Runbook oder CI/CD-Nachweis | offen |

## Links

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }})
