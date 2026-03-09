---
layout: page
title: "Runbook: Jira-Übersicht aktualisieren"
permalink: /operations/runbook/
---

## Zweck

Die öffentliche, statische Jira-Übersicht in diesem Repo aktualisieren:

- `/mirror/` (Landing)
- `/mirror/sprint-board/`
- `/mirror/backlog/`
- `/mirror/erledigt/`
- `/mirror/issues/J01-*/` (Epics/Tasks)
- Schritt-Seiten nur bei Subtasks mit Angaben: `/mirror/issues/<PARENT>/steps/<SUBTASK_KEY>/`
- Zusätzlich: Jira Remote Links werden (gefiltert) als Linkliste im Mirror angezeigt
  (nur Doku-Domain; als site-relative Links gerendert).

## Voraussetzungen

- Zugriff auf das `atlassian`-CLI (Tool-Eigentümer ist lokal konfiguriert) und `jq`
- Schreibrechte im Repo
- Regeln (öffentlich): keine Jira-Cloud-Links, keine E-Mail-Adressen

## Schritte

1) Änderungen an Vorgängen/Status in Jira durchführen (SSOT für Vorgänge/Status).

2) Jira-Übersicht generieren:

```bash
sh scripts/update-jira-mirror.sh
```

Optional (on demand, „neu baselinen“):

```bash
sh scripts/update-jira-mirror.sh --full
```

3) Stichprobe (inhaltlich):
   - Subtasks ohne Angaben haben **keine** eigene Seite (nur Schritt-Nr/Titel/Zustand beim Parent).
   - Subtasks mit Angaben haben eine Schritt-Seite (URL enthält den Subtask-Key; Linktext bleibt ParentNr-SchrittNr).

4) Hygiene (Policy):
   - Keine `atlassian.net` Links im Output.
   - Keine E-Mail-Adressen im Output.
   - Remote Links zeigen nicht als absolute Doku-Domain, sondern als relative Site-Links.

## Rollback

- `git checkout -- mirror/` (oder gezielt einzelne Dateien) und erneut generieren.

## Monitoring

- Sprint-Board/Backlog/Erledigt stimmen mit Jira-Statuskategorien überein.
- Issue-/Step-Seiten enthalten je Vorgang `**Aktualisiert:** …` (Jira-Quelle).
- `git` ist die verlässliche Historie: Diffs entstehen nur bei Inhaltsänderung.
