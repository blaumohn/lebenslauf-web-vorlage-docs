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
- [Sprint history]({{ "/en/work/sprints/" | relative_url }})

## Regeln (öffentlich)

- Keine Jira-Cloud-Links.
- Keine E-Mail-Adressen.
- The sprint board groups current sprint work by sprint category and status.
- The sprint board only shows the same top-level issues as the Jira board;
  steps stay visible on the parent issue and in the sprint dossier.
- Subtasks werden in Listen standardmäßig **ohne Key** gezeigt (nur Schritt-Nr/Titel/Zustand).
- The base record of a subtask is step number, title, and status.
- Pure step-page metadata does not count as additional details.
- Subtasks only get their own page if they carry additional public details.
  - Additional details are the subtask's own domain content or canonical
    links beyond the base record and metadata.
  - A dedicated `work/jira/J01-<KEY>/` page or a canonical Jira remote link
    to that page counts as an additional detail.
  - Hinweis: Die Schritt-Seiten sind stabil per Subtask-Key adressiert
    (`/mirror/issues/<PARENT>/steps/<SUBTASK_KEY>/`); nur die Anzeige/Linktexte bleiben key-frei.

## Aktualisieren

Siehe Runbook:
- [Jira-Übersicht aktualisieren]({{ "/en/operations/runbook/" | relative_url }})
