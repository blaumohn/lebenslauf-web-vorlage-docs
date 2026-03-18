---
layout: page
title: "Jira- und Doku-Tooling: Jira-Übersicht (öffentlich)"
permalink: /de/areas/proj-doku-tooling/jira-uebersicht/
---

## Ziel

Jira bleibt nicht-öffentlich. Der aktuelle Zustand wird als statische Jira-Übersicht über GitHub Pages veröffentlicht:

- [Jira‑Übersicht]({{ "/de/mirror/" | relative_url }})
- [Sprint-Board]({{ "/de/mirror/sprint-board/" | relative_url }})
- [Backlog]({{ "/de/mirror/backlog/" | relative_url }})
- [Erledigt]({{ "/de/mirror/erledigt/" | relative_url }})
- [Sprint-Historie]({{ "/de/work/sprints/" | relative_url }})

## Regeln (öffentlich)

- Keine Jira-Cloud-Links.
- Keine E-Mail-Adressen.
- Das Sprint-Board gruppiert aktuelle Sprint-Arbeit nach Sprint-Kategorie und
  Status.
- Im Sprint-Board erscheinen nur dieselben Top-Level-Vorgänge wie im
  Jira-Board; Schritte bleiben beim Parent-Vorgang und in der Sprint-Doku
  sichtbar.
- Subtasks werden in Listen standardmäßig **ohne Key** gezeigt (nur Schritt-Nr/Titel/Zustand).
- Grundbestand eines Subtasks sind Schritt-Nr., Titel und Status.
- Reine Metadaten einer Schritt-Seite gelten nicht als zusätzliche Angaben.
- Subtasks bekommen nur dann eine eigene Seite, wenn sie zusätzliche Angaben enthalten.
  - Zusätzliche Angaben sind eigene fachliche Inhalte oder eigene kanonische
    Verweise des Subtasks über Grundbestand und Metadaten hinaus.
  - Eine eigene `work/jira/J01-<KEY>/`-Seite oder ein kanonischer
    Jira-Remote-Link darauf zählt als zusätzliche Angabe.
  - Normale Jira-Arbeitsdokus zeigen oben eine kompakte Kontextleiste, in der
    der eigene Vorgangs-Key direkt auf die eigene Mirror-Seite zeigt.
  - Eine öffentliche Schrittseite unter
    `work/jira/<PARENT>/steps/<SUBTASK_KEY>/` zählt ebenfalls als eigene
    öffentliche Detailaussage.
  - Hinweis: Die Schritt-Seiten sind stabil per Subtask-Key adressiert
    (`/mirror/issues/<PARENT>/steps/<SUBTASK_KEY>/`); nur die Anzeige/Linktexte bleiben key-frei.
  - Wenn eine solche Schrittseite existiert, linkt ihre Schrittkennung in der
    Einleitung auf die eigene Mirror-Schrittseite und der Eltern-Key auf die
    Eltern-Arbeitsdoku.

## Aktualisieren

Siehe Runbook:
- [Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
