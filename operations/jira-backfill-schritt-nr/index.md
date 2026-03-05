---
layout: page
title: "Runbook: Backfill Schritt-Nr und Summary-Prefix"
permalink: /operations/jira-backfill-schritt-nr/
---

## Zweck {#zweck}

Subtasks (Schritte) bekommen eine konsistente Reihenfolge:

- `customfield_10071` („Schritt-Nr“) wird aus Rank abgeleitet und als 1..n gesetzt.
- Zusätzlich wird ein Summary-Prefix `<ParentNum>-<SchrittNum> ` gesetzt (z. B. `9-1 …`), damit Schritte auf dem Board eindeutig lesbar sind.

## Voraussetzungen {#voraussetzungen}

- Jira: Feld „Schritt-Nr“ (`customfield_10071`) ist für Issue-Type „Subtask“ setzbar (Projekt `J01`).
- Tooling: `atlassian` und `atlassian-http-client` sind installiert; Config liegt beim Tool-Eigentümer in `$HOME/.config/atlassian/http-client`.
- Abhängigkeiten: `jq` ist vorhanden.
- Berechtigungen: Schreibrechte auf Subtasks im Projekt `J01`.

## Schritte {#schritte}

1) Parents festlegen (z. B. Sprint-Parents: `J01-9`, `J01-13`, `J01-16`, `J01-31`).
2) Reihenfolge prüfen (JQL): `parent = J01-9 ORDER BY Rank ASC`.
3) Dry-Run ausführen: `atlassian jira ext backfill schritt-nr --parent J01-9 --parent J01-13 --dry-run`.
4) Ausführen: gleicher Befehl ohne `--dry-run`.
5) Verifizieren: Schritt-Nr und Summary-Prefix sind konsistent (per JQL/Issue-View).
6) Nach Umrankieren: Backfill erneut ausführen (optional mit `--force`).

## Rollback {#rollback}

1) Wenn der Summary-Prefix nicht gewünscht ist: Prefix manuell aus den betroffenen Subtask-Summaries entfernen (Scope ist auf die angegebenen Parents begrenzt).

## Monitoring {#monitoring}

- API-Fehler (4xx/5xx) und Rate-Limits beachten.
- Stichprobe: 1 Parent prüfen, bevor projektweit ausgeweitet wird.
