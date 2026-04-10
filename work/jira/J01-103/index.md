---
layout: page
title: "J01-103: Offene Zielerfüllung aus J01-91 für Public-Doku und Übernahmestatus nachziehen"
jira_key: J01-103
permalink: /de/jira/issues/J01-103/
---

**Stand:** 2026-04-10

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-103`.
Der Vorgang zieht die offen gebliebene Zielerfüllung aus `J01-91` nach, ohne
den bereits geschlossenen Strukturteil von `J01-91` rückwirkend umzudefinieren.

## Ziel

Die öffentliche Zielerfüllung aus `J01-91` belastbar nachziehen:

- Orientierung für HR/Dev als überprüfbares Zielbild ausformulieren
- je größerem Alt-Thema Entscheidung und Umsetzungsstand sichtbar machen
- belegbar machen, was aus Altquellen wirklich übernommen wurde und was nur
  Zielort oder Folgearbeit bleibt

## Aktueller Stand

- `J01-91` bleibt als Struktur- und Entscheidungs-Snapshot bestehen.
- Die neue Fassung von `J01-91` trennt jetzt zwischen erreichtem Strukturteil
  und offener Zielerfüllung.
- `archive-topics` trennt jetzt öffentlich zwischen
  `Übernahmeentscheidung` und `Umsetzungsstand`.
- Der eigentliche Vollabgleich und die vollständige Nachschärfung des
  öffentlichen Zielbilds stehen noch aus und werden nicht mehr in den
  laufenden Sprint gedrückt.
- Der Restpfad `docs/ENVIRONMENTS.md` ist im Zuge von `J01-105` als
  duplizierender App-Doku-Ort entfernt; die verbliebenen Hinweise liegen in
  README, Manifest und Pipeline-Spec-Doku.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Zielteile aus `J01-91` sind explizit bewertet | Orientierung, Migration, Transparenz, Struktur und Nachweis sind als getrennte Zielteile sichtbar | [J01-91]({{ "/de/jira/issues/J01-91/" | relative_url }}) | teilweise |
| `archive-topics` trennt Entscheidung und Ausführung | Die Seite mischt nicht mehr Soll und Ist in einem Einzelstatus | [Archiv-Themen]({{ "/de/jira/issues/J01-91/archive-topics/" | relative_url }}) | teilweise |
| Offene Zielerfüllung ist nicht in `J01-100` versteckt | `J01-103` ist als eigener Folgeort aus `J01-91` verlinkt und beschrieben | diese Seite + [J01-91]({{ "/de/jira/issues/J01-91/" | relative_url }}) | teilweise |
| Restpfad für Konfig-/Preview-Doku ist benannt | Der frühere Punkt `docs/ENVIRONMENTS.md` ist nicht mehr als eigener Doku-Ort nötig und über `J01-105` bereinigt | diese Seite + [J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }}) | erledigt |
| Öffentliche Arbeitsdoku ist aus Jira erreichbar | Jira hält den kanonischen Link auf `/de/jira/issues/J01-103/` | Jira-Remote-Link für `J01-103` | erledigt |

## Abschlussbild oder offene Punkte

- `J01-103` ist kein Sprint-1-Nachzügler, sondern der explizite Kandidat für
  die nächste Sprint-Planung.
- `J01-98` bleibt auf den sprintrelevanten Preview-Ausschnitt begrenzt.
- `J01-100` bleibt bei den übrigen `docs/agile`-Resten und ersetzt nicht die
  offene Zielerfüllung aus `J01-91`.

## Links

- Jira-Metadaten verlinken `J01-103` jetzt explizit mit `J01-91` und
  `J01-100`.
- [J01-91: Zustand/Vorhaben (Snapshot)]({{ "/de/jira/issues/J01-91/" | relative_url }})
- [J01-98: sprintrelevante Preview-Migration]({{ "/de/jira/issues/J01-98/" | relative_url }})
- [J01-100: docs/agile-Reste nach Sprint 1]({{ "/de/jira/issues/J01-100/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
