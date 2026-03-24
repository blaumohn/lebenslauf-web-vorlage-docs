---
layout: page
title: "J01-116: Öffentliche Jira-Issue-Seiten konsistent spiegeln"
jira_key: J01-116
jira_parent_key: J01-84
permalink: /de/jira/issues/J01-116/
---

**Stand:** 2026-03-24

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-116`.
Der Vorgang schärft die öffentliche Jira-Fläche so, dass eine
Vorgangsseite den Jira-Zustand wieder lesbar spiegelt, ohne die
Arbeitsteilung zwischen Jira und GitHub Pages zu verwischen.

## Quellenbasis

- [Bereich: Jira- und Doku-Tooling]({{ "/de/areas/proj-doku-tooling/" | relative_url }})
  und [Jira-Übersicht]({{ "/de/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }}):
  GitHub Pages bleibt öffentlicher Doku-Ort, Jira bleibt SSOT für Vorgänge
  und Status.
- [J01-91: Zustand/Vorhaben (Snapshot)]({{ "/de/jira/issues/J01-91/" | relative_url }}):
  dieselbe SSOT-Trennung ist dort als öffentliche Arbeitsregel benannt.
- [J01-107: Jira-Metadaten für Migrationsvorgänge aus J01-91 präzisieren]({{ "/de/jira/issues/J01-107/" | relative_url }}):
  Beziehungen sollen nicht nur in Fließtext, sondern sichtbar in Jira-Metadaten
  liegen.
- [J01-108: Öffentliche Jira-Vorgangsseiten ohne Übersichten-Kiste]({{ "/de/jira/issues/J01-108/" | relative_url }}):
  Vorgangsseiten sollen echten Kontext zeigen, keine zweite Navigationskiste.
- [Runbook: öffentliche Jira-Fläche aktualisieren]({{ "/de/operations/runbook/" | relative_url }}):
  Subtasks ohne zusätzliche Angaben bleiben beim Parent und bekommen keine
  eigene Detailseite.

## Ziel

- Parent-Seiten wie `J01-31`, `J01-9` und `J01-13` zeigen keine toten
  Unteraufgaben-Links mehr.
- Öffentliche Vorgangsseiten zeigen die nötigen Jira-Metadaten:
  Bearbeitung, Priorität, aktiven Sprint, Sprint-Rolle und verknüpfte
  Vorgänge.
- Die Jira-Beschreibung wird auf generierten Parent-Seiten sichtbar statt
  als Platzhalter `-`.
- Die Kontextleiste bleibt knapp und zeigt nur echten Vorgangsbezug.

## Aktueller Stand

- Ein neuer Vorgang `J01-116` ist angelegt, dem aktiven Sprint zugeordnet
  und mit `J01-31`, `J01-104` und `J01-107` verknüpft.
- Der öffentliche Generator zieht jetzt `description` und `issuelinks`
  aus Jira in Cache und öffentliche Projektion nach.
- Parent-Seiten verlinken Unteraufgaben nur noch dann, wenn eine echte
  öffentliche Schrittseite vorhanden ist.
- Die öffentliche Projektion enthält jetzt zusätzlich aktiven Sprint,
  Sprint-Rolle, Labels und normierte Jira-Verknüpfungen.
- Vorgangsseiten bündeln Jira-Metadaten und Jira-Beziehungen jetzt in einem
  einzigen oberen Zustands- und Beziehungsblock.
- Der separate Kontextblock unterhalb davon zeigt nur noch echte
  Seiten-Navigation wie öffentliche Schritte.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Tote Subtask-Links entfernt | `J01-31`, `J01-9` und `J01-13` zeigen unverlinkte Subtasks ohne Detailseite | öffentliche Jira-Vorgangsseiten | offen |
| Metadaten sichtbar | Bearbeitung, Priorität, aktiver Sprint und Sprint-Rolle sind sichtbar | `_includes/jira-state-head.html` und generierte Vorgangsseiten | offen |
| Verknüpfungen sichtbar | Vorgangsseiten zeigen Jira-Issue-Links im oberen Zustands- und Beziehungsblock | `_data/jira_pages/issues.json`, `_includes/jira-state-head.html`, Vorgangsseiten | offen |
| Beschreibung gespiegelt | Jira-Description erscheint auf generierten Parent-Seiten | öffentliche Jira-Vorgangsseiten | offen |
| DE/EN konsistent | EN-Ableitung übernimmt dieselbe Struktur und Begriffe | `/en/jira/issues/...` | offen |

## Links

- [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }})
- [J01-107]({{ "/de/jira/issues/J01-107/" | relative_url }})
- [J01-108]({{ "/de/jira/issues/J01-108/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
