---
layout: page
title: "Drift-Report: J01-91 (Stand 2026-03-06)"
permalink: /de/quality/drift-reports/J01-91/
---

## Scope

- Erfasst: menschen-geschriebene Doku-Seiten (kein `mirror/`).
- Querabgleich: Repo-Quellen (`atlassian-tools`, `lebenslauf-web-vorlage`,
  `pipeline-config-spec-php`) und Doku-Skripte in diesem Repo.

## Kurzfazit

- P1: Mehrere Seiten mussten von „Ist-Behauptung“ auf „Zielbild/Geplant“
  umformuliert werden.
- P2/P3: Mehrere Bereiche sind noch Platzhalter (bewusst, als Phase-2-Arbeit).

## Ergänzende Teilberichte

- [J01-91: Zustand/Vorhaben (Snapshot)]({{ "/de/work/jira/J01-91/" | relative_url }})
- [J01-91: Bereiche-Inventar]({{ "/de/work/jira/J01-91/area-inventory/" | relative_url }})
- [J01-91: Archiv-Auswertung]({{ "/de/work/jira/J01-91/archive-topics/" | relative_url }})
- [J01-91: Policy-Delta-Vorschläge]({{ "/de/work/jira/J01-91/policy-deltas/" | relative_url }})
- [Abdeckung: geprüfte Seiten]({{ "/de/quality/drift-reports/J01-91/coverage/" | relative_url }})

## Feststellungen

| Prio | Seite | Claim | Quelle | Status | Fix | Jira |
| --- | --- | --- | --- | --- | --- | --- |
| P0 | `areas/proj-doku-tooling/api-betriebe/` | Beispiele zeigen nicht existierende CLI-Kommandos als Ist. | `../atlassian-tools/cli/bin/atlassian` (exponierte Subcommands) | behoben | Beispiele auf tatsächliche `jira ext`-Kommandos umgestellt; geplante Kandidaten sind als „geplant“ markiert. |  |
| P1 | `quality/testmatrix/` | „Jira-Issues verlinken …“ klingt wie Ist-Stand. | Seite selbst + Jira Remote Links + Mirror-Link-Import | behoben | Text auf Zielbild umformuliert. |  |
| P1 | `getting-started/` | SSOT/Onboarding nennt veraltete Quellen als aktuellen Kontext. | Seite selbst | behoben | Kontext auf „Doku: GitHub Pages SSOT; Vorgänge/Status: Jira SSOT; Notizrepo privat“ umgestellt. |  |
| P2 | `areas/proj-doku-tooling/` | Tooling-Repo heißt `proj-doku-tools`. | Workspace-Repos: `../atlassian-tools/` | behoben | Repo-Bezeichnung auf `atlassian-tools` korrigiert (Area-ID bleibt `proj-doku-tooling`). |  |
| P2 | `decisions/adr-0002/` | Link nennt Tooling-Repo `proj-doku-tools`. | Workspace-Repos: `../atlassian-tools/` | behoben | Link/Bezeichnung auf `atlassian-tools` korrigiert. |  |
| P2 | `index.md` | Beispieltext legt Confluence als aktuelle Quelle nahe. | Seite selbst | behoben | Beispieltext neutralisiert (Runbooks/Entscheidungen). |  |
| P2 | `README.md` | Confluence wirkt wie aktuelle Quelle. | README selbst | behoben | README-Text auf „migriert/konsolidiert“ umformuliert. |  |
| P3 | `areas/cli-build/` | Platzhalter. | Seite selbst | bestätigt | Bereich entweder füllen (Ist/Plan) oder entfernen, bis Inhalt existiert. |  |
| P3 | `areas/http-runtime/` | Platzhalter. | Seite selbst | bestätigt | Bereich entweder füllen (Ist/Plan) oder entfernen, bis Inhalt existiert. |  |
| P3 | `architecture/` | Platzhalter. | Seite selbst | behoben | Stub entfernt (kein eigener Architektur-Bereich, solange er nicht wirklich gefüllt ist). |  |

## Vorschlag: Nächste Schritte (aus dem Report ableitbar)

1. `areas/proj-doku-tooling/api-betriebe/`: Inhalte strikt „Ist“ vs „geplant“
   trennen, Beispiele aus realen CLI-Subcommands ableiten.
2. `getting-started/`: Einstieg auf aktuelle Systemlandschaft umstellen.
3. Policy-Deltas als konkrete Änderungen vorbereiten (siehe Teilbericht),
   aber erst nach Abstimmung in die Policy übernehmen.
