---
layout: page
title: "Jira- und Doku-Tooling: Öffentliche Jira-Fläche"
permalink: /de/areas/proj-doku-tooling/jira-uebersicht/
---

## Ziel

Jira bleibt nicht-öffentlich. Der aktuelle Zustand wird als öffentliche
Jira-Fläche über GitHub Pages veröffentlicht:

- [Jira]({{ "/de/jira/" | relative_url }})
- [Sprint Board]({{ "/de/jira/sprint/" | relative_url }})
- [Backlog]({{ "/de/jira/backlog/" | relative_url }})
- [Historie]({{ "/de/jira/historie/" | relative_url }})
- [Sprint-Historie]({{ "/de/work/sprints/" | relative_url }})

## Regeln (öffentlich)

- Keine Jira-Cloud-Links.
- Keine E-Mail-Adressen.
- Der Einstieg unter `jira/` trennt Backlog, Historie und Sprint Board.
- Backlog-Listen zeigen den Status jedes gelisteten Vorgangs direkt in der
  Zeile.
- Die Sprint-Sicht gruppiert aktuelle Sprint-Arbeit nach Sprint-Kategorie und
  Status.
- In der Sprint-Sicht erscheinen nur dieselben Top-Level-Vorgänge wie im
  Jira-Board; Schritte bleiben beim Parent-Vorgang und in der Sprint-Doku
  sichtbar.
- Subtasks werden in Listen standardmäßig **ohne Key** gezeigt (nur Schritt-Nr/Titel/Zustand).
- Grundbestand eines Subtasks sind Schritt-Nr., Titel und Status.
- Reine Metadaten einer Schritt-Seite gelten nicht als zusätzliche Angaben.
- Subtasks bekommen nur dann eine eigene Seite, wenn sie zusätzliche Angaben enthalten.
  - Zusätzliche Angaben sind eigene fachliche Inhalte oder eigene kanonische
    Verweise des Subtasks über Grundbestand und Metadaten hinaus.
  - Eine eigene öffentliche Vorgangsseite unter `jira/issues/J01-<KEY>/` oder
    ein kanonischer
    Jira-Remote-Link darauf zählt als zusätzliche Angabe.
  - Öffentliche Vorgangs- und Schrittseiten zeigen oben einen kompakten
    Zustandskopf und darunter einen kurzen Kontextblock.
  - Eine öffentliche Schrittseite unter
    `jira/issues/<PARENT>/steps/<SUBTASK_KEY>/` zählt ebenfalls als eigene
    öffentliche Detailaussage.
  - Hinweis: Die Schritt-Seiten sind stabil per Subtask-Key adressiert
    (`/jira/issues/<PARENT>/steps/<SUBTASK_KEY>/`); nur die Anzeige/Linktexte
    bleiben key-frei.
  - Wenn eine solche Schrittseite existiert, zeigen Zustandskopf und
    Kontextblock dieselben kurzen Querpfade zur Schrittseite und zum
    Elternvorgang.

## Aktualisieren

Siehe Runbook:
- [Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
