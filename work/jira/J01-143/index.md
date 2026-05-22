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

## Entscheidung

Die erste Zielvariante ist ein lokaler Git-Hook- und Full-Sync-Weg:

- `scripts/sync-jira-commits.py full` scannt die vollständige lokale
  Git-Historie der Projekt-Repos und erzeugt `_data/jira_commits.json`.
- `scripts/hooks/post-commit` ergänzt nur den gerade erzeugten Commit, wenn
  dessen Betreff mit einem Jira-Key in Klammern endet.
- `scripts/hooks/commit-msg` erzwingt künftig das Format
  `<typ>(<scope>): <titel> (J01-123)` mit anerkannter Conventional-Commit-Art.
- `_includes/jira-commits.html` blendet die gefundenen Commits automatisch auf
  Jira-Vorgangsseiten ein.

Damit ist keine direkte GitHub-API-Abhängigkeit nötig; die lokale Git-Historie
bleibt die robuste Quelle.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Jira-/GitHub-Integration | Verfügbarkeit und Tier-Grenzen sind geprüft | Entscheidung: lokale Git-Historie statt API-Zwang | erledigt |
| Hook-Variante | Git-Push-Hook als Alternative ist bewertet | `scripts/hooks/post-commit`, `scripts/hooks/commit-msg` | erledigt |
| Workflow-Variante | GitHub-Workflow als Alternative ist bewertet | Analyse oder Entscheidungsnotiz | offen |
| Entscheidung | Zielvariante ist begründet gewählt | Abschnitt „Entscheidung“ | erledigt |
| Umsetzung | Gewählter Weg ist umgesetzt oder als Folgeauftrag klar abgegrenzt | `sync-jira-commits.py`, Hooks, Include, Runbook | erledigt |

## Links

- [J01-84]({{ "/de/jira/issues/J01-84/" | relative_url }})
- [Bereich: Jira- und Doku-Tooling]({{ "/de/areas/proj-doku-tooling/" | relative_url }})
- [Runbook: Git-Hooks für Doku-Sync und Commit-Format]({{ "/de/operations/recent-changes-hook/" | relative_url }})
