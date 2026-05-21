---
layout: page
title: "SCRUM Sprint 4: Review, Retro und Carry-over"
permalink: /de/work/sprints/scrum-sprint-4/
---

**Zeitraum:** 2026-04-28 bis 2026-05-12  
**Status:** abgeschlossen am 2026-05-22

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

### Ungeplant

- [J01-137]({{ "/de/jira/issues/J01-137/" | relative_url }}) —
  Laufende CV-UI-Anpassungen Sprint 4
- [J01-145]({{ "/de/jira/issues/J01-145/" | relative_url }}) —
  Laufende Doku-Wartung Sprint 4

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

## Rest vor Production-Deployment

Der konkrete Mail-/Token-Admin-Rest wird in
[J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }}) geführt. Dort
bleibt die kanonische Restliste für Preview-Mail, lokalen Token-Admin,
Admin-Härtung und CI-Preview-Nachzüge vor Production.

## Review

### Gemacht

- `SCRUM Sprint 4` wurde in Jira geschlossen.
- [J01-136]({{ "/de/jira/issues/J01-136/" | relative_url }}) wurde als
  Sprint-Admin-Arbeit erledigt.
- Der öffentliche Jira-Spiegel wurde nach dem Sprintabschluss nachgezogen:
  `activeSprint` ist bei den Sprint-4-Vorgängen leer und das öffentliche
  Sprint-Board zeigt keinen aktiven Sprint mehr.

### Begonnen, aber nicht abgeschlossen

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }}) blieb
  `In Bearbeitung`.
- [J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }}) blieb
  `In Bearbeitung`.
- [J01-137]({{ "/de/jira/issues/J01-137/" | relative_url }}) und
  [J01-145]({{ "/de/jira/issues/J01-145/" | relative_url }}) blieben als
  ungeplante Sprint-Arbeit `In Bearbeitung`.

### Offen geblieben

- [J01-65]({{ "/de/jira/issues/J01-65/" | relative_url }}) blieb
  `Zu erledigen`.
- [J01-68]({{ "/de/jira/issues/J01-68/" | relative_url }}) blieb
  `Zu erledigen`.

## Retro

- Gut: Der Production- und Runtime-Admin-Fokus wurde als Sprintlinie sichtbar
  gemacht und die offene Restliste blieb in Jira nachvollziehbar.
- Fehlte: Der Sprint wurde erst nach dem geplanten Enddatum öffentlich
  geschlossen; dadurch drifteten Jira-Sprint-Zustand und öffentliche
  Sprint-Historie auseinander.
- Nächste Änderung: Sprint-Closing gehört direkt nach dem Jira-Abschluss zum
  Pflichtablauf: Jira-Zustand lesen, öffentlichen Jira-Spiegel synchronisieren,
  Sprint-Artefakt auf Review/Retro/Carry-over umstellen und den Arbeitslauf im
  `tagebuch` notieren.

## Carry-over

- Es gibt nach dem Abschluss keinen aktiven Sprint in Jira.
- Die offenen Sprint-4-Vorgänge werden deshalb nicht automatisch einem neuen
  Sprint zugeordnet.
- Vor dem Start des nächsten Sprints müssen
  [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }}),
  [J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }}),
  [J01-65]({{ "/de/jira/issues/J01-65/" | relative_url }}),
  [J01-68]({{ "/de/jira/issues/J01-68/" | relative_url }}),
  [J01-137]({{ "/de/jira/issues/J01-137/" | relative_url }}) und
  [J01-145]({{ "/de/jira/issues/J01-145/" | relative_url }}) bewusst neu
  eingeordnet werden.
