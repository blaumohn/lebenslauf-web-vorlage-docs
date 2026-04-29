---
layout: page
title: "J01-137 — Laufende CV-UI-Anpassungen Sprint 4"
permalink: /de/jira/issues/J01-137/
jira_key: J01-137
jira_parent_key: J01-6
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für laufende CV-UI-Anpassungen in
`SCRUM Sprint 4`.

## Ziel

- Kleinere UI- und Renderkorrekturen am CV werden in einem laufenden
  Sprint-Vorgang gesammelt, solange sie fachlich zusammengehören.
- Jeder zugehörige Commit trägt `J01-137` im Commit-Titel, damit die
  spätere Zuordnung automatisierbar bleibt.
- Die Vorgangsseite hält eine einfache Commit-Liste als maschinenfreundliches
  Änderungsprotokoll.

## Aktueller Stand

- `J01-137` ist als laufender Sprint-4-Vorgang unter `J01-6` angelegt.
- Jira-Metadaten:
  - Status: `In Bearbeitung`
  - Sprint: `SCRUM Sprint 4`
  - Labels: `sprint-unplanned`, `cv`, `twig`
- Die bisherige Ausbildungskorrektur bleibt Teil des Vorgangs.
- Die aktuellen UI-Anpassungen an Header, Meta-Bereich, Eintragslayout,
  Beispieldaten und Renderer-Test sind ebenfalls unter diesem Vorgang
  gebündelt.

## Commit-Liste

| Datum | Commit | Titel |
| --- | --- | --- |
| 2026-04-29 | `cb4c846` | `fix: CV-Ausbildungsdaten und Tagbreiten stabilisieren (J01-137)` |
| 2026-04-29 | `fefc79e` | `fix: laufende CV-UI-Anpassungen fortführen (J01-137)` |

## Überprüfung

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Schema | `grad` und `beschreibung` sind einzeln optional, nicht beide gemeinsam fehlend | `CvValidatorTest` | erledigt |
| Twig-Ausgabe | Leere oder fehlende Felder erzeugen keine leeren Komma-Trenner | `sections.html.twig` | erledigt |
| UI-Layout | Eintrags-Metadaten liegen rechts oben und lange Eintragstexte können umfließen | `entry.html.twig`, `entry.css` | erledigt |
| Renderer | Die CV-Ausgabe bleibt renderbar | `CvRendererTest` | erledigt |
| CSS-Build | Gebaute CV-CSS enthält die aktuellen Layoutregeln | `npm run build:css` | erledigt |

## Offene Punkte

- Der Vorgang bleibt offen, solange weitere zusammengehörige Sprint-4-UI-
  Anpassungen unter `J01-137` laufen.
- Die Commit-Liste kann künftig aus Commit-Titeln mit `(J01-137)` erzeugt
  werden.

## Links

- [J01-6 — i18n für Seitenvorlagen und Templates]({{ "/de/jira/issues/J01-6/" | relative_url }})
- [SCRUM Sprint 4]({{ "/de/work/sprints/scrum-sprint-4/" | relative_url }})
