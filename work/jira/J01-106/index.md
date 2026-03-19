---
layout: page
title: "J01-106: Skill-Repo: jira-pages-sync in jira-state-sync zusammenführen"
jira_key: J01-106
permalink: /de/jira/issues/J01-106/
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für den Jira-Task `J01-106`.
Der Vorgang räumt die überholte Doppelspur zwischen `jira-pages-sync` und
`jira-state-sync` auf, damit der Nachzug der öffentlichen Jira-Fläche nur noch
einen kanonischen Skill-Ablauf hat.

## Ziel

- `jira-state-sync` ist der einzige kanonische Skill für den gezielten Nachzug
  der öffentlichen Jira-Fläche.
- `jira-pages-sync` entfällt als eigenständiger Skill und erzeugt kein
  Doppel-Trigger-Risiko mehr.
- Aktive Skill- und README-Verweise zeigen nur noch auf den journalisierten
  Sync-Weg.

## Aktueller Stand

- Jira-Vorgang angelegt (`J01-106`).
- Die Skill-Zusammenführung ist in Arbeit.
- Öffentliche Arbeitsdoku in DE/EN wird parallel angelegt.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Nur noch ein kanonischer Sync-Skill | `jira-pages-sync` ist entfernt, `jira-state-sync` deckt den Pages-Nachzug ab | Skill-Repo unter `skills/` | offen |
| Altname bleibt als Verweis nutzbar | `jira-mirror-sync` verweist direkt auf `jira-state-sync` | Skill-Repo unter `skills/jira-mirror-sync/` | offen |
| Aktive Verweise bereinigt | README und Koordinations-Skill nennen keinen aktiven `jira-pages-sync` mehr | Skill-Repo | offen |
| Öffentliche Arbeitsdoku vorhanden | `/de/jira/issues/J01-106/` und `/en/jira/issues/J01-106/` sind vorhanden | GitHub-Pages-Doku | offen |

## Offene Punkte

- Prüfen, ob außerhalb historischer Notizen noch weitere Live-Verweise auf
  `jira-pages-sync` bestehen.
- Skill-Repo-Änderungen gegen bereits offene lokale Änderungen sauber
  einmischen.

## Links

- [J01-95: Journalisierten Jira-/Pages-Sync mit Resume aufbauen]({{ "/de/jira/issues/J01-95/" | relative_url }})
- [J01-105: Pipeline-Spec: Manifest vereinfachen für klaren Parameter-Ablauf]({{ "/de/jira/issues/J01-105/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
