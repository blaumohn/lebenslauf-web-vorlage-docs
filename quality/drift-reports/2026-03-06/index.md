---
layout: page
title: Drift-Report 2026-03-06
permalink: /quality/drift-reports/2026-03-06/
---

## Scope

- Erfasst: menschen-geschriebene Doku-Seiten (kein `mirror/`).
- Querabgleich: Repo-Quellen (`atlassian-tools`, `lebenslauf-web-vorlage`,
  `pipeline-config-spec-php`) und Doku-Skripte in diesem Repo.

## Kurzfazit

- P0: Mindestens eine Seite beschreibt CLI-Kommandos, die aktuell so nicht
  existieren.
- P1: Mehrere Seiten beschreiben den Zielzustand („soll“), ohne ihn klar als
  geplant zu markieren.
- P2/P3: Mehrere Bereiche sind noch Platzhalter.

## Feststellungen

| Prio | Seite | Claim | Quelle | Status | Fix | Jira |
| --- | --- | --- | --- | --- | --- | --- |
| P0 | `areas/proj-doku-tooling/api-betriebe/` | Beispiele zeigen `subtasks list/reorder`, `issue transition`, `search jql` als vorhandene CLI-Kommandos. | `../atlassian-tools/cli/bin/atlassian` (exponierte Subcommands) | bestätigt | Beispiele und Abschnitt auf tatsächlich vorhandene `jira ext`-Kommandos umstellen und „geplant“ klar trennen. |  |
| P1 | `quality/testmatrix/` | „Jira-Issues linken auf konkrete Testseiten“ (als Ist-Stand). | `scripts/update-jira-mirror.sh` + `mirror/` (keine Remote-Link-Übernahme) | bestätigt | Text als „geplant“ markieren oder Remote-Link-Übernahme (Jira → Mirror) implementieren und dann belegen. |  |
| P1 | `getting-started/` | Onboarding-Quelle ist Confluence/Space J01 + weitere frühere Quellen. | aktueller Doku-Stand (GitHub Pages) + Jira-Remote-Link-Ansatz | bestätigt | Onboarding an „Jira + GitHub Pages“ ausrichten; Confluence nur nennen, falls noch aktiv genutzt. |  |
| P2 | `areas/proj-doku-tooling/` | Tooling-Repo heißt `proj-doku-tools`. | Workspace-Repos: `../atlassian-tools/` | bestätigt | Repo-Bezeichnung auf `atlassian-tools` ändern (Area-ID bleibt `proj-doku-tooling`). |  |
| P3 | `areas/cli-build/` | Platzhalter. | Seite selbst | bestätigt | Bereich entweder füllen (Ist/Plan) oder entfernen, bis Inhalt existiert. |  |
| P3 | `areas/http-runtime/` | Platzhalter. | Seite selbst | bestätigt | Bereich entweder füllen (Ist/Plan) oder entfernen, bis Inhalt existiert. |  |
| P3 | `architecture/` | Platzhalter. | Seite selbst | bestätigt | Architektur-Übersicht erstellen oder Platzhalter entfernen. |  |

## Vorschlag: Nächste Schritte (aus dem Report ableitbar)

1. `areas/proj-doku-tooling/api-betriebe/`: Inhalte strikt „Ist“ vs „geplant“
   trennen, Beispiele aus realen CLI-Subcommands ableiten.
2. `getting-started/`: Einstieg auf aktuelle Systemlandschaft umstellen.
3. `policies/doku-richtlinie/`: Regel ergänzen, wie „Ist/Plan“ im Text
   zu markieren ist, plus Regeln zu Jira-Links (Public-Doku vs Mirror).

