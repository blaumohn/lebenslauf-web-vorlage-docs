---
layout: page
title: "J01-99: Alte Confluence-Remote-Links in Jira bereinigen"
permalink: /de/work/jira/J01-99/
---

**Stand:** 2026-03-16

Kanonischer öffentlicher Arbeitsstand für `J01-99`.
Der Schritt räumt verbliebene alte Confluence-Remote-Links in Jira auf und
verankert einen wiederholbaren Audit-Pfad gegen Legacy-Ziele.

## Ziel

Jira-Remote-Links im J01-Bereich sollen nur noch auf kanonische
GitHub-Pages-Ziele zeigen oder bewusst fehlen, wenn kein kanonischer
öffentlicher Zielort existiert.

## Audit-Stand 2026-03-16

Der neue Legacy-Audit im Verifikationsskript hat im Projektbestand gefunden:

- 26 alte Confluence-Remote-Links
- 19 betroffene Jira-Vorgaenge
- davon 22 Links in 15 Vorgängen aus dem `J01-72`-/Tooling-Strang
- plus 4 ältere Kontext-Links in `J01-31`, `J01-16`, `J01-13`, `J01-9`
- keine Altlinks in `J01-91` selbst

## Bereinigungsregeln

- Wenn ein kanonisches GitHub-Pages-Ziel existiert:
  alten Confluence-Link durch dieses Ziel ersetzen.
- Wenn nur ein generischer alter Spezifikations-Link bleibt:
  auf die heute kanonische Fachseite umstellen.
- Wenn kein sauberer kanonischer Zielort mehr existiert:
  Link entfernen statt einen provisorischen Zielort zu erfinden.

## Zielabbildung

| Jira-Keys | Aktion | Kanonisches Ziel |
| --- | --- | --- |
| `J01-73` | ersetzen | [ADR-0003]({{ "/de/decisions/adr-0003/" | relative_url }}) |
| `J01-75`, `J01-78` | ersetzen | [Runbook: Backfill Schritt-Nr und Summary-Prefix]({{ "/de/operations/jira-backfill-schritt-nr/" | relative_url }}) |
| `J01-79`, `J01-82`, `J01-85` | ersetzen | [API-Betriebe (Wrapper)]({{ "/de/areas/proj-doku-tooling/api-betriebe/" | relative_url }}) |
| `J01-80`, `J01-81` | ersetzen | [Programmierleitlinien]({{ "/de/policies/programmierleitlinien/" | relative_url }}) |
| `J01-83` | ersetzen | [ADR-0002]({{ "/de/decisions/adr-0002/" | relative_url }}) |
| `J01-84` | ersetzen | [Bereich: Jira- und Doku-Tooling]({{ "/de/areas/proj-doku-tooling/" | relative_url }}) und [Systemüberblick]({{ "/de/areas/proj-doku-tooling/aufbau/" | relative_url }}) |
| `J01-86`, `J01-87` | ersetzen | [Jira-Übersicht (öffentlich)]({{ "/de/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }}), [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }}) und [ADR-0004]({{ "/de/decisions/adr-0004/" | relative_url }}) |
| `J01-88`, `J01-89`, `J01-90` | ersetzen | [Jira-Übersicht (öffentlich)]({{ "/de/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }}) |
| `J01-31` | ersetzen | [Startseite]({{ "/de/" | relative_url }}) |
| `J01-16` | ersetzen | [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }}) |
| `J01-13` | ersetzen | [Testmatrix]({{ "/de/quality/testmatrix/" | relative_url }}) |
| `J01-9` | ersetzen | [Betrieb (Runbook)]({{ "/de/operations/" | relative_url }}) |

## Guardrail

- `verify-jira-ghpages-links.sh --legacy-confluence-audit` meldet alte
  `atlassian.net/wiki`-Ziele explizit mit Jira-Key, Link-ID, URL und Titel.
- Der Audit wird im Runbook als fester Hygiene-Schritt dokumentiert.
- Mirror- und Link-Sync laufen danach wie bisher ueber Jira als SSOT.

## Links

- [J01-91: Abschluss-Snapshot]({{ "/de/work/jira/J01-91/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/work/jira/" | relative_url }})
