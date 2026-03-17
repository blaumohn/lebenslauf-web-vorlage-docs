---
layout: page
title: "J01-98: sprintrelevante Preview-Migration aus J01-91 Phase 2"
permalink: /de/work/jira/J01-98/
---

**Stand:** 2026-03-16

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
  [J01-100]({{ "/de/work/jira/J01-100/" | relative_url }}) ausgelagert

## Arbeitsregeln

- Keine Rueckverlagerung nach `J01-91`; dort bleibt nur der Abschluss-Snapshot.
- Sprint-Fokus zuerst:
  Preview-Deployment vor allgemeiner `docs/agile`-Bereinigung.
- Nur Themen bearbeiten, die den Scope von `SCRUM Sprint 1` sichtbar stützen.
- Alles andere wandert in [J01-100]({{ "/de/work/jira/J01-100/" | relative_url }})
  und bleibt bis nach diesem Sprint im Backlog.

## Naechste Umsetzungsbloecke

1. Preview-/Deployment-Regelreste aus `docs/agile` nur für `J01-9`,
   `J01-13`, `J01-16` und `J01-31` in die heutigen Zielorte ziehen.
2. Nachweise für den Sprint-Zielpfad in passender Arbeitsdoku oder
   `quality/testmatrix/` verankern.
3. Alles, was den Sprint nicht direkt trägt, in [J01-100]({{ "/de/work/jira/J01-100/" | relative_url }})
   belassen.

## Links

- [J01-91: Zustand/Vorhaben (Abschluss-Snapshot)]({{ "/de/work/jira/J01-91/" | relative_url }})
- [J01-100: docs/agile-Reste nach Sprint 1]({{ "/de/work/jira/J01-100/" | relative_url }})
- [Doku-Richtlinie]({{ "/de/policies/doku-richtlinie/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/work/jira/" | relative_url }})
