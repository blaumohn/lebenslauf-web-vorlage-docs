---
layout: page
title: "J01-95: Journalisierten Jira-/Pages-Sync mit Resume aufbauen"
jira_key: J01-95
jira_parent_key: J01-72
permalink: /de/jira/issues/J01-72/steps/J01-95/
---

**Stand:** 2026-03-14

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-95`.
Der Schritt ergänzt den Jira-/Pages-Betrieb um einen lokalen Journal- und
Resume-Pfad für bekannte Jira- und GitHub-Pages-Änderungen.

## Ziel

Bekannte Jira- oder GitHub-Pages-Änderungen gezielt nachziehen, ohne dafür im
Normalmodus jedes Mal projektweite Jira-Listenabfragen zu brauchen.

## Jetzt umgesetzt

- neuer projektbezogener Skill `jira-state-sync/` für Journal- und Resume-Läufe
- lokaler Jira-Snapshot-Cache unter `.local/jira-sync-cache/`
- lokales Laufjournal unter `.local/jira-sync-journal/`
- Mirror-Generator akzeptiert jetzt lokale Snapshot-Dateien statt nur frischer
  Jira-Abfragen
- `verify-public-jira-pages.sh` kann jetzt gezielt nur betroffene Keys prüfen
- neue Pages-Helfer:
  - Link-Änderungen aus Git-Diff ableiten
  - betroffene Jira-Keys lokal aus `mirror/` rückwärts finden
- `atlassian jira ext remotelink sync` für gezielte Docs-Link-Synchronisierung
- Der Vorgang ist in Jira auf `Erledigt` gesetzt; gezielte Status- und
  Remote-Link-Läufe für `J01-95` wurden erfolgreich nachgezogen.

## V1-Regeln

- Jira-Änderungen werden als `KEY:CLASS` erfasst.
- V1-Klassen:
  `status`, `summary`, `description`, `step_meta`, `remote_links`
- GitHub-Pages-Änderungen werden über einen Git-Base-Ref erkannt.
- `jira/` gilt in V1 als vollständige öffentliche Sicht auf Docs-Domain-Links
  aus Jira; andere Jira-Inhalte bleiben außerhalb dieses Pfads.
- Vollsync bleibt Reparaturmodus und nicht der Normalweg.

## Abschluss

- V1 liefert einen journalisierten Normalmodus für bekannte Jira- und
  GitHub-Pages-Änderungen.
- Resume, gezielte Verifikation und der Reparaturweg über Vollsync sind im
  Betrieb verankert.
- Weitere Schärfung betrifft nur spätere Erweiterungen, nicht mehr die
  Grundfunktion.

## Links

- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
