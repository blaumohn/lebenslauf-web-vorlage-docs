---
layout: page
title: "J01-98: sprintrelevante Preview-Migration aus J01-91 Phase 2"
jira_key: J01-98
permalink: /de/jira/issues/J01-98/
---

**Stand:** 2026-03-17

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-98`.
Der Vorgang begrenzt die Phase-2-Arbeit aus `J01-91` auf die
`docs/agile`-Migration, die für `SCRUM Sprint 1` und das
Preview-Deployment unmittelbar relevant ist.

## Ziel

Nur den sprintrelevanten Teil der Phase-2-Folgen aus `J01-91` umsetzen:

- Preview-/Deployment-nahe Reste aus `docs/agile`
- Zielpfade für `J01-9`, `J01-13`, `J01-16` und `J01-31`
- klare Abgrenzung gegen spätere Migrationen außerhalb dieses Sprints

## Jetzt umgesetzt

- `J01-98` als eigener Folge-Vorgang zu `J01-91` angelegt
- im aktiven Sprint verankert und als `sprint-support` markiert
- Scope jetzt enger gezogen:
  nur die `docs/agile`-Migration, die den aktuellen Preview-Sprint stützt
- der übrige Phase-2-Rest wurde in den Backlog-Folge-Vorgang
  [J01-100]({{ "/de/jira/issues/J01-100/" | relative_url }}) ausgelagert
- die vertiefende Arbeitsdoku für die sprintrelevanten Themenblöcke liegt jetzt
  in [Migrationslandkarte und öffentliche Herleitung]({{ "/de/jira/issues/J01-98/migration-map/" | relative_url }})
- die vier kanonischen Zielorte aus `J01-98` sind jetzt öffentlich befüllt:
  Preview-Runbook, Testmatrix, HTTP-Runtime und CLI-/Build-Bereich
- der lokale Pages-Preview-Pfad wurde am 2026-03-17 gegen `J01-98` und die
  vier Zielseiten geprüft; alle betroffenen Seiten antworten im Preview mit
  `HTTP 200`

## Vertiefende Arbeitsdoku

Diese Seite bleibt der knappe öffentliche Arbeitsstand.
Die fachliche Herleitung, die Zielort-Zuordnung und die Scope-Grenze gegen
`J01-100` sind in der Unterseite
[Migrationslandkarte und öffentliche Herleitung]({{ "/de/jira/issues/J01-98/migration-map/" | relative_url }})
ausgeschrieben.
Interne Arbeitsnotizen werden dort höchstens als Provenienz genannt, aber nicht
verlinkt; die öffentliche Aussage selbst steht immer in der Doku.
Die Herleitung stützt sich dort zusätzlich auf die Commit-Historie der
Branches `preview`, `feature/iss-005-preview` und `dev`.

## Arbeitsregeln

- Keine Rückverlagerung nach `J01-91`; dort bleibt nur der Abschluss-Snapshot.
- Sprint-Fokus zuerst:
  Preview-Deployment vor allgemeiner `docs/agile`-Bereinigung.
- Nur Themen bearbeiten, die den Scope von `SCRUM Sprint 1` sichtbar stützen.
- Alles andere wandert in [J01-100]({{ "/de/jira/issues/J01-100/" | relative_url }})
  und bleibt bis nach diesem Sprint im Backlog.

## Abschlussstand

- Der sprintrelevante Preview-Scope aus `J01-91` ist für `J01-98`
  öffentlich umgesetzt und lokal im Pages-Preview geprüft.
- Weitere `docs/agile`-Reste bleiben nicht mehr in diesem Vorgang, sondern in
  [J01-100]({{ "/de/jira/issues/J01-100/" | relative_url }}).
- Künftige Ergänzungen gehören nur dann noch zu `J01-98`, wenn sich der
  Sprint-Scope erneut ändert; im aktuellen Zuschnitt ist der Vorgang
  fachlich abgeschlossen.

## Links

- Jira-Metadaten verlinken `J01-98` jetzt explizit mit `J01-91` und
  `J01-100`.
- [J01-91: Zustand/Vorhaben (Abschluss-Snapshot)]({{ "/de/jira/issues/J01-91/" | relative_url }})
- [J01-100: docs/agile-Reste nach Sprint 1]({{ "/de/jira/issues/J01-100/" | relative_url }})
- [J01-98: Migrationslandkarte und öffentliche Herleitung]({{ "/de/jira/issues/J01-98/migration-map/" | relative_url }})
- [Doku-Richtlinie]({{ "/de/policies/doku-richtlinie/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
