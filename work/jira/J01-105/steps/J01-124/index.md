---
layout: page
title: "105-4: Prüfläufe, Entblockung J01-9 und Abschlussbild nachweisen"
jira_key: J01-124
jira_parent_key: J01-105
permalink: /de/jira/issues/J01-105/steps/J01-124/
---

**Stand:** 2026-04-03

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[105-4]({{ "/de/jira/issues/J01-105/steps/J01-124/" | relative_url }}) unter
[J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }}).
Diese Seite bündelt den Abschlussnachweis, damit die Entblockung von `J01-9`
nicht nur behauptet, sondern prüfbar geschlossen werden kann.

## Ziel

- Die relevanten Prüfläufe für App-Repo und Lib sind sichtbar gesammelt.
- Der lokale Verbundtest mit lokaler Lib-Anbindung ist nachvollziehbar.
- `J01-9` kann erst dann entblockt werden, wenn `J01-105` fachlich und
  technisch als abgeschlossen nachgewiesen ist.

## Bericht

- `J01-105` ist im aktiven Sprint als `sprint-support` sichtbar, weil der
  Vorgang `J01-9` blockiert.
- Der Abschluss dieses Vorgangs hängt nicht an einer einzelnen Datei,
  sondern an konsistenten Prüfläufen über mehrere Repos.
- Dieser Schritt hält deshalb die Abschlusskriterien und den Nachweisort
  separat fest.

## Aktueller Stand

- Jira-Subtask `J01-124` ist angelegt.
- Die Prüf- und Entblockungslogik ist als eigener öffentlicher Schritt
  abgegrenzt.
- Konkrete Testläufe und der finale Jira-Statuswechsel sind noch offen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| App-Tests grün | Zielmodell läuft im Hauptrepo reproduzierbar | App-Repo, Test-Lauf | offen |
| Lib-Tests grün | Expander und Validierung sind gegen das Zielmodell abgesichert | Lib-Repo, Test-Lauf | offen |
| Verbundtest nachvollziehbar | Hauptrepo testet gegen die lokale Lib-Fassung | `set-config-spec-repo`, Test-Notiz | offen |
| J01-9 entblockt | Jira zeigt keinen Blocker mehr durch `J01-105` | Jira | offen |

## Offene Punkte

- Festziehen, welche Minimalmenge an Tests für den Abschluss reicht.
- Prüfen, ob nach dem Abschluss zusätzliche Folgepunkte aus `J01-37` oder
  `J01-31` sichtbar referenziert werden müssen.

## Links

- [105-4 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-124/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})
- [J01-9: Preview — Workflow wieder aktivieren]({{ "/de/jira/issues/J01-9/" | relative_url }})
