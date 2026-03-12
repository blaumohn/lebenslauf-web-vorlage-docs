---
layout: page
title: "Jira- und Doku-Tooling: Jira-Übersicht (öffentlich)"
permalink: /en/areas/proj-doku-tooling/jira-uebersicht/
---

## Ziel

Jira bleibt nicht-öffentlich. Der aktuelle Zustand wird als statische Jira-Übersicht über GitHub Pages veröffentlicht:

- [Jira‑Übersicht]({{ "/en/mirror/" | relative_url }})
- [Sprint-Board]({{ "/en/mirror/sprint-board/" | relative_url }})
- [Backlog]({{ "/en/mirror/backlog/" | relative_url }})
- [Erledigt]({{ "/en/mirror/erledigt/" | relative_url }})

## Regeln (öffentlich)

- Keine Jira-Cloud-Links.
- Keine E-Mail-Adressen.
- Subtasks werden in Listen standardmäßig **ohne Key** gezeigt (nur Schritt-Nr/Titel/Zustand).
- Subtasks bekommen nur dann eine eigene Seite, wenn sie zusätzliche Angaben enthalten.
  - Hinweis: Die Schritt-Seiten sind stabil per Subtask-Key adressiert
    (`/mirror/issues/<PARENT>/steps/<SUBTASK_KEY>/`); nur die Anzeige/Linktexte bleiben key-frei.

## Aktualisieren

Siehe Runbook:
- [Jira-Übersicht aktualisieren]({{ "/en/operations/runbook/" | relative_url }})
