---
layout: page
title: "SCRUM Sprint 3: Review, Retro und Carry-over"
permalink: /de/work/sprints/scrum-sprint-3/
---

**Zeitraum:** 2026-04-15 bis 2026-04-29  
**Status:** abgeschlossen am 2026-04-28

## Beteiligte

- Dani Y.
- Codex-Agent

## Sprint-Ziel

Preview-Deployment fertig machen.

## Sprint-Kontext aus Sprint 2

- [J01-9]({{ "/de/jira/issues/J01-9/" | relative_url }}) wurde als klare
  operative Preview-Arbeit weitergeführt.
- [J01-13]({{ "/de/jira/issues/J01-13/" | relative_url }}) und
  [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }}) standen im
  Sprint-Kontext, ihr konkreter Beitrag zum letzten Sprint ist im Rückblick
  aber nicht belastbar geklärt.
- Diese beiden Vorgänge werden deshalb nicht als erledigte oder sinnvoll
  fortgeführte Zielarbeit beschrieben; ihr Zusammenhang soll später in einem
  Drift-Bericht geprüft werden.
- [J01-131]({{ "/de/jira/issues/J01-131/" | relative_url }}) wird als
  `sprint-admin` mitgeführt, weil der Sprintwechsel selbst dokumentiert und
  geprüft werden muss.

## Sprint-Backlog

### Sprint-Ziel

- [J01-9]({{ "/de/jira/issues/J01-9/" | relative_url }}) —
  Preview-Deployment nach `dev`-Merge betrieblich ausführen und nachweisen

### Unklarer Sprint-Kontext

- [J01-13]({{ "/de/jira/issues/J01-13/" | relative_url }}) —
  Bedeutung und Beitrag im Sprint sind nicht belastbar geklärt.
- [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }}) —
  Bedeutung und Beitrag im Sprint sind nicht belastbar geklärt.

### Admin / Rahmen

- [J01-131]({{ "/de/jira/issues/J01-131/" | relative_url }}) —
  Sprint 3 planen, Sprint 2 abschließen und öffentliche Artefakte nachziehen

## Vorläufig nicht übernommen

- Erledigte Sprint-2-Arbeit bleibt in der Historie:
  `J01-105`, `J01-119`, `J01-120`, `J01-121`, `J01-126`
- Backlog-Arbeit ohne unmittelbaren Preview-Zielbezug bleibt außerhalb des
  aktiven Sprints.

## Planning-Entscheidung

- Sprint 3 setzt das Preview-Ziel fort; im Rückblick ist nur
  [J01-9]({{ "/de/jira/issues/J01-9/" | relative_url }}) als klare
  operative Zielarbeit belastbar.
- [J01-13]({{ "/de/jira/issues/J01-13/" | relative_url }}) und
  [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }}) bleiben als
  ungeklärter Sprint-Kontext sichtbar und gehören in eine spätere
  Drift-Prüfung.
- Der frühere Support-Blocker `J01-105` wird nicht mehr übernommen, weil er
  erledigt ist und `J01-9` nicht mehr blockiert.
- Neue Nebenarbeit wird nur aufgenommen, wenn sie explizit als
  `sprint-support`, `sprint-admin` oder `sprint-unplanned` markiert wird.

## Risiken

- `J01-9` bleibt der operative Engpass: Der Preview-Lauf muss jetzt
  tatsächlich ausgeführt und belegt werden.
- `J01-13` und `J01-31` zeigen eine Planungsunschärfe: Ihre Bedeutung im
  letzten Sprint ist nicht klar genug belegt.
- Doku-/Jira-Betrieb muss aktuell bleiben, darf aber das Preview-Ziel nicht
  erneut verdrängen.

## Review

### Gemacht

- [J01-9]({{ "/de/jira/issues/J01-9/" | relative_url }}) wurde samt den
  Schritten `J01-10`, `J01-11`, `J01-12`, `J01-132`, `J01-133` und `J01-134`
  auf `Erledigt` gesetzt.
- Die frühen Schrittseiten zu `9-1` bis `9-3` wurden öffentlich sichtbar
  nachgezogen, damit der Abschlussstand nachvollziehbar bleibt.
- [J01-131]({{ "/de/jira/issues/J01-131/" | relative_url }}) wurde als
  Sprint-Admin-Arbeit abgeschlossen.

### Unklar geblieben

- [J01-13]({{ "/de/jira/issues/J01-13/" | relative_url }}) und
  [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }}) sind echte
  Aufgaben, aber ihr Beitrag im letzten Sprint ist aktuell nicht klar.
- Beide Vorgänge sollen später in einem Drift-Bericht eingeordnet werden,
  statt hier als klare Zielarbeit oder klar verfehltes Ziel zu erscheinen.

## Retro

- Gut: Der Preview-Workflow ist als zusammenhängender Vorgang abgeschlossen.
- Fehlte: Die Rolle von `J01-13` und `J01-31` im Sprint war nicht sauber
  genug geklärt.
- Nächste Änderung: Der Sprint-Fokus wird enger als Production- und
  Betriebsstart formuliert.

## Carry-over

- Kein automatisches Carry-over von `J01-13` und `J01-31`.
- Die beiden Vorgänge bleiben als spätere Drift-Prüfung außerhalb des
  Sprint-4-Ziels.
- Sprint 4 startet stattdessen mit den neuen Hauptlinien
  CI/CD-/Runtime-Admin-Betrieb und Production-Deployment.
