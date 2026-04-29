---
layout: page
title: "135-1 — Runtime-Admin-Auslösung über SFTP-Fahne und HTTP-Trigger modellieren"
permalink: /de/jira/issues/J01-135/steps/J01-138/
jira_key: J01-138
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Angaben

Ziel: Den Auslöseweg für Runtime-Admin-Betriebe so modellieren, dass CI/CD
eine wartende Aktion per SFTP hinterlegen kann und die Shared-Hosting-Runtime
nur vorbereitete Aktionen über einen HTTP-Trigger ausführt.

- Die Admin-Fahne liegt im kontrollierten Runtime-Bereich unter `var/`.
- Der HTTP-Trigger prüft wartende Aktionen, statt freie Befehle anzunehmen.
- Der Ablauf bleibt mit vorhandenen Runtime-Locks vereinbar.
- Fehlerfälle und Leerlauf müssen klar unterscheidbar sein.

Erfolgskriterium: Der geplante Auslöseweg ist dokumentiert und kann später
ohne frei parametrisierbaren Betriebsendpunkt umgesetzt werden.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| SFTP-Fahne | Wartende Aktion ist als Datei oder gleichwertiges Runtime-Artefakt modelliert | Entwurf oder Implementierung | offen |
| HTTP-Trigger | Trigger liest nur vorbereitete Aktionen | Code oder Runbook | offen |
| Locking | Runtime-Locks bleiben Teil des Ausführungswegs | Codepfad / Test | offen |

## Links

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }})
