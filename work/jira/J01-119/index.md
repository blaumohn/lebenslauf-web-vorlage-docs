---
layout: page
title: "J01-119: Gezielten Jira-/Pages-Sync gegen stille Rückschritte härten"
jira_key: J01-119
jira_parent_key: J01-84
permalink: /de/jira/issues/J01-119/
---

**Stand:** 2026-04-01

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-119`.
Der Vorgang führt die Nachschärfung nach dem abgeschlossenen V1-Basisstand aus
`J01-95` weiter: Guard gegen teilalte lokale Arbeitsstände, sichtbarer
Fehlerpfad und fehlendes Befehlsrezept für gezielte Jira-Issue-Lesezugriffe.

## Ziel

- Gezielte Jira-/Pages-Läufe dürfen keine unbehandelten Vorgänge mehr still
  auf ältere Metadaten zurückfallen lassen.
- Ein Inkonsistenzfall wird als echte Systemlücke gemeldet und verlangt einen
  bewussten Vollsync statt stiller Überschreibung.
- Der wiederkehrende Leseweg für einzelne Jira-Issues ist im Befehlscache
  dokumentiert.
- `J01-95` bleibt als abgeschlossene V1-Basis lesbar, ohne spätere Härtefälle
  still mitzutragen.

## Aktueller Stand

- `J01-119` ist als neuer Folge-Vorgang unter `J01-84` angelegt.
- `J01-95` ist in Jira auf `Erledigt` belassen und per Vorgangslink mit
  `J01-119` verbunden.
- Das fehlende Befehlscache-Rezept
  `shared-tooling/jira-pages/cache-recipes/issue-read.md` ist ergänzt.
- Die neue Guard-Arbeit und die begriffliche Abgrenzung zu `J01-95` werden in
  dieser öffentlichen Arbeitsdoku und im `tagebuch` gespiegelt.
- Die Sprint-Zuordnung bleibt vorerst offen, weil Jira am 2026-04-01 den
  zeitlich abgelaufenen `SCRUM Sprint 1` weiterhin als `active` meldet und die
  Sprint-Richtlinie zuerst dessen Bereinigung verlangt.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Neuer Folge-Vorgang statt stiller Weiterarbeit | `J01-119` existiert in Jira und referenziert die Guard-/Rezept-Nacharbeit | Jira `J01-119`, diese Seite | offen |
| Abgrenzung zu `J01-95` sichtbar | `J01-95` bleibt abgeschlossen, verweist aber auf `J01-119` als Folgearbeit | Jira-Issue-Link, `work/jira/J01-95/` | offen |
| Befehlsrezept ergänzt | `issue-read.md` dokumentiert den gültigen REST-Leseweg und den fehlenden Kurzpfad | Skill-Repo `cache-recipes/issue-read.md` | offen |
| Sprint-Risiko benannt | Öffentliche Doku hält fest, dass Sprint-Zuordnung erst nach Bereinigung des überfälligen aktiven Sprints folgt | diese Seite, Sprint-Richtlinie | offen |

## Abschlussbild oder offene Punkte

- Der Jira-Bezug für die Folgearbeit ist jetzt sauber vom erledigten
  V1-Vorgang getrennt.
- Der neue Vorgang macht sichtbar, dass `Erledigt` bei `J01-95` den
  abgeschlossenen Basisumfang meint, nicht jede spätere Härtearbeit.
- Offen bleibt die Sprint-Bereinigung, bevor `J01-119` regulär in einen
  aktiven Sprint eingeordnet werden kann.

## Links

- [J01-95: Journalisierten Jira-/Pages-Sync mit Resume aufbauen]({{ "/de/jira/issues/J01-95/" | relative_url }})
- [J01-84: Atlassian-System vorbereiten (SSOT: Jira)]({{ "/de/jira/issues/J01-84/" | relative_url }})
- [Sprint-Richtlinie]({{ "/de/policies/sprint-richtlinie/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
