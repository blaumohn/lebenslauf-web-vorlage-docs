---
layout: page
title: "Runbook: Jira-Übersicht aktualisieren"
permalink: /de/operations/runbook/
---

## Zweck

Die öffentliche, statische Jira-Übersicht in diesem Repo aktualisieren:

- DE: `/de/mirror/`, `/de/mirror/sprint-board/`, `/de/mirror/backlog/`,
  `/de/mirror/erledigt/`, `/de/mirror/issues/J01-*/`
- EN: `/en/mirror/`, `/en/mirror/sprint-board/`, `/en/mirror/backlog/`,
  `/en/mirror/erledigt/`, `/en/mirror/issues/J01-*/`
- Schritt-Seiten nur bei Subtasks mit Angaben:
  `/de/mirror/issues/<PARENT>/steps/<SUBTASK_KEY>/` und
  `/en/mirror/issues/<PARENT>/steps/<SUBTASK_KEY>/`
- Zusätzlich: Jira Remote Links werden (gefiltert) als Linkliste im Mirror angezeigt
  (nur Doku-Domain; als site-relative Links gerendert).

## Voraussetzungen

- Zugriff auf das `atlassian`-CLI (Tool-Eigentümer ist lokal konfiguriert) und `jq`
- Schreibrechte im Repo
- Regeln (öffentlich): keine Jira-Cloud-Links, keine E-Mail-Adressen

## Schritte

1) Änderungen an Vorgängen/Status in Jira durchführen (SSOT für Vorgänge/Status).
   - Bei Sprint-Arbeit zusätzlich:
     aktiven Sprint prüfen, Sprint-Labels setzen und öffentliche Sprint-Doku
     aktualisieren.
   - Für dieselbe öffentliche Arbeitsdoku in Jira nur einen kanonischen
     Remote-Link pflegen; die DE/EN-Aufspaltung bleibt Aufgabe von GitHub
     Pages und Mirror.

2) Jira-Übersicht generieren:

```bash
sh scripts/update-jira-mirror.sh
```

Optional (on demand, „neu baselinen“):

```bash
sh scripts/update-jira-mirror.sh --full
```

Optional (journalisierter Normalmodus bei bekannten Änderungen):

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/journal-sync-jira-change.sh --change J01-95:summary
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/journal-sync-pages-change.sh HEAD~1
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/resume-open-syncs.sh
```

3) GitHub-Pages-Ziele aus Jira lokal bestätigen:

```bash
sh scripts/verify-jira-ghpages-links.sh
```

Dabei gilt für die Umwandlung aus Jira-URLs:

- `https://docs.template.ysdani.com/...` wird zu einer site-relativen URI.
- neutrale Seiten bleiben nur `/` oder `/index.html`
- sprachgebundene Seiten werden im DE-Kontext auf `/de/...` und im EN-Kontext
  auf `/en/...` bestätigt
- bestätigt wird lokal gegen dieses GitHub-Pages-Repo

4) Stichprobe (inhaltlich):
   - Subtasks ohne Angaben haben **keine** eigene Seite (nur Schritt-Nr/Titel/Zustand beim Parent).
   - Subtasks mit Angaben haben eine Schritt-Seite (URL enthält den Subtask-Key; Linktext bleibt ParentNr-SchrittNr).

5) Hygiene (Policy):
  - Keine `atlassian.net` Links im Output.
  - Keine E-Mail-Adressen im Output.
- Remote Links zeigen nicht als absolute Doku-Domain, sondern als relative Site-Links.
- Remote Links folgen im Mirror dem Sprachkontext der Seite
  (`/de/...` auf DE-Seiten, `/en/...` auf EN-Seiten).
- Jira selbst hält für dieselbe Arbeitsdoku keine doppelten DE/EN-Remote-Links.
  - Sprint-Board gruppiert die aktuelle Sprint-Arbeit nach Kategorie-Labels
    (`sprint-goal`, `sprint-support`, `sprint-admin`, `sprint-unplanned`).
  - Im Sprint-Board erscheinen nur dieselben Top-Level-Vorgänge wie im
    Jira-Board; Schritte bleiben auf Parent-/Step-Seiten sichtbar.
  - Nach dem DE-Render wird der EN-Mirror als abgeleitete Kopie synchronisiert.

## Rollback

- `git checkout -- mirror/` (oder gezielt einzelne Dateien) und erneut generieren.

## Monitoring

- Sprint-Board/Backlog/Erledigt stimmen mit Jira-Statuskategorien überein.
- Das Sprint-Board zeigt die Sprint-Kategorien in eigener Zeilenstruktur.
- Issue-/Step-Seiten enthalten je Vorgang `**Aktualisiert:** …` (Jira-Quelle).
- `git` ist die verlässliche Historie: Diffs entstehen nur bei Inhaltsänderung.
- `scripts/verify-jira-ghpages-links.sh` bestätigt die aus Jira importierten
  GitHub-Pages-Ziele lokal für DE und EN.
- `.local/jira-sync-cache/` und `.local/jira-sync-journal/` halten den
  lokalen Snapshot- und Resume-Zustand für den journalisierten Normalmodus.
