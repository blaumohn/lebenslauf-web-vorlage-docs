---
layout: page
title: "Sprint-Richtlinie"
permalink: /de/policies/sprint-richtlinie/
---

## Ziel

Den Scrum-Sprint-Rahmen für dieses Projekt so festziehen, dass

- Jira den operativen Sprint-Zustand abbildet,
- GitHub Pages die öffentliche Sprint-Historie zeigt,
- und das `tagebuch` den feineren Denk- und Arbeitsverlauf trägt.

## Begriffe

- **Projekt-Backlog**:
  alle bekannten, priorisierten oder später möglichen Arbeiten.
- **Sprint-Backlog**:
  nur die Arbeit, die im aktuellen Sprint tatsächlich verfolgt wird.
- **Aktiver Vorgang**:
  nicht `Done` und im aktuell aktiven Sprint.

## Systemrollen

- **Jira**:
  Sprint-Zustand, Sprint-Backlog, Statusfluss, Labels.
- **GitHub Pages**:
  öffentliche Sprint-Doku, Sprint-Historie, öffentlicher Jira-Spiegel.
- **`tagebuch`**:
  Rohstoff für Denkverlauf, Rundenprotokolle, Beobachtungen und feineren
  Arbeitsablauf.

## Regeln

- Alle tatsächlich bearbeiteten Arbeiten im Sprint-Zeitraum gehören in den
  aktiven Sprint.
- Sprint-Ziel und Sprint-Backlog sind nicht identisch.
- Zusätzliche Sprint-Arbeit bleibt im Sprint sichtbar und wird per Label
  gekennzeichnet.
- Wenn ein Sprint zeitlich abgelaufen ist, aber in Jira noch aktiv wirkt:
  zuerst den Sprint-Zustand bereinigen, danach normal weiterarbeiten.

## Sprint-Kategorien

- `sprint-goal`:
  direkte Arbeit am Sprint-Ziel.
- `sprint-support`:
  Arbeit, die Zielarbeit absichert, vorbereitet oder entblockt.
- `sprint-admin`:
  Doku-, Jira-, Mirror-, Skill- oder Prozessarbeit im Sprint.
- `sprint-unplanned`:
  im Sprint neu aufgenommene Arbeit.

## Öffentliche Sprint-Artefakte

- Sprint-Planning
- Sprint-Review
- Sprint-Retro
- Carry-over
- Scope-Änderungen

Diese Artefakte werden unter `work/sprints/` veröffentlicht.
