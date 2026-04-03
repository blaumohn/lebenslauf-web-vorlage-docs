---
layout: page
title: "J01-121: SCRUM Sprint 2 planen und Preview-Carry-over einsortieren"
jira_key: J01-121
jira_parent_key: J01-84
permalink: /de/jira/issues/J01-121/
---

**Stand:** 2026-04-01

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-121`.
Der Vorgang startet nach dem Abschluss von Sprint 1 den neuen aktiven Sprint,
ordnet das Preview-Carry-over bewusst ein und macht die Sprint-2-Planung
öffentlich nachvollziehbar.

## Ziel

- `SCRUM Sprint 2` als neuen aktiven Sprint mit dem Ziel
  „Preview-Deployment fertig machen“ eröffnen.
- Die offenen Zielvorgänge aus Sprint 1 bewusst statt automatisch übernehmen.
- Den harten Blocker `J01-105` als Support-Arbeit im Sprint sichtbar halten.
- Tatsächlich bearbeitete Admin-Folgearbeit sichtbar im neuen Sprint halten.

## Aktueller Stand

- `SCRUM Sprint 2` ist in Jira angelegt und aktiv.
- Als `sprint-goal` sind bewusst übernommen:
  [J01-9]({{ "/de/jira/issues/J01-9/" | relative_url }}),
  [J01-13]({{ "/de/jira/issues/J01-13/" | relative_url }}),
  [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }})
- Als `sprint-support` ist zusätzlich aufgenommen:
  [J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }}) als expliziter
  Blocker von `J01-9`
- Als `sprint-admin` und tatsächlich bearbeitete Folgearbeit liegen im Sprint:
  [J01-119]({{ "/de/jira/issues/J01-119/" | relative_url }}),
  [J01-120]({{ "/de/jira/issues/J01-120/" | relative_url }}),
  `J01-121`
- Andere offene Sprint-1-Reste wie `J01-104`, `J01-109`, `J01-111`,
  `J01-113`, `J01-115`, `J01-116` und `J01-117` bleiben vorerst im Backlog.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Neuer Sprint aktiv | Jira zeigt `SCRUM Sprint 2` als `active` | Jira-Board 1 / Sprint 35 | offen |
| Zielarbeit bewusst übernommen | `J01-9`, `J01-13`, `J01-31` liegen im aktiven Sprint mit `sprint-goal` | Jira-Sprint 2, Sprint-Board | offen |
| Blocker sichtbar berücksichtigt | `J01-105` liegt im aktiven Sprint mit `sprint-support` | Jira-Sprint 2, Sprint-Board | offen |
| Admin-Folgearbeit sichtbar | `J01-119`, `J01-120`, `J01-121` liegen im aktiven Sprint mit `sprint-admin` | Jira-Sprint 2, Sprint-Board | offen |
| Sprint-2-Planning öffentlich | `work/sprints/scrum-sprint-2/` beschreibt Ziel, Carry-over und Nicht-Übernahmen | öffentliche Sprint-Doku | offen |

## Abschlussbild oder offene Punkte

- Carry-over wird jetzt nicht mehr nur retrospektiv benannt, sondern aktiv in
  Sprint 2 eingeordnet.
- Offen bleibt nur die spätere Feinsteuerung innerhalb des Sprints, nicht mehr
  die Grundentscheidung über den Start des nächsten aktiven Sprints.

## Links

- [J01-120: SCRUM Sprint 1 schließen und öffentliche Review/Retro nachziehen]({{ "/de/jira/issues/J01-120/" | relative_url }})
- [Sprint-Historie]({{ "/de/work/sprints/" | relative_url }})
- [Sprint-Richtlinie]({{ "/de/policies/sprint-richtlinie/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
