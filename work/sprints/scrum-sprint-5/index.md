---
layout: page
title: "SCRUM Sprint 5: Review, Retro und Carry-over — Produktion live"
permalink: /de/work/sprints/scrum-sprint-5/
---

**Zeitraum:** 2026-05-23 bis 2026-06-04

**Status:** abgeschlossen

## Beteiligte

- Dani Y.
- Codex-Agent

## Sprint-Ziel

Produktion live bringen: Production-Branch, Environment, Smoke-Checks,
Mail-/Token-/Runtime-Admin-Rest und Betriebsdoku so schließen, dass der
Production-Pfad praktisch nutzbar wird.

## Sprint-Backlog

### Sprint-Ziel

- [J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }}) —
  Production-Branch- und Environment-Regeln aktivieren
- [J01-65]({{ "/de/jira/issues/J01-65/" | relative_url }}) —
  Production-Artefakt- und Smoke-Checks definieren
- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }}) —
  CI/CD-Tools für CV-Token-Erzeugung und Runtime-Admin-Betrieb

### Sprint-Support

- [J01-68]({{ "/de/jira/issues/J01-68/" | relative_url }}) —
  Production-Betriebsdoku und Runbook

### Sprint-Admin

- [J01-150]({{ "/de/jira/issues/J01-150/" | relative_url }}) —
  Sprint 5 planen und Produktion live bringen
- [J01-145]({{ "/de/jira/issues/J01-145/" | relative_url }}) —
  Laufende Doku-Wartung

### Ungeplant / laufend

- [J01-137]({{ "/de/jira/issues/J01-137/" | relative_url }}) —
  Laufende CV-UI-Anpassungen
- [J01-151]({{ "/de/jira/issues/J01-151/" | relative_url }}) —
  Laufende technische Chores

## Planning-Entscheidung

- Sprint 5 übernimmt die offenen Production-Reste aus Sprint 4 bewusst als
  Zielarbeit.
- Laufende Doku-Wartung bleibt im Sprint sichtbar, weil sie den öffentlichen
  Jira-/Doku-Spiegel und Sprint-Artefakte trägt.
- Laufende CV-UI-Arbeit bleibt sichtbar als zusätzliche laufende Arbeit, ist
  aber nicht Teil des Sprint-Ziels.
- Laufende technische Chores bekommen einen eigenen Sprint-5-Sammelvorgang,
  damit Dependabot- und ähnliche Wartungsarbeiten nicht in Doku- oder
  UI-Vorgängen landen.

## Risiken

- Production darf nicht nur technisch vorbereitet bleiben; der Sprint muss auf
  einen real nutzbaren Live-Pfad schneiden.
- Runtime-Admin- und CV-Token-Arbeit dürfen nicht ohne klare Betriebsgrenzen
  neben dem Deployment-Pfad liegen.
- Doku-/Mirror-Arbeit muss den Sprint begleiten, darf aber das Ziel nicht
  verdrängen.

## Scope-Änderungen

- 2026-05-23: Sprint gestartet, Doku-/CV-Laufvorgänge bewusst mit aufgenommen.
- 2026-05-28: `J01-151` als laufenden technischen Chore-Sammelvorgang ergänzt.
- 2026-06-01: Die Go-live-Restarbeit unter `J01-62` in `J01-152`,
  `J01-153` und `J01-154` konkretisiert.
- 2026-06-04: Sprint geschlossen; Go-live als erreicht bestätigt.

## Review

- Das Sprint-Ziel „Produktion live!“ wurde erreicht.
- Der gemeinsame Deploy-Workflow für `preview` und `prod`, die
  branchbasierte Environment-Auswahl und die Production-Pipeline-Konfiguration
  sind umgesetzt.
- Die Production-Inhaltsquelle wird im CI-Pfad per SFTP geladen; der
  Publish-Pfad baut, überträgt und veröffentlicht CV-HTML mit anschließendem
  HTTP-Smoke.
- Post-Deploy-Smokes, Rollback-Verhalten und Deploy-History sind im
  produktiven Code und in Tests verankert.
- Der öffentliche Sprint- und Vorgangsstand war beim Abschluss noch nicht
  vollständig nachgezogen und wird mit diesem Abschlusslauf korrigiert.

## Retro

- Der Sprint-Zuschnitt war als Leitfokus nützlich, die eigentliche Umsetzung
  lief aber überwiegend über konkrete Untervorgänge und technische Commits.
- Laufende Sammelvorgänge blieben sinnvoll für Doku und kleine Chores; ihre
  Titel mit „Sprint 4“ oder „Sprint 5“ sind nach dem Sprintende jedoch
  missverständlich und brauchen einen bewussten Folgezuschnitt.
- Planungsseiten dürfen nicht bis nach dem Go-live im Planungszustand bleiben.
  Der Abschlusslauf muss Sprintseite, Vorgangsstände und Jira gemeinsam
  nachziehen.

## Carry-over

- `J01-150` ist als Sprint-Admin-Vorgang abgeschlossen.
- Noch offene fachliche oder laufende Vorgänge werden nicht automatisch als
  unerledigte Go-live-Arbeit bewertet. Sie bleiben Backlog- oder
  Wartungsvorgänge und brauchen vor einem neuen Sprint eine bewusste
  Einordnung.

## Quellenabgleich

Jede Sektion dieser Sprint-Seite wurde gegen folgende Quellen geprüft:

- Tagebuch: Sprintstart vom 2026-05-23, Go-live-Abgleich vom 2026-06-01,
  J01-64-Nachtrag vom 2026-06-03 und Sitzungsindex KW 22.
- Codex- und Claude-Sitzungen: über die im Tagebuch verdichteten
  Sitzungsregister und die dort genannten Thread-/Sitzungs-IDs.
- Commit-Historie: Hauptrepo-Commits zu `J01-64`, `J01-152`, `J01-153` und
  Go-live-Nacharbeit bis 2026-06-04.

Nicht mehr aktuelle Planungs- und Risikosätze wurden in Review-, Retro- oder
Carry-over-Aussagen überführt. Historische Planning-Entscheidungen bleiben als
Entscheidungsprotokoll erhalten.
