---
layout: page
title: "ADR-0001 SSOT: Jira, docs/agile entfernt"
permalink: /decisions/adr-0001/
---

**Status:** Akzeptiert

## Kontext {#kontext}

Es gab bisher eine zweite Arbeitsquelle (`docs/agile`) neben Jira. Das führte zu Drift und erschwerte die Synchronisation über Jira-IDs in Commits/PRs.

## Entscheidung {#entscheidung}

- Jira ist die einzige Quelle der Wahrheit für Planung, Status und Arbeitspakete.
- `docs/agile/` wird aus dem App-Repo entfernt.
- Formale Dokumente und öffentliche Projekt-Doku liegen in GitHub Pages (dieses Repo); Confluence-Inhalte wurden migriert bzw. ersetzt.
- Interne Denkarbeit und Arbeitslog bleiben im privaten Notizrepo.

## Konsequenzen {#konsequenzen}

- Planung und Status nur in Jira; Commits/PRs referenzieren Jira-IDs.
- Keine agile Prozessdoku im App-Repo; weniger Drift.
- Abhängigkeit von Jira (SSOT) und dem Doku-Repo (GitHub Pages).

## Alternativen {#alternativen}

- `docs/agile` im Repo behalten: abgelehnt (Drift-Risiko).
- GitHub Projects als SSOT: abgelehnt.

## Links {#links}

- Jira: Epic „Jira-System vorbereiten (SSOT)“ (Key folgt)
