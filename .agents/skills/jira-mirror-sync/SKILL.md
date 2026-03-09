---
name: jira-mirror-sync
description: Verwende diesen Skill, wenn die öffentliche Jira-Übersicht (`mirror/`) in diesem Repo aktualisiert werden soll. Nicht verwenden für direkte Code-Änderungen in anderen Repos.
---

## Ziel

Aktualisiere den Jira-Spiegel (`mirror/`) so, dass er konsistent und greppbar
bleibt, ohne unnötige Jira-API-Last zu erzeugen.

## Geltungsbereich

Arbeite nur in diesem Repo:

- `mirror/`
- `scripts/`
- `operations/` (Runbook, falls nötig)

Arbeite nicht in:

- anderen Repos im Workspace
- Jira-Schreiboperationen (Remote Links, Statusänderungen) — das ist ein eigener Skill/Arbeitsgang

## Eingaben

- optional: „touched keys“ (Jira-Keys), die durch eine Jira-Änderung betroffen sind
  - Format: `J01-91,J01-72`
  - oder Datei mit einem Key pro Zeile

- optional: Git-Base-Ref für Diff-Key-Erkennung (z. B. `HEAD~1`)

## Vorgehen

1. Wenn „touched keys“ nicht explizit bekannt sind:
   - Keys aus dem lokalen Diff ableiten:
     - `sh scripts/detect-jira-keys-from-git-diff.sh <base-ref>`

2. Mirror inkrementell aktualisieren:
   - Standard:
     - `sh scripts/update-jira-mirror.sh --touched-keys "<csv>"`
   - On demand (neu baselinen):
     - `sh scripts/update-jira-mirror.sh --full`

3. Abnahme (kurz):
   - keine Jira-Cloud-Links, keine E-Mail-Adressen
   - `mirror/` enthält die erwarteten Links (greppbar)
   - Diffs entstehen nur bei Inhaltsänderung (kein Zeitstempel-Noise)

## Ausgabe

- aktualisierte Dateien unter `mirror/`
- optional: Hinweis, welche Keys als „touched“ verwendet wurden

