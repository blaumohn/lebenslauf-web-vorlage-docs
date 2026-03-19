---
layout: page
title: "J01-108: Öffentliche Jira-Vorgangsseiten ohne Übersichten-Kiste"
jira_key: J01-108
permalink: /de/jira/issues/J01-108/
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-108`.
Der Vorgang entfernt die Übersichten-Kiste aus dem öffentlichen
Vorgangskontext, damit die Seiten nur noch echten Parent- oder
Schritt-Kontext zeigen und keine zweite Mini-Navigation wiederholen.

## Ziel

- Die Kontext-Leiste auf öffentlichen Jira-Vorgangsseiten zeigt keine
  Übersichten mehr.
- Parent- und öffentliche-Schritte-Kontext bleiben erhalten.
- Seiten ohne solchen Kontext zeigen gar keine Kontext-Leiste.
- Die öffentliche Arbeitsdoku und der Jira-Remote-Link sind vorhanden.

## Aktueller Stand

- `J01-108` ist angelegt und dem aktiven Sprint zugeordnet.
- Der kanonische Jira-Remote-Link zeigt auf diese Arbeitsdoku.
- `_includes/jira-work-context.html` zeigt nur noch Parent und öffentliche
  Schritte.
- Die Übersichten-Sektion mit `Jira-Start`, `Sprint`, `Backlog` und
  `Historie`/`Done` ist entfernt.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Übersichten entfernt | Keine zweite Mini-Navigation auf Vorgangsseiten | `_includes/jira-work-context.html` | erledigt |
| Parent bleibt sichtbar | Schrittseiten und Child-Seiten zeigen weiter den Parent | öffentliche Jira-Vorgangsseiten | erledigt |
| Öffentliche Schritte bleiben sichtbar | Parent-Seiten mit Schritt-Unterseiten listen sie weiter im Kontext | öffentliche Jira-Vorgangsseiten | erledigt |
| Leere Leiste entfällt | Seiten ohne Parent und ohne öffentliche Schritte zeigen keine Kontext-Leiste | öffentliche Jira-Vorgangsseiten | erledigt |
| Öffentliche Arbeitsdoku vorhanden | `/de/jira/issues/J01-108/` und `/en/jira/issues/J01-108/` sind vorhanden | GitHub-Pages-Doku | erledigt |

## Links

- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
- [J01-104: GitHub Pages: Link-Regel für öffentliche Schrittseiten]({{ "/de/jira/issues/J01-104/" | relative_url }})
