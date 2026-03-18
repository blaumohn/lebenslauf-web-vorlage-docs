---
layout: page
title: "J01-96: Quellenregister und rohe Chat-Eingaben verankern"
jira_key: J01-96
permalink: /de/jira/issues/J01-96/
---

**Stand:** 2026-03-16

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-96`.
Der Vorgang führt im Repo `tagebuch` ein kleines Quellenregister für Suchfälle
ein und verankert rohe Chat-Eingaben als eigene Provenienz-Ebene für
Rundenprotokolle.

## Ziel

Das `tagebuch` als Sense-Making- und Quellen-Repo erhalten, ohne einzelne
Notizen künstlich zu normieren.
Dafür werden drei Ebenen getrennt:

- `notes/raw/` für rohe Eingaben
- `notes/inbox/` für geglättete Rundenprotokolle
- `notes/index/` für ein minimales Quellenregister zu Suchfällen

## Jetzt umgesetzt

- neuer Jira-Vorgang `J01-96` für das Tagebuch-/Register-Thema angelegt
- `tagebuch`-Rundenprotokoll zu dieser Entscheidungs- und Umsetzungsrunde
  ergänzt
- Roh-Eingaben für den Themenstrang unter `notes/raw/2026-03-16.md` ergänzt
- neues Register `notes/index/quellenregister.md` als aktive Sicht angelegt
- Start-Index des `tagebuch` um das neue Register erweitert
- `notes/meta/system.md` um die Regel ergänzt:
  Register sind abgeleitete Sichten für Suchfälle, keine Quelle
- Projekt-Skill ergänzt:
  Bei Herkunfts- und Quellenfragen zuerst Register prüfen,
  dann gezielt im `tagebuch` suchen und bei neuen Funden das Register
  ergänzen
- Jira-Vorgang `J01-96` wurde auf `Erledigt` gesetzt

## Arbeitsmodell

- Einzelne `tagebuch`-Notizen bleiben append-only.
- Das Register enthält nur `Suchfall`, `Such-Notizen` und `Quellen`.
- Ein Registereintrag wird geändert, wenn eine Anfrage den Suchstand
  verändert.
- Das geschieht in genau zwei Fällen:
  - eine wichtige relevante Quelle hat bisher gefehlt
  - eine Anfrage bringt neue relevante Quellen und neue Such-Notizen hervor
- Skills verweisen auf das Register, führen aber keine doppelte
  Themenhistorie und kein Meta-Register.
- Jira hält für dieselbe öffentliche Arbeitsdoku nur einen kanonischen
  Remote-Link; Mirror und GitHub Pages bleiben trotzdem vollständig DE/EN.

## Quellenbezug

- Lokal:
  - `tagebuch/notes/meta/system.md`
  - `tagebuch/notes/inbox/2026-02-25-dialektik-j01-83-cache-skill-notizsystem.md`
  - `tagebuch/notes/inbox/idee-spiegelung-rueckmeldung.md`
- Externe Vorbilder:
  - [IETF RFC 2223](https://www.rfc-editor.org/rfc/rfc2223) für
    `Updates`/`Obsoletes` als Beziehungsmodell
  - [GDS: Documenting architecture decisions](https://gds-way.digital.cabinet-office.gov.uk/standards/architecture-decisions.html)
    für sichtbare Nachfolger-Bezüge in ADRs
  - [HHS: Content Lifecycle Management and Archive Guidance](https://www.hhs.gov/web/building-and-managing-websites/managing-websites/content-management-lifecycle-and-archive-policy/index.html)
    für die Trennung von historischem Verlauf und aktuellem Einstieg

## V1-Regeln

- Keine Statusfelder wie `aktuell`, `ersetzt` oder `gültig` in einzelnen
  Tagebuch-Notizen.
- Keine täglichen Pflicht-Indizes.
- Kein allgemeines Entwicklungslinien- oder Meta-Register.
- Register nur dort, wo reale Fehlauffindbarkeit oder neue Quellenfunde
  entstehen.
- Keine automatische Index-Generierung in V1.
- Keine doppelten DE/EN-Remote-Links in Jira für dieselbe Arbeitsdoku.

## Links

- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
