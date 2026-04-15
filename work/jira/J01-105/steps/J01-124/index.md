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
- Konfig-Spec, Variablen und Programmpfade wurden geprüft; der finale
  Jira-Statuswechsel ist nachgezogen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| App-Tests grün | Zielmodell läuft im Hauptrepo reproduzierbar | App-Repo, Test-Lauf | erledigt |
| Lib-Tests grün | Expander und Validierung sind gegen das Zielmodell abgesichert | Lib-Repo, Test-Lauf | erledigt |
| Verbundtest nachvollziehbar | Hauptrepo testet gegen die lokale Lib-Fassung | `set-config-spec-repo`, Test-Notiz | erledigt |
| J01-9 entblockt | Jira zeigt keinen Blocker mehr durch `J01-105` | Jira | erledigt |

## Abschlussbild

- Die Minimalprüfung ist für den Sprintabschluss ausreichend nachgewiesen.
- Zusätzliche Pflege- und Folgefragen bleiben getrennte Vorgänge und halten
  `J01-105` nicht mehr offen.

## Links

- [105-4 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-124/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})
- [J01-9: Preview — Workflow wieder aktivieren]({{ "/de/jira/issues/J01-9/" | relative_url }})
