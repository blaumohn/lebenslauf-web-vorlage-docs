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
- Aktive Skill-, README- und Runbook-Verweise zeigen nur noch auf den
  journalisierten Sync-Weg.
- Live-Betriebsdoku unterscheidet klar zwischen Dateisystem-Pfad und
  öffentlichem URI-Pfad.
- Doku- und Skill-Repo folgen einem direkten `main`-Ablauf statt einem
  generischen `dev`-/`preview`-Pfad.

## Aktueller Stand

- Jira-Vorgang angelegt (`J01-106`).
- Skill-Zusammenführung umgesetzt.
- Öffentliche Arbeitsdoku in DE/EN angelegt.
- Live-Betriebsdoku und Skills auf Pfadsemantik und Repo-Klassen-Regel
  nachgezogen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Nur noch ein kanonischer Sync-Skill | `jira-pages-sync` ist entfernt, `jira-state-sync` deckt den Pages-Nachzug ab | Skill-Repo unter `skills/` | erledigt |
| Altname entfernt | `jira-mirror-sync` und alte Wrapper sind nicht mehr Teil des Live-Betriebs | Skill-Repo | erledigt |
| Aktive Verweise bereinigt | README, Skills und Runbooks nennen keinen aktiven `jira-pages-sync`- oder `jira-mirror-sync`-Weg mehr | Skill-Repo + Doku-Repo | erledigt |
| Pfadsemantik ist klar | Live-Doku unterscheidet Dateisystem-Pfad und öffentlichen URI-Pfad explizit | Skill-Repo + Doku-Repo | erledigt |
| Git-Regel nach Repo-Klasse dokumentiert | Docs-/Skill-Repos nutzen direkten `main`-Ablauf; Quell-Repos behalten eigene Flüsse | Skill-Repo + Doku-Repo | erledigt |
| Öffentliche Arbeitsdoku vorhanden | `/de/jira/issues/J01-106/` und `/en/jira/issues/J01-106/` sind vorhanden | GitHub-Pages-Doku | erledigt |

## Offene Punkte

- Historische Arbeitsdokus und Sprint-Retros mit alten Begriffen bleiben als
  Historie bewusst unbereinigt.

## Links

- [J01-95: Journalisierten Jira-/Pages-Sync mit Resume aufbauen]({{ "/de/jira/issues/J01-95/" | relative_url }})
- [J01-105: Pipeline-Spec: Manifest vereinfachen für klaren Parameter-Ablauf]({{ "/de/jira/issues/J01-105/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
