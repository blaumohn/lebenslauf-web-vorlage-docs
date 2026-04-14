---
layout: page
title: "J01-129: CLI-Konfig als Objekt statt wiederholter Argumentübergabe"
jira_key: J01-129
permalink: /de/jira/issues/J01-129/
---

**Stand:** 2026-04-14

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-129`.
Der Vorgang bewertet und beschreibt einen möglichen Folgeumbau nach
`J01-105`: `BasePipelineCommand` soll Pipeline-Phase und Konfig-Variablen
früh auflösen und danach als zugängliches Konfig-Objekt bereitstellen,
damit nachgelagerte Befehle dieselbe Konfig nicht mehrfach als
Methoden- oder Funktionsargument weiterreichen müssen.

## Ziel

- die frühe Auflösung in `BasePipelineCommand` als festen Einstieg klären
- bewerten, ob ein zugängliches Konfig-Objekt den CLI-Pfad klarer macht
- wiederholte Argumentübergabe derselben Konfig im Command-Pfad verringern
- Abgrenzung zu `J01-105` und `J01-123 / P_3` ausdrücklich festhalten

## Aktueller Stand

- `J01-129` ist als eigener Vorgang angelegt.
- Der fachliche Ursprung liegt in `J01-123 / P_3`, wo
  `BasePipelineCommand` bereits als Schicht für frühe Pipeline- und
  Override-Auflösung beschrieben ist.
- Die Objekt-Konsolidierung gehört jedoch nicht mehr zum aktuellen
  Abschlussbild von `J01-105`, sondern ist als Folgearbeit für einen
  späteren Sprint oder das Backlog geschnitten.
- Deshalb wird `J01-129` öffentlich als eigener Vorgang gespiegelt und
  nicht als weiterer Schritt `105-5` unter `J01-105`.

## Abgrenzung

- Nicht Teil von `J01-105`:
  - keine weitere Manifest-Ausdünnung
  - kein zusätzlicher `P_i`-Reduktionsschritt
  - kein weiterer Schritt im bestehenden `105-1`-bis-`105-4`-Baum
- Bezug zu `J01-105` bleibt:
  - Folge aus `J01-123 / P_3`
  - dieselbe CLI-/Spec-Grenze
  - dieselbe Frage nach einem stabilen Command-Zuschnitt

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Vorgang eigenständig gespiegelt | `J01-129` hat eine eigene DE-/EN-Vorgangsseite | Jira-Doku DE/EN | erledigt |
| Kein `105-5` erzeugt | `J01-105` zeigt weiterhin nur `105-1` bis `105-4` | `J01-105` DE/EN | erledigt |
| Folgebezug sichtbar | `J01-105` und `J01-123` nennen `J01-129` als ausgelagerte Folgearbeit | Jira-Doku DE/EN | erledigt |
| Architekturfrage klar benannt | Ziel und Abgrenzung des möglichen Konfig-Objekts sind nachvollziehbar | diese Vorgangsseite | erledigt |
| Sprint offen gelassen | Vorgang ist als Folgearbeit für späteren Sprint oder Backlog lesbar | diese Vorgangsseite | erledigt |

## Links

- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})
- [105-2 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-123/" | relative_url }})
