---
layout: page
title: "J01-126: GitHub Pages: Letzte Änderungen – Navbar-Seite mit Commit-Feed"
jira_key: J01-126
permalink: /de/jira/issues/J01-126/
---

**Stand:** 2026-04-12

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-126`.
Der Vorgang führt eine automatisch gepflegte „Letzte Änderungen"-Seite ein:
ein pre-commit-Hook generiert `_data/recent_commits.yml` aus den jüngsten
Commits dreier Projekt-Repos und stagt die Datei vor jedem Commit im
Doku-Repo, sodass sie beim nächsten Push automatisch mitveröffentlicht wird.

## Ziel

- `_data/recent_commits.yml` automatisch aktuell halten
- Artefakt-Commits (ausschließlich `_data/recent_commits.yml`) aus dem Feed ausschließen
- Remote-Refs vor der Generierung per `git fetch` aktualisieren
- Tests sichern das Verhalten gegen Regression ab

## Aktueller Stand

- pre-commit-Hook löst den früheren pre-push-Hook ab;
  die Datei fährt im regulären Commit mit, kein zweiter Push nötig
- `generate-recent-commits.sh` fetcht Remote-Refs und filtert Artefakt-Commits
  per Pathspec (`-- . ':!_data/recent_commits.yml'`)
- Shell-Rauchtests für Skript und Hook angelegt
- Runbook aktualisiert

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Hook vorhanden | `scripts/hooks/pre-commit` existiert und ist ausführbar | `scripts/hooks/pre-commit` | erledigt |
| Hook stagt Datei | `_data/recent_commits.yml` ist nach Hook-Lauf gestagert | `tests/pre-commit-hook.sh` | erledigt |
| fetch vor log | Remote-Refs werden vor `git log` aktualisiert | `scripts/generate-recent-commits.sh` | erledigt |
| Artefakt-Commits gefiltert | Commits die nur `_data/recent_commits.yml` ändern fehlen im YAML | `tests/generate-recent-commits.sh` | erledigt |
| Tests vorhanden | `tests/` enthält zwei Shell-Rauchtests | `tests/` | erledigt |
| Runbook aktuell | Runbook beschreibt den pre-commit-Ablauf | `operations/recent-changes-hook/index.md` | erledigt |

## Links

- [Operations: Pre-Commit-Hook für Letzte Änderungen]({{ "/de/operations/recent-changes-hook/" | relative_url }})
