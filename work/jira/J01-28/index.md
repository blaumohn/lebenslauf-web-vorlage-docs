---
layout: page
title: "J01-28: Analyse: Risikomuster und Befundliste"
jira_key: J01-28
permalink: /de/jira/issues/J01-28/
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-28`.
Herkunft: `ISS-003-phase-rules-typing-and-clarity` aus `docs/agile` (Stand 2026-02-13).

## Ziel

Repo-weite Befundliste für Risikomuster und Qualitätsdefizite in App
(`lebenslauf-web-vorlage`) und Config-Lib (`pipeline-config-spec-php`) erstellen.
Befunde werden priorisiert und in umsetzbare Folge-Vorgänge aufgeteilt.

## Scope

- Analysefokus: App-Repo und Config-Lib
- Ergebnisartefakte:
  - Liste der Muster inkl. Fundstellen
  - Priorisierung in kurz/mittel/langfristig
  - Vorschlag für konkrete Folge-Vorgänge
- `resolvePhaseConfig` / `PhaseConfig`-Unklarheit ist als Befund enthalten

## Akzeptanzkriterien

- Nachvollziehbare Befundliste mit Fundstellen in beiden Repos
- Jeder Befund ist priorisiert und einem Folge-Vorgang zugeordnet
  oder als Backlog markiert
- Liste ist konkret genug, um Umsetzungstickets direkt daraus zu starten

## Aktueller Stand

- Vorgang in Jira angelegt, Arbeitsdoku aus ISS-003 übernommen (2026-03-19).
- Inhaltliche Umsetzung noch nicht begonnen.

## Links

- [J01-52: Backlog: Typensicherheit statt Guards]({{ "/de/jira/issues/J01-52/" | relative_url }})
- [J01-105: Pipeline-Spec: Manifest vereinfachen]({{ "/de/jira/issues/J01-105/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
