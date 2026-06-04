---
layout: page
title: "J01-152 — 62-7 CI-Inhalts-YAML fuer Prod-Build bereitstellen"
permalink: /de/jira/issues/J01-62/steps/J01-152/
jira_key: J01-152
jira_parent_key: J01-62
status: "Zu erledigen"
priority: "Medium"
labels:
  - production
  - sprint-goal
sprint: "SCRUM Sprint 5"
updated: 2026-06-01
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Kontext

Diese Unteraufgabe gehört zu `J01-62` und bereitet die Inhalts-YAML vor, die der Production-Build in der CI nutzen soll.

## Ziel

Für den Production-Pfad liegt eine prüfbare Inhalts-YAML vor, die im CI-Build referenziert werden kann.

## Arbeitsumfang

- Benötigte Inhaltsdaten für den Production-Build bestimmen.
- YAML-Datei oder YAML-Struktur für CI-Nutzung bereitstellen.
- Sicherstellen, dass keine privaten oder ungeeigneten Inhalte in den öffentlichen Build gelangen.

## Prüfpunkte

- YAML ist syntaktisch gültig.
- CI kann die Inhaltsdaten eindeutig finden.
- Production-relevante Inhalte sind öffentlich geeignet.
- Bezug zu Branch- und Environment-Regeln aus `J01-62` ist nachvollziehbar.

## Status

Zu erledigen.

## Öffentliche Hinweise

Keine sensiblen Werte, Tokens oder internen Zugangsdaten dokumentieren.
