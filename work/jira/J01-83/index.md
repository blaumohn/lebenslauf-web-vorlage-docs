---
layout: page
title: "J01-83: Erste Cache-V1 vorbereiten und Policy trennen"
permalink: /de/work/jira/J01-83/
---

**Stand:** 2026-03-17

Kanonischer öffentlicher Arbeitsstand für `J01-83`.
Der Vorgang schneidet den früher breiter formulierten CLI-Cache-Schritt auf
eine kleine, schnell ersetzbare erste Cache-Iteration zu und trennt die
Policy-Schärfung bewusst in einen eigenen Folgepunkt aus.

## Ziel

Eine kleine Cache-V1 vorbereiten, die Mensch und KI schnell ein belastbares
Rezept für wiederkehrende Jira-Arbeit gibt, ohne dafür schon die spätere
Sicherheits- oder Curl-Reifung vorwegzunehmen.

## Quellen- und Chronologiebasis

- 2026-02-24:
  In den J01-Notizen wurde ein CLI-Cache bzw. Rezepte-Katalog als
  Zwischenschritt festgehalten.
- 2026-02-24:
  Der Systemüberblick und [ADR-0002]({{ "/de/decisions/adr-0002/" |
  relative_url }}) verankerten den Cache-Kontext öffentlich, allerdings noch
  zusammen mit der stärkeren Policy-Sprache.
- 2026-02-25 und 2026-02-26:
  Im `tagebuch` wurde der Strang als „Cache vs. Codex-Skill“ und danach als
  „Cache-Artefakt vs. Codex-Skill“ geschärft.
- 2026-03-14:
  [J01-95]({{ "/de/work/jira/J01-95/" | relative_url }}) zeigte das passende
  Muster für diese Runde:
  kleine lokale V1, schnell nutzbar, später ersetzbar.
- Negativbefund:
  In den exportierten `docs/agile`-Quellen wurde kein eigener Cache-Strang
  gefunden; deshalb war der Punkt auch kein fehlender Rest in
  `J01-91/archive-topics.md`.

## Jetzt vorbereitet

- `J01-83` in Jira auf Cache-V1 zugeschnitten
- Policy-Strang als eigener Jira-Kandidat `J01-101` ausgelagert
- neue öffentliche Arbeitsdoku für `J01-83` angelegt
- Quellenlage im `tagebuch` als eigener Suchfall und als Rundenprotokoll
  nachgezogen
- kleines Referenzrezept im Skill-Repo umgesetzt:
  `shared-tooling/jira-pages/cache-recipes/parent-subtasks.md`

## Umgesetztes Referenzrezept

Die V1 ist jetzt als genau ein kleines Cache-Artefakt umgesetzt.
Das Artefakt beschreibt den Lesefall:
Jira-Parent lesen und daraus die enthaltenen Subtasks ableiten.

Der kopierbare Kernaufruf lautet:

```bash
atlassian jira http get "/rest/api/3/issue/<PARENT_KEY>?fields=subtasks,summary,status"
```

Das Referenzrezept enthält nur die für diese V1 nötigen Felder:

- Ziel
- kopierbarer Befehl
- Platzhalter
- erwartete Output-Felder
- Erfolgssignale
- Fehlersignale und Grenzen

Als Erfolg gilt in der V1:

- Exit-Code `0`
- parsebares JSON
- vorhandenes Feld `fields.subtasks`
- lesbare Subtask-Felder `key`, `fields.summary`, `fields.status.name`

Ausdrücklich nicht Teil der V1:

- vollständige Antwort als Datei speichern
- lokaler JSON-Snapshot-Cache
- neue CLI-Subcommands
- neue Policy-Schärfung im `atlassian-http-client`

## V1-Zuschnitt

- genau ein kleines Referenzrezept genügt
- das Rezept beschreibt nur:
  Zweck, kopierbaren Befehl, Platzhalter, erwartete Output-Felder,
  Erfolgssignale und Grenzen
- die Lösung bleibt bewusst klein und schnell austauschbar
- Vorbild ist die V1-Haltung aus `J01-95`, nicht dessen konkreter Inhalt

## Nicht Teil von J01-83

- keine breite Rezeptbibliothek
- keine Snapshot-Pflicht
- keine neue Policy-Schärfung im Bereich `atlassian-tools/curl`
- keine neue Sicherheits- oder Curl-Härtung als DoD dieser ersten Iteration

## Abgrenzung zum Policy-Strang

- [J01-101]({{ "/de/work/jira/J01-101/" | relative_url }}) trägt die
  getrennte Policy-Folgearbeit.
- `J01-83` bleibt der Cache-Strang und zieht die Policy-Arbeit nicht wieder
  implizit in den Scope zurück.

## Links

- [J01-95: Journalisierten Jira-/Pages-Sync mit Resume aufbauen]({{
  "/de/work/jira/J01-95/" | relative_url }})
- [J01-101: Policy-Schärfung für CLI-Cache getrennt vorbereiten]({{
  "/de/work/jira/J01-101/" | relative_url }})
- [ADR-0002: atlassian-http-client Sicherheitsmodell]({{
  "/de/decisions/adr-0002/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/work/jira/" | relative_url }})
