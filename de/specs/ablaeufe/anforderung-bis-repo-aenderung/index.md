---
layout: page
title: "Spec: Anforderung bis Repo-Änderung"
permalink: /de/specs/ablaeufe/anforderung-bis-repo-aenderung/
---

Dieser Ablauf beschreibt den stabilen Weg von einer neuen Anforderung bis zur
umgesetzten Änderung im passenden Repo.

## Zweck

- Scope, Arbeitsdoku, Quellen und Repo-Änderung sauber zusammenführen

## Auslöser

- neue Produkt-, Doku-, Skill- oder Betriebsanforderung

## Beteiligte Systeme

- [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- [GitHub- und PR-System]({{ "/de/specs/systeme/github-zusammenarbeit/" | relative_url }})
- [KI-/Skill-Rahmen]({{ "/de/specs/systeme/ki-skill-rahmen/" | relative_url }})

## Ein- und Ausgänge

- Eingänge:
  - Anforderung, Problem oder Änderungswunsch
- Ausgänge:
  - Jira-Vorgang, öffentliche Arbeitsdoku, Repo-Änderung, Commit

## Ablauf

1. passenden Jira-Vorgang prüfen oder anlegen
2. öffentliche Arbeitsdoku unter `work/jira/` anlegen oder aktualisieren
3. Quellen und Zielort klären
4. im passenden Repo oder in mehreren getrennten Repos ändern
5. verifizieren, committen und integrieren

## Übergaben

- Jira -> öffentliche Arbeitsdoku
- Arbeitsdoku -> Repo-Änderung
- Repo-Änderung -> öffentliche Erklärung oder Abschlussbild

## Grenzen und Nicht-Ziele

- kein Ersatz für detailierte Runbooks
- keine Misch-Commits über mehrere Repos

## Verweise auf operative Doku

- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [J01-117]({{ "/de/jira/issues/J01-117/" | relative_url }})

## Quellen

- `skills/koordination/SKILL.md`
- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
- [J01-102]({{ "/de/jira/issues/J01-102/" | relative_url }})
