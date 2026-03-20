---
layout: page
title: "J01-104: GitHub Pages: Link-Regel für öffentliche Schrittseiten"
jira_key: J01-104
permalink: /de/jira/issues/J01-104/
jira_parent_key: J01-84
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für den Jira-Task `J01-104` unter dem
Epic `J01-84`.
Dieser Arbeitsstand zieht die GitHub-Pages-Regel für kurze, sichtbare
Querpfade innerhalb von `work/jira` systemisch nach; Jira Cloud dient hier nur
als Vorgangsrahmen und nicht als fachlicher Ablageort der Regel.

## Ziel

- Die Doku-Richtlinie, Vorlagen und Skill-/Tooling-Regeln erklären dieselbe
  Kontextnavigations-Logik für Vorgänge und Schrittseiten konsistent.
- Die Regel bleibt als Projektvorgabe erhalten:
  Richtlinie, Vorlage, Generator, Verifikation und Skill-Ablauf tragen
  denselben Pfadstandard.
- Öffentliche Schrittseiten unter `work/jira/<PARENT>/steps/<SUBTASK_KEY>/`
  sind als Variante der Jira-Arbeitsdoku formalisiert.
- Normale Jira-Arbeitsdokus zeigen oben kurze, sofort sichtbare Querpfade zu
  Parent und öffentlichen Schritten.
- Vorgänge mit mehreren öffentlichen Teilseiten zeigen zusätzlich einen
  Inhalts-Schlüssel.
- Wenn eine öffentliche Schrittseite oder ein öffentlicher Subtask-Arbeitsstand
  existiert, bleiben Elternvorgang, Gegenseite und Detailseite konsistent
  verlinkt.
- Die öffentliche Jira-Fläche trennt Einstieg, Backlog, Historie und
  Sprint-Board klarer; der Status bleibt in Backlog-Listen je Vorgangszeile
  sichtbar.

## Jetzt umgesetzt

- Jira-Arbeitsdokus nutzen eine gemeinsame Kontextnavigation statt
  händischer Einzel-Leisten; dadurch bleiben normale Vorgänge,
  Subtask-Arbeitsstände und Schrittseiten im selben Muster.
- Die Verifikation prüft Jira-Remote-Links und die lokale `work/jira`-
  Struktur jetzt ohne Spiegel-Gegenpfade.
- Richtlinie, Vorlage, Bereichsseite, Runbook und Skill nennen dieselbe
  Regel.
- Die öffentliche Jira-Fläche nutzt jetzt `Backlog`, `Historie` und
  `Sprint Board` als klarere Hauptsichten; `erledigt/` bleibt nur noch als
  Kompatibilitätspfad zur Historie erhalten.
- Backlog-Listen zeigen den Status jedes gelisteten Vorgangs direkt in der
  Zeile.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Richtlinie beschreibt die Vorgabe | `work/jira` ist die einzige öffentliche Jira-Arbeitsdoku; Kontextblock und Inhalts-Schlüssel erklären Parent-/Child-Pfade | Richtlinie + Bereichsseite | erledigt |
| Jira-Arbeitsdokus nutzen keine Einzel-Leisten mehr | Normale Arbeitsdokus und Schrittseiten binden dieselbe gemeinsame Kontextnavigation ein | diese Seite + andere Jira-Arbeitsdokus | erledigt |
| Generator und Sync bleiben konsistent | Generierte Übersichten und nicht-manuelle Jira-Seiten liegen unter `work/jira` | Generator + EN-Sync | erledigt |
| Verifikation prüft die Systemregel | Öffentliche Jira-Pfade werden nur noch gegen `work/jira` bestätigt | Verifikationsskript + Runbook | erledigt |
| Skill-Ablauf trägt die Regel weiter | Der Docs-/Sync-Ablauf nennt nur noch `work/jira` als öffentliche Quelle | Skill-Doku | erledigt |
| Öffentliche Jira-Fläche bleibt klar lesbar | Einstieg trennt Backlog, Historie und Sprint Board; `erledigt/` ist nur noch Weiterleitungskontext | `jira/`, `backlog/`, `historie/`, `erledigt/` | erledigt |
| Backlog zeigt Status je Vorgangszeile | Alle gelisteten Backlog-Vorgänge tragen einen sichtbaren Statuszusatz | `backlog/` | erledigt |

## Abschlussbild oder offene Punkte

- Der GitHub-Pages-Nachzug ist nicht nur sichtbar eingebaut, sondern als
  Projektvorgabe in Richtlinie, Vorlage, Generator, Verifikation und Skill
  verankert.
- Neue oder nachgezogene Arbeitsdokus und Generator-Läufe benutzen damit
  dieselbe Querpfad-Regel reproduzierbar weiter.
- Die Umsetzung bleibt vollständig außerhalb von Jira Cloud.

## Links

- [Doku-Richtlinie]({{ "/de/policies/doku-richtlinie/" | relative_url }})
- [Jira-Arbeitsdoku-Vorlage]({{ "/de/templates/jira-arbeitsdoku/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [Jira- und Doku-Tooling: Jira-Übersicht (öffentlich)]({{ "/de/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
- [Jira: Historie]({{ "/de/jira/historie/" | relative_url }})
