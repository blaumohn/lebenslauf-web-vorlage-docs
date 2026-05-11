---
layout: page
title: "J01-145 — Laufende Doku-Wartung Sprint 4"
permalink: /de/jira/issues/J01-145/
jira_key: J01-145
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für laufende Doku-Wartung in
`SCRUM Sprint 4`.

## Ziel

- Kleine Doku-Korrekturen und Policy-Schärfungen werden in einem laufenden
  Sprint-Vorgang gesammelt, wenn kein spezifischer fachlicher Vorgang passt.
- Jede zugehörige Änderung trägt `J01-145` im Commit-Titel, damit die
  spätere Zuordnung automatisierbar bleibt.
- Die Vorgangsseite hält eine einfache Änderungsliste als nachvollziehbares
  Wartungsprotokoll.

## Aktueller Stand

- `J01-145` ist als laufender Sprint-4-Vorgang angelegt.
- Jira-Metadaten:
  - Status: `In Bearbeitung`
  - Sprint: `SCRUM Sprint 4`
  - Labels: `sprint-unplanned`, `docs`, `policy`
- Die erste Änderung schärft die Programmierleitlinien unter
  `policies/programmierleitlinien/#fachliche-stilregeln`.
- `J01-113` bleibt der allgemeine Regelwerks- und Architekturkontext; diese
  konkrete laufende Doku-Wartung wird hier geführt.

## Commit-Liste

| Datum | Commit-Spur | Betroffene Vorgänge | Bereich | Änderung |
| --- | --- | --- | --- | --- |
| 2026-05-11 | `docs: laufende doku-wartung verankern (J01-145)` | `J01-145`, `J01-113` | Programmierleitlinien | Fachliche Stilregeln erklären den von oben nach unten lesbaren Hauptfluss von Programmdateien ohne starre Sortierpflicht; `J01-113` verweist nur auf diesen laufenden Wartungsvorgang. |
| 2026-05-11 | `docs: doku-commits im recent-feed trennen (J01-145)` | `J01-145` | Letzte Änderungen | Doku-Commits werden auf `/recent/` in einer eigenen Tabelle angezeigt. |
| 2026-05-11 | `docs: recent-feed mit inhaltsliste erweitern (J01-145)` | `J01-145` | Letzte Änderungen | `/recent/` zeigt eine Inhaltsliste und bis zu 10 Projekt-/Konfigurationscommits plus 10 Doku-Commits. |

## Überprüfung

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Laufender Vorgang | Doku-Wartung läuft nicht über einen allgemeinen Altvorgang | `J01-145` | erledigt |
| DE/EN-Policy | Deutsche und englische Programmierleitlinie sind inhaltlich gleichwertig | `policies/programmierleitlinien/`, `en/policies/programmierleitlinien/` | erledigt |
| Keine starre Sortierpflicht | Die Regel beschreibt Lesbarkeit und fachlichen Hauptfluss statt mechanischer Umordnung | Abschnitt `Fachliche Stilregeln` | erledigt |
| Remote-Link | Jira verweist auf die kanonische öffentliche Arbeitsdoku | Jira-Remote-Link auf `/de/jira/issues/J01-145/` | erledigt |

## Offene Punkte

- Der Vorgang bleibt offen, solange kleinere zusammengehörige
  Doku-Wartungen im Sprint keinen eigenen spezifischen Vorgang brauchen.
- Größere fachliche Änderungen bekommen weiterhin einen eigenen Vorgang.

## Links

- [Programmierleitlinien]({{ "/de/policies/programmierleitlinien/" | relative_url }})
- [J01-113 — Regelwerk-Bereinigung]({{ "/de/jira/issues/J01-113/" | relative_url }})
- [SCRUM Sprint 4]({{ "/de/work/sprints/scrum-sprint-4/" | relative_url }})
