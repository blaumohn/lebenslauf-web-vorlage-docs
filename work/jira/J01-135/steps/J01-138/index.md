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

Erfolgskriterium: Der geplante Auslöseweg ist dokumentiert und ohne frei
parametrisierbaren Betriebsendpunkt umgesetzt.

## Abschlussnotiz 2026-05-06

Der Auslöseweg wurde nicht als separater Implementierungsstrang fertiggestellt.
Er ist im Zuge von
[J01-142]({{ "/de/jira/issues/J01-135/steps/J01-142/" | relative_url }})
praktisch mit erledigt worden:

- SFTP hinterlegt vorbereitete Admin-Artefakte unter `var/admin/`.
- Der HTTP-Trigger `/admin/run` liest wartende Aufgaben.
- Der Trigger nimmt keine freien Befehle an, sondern dispatcht nur bekannte
  Task-Typen an feste Handler.
- Der konkrete `deploy_switch` läuft unter Runtime-Lock und schreibt den
  sichtbaren Zustand atomar.

Damit ist J01-138 fachlich erledigt. Die konkrete technische Ausprägung und
die Nachweise bleiben in J01-142, damit der Arbeitsstand nicht doppelt geführt
wird.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| SFTP-Fahne | Wartende Aktion ist als Datei oder gleichwertiges Runtime-Artefakt modelliert | `AdminTaskStore`, `var/admin/tasks/`, J01-142 | erledigt |
| HTTP-Trigger | Trigger liest nur vorbereitete Aktionen | `/admin/run`, `AdminTaskRunner`, J01-142 | erledigt |
| Locking | Runtime-Locks bleiben Teil des Ausführungswegs | `DeploySwitcher`, `RuntimeLockRunner`, J01-142 | erledigt |

## Links

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }})
- [J01-142]({{ "/de/jira/issues/J01-135/steps/J01-142/" | relative_url }})
