---
layout: page
title: "J01-109: GitHub-Pages-Permalinks für öffentliche Jira-Doku angleichen"
jira_key: J01-109
permalink: /de/jira/issues/J01-109/
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-109`.
Der Vorgang behebt einen Permalink-Drift zwischen älteren Step-Pfaden und
heute bereits verlinkten Kurzpfaden in der öffentlichen Jira-Doku.

## Ziel

- kaputte GitHub-Pages-Links aus Kurzpfaden auflösen
- kanonische öffentliche Arbeitsdoku-URIs wieder konsistent machen
- Jira-Remote-Links und öffentliche Jira-Fläche auf dieselben Ziele nachziehen

## Aktueller Stand

- `J01-109` ist angelegt, dem aktiven Sprint zugeordnet und als
  `sprint-admin` markiert.
- Der Drift betrifft nicht nur `J01-103` → `J01-91/archive-topics`, sondern
  mehrere ältere Arbeitsdokus aus dem `J01-72`-Strang.
- Betroffen sind aktuell `J01-73`, `J01-83`, `J01-91`, `J01-92`, `J01-94`,
  `J01-95` und `J01-99`, jeweils inklusive EN-Spiegel; bei `J01-91`
  zusätzlich die Unterseiten `archive-topics`, `area-inventory` und
  `policy-deltas`.
- Die Jira-Remote-Links für die betroffenen Vorgänge zeigen jetzt auf die
  kanonischen `/de/jira/issues/...`-Ziele.
- Der öffentliche Jira-Spiegel und der lokale Journal-/Cache-Stand sind nach
  dem Link-Nachzug verifiziert synchron.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Kurzpfad-Links treffen echte Zielseiten | Alle bereits verwendeten Kurzpfade rendern auf vorhandene Arbeitsdokus | betroffene `work/jira/`-Seiten + lokale Vorschau | erledigt |
| Betroffene Permalinks sind vereinheitlicht | Frontmatter nutzt für die Drift-Fälle das Kurzpfad-Schema | betroffene DE/EN-Arbeitsdokus | erledigt |
| Alte Step-Pfad-Erklärungen sind nachgezogen | Textliche Hinweise und Selbstlinks nennen die neuen kanonischen Ziele | betroffene Arbeitsdokus | erledigt |
| Jira-Remote-Links sind auf Kurzpfade umgestellt | Jira zeigt für die betroffenen Vorgänge denselben kanonischen DE-Link | Jira-Remote-Links für `J01-73`, `J01-83`, `J01-91`, `J01-92`, `J01-94`, `J01-95`, `J01-99`, `J01-109` | erledigt |
| Öffentliche Jira-Fläche ist synchron | Mirror/Backlog/Historie zeigen den neuen Vorgang und die aktualisierten Linkziele | öffentlicher Jira-Nachzug | erledigt |

## Links

- [J01-91: Zustand/Vorhaben (Snapshot)]({{ "/de/jira/issues/J01-91/" | relative_url }})
- [J01-103: offene Zielerfüllung aus J01-91 nachziehen]({{ "/de/jira/issues/J01-103/" | relative_url }})
- [J01-107: Jira-Metadaten für Migrationsvorgänge aus J01-91 präzisieren]({{ "/de/jira/issues/J01-107/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
