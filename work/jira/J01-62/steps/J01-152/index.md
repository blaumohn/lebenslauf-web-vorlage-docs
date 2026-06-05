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

## Abschlussstand

Fachlich umgesetzt; Jira-Nachzug offen.

Der CI-Pfad lädt die Lebenslauf-Inhaltsquelle per SFTP und prüft diesen Ablauf
in der Pipeline. Hauptnachweis ist der Commit `318d77e`.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Inhaltsquelle | CI lädt die Production-Inhaltsquelle per SFTP | Hauptrepo-Commit `318d77e` | erledigt |
| Pipeline-Test | Der Fetch ist im CI-Pfad prüfbar | Hauptrepo-Tests zum Commit `318d77e` | erledigt |
| Jira-Status | Jira zeigt den fachlichen Abschluss | `J01-152` | offen |

## Öffentliche Hinweise

Keine sensiblen Werte, Tokens oder internen Zugangsdaten dokumentieren.
