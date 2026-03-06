---
layout: page
title: "Abdeckung: geprüfte Seiten (ohne mirror/) – 2026-03-06"
permalink: /quality/drift-reports/J01-91/coverage/
---

Diese Liste zeigt, welche Seiten im Scope des Drift-Reports geprüft wurden
(menschen-geschrieben, ohne `mirror/`) und welchen Status sie haben.

Status-Legende:

- `ok`: keine relevante Abweichung gefunden
- `drift`: relevante Abweichung (siehe Haupt-Drift-Tabelle)
- `platzhalter`: Seite ist absichtlich noch leer/Stub

| Seite | Status | Notiz |
| --- | --- | --- |
| `index.md` | drift | Confluence-Beispieltext (siehe Haupttabelle). |
| `getting-started/index.md` | drift | SSOT-Kontext (Confluence/Arbeitsnotizen) wirkt veraltet. |
| `areas/index.md` | ok | Navigation ok; zwei Bereiche sind Stubs. |
| `areas/proj-doku-tooling/index.md` | drift | Repo-Name `proj-doku-tools` (siehe Haupttabelle). |
| `areas/proj-doku-tooling/aufbau/index.md` | ok | Modell konsistent zu Tooling-Repo. |
| `areas/proj-doku-tooling/api-betriebe/index.md` | drift | CLI-Beispiele passen nicht zum Ist-Stand. |
| `areas/proj-doku-tooling/jira-uebersicht/index.md` | ok | Regeln/Links konsistent zu `mirror/` + Runbook. |
| `areas/cli-build/index.md` | platzhalter | Inhalt fehlt. |
| `areas/http-runtime/index.md` | platzhalter | Inhalt fehlt. |
| `architecture/index.md` | platzhalter | Sehr dünn; de facto Stub. |
| `decisions/index.md` | ok | Index konsistent. |
| `decisions/adr-0001/index.md` | ok | Entscheidungskontext stimmig. |
| `decisions/adr-0002/index.md` | drift | Repo-Link `proj-doku-tools` (siehe Haupttabelle). |
| `decisions/adr-0003/index.md` | ok | Abgleich mit Tooling-Code plausibel. |
| `decisions/adr-0004/index.md` | ok | Öffentlichkeitsregeln konsistent. |
| `operations/index.md` | ok | Index konsistent. |
| `operations/ghpages-preview/index.md` | ok | Abgleich mit `compose.yaml` plausibel. |
| `operations/jira-backfill-schritt-nr/index.md` | ok | Kommandos/Begriffe konsistent zu CLI. |
| `operations/runbook/index.md` | ok | Generator-Regeln konsistent; Remote-Link-Import ist (noch) nicht Teil. |
| `policies/index.md` | ok | Index konsistent. |
| `policies/doku-richtlinie/index.md` | ok | Grundstruktur ok; Delta-Vorschläge separat. |
| `policies/programmierleitlinien/index.md` | ok | Keine Quell-Claims, eher Leitlinie. |
| `quality/index.md` | ok | Verlinkung ok. |
| `quality/testmatrix/index.md` | drift | Claim „Jira verlinkt …“ derzeit nicht erfüllt. |
| `templates/index.md` | ok | Index konsistent. |
| `templates/adr/index.md` | ok | Vorlage ok. |
| `templates/kep-lite/index.md` | ok | Vorlage ok. |
| `templates/runbook/index.md` | ok | Vorlage ok. |
| `templates/postmortem/index.md` | ok | Vorlage ok. |
| `templates/testmatrix/index.md` | ok | Vorlage ok. |
| `templates/richtlinie/index.md` | ok | Vorlage ok. |
| `templates/drift-report/index.md` | ok | Vorlage eingeführt; Regeltext präzisiert. |
| `quality/drift-reports/index.md` | ok | Index konsistent. |
| `quality/drift-reports/J01-91/index.md` | ok | Hauptreport. |
| `README.md` | drift | Confluence als aktuelle Quelle klingt zu stark. |
