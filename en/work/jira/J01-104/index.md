---
layout: page
title: "J01-104: GitHub Pages: Link-Regel für öffentliche Schrittseiten"
permalink: /en/work/jira/J01-104/
---

**Stand:** 2026-03-18

Kanonischer öffentlicher Arbeitsstand für den Jira-Task `J01-104` unter dem
Epic `J01-84`.
Dieser Arbeitsstand zieht die GitHub-Pages-Regel für öffentliche
Schrittseiten nach; Jira Cloud dient hier nur als Vorgangsrahmen und nicht
als fachlicher Ablageort der Regel.

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
- Für diese Arbeit existiert jetzt ein echter Jira-Task; die Fachregel selbst
  bleibt trotzdem nur in GitHub Pages dokumentiert.

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
- Diese Seite dokumentiert den abgeschlossenen Docs-Nachzug unter `J01-104`.
- Der Jira-Bezug ist damit wieder korrekt: eigener Task unter Epic `J01-84`,
  aber keine fachliche Regelpflege in Jira Cloud.

## Links

- [Doku-Richtlinie]({{ "/en/policies/doku-richtlinie/" | relative_url }})
- [Jira-Arbeitsdoku-Vorlage]({{ "/en/templates/jira-arbeitsdoku/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/en/operations/runbook/" | relative_url }})
- [Jira- und Doku-Tooling: Jira-Übersicht (öffentlich)]({{ "/en/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})
