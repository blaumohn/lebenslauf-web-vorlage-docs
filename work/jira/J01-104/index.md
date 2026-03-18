---
layout: page
title: "J01-104: GitHub Pages: Link-Regel für öffentliche Schrittseiten"
jira_key: J01-104
permalink: /de/jira/issues/J01-104/
jira_parent_key: J01-84
---

**Stand:** 2026-03-18

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für den Jira-Task `J01-104` unter dem
Epic `J01-84`.
Dieser Arbeitsstand zieht die GitHub-Pages-Regel für kurze, sichtbare
Querpfade zwischen `work/jira` und `mirror` systemisch nach; Jira Cloud dient
hier nur als Vorgangsrahmen und nicht als fachlicher Ablageort der Regel.

## Ziel

- Die Doku-Richtlinie, Vorlagen und Mirror-Regeln erklären dieselbe
  Kontextnavigations-Logik für Vorgänge und Schrittseiten konsistent.
- Die Regel bleibt als Projektvorgabe erhalten:
  Richtlinie, Vorlage, Generator, Verifikation und Skill-Ablauf tragen
  denselben Pfadstandard.
- Öffentliche Schrittseiten unter `work/jira/<PARENT>/steps/<SUBTASK_KEY>/`
  sind als Variante der Jira-Arbeitsdoku formalisiert.
- Normale Jira-Arbeitsdokus und Mirror-Seiten zeigen oben kurze,
  sofort sichtbare Querpfade zur Gegenseite sowie, wenn verfügbar, zu
  über- und untergeordneten öffentlichen Seiten.
- Wenn eine öffentliche Schrittseite oder ein öffentlicher Subtask-Arbeitsstand
  existiert, bleiben Elternvorgang, Gegenseite und Detailseite konsistent
  verlinkt.

## Jetzt umgesetzt

- Jira-Arbeitsdokus nutzen eine gemeinsame Kontextnavigation statt
  händischer Einzel-Leisten; dadurch bleiben normale Vorgänge,
  Subtask-Arbeitsstände und Schrittseiten im selben Muster.
- Der Mirror erzeugt dieselbe Querpfad-Logik jetzt generatorseitig aus
  lokalen Public-Zielen und Jira-Beziehungen, nicht nur aus Remote-Link-Listen.
- Die Verifikation prüft neben Jira-Remote-Links jetzt auch die lokalen
  Gegenstücke zwischen `work/jira` und `mirror`.
- Richtlinie, Vorlage, Bereichsseite, Runbook und Mirror-Skill nennen dieselbe
  Regel.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Richtlinie beschreibt den Querpfad als Vorgabe | `work/jira` und `mirror` haben für Vorgänge und Schrittseiten klaren Kontextblock, Gegenseite und Parent-/Child-Regeln | Richtlinie + Bereichsseite | erledigt |
| Jira-Arbeitsdokus nutzen keine Einzel-Leisten mehr | Normale Arbeitsdokus und Schrittseiten binden dieselbe gemeinsame Kontextnavigation ein | diese Seite + andere Jira-Arbeitsdokus | erledigt |
| Mirror erzeugt dieselbe Logik erneut | Ein Mirror-Neulauf rendert die kurzen Gegenpfade aus lokaler Struktur und Jira-Beziehungen | Mirror-Seiten + Generator | erledigt |
| Verifikation prüft die Systemregel | Fehlende lokale Gegenstücke zwischen `work/jira` und `mirror` werden gemeldet | Verifikationsskript + Runbook | erledigt |
| Skill-Ablauf trägt die Regel weiter | Mirror-Betrieb nennt die Paar- und Querpfad-Prüfung ausdrücklich | Mirror-Skill | erledigt |

## Abschlussbild oder offene Punkte

- Der GitHub-Pages-Nachzug ist nicht nur sichtbar eingebaut, sondern als
  Projektvorgabe in Richtlinie, Vorlage, Generator, Verifikation und Skill
  verankert.
- Neue oder nachgezogene Arbeitsdokus und Mirror-Läufe benutzen damit dieselbe
  Querpfad-Regel reproduzierbar weiter.
- Die Umsetzung bleibt vollständig außerhalb von Jira Cloud.

## Links

- [Doku-Richtlinie]({{ "/de/policies/doku-richtlinie/" | relative_url }})
- [Jira-Arbeitsdoku-Vorlage]({{ "/de/templates/jira-arbeitsdoku/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [Jira- und Doku-Tooling: Jira-Übersicht (öffentlich)]({{ "/de/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
