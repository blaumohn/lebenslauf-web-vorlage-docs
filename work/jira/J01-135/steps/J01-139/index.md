---
layout: page
title: "135-5 — CV-Token-Rotation als Runtime-Admin-Aktion umsetzen"
permalink: /de/jira/issues/J01-135/steps/J01-139/
jira_key: J01-139
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Angaben

Ziel: Die CV-Token-Erzeugung als begrenzte Runtime-Admin-Aktion festziehen,
statt sie als lose manuelle Bedienung neben CI/CD stehen zu lassen.

Dieser Schritt ist jetzt nach dem Admin-Gerüst eingeordnet: J01-142 klärt das
generische Laufzeit-Admin-Betriebe-Gerüst und den ersten konkreten
`deploy_switch`; J01-139 nutzt diese Grenzen für die fachliche
CV-Token-Rotation.

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

## Nachtrag 2026-05-09: Stand vor Production-Vorbereitung

Die letzten Codex- und Claude-Sitzungen haben den technischen Kern von
J01-139 weitergebracht:

- `cv_token_rotation` ist als fester Runtime-Admin-Task-Typ im App-Code
  vorhanden.
- Der Handler rotiert Tokens über `TokenRotationService`, nutzt die
  bestehende Profilprüfung und schreibt über `TokenService` unter Runtime-Lock.
- Das Ergebnis läuft über den Mail-Rückkanal aus J01-140.
- Ein Feature-Test prüft: Task-Datei ablegen, `/admin/run` ausführen, Token
  aus dem Mail-Output lesen und damit den privaten CV-Inhalt erreichen.
- Die Pipeline-Config wurde auf Gruppenstruktur und `--overrides` umgestellt;
  GitHub-Workflows geben SFTP-/SMTP-Secrets als YAML-Heredoc an `bin/cd`.

Offen bleibt der eigentliche Preview-Betriebsbefehl für Token-Admin:

- lokale, vertraute Ausführung statt allgemeiner GitHub-Workflow
- Credentials aus einer lokalen Datei mit restriktiven Rechten
- SFTP-Schritt zum Ablegen der Task-Datei unter `var/admin/tasks/`
- HTTP-GET gegen `/admin/run`
- E2E-Nachweis gegen Preview, inklusive Mail-Rückkanal

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Profilbindung | Rotation ist nur für vorhandene CV-Profile möglich | `TokenRotationService`, Feature-Test | umgesetzt |
| Programmpfade | CLI/Handler trennen Token-Mechanik von Profilverfügbarkeit | `TokenCommand`, `CvTokenRotationTaskHandler` | teilweise umgesetzt |
| Schnellstart | README nutzt den gültigen Beispielinhalt-Schalter | `README.md`, `README.en.md` | erledigt |
| Runtime-Schutz | Bestehende Locks und atomare Writes bleiben wirksam | `TokenService`, `RuntimeLockRunner`, Feature-Test | umgesetzt |
| Bedienbarkeit | Admin-Aktion ist reproduzierbar auslösbar | lokaler Preview-Admin-Befehl | offen |
| Preview-E2E | Preview erzeugt Token, meldet sie per Mail und erlaubt privaten CV-Zugriff | manueller Preview-Test | offen |

## Links

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }})
