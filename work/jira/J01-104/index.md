---
layout: page
title: "J01-104: GitHub Pages: Link-Regel für öffentliche Schrittseiten"
permalink: /de/work/jira/J01-104/
---

**Stand:** 2026-03-18

<div class="jira-context-bar">
  <span class="jira-context-bar__label">Kontext</span>
  <a class="jira-context-bar__link" href="{{ "/de/mirror/issues/J01-104/" | relative_url }}">J01-104 im Jira-Mirror</a>
  <a class="jira-context-bar__link" href="{{ "/de/mirror/issues/J01-84/" | relative_url }}">J01-84 als Epic im Jira-Mirror</a>
</div>

Kanonischer öffentlicher Arbeitsstand für den Jira-Task `J01-104` unter dem
Epic `J01-84`.
Dieser Arbeitsstand zieht die GitHub-Pages-Regel für öffentliche
Schrittseiten nach; Jira Cloud dient hier nur als Vorgangsrahmen und nicht
als fachlicher Ablageort der Regel.

## Ziel

- Die Doku-Richtlinie, Vorlagen und Mirror-Regeln erklären dieselbe
  Schrittseiten- und Kontextleisten-Logik konsistent.
- Öffentliche Schrittseiten unter `work/jira/<PARENT>/steps/<SUBTASK_KEY>/`
  sind als Variante der Jira-Arbeitsdoku formalisiert.
- Normale Jira-Arbeitsdokus zeigen oben einen kurzen Eigenpfad auf die eigene
  Mirror-Seite.
- Wenn eine öffentliche Schrittseite existiert, sind Schrittkennung,
  Eltern-Arbeitsdoku und Mirror konsistent miteinander verlinkt.

## Jetzt umgesetzt

- Die erste echte Schrittseite unter
  [16-1]({{ "/de/work/jira/J01-16/steps/J01-17/" | relative_url }}) folgt
  jetzt der neuen Link-Regel im Einleitungssatz und im Link-Abschnitt.
- Normale Jira-Arbeitsdokus tragen jetzt eine kompakte Kontextleiste mit
  direktem Link auf die eigene Mirror-Seite.
- Die Link-Regel ist in Richtlinie, Vorlage, Runbook und öffentlicher
  Jira-Übersicht kanonisch beschrieben.
- Für diese Arbeit existiert jetzt ein echter Jira-Task; die Fachregel selbst
  bleibt trotzdem nur in GitHub Pages dokumentiert.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Doku-Richtlinie kennt Schritt-Variante | `work/jira/<PARENT>/steps/<SUBTASK_KEY>/` ist als Jira-Arbeitsdoku-Variante beschrieben | Richtlinie + URI-Muster | erledigt |
| Normale Jira-Arbeitsdoku zeigt oberen Eigenpfad | Die Kontextleiste führt auf die eigene Mirror-Seite und macht den Zusammenhang sofort sichtbar | diese Seite + andere Jira-Arbeitsdokus | erledigt |
| Vorlage deckt Schrittseiten ab | Die Jira-Arbeitsdoku-Vorlage enthält eine Schrittseiten-Variante | Vorlage | erledigt |
| Tooling-Seiten nennen dieselbe Regel | Runbook und Jira-Übersicht nennen Schrittseiten konsistent | beide Seiten | erledigt |
| Bestehende Schrittseite erfüllt die Regel | `16-1` verlinkt in der Einleitung auf Mirror und Eltern-Arbeitsdoku | [16-1]({{ "/de/work/jira/J01-16/steps/J01-17/" | relative_url }}) | erledigt |

## Abschlussbild oder offene Punkte

- Der GitHub-Pages-Nachzug für öffentliche Schrittseiten ist in diesem
  Arbeitsstand erledigt.
- Der kurze obere UX-Pfad zwischen normaler Arbeitsdoku und eigenem Mirror ist
  jetzt ebenfalls sichtbar eingeführt.
- Diese Seite dokumentiert den abgeschlossenen Docs-Nachzug unter `J01-104`.
- Der Jira-Bezug ist damit wieder korrekt: eigener Task unter Epic `J01-84`,
  aber keine fachliche Regelpflege in Jira Cloud.

## Links

- [Doku-Richtlinie]({{ "/de/policies/doku-richtlinie/" | relative_url }})
- [Jira-Arbeitsdoku-Vorlage]({{ "/de/templates/jira-arbeitsdoku/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [Jira- und Doku-Tooling: Jira-Übersicht (öffentlich)]({{ "/de/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})
