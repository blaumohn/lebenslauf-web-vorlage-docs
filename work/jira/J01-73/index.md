---
layout: page
title: "J01-73: Subtask-Reihenfolge gegen Export prüfen"
jira_key: J01-73
jira_parent_key: J01-72
permalink: /de/jira/issues/J01-73/
---

**Stand:** 2026-03-17

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-73`.
Der Vorgang hielt die fachliche Prüfung fest, wie Unteraufgaben im Jira- und
Pages-Kontext konsistent nummeriert und angezeigt werden sollen.

## Ziel

Die Reihenfolge von Subtasks gegen den heutigen Export- und Pages-Pfad so
klären, dass Umrankieren, Schritt-Nummern und Summary-Prefixe dieselbe
öffentliche Reihenfolge tragen.

## Abschlussbild

- Die fachliche Entscheidung liegt heute in [ADR-0003]({{
  "/de/decisions/adr-0003/" | relative_url }}) vor.
- Die operative Umsetzung läuft über den Backfill- und Prefix-Pfad aus
  `J01-75` und `J01-78`.
- `J01-73` bleibt deshalb kein versteckter Rest, sondern endet als
  abgeschlossene Prüf- und Entscheidungsarbeit.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Öffentliche Entscheidungsgrundlage ist vorhanden | `ADR-0003` beschreibt Rank, Schritt-Nr und Summary-Prefix als Zielmodell | [ADR-0003]({{ "/de/decisions/adr-0003/" | relative_url }}) | erledigt |
| Operativer Pfad zur Umsetzung ist öffentlich beschrieben | Backfill und Prefix-Pfad sind im Runbook verankert | [Runbook: Backfill Schritt-Nr und Summary-Prefix]({{ "/de/operations/jira-backfill-schritt-nr/" | relative_url }}) | erledigt |
| Legacy-Link-Ersatz ist geklärt | `J01-99` führt `ADR-0003` als kanonisches Ziel für `J01-73` | [J01-99]({{ "/de/jira/issues/J01-99/" | relative_url }}) | erledigt |
| Kanonische Arbeitsdoku ist aus Jira direkt erreichbar | Jira hält zusätzlich einen Remote-Link auf `/de/jira/issues/J01-73/` | Jira-Remote-Links für `J01-73` | erledigt |

## Abschluss

`J01-73` wird im Abschluss von `J01-72` nicht mehr als offene
Implementierungsarbeit geführt.
Der Vorgang ist als öffentlich nachvollziehbare Prüf- und Entscheidungsarbeit
abgeschlossen und in Jira auf `Erledigt` gesetzt.

## Links

- [ADR-0003: Schritt-Reihenfolge: Rank -> Schritt-Nr, Summary-Prefix]({{
  "/de/decisions/adr-0003/" | relative_url }})
- [J01-99: Alte Confluence-Remote-Links in Jira bereinigen]({{
  "/de/jira/issues/J01-99/" | relative_url }})
- [J01-72: Abschluss der Umsetzungsschritte]({{ "/de/jira/issues/J01-72/" | relative_url }})
