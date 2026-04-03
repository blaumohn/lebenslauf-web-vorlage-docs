---
layout: page
title: "J01-120: SCRUM Sprint 1 schließen und öffentliche Review/Retro nachziehen"
jira_key: J01-120
jira_parent_key: J01-84
permalink: /de/jira/issues/J01-120/
---

**Stand:** 2026-04-01

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-120`.
Der Vorgang führt den operativen Sprint-Abschluss nach dem in `J01-94`
aufgebauten Rahmen aus: Sprint 1 sauber in Jira schließen, öffentlich als
Review/Retro/Carry-over spiegeln und die Abweichungsgründe sichtbar machen.

## Ziel

- Den zeitlich abgelaufenen, aber in Jira noch aktiven `SCRUM Sprint 1`
  bereinigen.
- Die öffentliche Sprint-Doku von einem reinen Planning auf Review, Retro und
  Carry-over umstellen.
- Sichtbar machen, was im Sprint erledigt wurde und was offen blieb.
- Die beobachteten Abweichungsgründe so dokumentieren, dass spätere Sprints in
  der Pre-Preview-Phase realistischer geführt werden können.

## Aktueller Stand

- `SCRUM Sprint 1` ist am 2026-04-01 in Jira auf `closed` gesetzt.
- Jira meldet für den Sprint jetzt ein `completeDate` und keine aktiven
  Sprints mehr.
- `J01-120` ist als Folgearbeit zu `J01-94` angelegt und mit dem
  Rahmenvorgang verknüpft.
- Ein neues Befehlsrezept für „Sprint-Inhalt lesen und Sprint schließen“ ist
  im Skill-Repo ergänzt.
- Die öffentliche Sprint-Seite `work/sprints/scrum-sprint-1/` wird in diesem
  Arbeitsgang auf Review, Retro und Carry-over nachgezogen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Sprint in Jira geschlossen | `SCRUM Sprint 1` ist nicht mehr `active`, sondern `closed` mit Abschlusszeit | Jira-Sprint 1 | offen |
| Öffentliche Sprint-Doku nachgezogen | `work/sprints/scrum-sprint-1/` zeigt nicht mehr nur Planning, sondern auch Review, Retro und Carry-over | öffentliche Sprint-Seite | offen |
| Abweichungen sichtbar zerlegt | Erledigt, offen, ungeplant und Rahmenbedingungen sind getrennt dokumentiert | Sprint-Seite, `tagebuch` | offen |
| Rezept ergänzt | `close-sprint.md` dokumentiert den verifizierten Jira-Pfad | Skill-Repo `cache-recipes/close-sprint.md` | offen |

## Abschlussbild oder offene Punkte

- Der Sprint-Rahmen aus `J01-94` ist jetzt nicht nur aufgebaut, sondern auch
  für einen überfälligen realen Abschluss belastbar angewendet.
- Die Folgeentscheidung über Sprint 2 und die bewusste Carry-over-Einsortierung
  läuft unter [J01-121]({{ "/de/jira/issues/J01-121/" | relative_url }}).

## Links

- [J01-94: Scrum-Sprint-Rahmen und öffentliche Sprint-Historie]({{ "/de/jira/issues/J01-94/" | relative_url }})
- [J01-121: SCRUM Sprint 2 planen und Preview-Carry-over einsortieren]({{ "/de/jira/issues/J01-121/" | relative_url }})
- [Sprint-Historie]({{ "/de/work/sprints/" | relative_url }})
- [Sprint-Richtlinie]({{ "/de/policies/sprint-richtlinie/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
