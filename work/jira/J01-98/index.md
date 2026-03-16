---
layout: page
title: "J01-98: J01-91 Phase 2 an kanonischen Zielorten umsetzen"
permalink: /de/work/jira/J01-98/
---

**Stand:** 2026-03-16

Kanonischer öffentlicher Arbeitsstand für `J01-98`.
Der Vorgang zieht die festgezogenen Phase-2-Folgen aus `J01-91` in konkrete
kanonische Zielorte und passende vorgangsgenaue Arbeitsdokus.

## Ziel

Die in `J01-91` beschlossenen Zielorte nicht nur benennen, sondern an den
richtigen öffentlichen Stellen umsetzen:

- kanonische Fachseiten unter `areas/`, `operations/`, `policies/`,
  `decisions/`, `quality/`
- vorgangsgenaue Restarbeit unter `work/jira/J01-<KEY>/`
- keine neue Sammelstruktur und keine neuen Dokutypen

## Jetzt umgesetzt

- `J01-98` als eigener Folge-Vorgang zu `J01-91` angelegt
- im aktiven Sprint verankert und als `sprint-support` markiert
- Scope gegen `J01-91` festgezogen:
  Terminologie, Nachweise und Zielorte werden direkt an den kanonischen Seiten
  oder in passender Arbeitsdoku nachgezogen
- `J01-91` kann damit als abgeschlossener Struktur- und Entscheidungs-Vorgang
  behandelt werden

## Arbeitsregeln

- Keine Rueckverlagerung nach `J01-91`; dort bleibt nur der Abschluss-Snapshot.
- Neue strukturelle Aenderungen weiter gegen `policies/doku-richtlinie/`
  pruefen.
- Wenn ein Thema ueber den aktuellen Vorgang hinaus stabil gilt:
  in die kanonische Fachseite uebernehmen.
- Wenn ein Thema noch vorgangsgebunden bleibt:
  in der passenden `work/jira/J01-<KEY>/`-Seite halten.

## Naechste Umsetzungsbloecke

1. Terminologie aus `J01-91` in den betroffenen Bereichsseiten nachziehen.
2. Nachweise dort in `quality/testmatrix/` oder passender Arbeitsdoku
   verankern, wo sie fachlich hingehoeren.
3. Offene Restthemen aus `archive-topics.md` nur noch an festgezogenen
   Zielorten weiterfuehren.

## Links

- [J01-91: Zustand/Vorhaben (Abschluss-Snapshot)]({{ "/de/work/jira/J01-91/" | relative_url }})
- [Doku-Richtlinie]({{ "/de/policies/doku-richtlinie/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/work/jira/" | relative_url }})
