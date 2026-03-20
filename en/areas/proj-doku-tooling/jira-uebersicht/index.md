---
layout: page
title: "Jira- und Doku-Tooling: Jira-Übersicht (öffentlich)"
permalink: /en/areas/proj-doku-tooling/jira-uebersicht/
---

## Goal

Jira stays non-public. The current state is published as a static public Jira
area via GitHub Pages:

- [Jira]({{ "/en/jira/" | relative_url }})
- [Sprint Board]({{ "/en/jira/sprint/" | relative_url }})
- [Backlog]({{ "/en/jira/backlog/" | relative_url }})
- [History]({{ "/en/jira/history/" | relative_url }})
- [Sprint History]({{ "/en/work/sprints/" | relative_url }})

## Public rules

- Keine Jira-Cloud-Links.
- Keine E-Mail-Adressen.
- The entry point under `jira/` separates backlog, history, and sprint board.
- Backlog lists show each listed issue's status directly in the same line.
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
  - Normal Jira work docs and public step pages show a short context block at
    the top that makes available parent and child paths visible.
  - If an issue has multiple public subpages, the work doc also shows a
    contents key.
  - A public step page under `work/jira/<PARENT>/steps/<SUBTASK_KEY>/`
    likewise counts as its own public detail statement.
  - Step pages stay stably addressed by subtask key
    (`/jira/issues/<PARENT>/steps/<SUBTASK_KEY>/`); only labels stay key-free.
  - If such a step page exists, context block, intro and contents key expose
    the same short cross-paths to the step page and the parent work doc.

## Update

See the runbook:
- [Update the public Jira area]({{ "/en/operations/runbook/" | relative_url }})
