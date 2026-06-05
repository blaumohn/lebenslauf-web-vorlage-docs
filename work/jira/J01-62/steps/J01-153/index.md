---
layout: page
title: "62-9 — Publish-Pfad und laufende Inhaltsänderungen"
permalink: /de/jira/issues/J01-62/steps/J01-153/
jira_key: J01-153
jira_parent_key: J01-62
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Ziel

CV-Inhaltsänderungen über einen klaren Publish-Pfad veröffentlichen, ohne für
jede Inhaltsänderung ein vollständiges Deployment zu benötigen.

## Abschlussstand

Fachlich umgesetzt und in Jira auf `Erledigt` gesetzt.

Der Publish-Befehl baut CV-HTML, lädt es in einen Staging-Pfad, löst den
begrenzten `cv_publish`-Task aus, schreibt die Dateien atomar und prüft danach
die öffentliche URL per HTTP-Smoke.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Upload und Task | Publish überträgt HTML und löst `cv_publish` aus | Commits `33768cf`, `5ad711f` | erledigt |
| Atomisches Schreiben | Veröffentlichte HTML-Dateien werden atomar ersetzt | Commit `5ad711f`, PHP-Feature-Tests | erledigt |
| Tests | Publish-Ablauf und Fehlerfälle sind geprüft | Commit `97a3cdb` | erledigt |
| Konfiguration | Publish nutzt `PIPELINE_CFG_JSON` korrekt | Commit `7341f10` | erledigt |
| Jira-Status | Jira zeigt den fachlichen Abschluss | `J01-153` | erledigt |

## Links

- [Parent J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }})
