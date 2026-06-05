---
layout: page
title: "62-8 — Home- und Index-Inhalt aus Seitendaten ableiten"
permalink: /de/jira/issues/J01-62/steps/J01-154/
jira_key: J01-154
jira_parent_key: J01-62
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Ziel

Production mit einem gültigen öffentlichen Profil und realen Seitendaten
betreiben.

## Abschlussstand

Fachlich umgesetzt; Jira-Nachzug offen.

Die Production-Pipeline-Konfiguration verwendet `LEBENSLAUF_PUBLIC_PROFILE:
gueltig` statt des Dev-Profils. Die HTTP-Smokes lesen den erwarteten CV-Namen
dynamisch aus der Inhalts-YAML.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Production-Profil | Production verwendet ein vorhandenes öffentliches Profil | Commit `d5202b6`, `src/resources/pipeline-config/prod.yaml` | erledigt |
| Inhalts-Smoke | Smoke-Erwartungen stammen aus der Inhalts-YAML | Commits `4498f3c`, `4c5f63c` | erledigt |
| Jira-Status | Jira zeigt den fachlichen Abschluss | `J01-154` | offen |

## Links

- [Parent J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }})
