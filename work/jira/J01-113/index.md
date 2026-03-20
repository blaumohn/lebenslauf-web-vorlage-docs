---
layout: page
title: "J01-113: Regelwerk-Bereinigung: Ebenen 1–2–3 trennen und Prüfkategorie-Zuordnung A/B/C/D"
jira_key: J01-113
jira_parent_key: J01-111
permalink: /de/jira/issues/J01-113/
---

**Stand:** 2026-03-20

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-113`.
Der Vorgang bereinigt die KI-Agenten-Regelstruktur im Projektverbund:
Verdoppelungen entfernen, drei Ebenen sauber trennen, je Regel eine formale
Prüfkategorie zuordnen.

## Ziel

- Identische Regeln (Kommunikation, UTF-8, Grammatische Rückmeldung), die
  redundant in Workspace-`AGENTS.md`, `lebenslauf-web-vorlage-docs/AGENTS.md`,
  `atlassian-tools/AGENTS.md` und `tagebuch/AGENTS.md` stehen, auf die
  richtige Ebene konsolidieren.
- Drei Ebenen klar trennen:
  - Ebene 1 — Workspace `AGENTS.md`: Prinzipien, workspace-weit
  - Ebene 2 — Skills: Arbeitsabläufe, projektgebunden
  - Ebene 3 — Repo-`AGENTS.md`: nur echte Repo-Eigenheiten
- Sechs Regeln, die bisher nur implizit im Sitzungskontext existieren, formal
  verankern (u. a. Lib/App-Branch-Basis, DE/EN-Sync, `blocks`-vs-`relates`-
  Typisierung, lokaler Mirror, `--help` vor unbekannten Befehlen).
- Je Regel eine Prüfkategorie zuordnen:
  - A — vor Ausführung (PreToolUse-Hook)
  - B — nach Ausführung, deterministisch (grep/git-Skripte)
  - C — nach Ausführung, semantisch (lokales Modell)
  - D — dateiübergreifend, semantisch (API-Modell)

## Aktueller Stand

- Vorgang angelegt, Sprint zugeordnet, Label `sprint-unplanned`.
- Analyse aus Rundenprotokoll 2026-03-20 liegt vor.
- Umsetzung noch nicht begonnen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Keine doppelten Regeln mehr | Kommunikation, UTF-8, Grammatik stehen nur noch in Ebene 1 oder der zuständigen Quelle | WS-`AGENTS.md`, repo-lokale `AGENTS.md` | offen |
| Ebenen 1/2/3 klar getrennt | WS enthält nur Prinzipien; Skills die Abläufe; Repo-AGENTS nur Repo-Eigenheiten | alle AGENTS.md-Dateien im Workspace | offen |
| Sechs implizite Regeln formal verankert | Jede Regel hat eine dokumentierte Quelle in WS, Skill oder Repo-AGENTS | Regelwerk-Bestandsdoku | offen |
| Je Regel Kategorie A/B/C/D zugeordnet | Vollständige Tabelle Regel → Kategorie liegt vor | Arbeitsdoku oder Skill | offen |
| Öffentliche Arbeitsdoku vorhanden | `/de/jira/issues/J01-113/` und `/en/jira/issues/J01-113/` vorhanden | GitHub-Pages-Doku | erledigt |

## Offene Punkte

- Konkrete Zuordnung je Regel ist noch nicht ausgearbeitet.
- Granularitäts-Vermischung in WS § Dokumentationspflicht
  (allgemeine Pflichten vs. Sprint-Details) muss aufgelöst werden.

## Links

- [J01-111: Epic KI-Regelwerk-Kohärenz und Prüfarchitektur]({{ "/de/jira/issues/J01-111/" | relative_url }})
- [J01-115: KI-Prüfarchitektur]({{ "/de/jira/issues/J01-115/" | relative_url }})
- [J01-92: Shared-Agent-Regeln und Skill-Versionierung]({{ "/de/jira/issues/J01-92/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
