---
layout: page
title: "J01-130: GitHub Pages: Backlog, Recent-Feed und Jira-UI bewerten"
jira_key: J01-130
jira_parent_key: J01-84
permalink: /de/jira/issues/J01-130/
---

**Stand:** 2026-04-15

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Ziel

Bewerten, ob die öffentliche GitHub-Pages-Jira-Fläche bei Backlog,
Recent-Feed und Status-UI die Projektverwaltungsrolle wirksam erfüllt.
Der Vorgang ist ein Bewertungsauftrag; konkrete UI- oder Hook-Fixes folgen
erst aus den Ergebnissen.

## Ausgangslage

Bei `J01-128` wurden zwei Betriebsfragen sichtbar:

- `_data/recent_commits.yml` kann nach einem Commit sofort wieder veraltet
  wirken, wenn der Feed vor dem finalen Commit-Hash generiert wird.
- Die englische Backlog-Seite übernimmt Jira-Summaries unverändert, obwohl
  sie als englische Oberfläche erscheint.

Zusätzlich ist offen, ob Statushinweise wie `Zu erledigen` beziehungsweise
`To Do` in der Backlog-UI ausreichend wirksam und unterscheidbar sind.

## Bewertungsfragen

| Frage | Erwartetes Ergebnis | Status |
| --- | --- | --- |
| Recent-Feed aktuell? | Klare Regel, wann und wodurch `_data/recent_commits.yml` gepflegt wird | offen |
| Feed-Betrieb nachvollziehbar? | Entscheidung zwischen Pre-Commit, Pre-Push, separatem Sync oder bewusster Verzögerung | offen |
| Englische Titelstrategie? | Entscheidung, ob EN-Seiten Jira-Summaries spiegeln oder redaktionell übersetzen | offen |
| Backlog-UI wirksam? | Bewertung, ob Status, Gruppierung und visuelle Unterschiede schnell erfassbar sind | offen |
| Jira-Rolle eingehalten? | Abgleich mit Jira als SSOT und der öffentlichen Doku als Arbeitsdoku | offen |

## Nicht-Ziele

- Keine direkte UI-Umsetzung in diesem Vorgang.
- Keine sofortige Änderung am Recent-Feed-Hook.
- Keine Vorentscheidung, dass englische Backlog-Titel immer übersetzt werden.

## Links

- [J01-84 im Jira-Mirror]({{ "/de/jira/issues/J01-84/" | relative_url }})
- [J01-126 im Jira-Mirror]({{ "/de/jira/issues/J01-126/" | relative_url }})
- [Backlog]({{ "/de/jira/backlog/" | relative_url }})
- [Letzte Änderungen]({{ "/de/recent/" | relative_url }})
