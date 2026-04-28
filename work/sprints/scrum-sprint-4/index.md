---
layout: page
title: "SCRUM Sprint 4: Planning"
permalink: /de/work/sprints/scrum-sprint-4/
---

**Zeitraum:** 2026-04-28 bis 2026-05-12  
**Status:** aktiv

## Beteiligte

- Dani Y.
- Codex-Agent

## Sprint-Ziel

CI/CD-Tools für CV-Token-Erzeugung und Runtime-Admin-Betrieb starten und den
Production-Deployment-Pfad praktisch eröffnen.

## Sprint-Backlog

### Sprint-Ziel

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }}) —
  CI/CD-Tools für CV-Token-Erzeugung und Runtime-Admin-Betrieb
- [J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }}) —
  Production-Branch- und Environment-Regeln aktivieren
- [J01-65]({{ "/de/jira/issues/J01-65/" | relative_url }}) —
  Production-Artefakt- und Smoke-Checks definieren

### Sprint-Support

- [J01-68]({{ "/de/jira/issues/J01-68/" | relative_url }}) —
  Production-Betriebsdoku und Runbook

### Sprint-Admin

- [J01-136]({{ "/de/jira/issues/J01-136/" | relative_url }}) —
  Sprint 4 planen, Sprint 3 abschließen und öffentliche Artefakte nachziehen

## Planning-Entscheidung

- `J01-13` und `J01-31` bleiben außerhalb des aktiven Sprints, weil ihre
  Bedeutung und ihr Beitrag im letzten Sprint aktuell nicht belastbar geklärt
  sind.
- Diese Klärung ist spätere Drift-Bericht-Arbeit, nicht Teil des Sprint-4-Ziels.
- Die neue Zielarbeit wird in zwei Linien gelesen:
  CI/CD-/Runtime-Admin-Betrieb und Production-Deployment.
- Production startet mit den bestehenden Vorgängen unter dem Epic
  [J01-7]({{ "/de/jira/issues/J01-7/" | relative_url }}).

## Risiken

- CV-Token-Erzeugung und Runtime-Admin-Betrieb dürfen nicht als lose
  Handarbeit neben der Pipeline verbleiben.
- Production-Deployment braucht früh klare Branch-, Environment- und
  Smoke-Check-Grenzen.
- Sprint-Admin-Arbeit bleibt sichtbar, darf aber die beiden Zielrichtungen
  nicht verdrängen.
