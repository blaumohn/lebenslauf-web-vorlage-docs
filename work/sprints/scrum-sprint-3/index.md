---
layout: page
title: "SCRUM Sprint 3: Planning"
permalink: /de/work/sprints/scrum-sprint-3/
---

**Zeitraum:** 2026-04-15 bis 2026-04-29  
**Status:** aktiv

## Beteiligte

- Dani Y.
- Codex-Agent

## Sprint-Ziel

Preview-Deployment fertig machen.

## Bewusstes Carry-over aus Sprint 2

- Die offenen Zielvorgänge aus Sprint 2 werden bewusst weitergeführt:
  [J01-9]({{ "/de/jira/issues/J01-9/" | relative_url }}),
  [J01-13]({{ "/de/jira/issues/J01-13/" | relative_url }}),
  [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }})
- Sie bleiben `sprint-goal`, weil das Preview-Ziel weiterhin der Leitfokus
  ist.
- [J01-131]({{ "/de/jira/issues/J01-131/" | relative_url }}) wird als
  `sprint-admin` mitgeführt, weil der Sprintwechsel selbst dokumentiert und
  geprüft werden muss.

## Sprint-Backlog

### Sprint-Ziel

- [J01-9]({{ "/de/jira/issues/J01-9/" | relative_url }}) —
  Preview-Deployment nach `dev`-Merge betrieblich ausführen und nachweisen
- [J01-13]({{ "/de/jira/issues/J01-13/" | relative_url }}) —
  Preview-Testmatrix und Entscheidungen finalisieren
- [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }}) —
  Preview-Readiness der System-Source-Verarbeitung klären

### Admin / Rahmen

- [J01-131]({{ "/de/jira/issues/J01-131/" | relative_url }}) —
  Sprint 3 planen, Sprint 2 abschließen und öffentliche Artefakte nachziehen

## Vorläufig nicht übernommen

- Erledigte Sprint-2-Arbeit bleibt in der Historie:
  `J01-105`, `J01-119`, `J01-120`, `J01-121`, `J01-126`
- Backlog-Arbeit ohne unmittelbaren Preview-Zielbezug bleibt außerhalb des
  aktiven Sprints.

## Planning-Entscheidung

- Sprint 3 setzt das Preview-Ziel fort, reduziert den aktiven Umfang aber auf
  die drei offenen Zielvorgänge und den administrativen Sprintwechsel.
- Der frühere Support-Blocker `J01-105` wird nicht mehr übernommen, weil er
  erledigt ist und `J01-9` nicht mehr blockiert.
- Neue Nebenarbeit wird nur aufgenommen, wenn sie explizit als
  `sprint-support`, `sprint-admin` oder `sprint-unplanned` markiert wird.

## Risiken

- `J01-9` bleibt der operative Engpass: Der Preview-Lauf muss jetzt
  tatsächlich ausgeführt und belegt werden.
- `J01-13` und `J01-31` können das Preview-Deployment weiter verzögern, wenn
  sie nicht aktiv entschieden werden.
- Doku-/Jira-Betrieb muss aktuell bleiben, darf aber das Preview-Ziel nicht
  erneut verdrängen.
