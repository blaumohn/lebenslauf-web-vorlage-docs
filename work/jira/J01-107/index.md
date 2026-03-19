---
layout: page
title: "J01-107: Jira-Metadaten für Migrationsvorgänge aus J01-91 präzisieren"
jira_key: J01-107
permalink: /de/jira/issues/J01-107/
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-107`.
Der Vorgang zieht die Jira-Metadaten für die Migrationskette aus `J01-91`
nach, damit Folge, Abgrenzung und Zusammenhang nicht nur in Textdokus,
sondern auch in Jira-Links sichtbar sind.

## Ziel

- `J01-91` ist in Jira explizit mit `J01-98`, `J01-100` und `J01-103`
  verknüpft.
- Abgrenzungen zwischen `J01-98`, `J01-100` und `J01-103` sind als
  Jira-Metadaten sichtbar.
- Die öffentliche Arbeitsdoku benennt den neuen Metadatenstand.
- Die öffentliche Jira-Ausgabe ist nach dem Metadaten-Nachzug synchron.

## Aktueller Stand

- `J01-107` ist angelegt und dem aktiven Sprint zugeordnet.
- Der kanonische Jira-Remote-Link zeigt auf diese Arbeitsdoku.
- Jira-Issue-Links vom Typ `Relates` sind für die Migrationskette gesetzt:
  - `J01-91` ↔ `J01-98`
  - `J01-91` ↔ `J01-100`
  - `J01-91` ↔ `J01-103`
  - `J01-98` ↔ `J01-100`
  - `J01-100` ↔ `J01-103`
- Die betroffenen Arbeitsdokus benennen den Linkstand.
- Die öffentliche Jira-Ausgabe ist für die betroffenen Keys nachgezogen und
  verifiziert.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Zentraler Snapshot verknüpft | `J01-91` zeigt die drei Folge-/Restvorgänge in `issuelinks` | Jira-Metadaten für `J01-91` | erledigt |
| Sprint-Schnitt sichtbar | `J01-98` ist mit `J01-100` als Abgrenzung verlinkt | Jira-Metadaten für `J01-98` und `J01-100` | erledigt |
| Rest-/Zielerfüllung getrennt | `J01-100` und `J01-103` sind explizit verbunden | Jira-Metadaten für `J01-100` und `J01-103` | erledigt |
| Öffentliche Doku aktualisiert | Die betroffenen Arbeitsdokus nennen den neuen Linkstand | diese Seite + `J01-91`, `J01-98`, `J01-100`, `J01-103` | erledigt |
| Öffentliche Jira-Ausgabe synchron | GitHub Pages spiegelt den aktuellen Metadatenstand | öffentlicher Jira-Nachzug | erledigt |

## Links

- [J01-91: Zustand/Vorhaben (Snapshot)]({{ "/de/jira/issues/J01-91/" | relative_url }})
- [J01-98: sprintrelevante Preview-Migration]({{ "/de/jira/issues/J01-98/" | relative_url }})
- [J01-100: docs/agile-Reste nach Sprint 1]({{ "/de/jira/issues/J01-100/" | relative_url }})
- [J01-103: offene Zielerfüllung aus J01-91 nachziehen]({{ "/de/jira/issues/J01-103/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
