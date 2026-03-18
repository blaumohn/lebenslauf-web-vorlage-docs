---
layout: page
title: "Runbook: öffentliche Jira-Fläche aktualisieren"
permalink: /de/operations/runbook/
---

## Zweck

Die öffentliche Jira-Fläche in diesem Repo aktualisieren:

- DE: `/de/jira/`, `/de/jira/sprint/`, `/de/jira/backlog/`,
  `/de/jira/erledigt/`, `/de/jira/issues/J01-*/`
- EN: `/en/jira/`, `/en/jira/sprint/`, `/en/jira/backlog/`,
  `/en/jira/erledigt/`, `/en/jira/issues/J01-*/`
- Schritt-Seiten nur bei Subtasks mit Angaben:
  `/de/jira/issues/<PARENT>/steps/<SUBTASK_KEY>/` und
  `/en/jira/issues/<PARENT>/steps/<SUBTASK_KEY>/`
- Zusätzlich: Jira-Remote-Links werden gefiltert als relative Links in der
  öffentlichen Jira-Fläche angezeigt.

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

2) Öffentliche Jira-Fläche generieren:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/update-public-jira-pages.sh
```

Optional (on demand, „neu baselinen“):

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/update-public-jira-pages.sh --full
```

Optional (journalisierter Normalmodus bei bekannten Änderungen):

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/journal-sync-jira-change.sh --change J01-95:summary
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/journal-sync-pages-change.sh HEAD~1
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/resume-open-syncs.sh
```

3) GitHub-Pages-Ziele aus Jira lokal bestätigen:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/verify-public-jira-pages.sh
```

Optional: alte Confluence-Ziele gezielt auditen:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/verify-public-jira-pages.sh --legacy-confluence-audit
```

Dabei gilt für die Umwandlung aus Jira-URLs:

- `https://docs.template.ysdani.com/...` wird zu einer site-relativen URI.
- neutrale Seiten bleiben nur `/` oder `/index.html`
- sprachgebundene Seiten werden im DE-Kontext auf `/de/...` und im EN-Kontext
  auf `/en/...` bestätigt
- bestätigt wird lokal gegen dieses GitHub-Pages-Repo
- der Legacy-Audit meldet alte `atlassian.net/wiki`-Ziele als
  `LEGACY_CONFLUENCE<TAB>KEY<TAB>LINK_ID<TAB>URL<TAB>TITEL`

4) Stichprobe (inhaltlich):
   - Vorgangs- und Schrittseiten unter `jira/` zeigen kurze, sichtbare
     Querpfade zu Übersichten, Parent und öffentlichen Schritten.
   - Subtasks ohne Angaben haben **keine** eigene Seite (nur Schritt-Nr/Titel/Zustand beim Parent).
   - Grundbestand eines Subtasks sind Schritt-Nr., Titel und Status.
   - Reine Metadaten einer Schritt-Seite, etwa Parent, Schritt-Nr., Status,
     Key oder Aktualisiert-Datum, zählen **nicht** als zusätzliche Angaben.
   - Subtasks mit zusätzlichen Angaben haben eine Schritt-Seite
     (URL enthält den Subtask-Key; Linktext bleibt ParentNr-SchrittNr).
   - Zusätzliche Angaben sind eigene fachliche Inhalte oder eigene
     kanonische Verweise des Subtasks, die über Grundbestand und Metadaten
     hinausgehen.
   - Dazu zählen insbesondere eine eigene öffentliche Arbeitsdoku unter
     `work/jira/J01-<KEY>/`, ein kanonischer Jira-Remote-Link auf diese Doku,
     eigene Nachweise, eigene Abschlussaussagen oder andere eigene
     kanonische Zielseiten.
   - Wenn statt einer öffentlichen Vorgangsseite eine öffentliche Schrittseite
     unter `jira/issues/<PARENT>/steps/<SUBTASK_KEY>/` genutzt wird, gilt
     dieselbe Erwartung für kanonische Verlinkung und Nachzug.
   - Bei neuen Schrittseiten für bereits bestehende Unteraufgaben werden
     vorhandene Public-Nennungen nachgezogen, soweit sie diese Schrittseite
     oder ihren Elternvorgang direkt betreffen.
   - Wenn eine öffentliche Vorgangs- oder Schrittseite existiert, wird sie
     über die Verifikation gegen Jira-Remote-Links, Altpfade und
     Doppelpunkte geprüft.

5) Hygiene (Policy):
  - Keine `atlassian.net` Links im Output.
  - Keine E-Mail-Adressen im Output.
- Remote Links zeigen nicht als absolute Doku-Domain, sondern als relative
  Site-Links.
- Remote Links folgen in der öffentlichen Jira-Fläche dem Sprachkontext der Seite
  (`/de/...` auf DE-Seiten, `/en/...` auf EN-Seiten).
- Jira selbst hält für dieselbe Arbeitsdoku keine doppelten DE/EN-Remote-Links.
  - Sprint-Board gruppiert die aktuelle Sprint-Arbeit nach Kategorie-Labels
    (`sprint-goal`, `sprint-support`, `sprint-admin`, `sprint-unplanned`).
  - Im Sprint-Board erscheinen nur dieselben Top-Level-Vorgänge wie im
    Jira-Board; Schritte bleiben auf Parent-/Step-Seiten sichtbar.
  - Nach dem DE-Render wird der EN-Jira-Baum als abgeleitete Kopie synchronisiert.

## Rollback

- Betroffene Dateien zurücksetzen und die öffentliche Jira-Fläche erneut
  generieren.

## Monitoring

- Sprint-Board/Backlog/Erledigt stimmen mit Jira-Statuskategorien überein.
- Das Sprint-Board zeigt die Sprint-Kategorien in eigener Zeilenstruktur.
- Issue-/Step-Seiten enthalten je Vorgang `**Aktualisiert:** …` (Jira-Quelle).
- `git` ist die verlässliche Historie: Diffs entstehen nur bei Inhaltsänderung.
- `shared-tooling/jira-pages/verify-public-jira-pages.sh` bestätigt die aus
  Jira importierten GitHub-Pages-Ziele lokal für DE und EN.
- `shared-tooling/jira-pages/verify-public-jira-pages.sh` bestätigt zusätzlich
  das Fehlen öffentlicher Altpfade und doppelter Detail-URLs.
- `shared-tooling/jira-pages/verify-public-jira-pages.sh --legacy-confluence-audit`
  meldet verbliebene alte Confluence-Remote-Links mit Jira-Key und Link-ID.
- `.local/jira-sync-cache/` und `.local/jira-sync-journal/` halten den
  lokalen Snapshot- und Resume-Zustand für den journalisierten Normalmodus.
