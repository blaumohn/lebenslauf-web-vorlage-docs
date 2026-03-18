---
layout: page
title: "J01-84: GitHub-Pages-Regel für öffentliche Schrittseiten"
permalink: /en/work/jira/J01-84/
---

**Stand:** 2026-03-18

Kanonischer öffentlicher Arbeitsstand für die GitHub-Pages-Seite dieses
Themas unter dem bestehenden Jira-Rahmen `J01-84`.
Dieser Arbeitsstand zieht nur die Public-Doku-Regel für öffentliche
Schrittseiten nach und ändert Jira Cloud selbst bewusst nicht.

## Ziel

- Die Doku-Richtlinie, Vorlagen und Mirror-Regeln erklären dieselbe
  Schrittseiten-Logik konsistent.
- Öffentliche Schrittseiten unter `work/jira/<PARENT>/steps/<SUBTASK_KEY>/`
  sind als Variante der Jira-Arbeitsdoku formalisiert.
- Wenn eine öffentliche Schrittseite existiert, sind Schrittkennung,
  Eltern-Arbeitsdoku und Mirror konsistent miteinander verlinkt.

## Jetzt umgesetzt

- Die erste echte Schrittseite unter
  [16-1]({{ "/en/work/jira/J01-16/steps/J01-17/" | relative_url }}) folgt
  jetzt der neuen Link-Regel im Einleitungssatz und im Link-Abschnitt.
- Die Link-Regel ist in Richtlinie, Vorlage, Runbook und öffentlicher
  Jira-Übersicht kanonisch beschrieben.
- Dieser Arbeitsstand blieb bewusst auf GitHub Pages beschränkt;
  Jira-Cloud-Inhalte wurden nicht geändert.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Doku-Richtlinie kennt Schritt-Variante | `work/jira/<PARENT>/steps/<SUBTASK_KEY>/` ist als Jira-Arbeitsdoku-Variante beschrieben | Richtlinie + URI-Muster | erledigt |
| Vorlage deckt Schrittseiten ab | Die Jira-Arbeitsdoku-Vorlage enthält eine Schrittseiten-Variante | Vorlage | erledigt |
| Tooling-Seiten nennen dieselbe Regel | Runbook und Jira-Übersicht nennen Schrittseiten konsistent | beide Seiten | erledigt |
| Bestehende Schrittseite erfüllt die Regel | `16-1` verlinkt in der Einleitung auf Mirror und Eltern-Arbeitsdoku | [16-1]({{ "/en/work/jira/J01-16/steps/J01-17/" | relative_url }}) | erledigt |

## Abschlussbild oder offene Punkte

- Der GitHub-Pages-Nachzug für öffentliche Schrittseiten ist in diesem
  Arbeitsstand erledigt.
- Diese Seite dokumentiert bewusst nur den docs-only Nachzug unter `J01-84`.
- Wenn später auch Jira-Struktur oder Epic-/Task-Zuschnitt geändert werden
  sollen, braucht das einen eigenen Jira-Arbeitsschritt außerhalb dieses
  abgeschlossenen Doku-Laufs.

## Links

- [Doku-Richtlinie]({{ "/en/policies/doku-richtlinie/" | relative_url }})
- [Jira-Arbeitsdoku-Vorlage]({{ "/en/templates/jira-arbeitsdoku/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/en/operations/runbook/" | relative_url }})
- [Jira- und Doku-Tooling: Jira-Übersicht (öffentlich)]({{ "/en/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})
