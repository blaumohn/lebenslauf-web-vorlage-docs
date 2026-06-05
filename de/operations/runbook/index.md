---
layout: page
title: "Runbook: öffentliche Jira-Fläche aktualisieren"
permalink: /de/operations/runbook/
---

## Zweck

Die öffentliche Jira-Fläche in diesem Repo aktualisieren:

- DE: `/de/jira/`, `/de/jira/sprint/`, `/de/jira/backlog/`,
  `/de/jira/historie/`, `/de/jira/erledigt/`, `/de/jira/issues/J01-*/`
- EN: `/en/jira/`, `/en/jira/sprint/`, `/en/jira/backlog/`,
  `/en/jira/history/`, `/en/jira/erledigt/`, `/en/jira/issues/J01-*/`
- Schritt-Seiten nur bei Subtasks mit Angaben:
  `/de/jira/issues/<PARENT>/steps/<SUBTASK_KEY>/` und
  `/en/jira/issues/<PARENT>/steps/<SUBTASK_KEY>/`
- Zusätzlich: Jira-Remote-Links werden gefiltert als relative Links in der
  öffentlichen Jira-Fläche angezeigt.

## Voraussetzungen

- Zugriff auf das `atlassian`-CLI (Tool-Eigentümer ist lokal konfiguriert) und `jq`
- Schreibrechte im Repo
- Regeln (öffentlich): keine Jira-Cloud-Links, keine E-Mail-Adressen

## Pfadsemantik

- `work/...` ist der öffentliche Quellpfad für Jira-Arbeitsdokus in diesem Repo.
- Öffentliche URI-Pfade laufen unter `/de/...` und `/en/...`.
- Eine Arbeitsdoku kann also im Dateisystem unter
  `work/jira/J01-106/index.md` liegen und gleichzeitig öffentlich unter
  `/de/jira/issues/J01-106/` erscheinen.
- Der Zusammenhang wird über `permalink` und die Generator-/Jekyll-Logik
  hergestellt, nicht durch eine 1:1-Spiegelung der Ordnernamen.

## Schritte

1) Änderungen an Vorgängen/Status in Jira durchführen (SSOT für Vorgänge/Status).
   - Bei Sprint-Arbeit zusätzlich:
     aktiven Sprint prüfen, Sprint-Labels setzen und öffentliche Sprint-Doku
     aktualisieren.
   - Für dieselbe öffentliche Arbeitsdoku in Jira nur einen kanonischen
     Remote-Link pflegen; die DE/EN-Aufspaltung bleibt Aufgabe von GitHub
     Pages und der öffentlichen Jira-Seiten.

2) Normalweg bei bekannten Änderungen:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/run-sync.sh jira-change --change J01-95:summary
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/run-sync.sh pages-change HEAD~1
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/run-sync.sh resume
```

Wenn ein gezielter Lauf vor dem Schreiben Rückschritte bei unbehandelten
Keys erkennt, bricht der Guard den Lauf ab. Das ist als Systemlücke im
journalisierten Sync zu behandeln; danach ist ein bewusster Vollsync nötig.

3) Reparaturmodus / Neu-Baselining:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/update-public-jira-pages.sh
```

Optional (on demand, „neu baselinen“):

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/update-public-jira-pages.sh --full
```

4) GitHub-Pages-Ziele aus Jira lokal bestätigen:

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

5) Stichprobe (inhaltlich):
   - Der Einstieg unter `jira/` verweist auf Backlog, Historie und Sprint
     Board.
   - Backlog-Listen zeigen den Status jedes gelisteten Vorgangs direkt in der
     Zeile.
   - Die Historie bündelt Sprint-Historie und global sichtbare erledigte
     Top-Level-Vorgänge.
- `erledigt/` dient nur noch als Kompatibilitätspfad zur Historie.
- Vorgangs- und Schrittseiten unter `jira/` zeigen kurze, sichtbare
  Querpfade zu Parent und öffentlichen Schritten; bei mehreren Teilseiten
  zusätzlich einen Inhalts-Schlüssel.
- Vorgangsseiten bleiben Hybrid:
  Jira-Zustand und Jira-Verknüpfungen werden dort knapp gespiegelt,
  fachliche Hinweise und Nachweise bleiben in GitHub Pages.
- Jira-Metadaten leben auf Vorgangsseiten in genau einem oberen Zustands-
  und Beziehungsblock; dazu zählen auch Parent und andere Vorgänge aus
  `issuelinks`.
- Ein separater Kontextblock unterhalb davon dient nur Navigationskontext,
  etwa öffentliche Schritte oder Parent-Navigation auf Schrittseiten.
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
     dem Dateisystem-Pfad `work/jira/J01-<KEY>/`, ein kanonischer
     Jira-Remote-Link auf deren öffentliche URI, eigene Nachweise, eigene
     Abschlussaussagen oder andere eigene kanonische Zielseiten.
   - Wenn statt einer öffentlichen Vorgangsseite eine öffentliche Schrittseite
     unter `jira/issues/<PARENT>/steps/<SUBTASK_KEY>/` genutzt wird, gilt
     dieselbe Erwartung für kanonische Verlinkung und Nachzug.
   - Bei neuen Schrittseiten für bereits bestehende Unteraufgaben werden
     vorhandene Public-Nennungen nachgezogen, soweit sie diese Schrittseite
     oder ihren Elternvorgang direkt betreffen.
   - Wenn eine öffentliche Vorgangs- oder Schrittseite existiert, wird sie
     über die Verifikation gegen Jira-Remote-Links, Altpfade und
     Doppelpunkte geprüft.

6) Hygiene (Policy):
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
  - Backlog und Historie zeigen Status je Vorgangszeile sichtbar an.
  - Nach dem DE-Render werden nur die generierten EN-Jira-Seiten unter
    `en/work/jira/` synchronisiert.

## Rollback

- Betroffene Dateien zurücksetzen und die öffentliche Jira-Fläche erneut
  generieren.

## Monitoring

- Sprint Board, Backlog und Historie stimmen mit Jira-Statuskategorien und
  Pfadzielen überein.
- Das Sprint-Board zeigt die Sprint-Kategorien in eigener Zeilenstruktur.
- Backlog-Listen zeigen pro gelistetem Vorgang den Status direkt in der Zeile.
- `erledigt/` verweist nur auf die Historie und führt keine eigene Vollsicht
  mehr.
- Issue-/Step-Seiten enthalten je Vorgang `**Aktualisiert:** …` (Jira-Quelle).
- Issue-Seiten zeigen zusätzlich sichtbare Jira-Metadaten wie Bearbeitung,
  Priorität, aktiven Sprint, Sprint-Rolle und verknüpfte Vorgänge.
- `git` ist die verlässliche Historie: Diffs entstehen nur bei Inhaltsänderung.
- `shared-tooling/jira-pages/verify-public-jira-pages.sh` bestätigt die aus
  Jira importierten GitHub-Pages-Ziele lokal für DE und EN.
- `shared-tooling/jira-pages/verify-public-jira-pages.sh` bestätigt zusätzlich
  das Fehlen öffentlicher Altpfade und doppelter Detail-URLs.
- `shared-tooling/jira-pages/verify-public-jira-pages.sh --legacy-confluence-audit`
  meldet verbliebene alte Confluence-Remote-Links mit Jira-Key und Link-ID.
- `.local/jira-sync-cache/` und `.local/jira-sync-journal/` halten den
  lokalen Snapshot- und Resume-Zustand für den journalisierten Normalmodus.
- Guard-Fehler aus gezielten Läufen stehen zusätzlich im Laufjournal unter
  `.local/jira-sync-journal/`; solche Läufe schreiben keine öffentlichen
  Jira-Dateien und verlangen danach einen Vollsync.
- Für dieses Doku-Repo gilt kein generischer `dev`-/`preview`-Git-Ablauf;
  Änderungen werden nach lokaler Prüfung direkt in `main` integriert.
