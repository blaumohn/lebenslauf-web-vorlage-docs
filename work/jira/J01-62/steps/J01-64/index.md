---
layout: page
title: "62-3 — Environment aktivieren"
permalink: /de/jira/issues/J01-62/steps/J01-64/
jira_key: J01-64
jira_parent_key: J01-62
status: "Erledigt"
priority: "Medium"
labels:
  - production
  - sprint-goal
updated: 2026-06-03
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[62-3]({{ "/de/jira/issues/J01-62/steps/J01-64/" | relative_url }}) unter
[J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }}).

## Ziel

Preview und Produktion verwenden verbindliche GitHub-Environments und einen
einheitlichen Deployment-Workflow. Branch, Pipeline und Environment werden
nachvollziehbar aus dem Branch-Kontext abgeleitet.

## Aktueller Stand

`J01-64` ist fachlich erledigt. Der Hauptrepo-Stand aktiviert den generischen
Deploy-Workflow für `preview` und `prod`; `PIPELINE` und GitHub-Environment
werden aus dem Branch-Namen bestimmt.

Der Arbeitslauf vom 2026-06-03 ergänzt die öffentliche Arbeitsseite
nachträglich, weil mehrere Hauptrepo-Commits `J01-64` referenzieren und die
Commit-Sektion nur mit einer eigenen Schrittseite sauber auffindbar ist.

## Nachtrag 2026-06-03: Pipeline-Variablen

Der nachgelagerte Deployment-Fix ergänzt die vollständige Übergabe der
Pipeline-Variablen im Workflow und filtert leere Werte vor der weiteren
Verarbeitung. Damit bleibt die Promotion fachlich bei `dev -> preview -> prod`,
ohne den Fix direkt und ungeprüft auf Produktionszweige zu schieben.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Branch-Mapping | `preview` und `prod` lösen den gemeinsamen Deploy-Workflow aus | `.github/workflows/deploy.yml`, Branches `preview` und `prod` | erledigt |
| Environment-Auswahl | GitHub-Environment und `PIPELINE` werden aus `github.ref_name` abgeleitet | `.github/workflows/deploy.yml` | erledigt |
| Pipeline-Variablen | Benötigte Pipeline-Variablen werden vollständig übergeben; leere Werte werden gefiltert | Hauptrepo-Commit `3cbdbae` | erledigt |
| Commit-Sektion | `J01-64`-Commits erscheinen auf der öffentlichen Schrittseite | `_data/jira_commits.json`, Abschnitt „Commits“ | erledigt |

## Abschlussbild

`62-3` bleibt als erledigter Environment-Aktivierungsschritt dokumentiert. Neue
Go-live-Restpunkte laufen nicht über diese Seite, sondern über die Folgepunkte
von `J01-62`.

## Links

- [Parent J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }})
