---
layout: page
title: "J01-143 — Doku-GitHub-Einbau für automatische Aktualisierung bewerten"
permalink: /de/jira/issues/J01-143/
jira_key: J01-143
jira_parent_key: J01-84
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Angaben

Ziel: Entscheiden und umsetzen, wie GitHub- und Jira-nahe Doku-Betriebe die
öffentliche Doku automatisch aktuell halten können, ohne eine ungeklärte
Plattformabhängigkeit einzubauen.

Zu prüfen:

- Ob ein Jira-API- und GitHub-Einbau möglich ist und ob die dafür nötigen
  Funktionen im Jira-Basis-Tier verfügbar sind.
- Ob Doku-Aktualisierung stattdessen an Git-Push-Betriebe über einen Hook
  gekoppelt werden soll.
- Ob Doku-Aktualisierung stattdessen über einen GitHub-Workflow nach dem Push
  laufen soll.
- Ob eine andere, robustere Möglichkeit besser passt.

Erfolgskriterium: Die Optionen sind bewertet, eine Zielvariante ist
entschieden und der gewählte Aktualisierungsweg ist umgesetzt oder als
konkreter Umsetzungsauftrag abgegrenzt.

## Sprint-Abgrenzung

Dieser Vorgang ist Backlog-Arbeit im Doku-/Jira-Tooling und liegt bewusst
nicht im aktiven Sprint.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Jira-/GitHub-Integration | Verfügbarkeit und Tier-Grenzen sind geprüft | Analyse oder Entscheidungsnotiz | offen |
| Hook-Variante | Git-Push-Hook als Alternative ist bewertet | Analyse oder Entscheidungsnotiz | offen |
| Workflow-Variante | GitHub-Workflow als Alternative ist bewertet | Analyse oder Entscheidungsnotiz | offen |
| Entscheidung | Zielvariante ist begründet gewählt | Entscheidungsnotiz / Doku | offen |
| Umsetzung | Gewählter Weg ist umgesetzt oder als Folgeauftrag klar abgegrenzt | Repo-Änderung oder Folgevorgang | offen |

## Links

- [J01-84]({{ "/de/jira/issues/J01-84/" | relative_url }})
- [Bereich: Jira- und Doku-Tooling]({{ "/de/areas/proj-doku-tooling/" | relative_url }})
