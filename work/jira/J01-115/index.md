---
layout: page
title: "J01-115: KI-Prüfarchitektur: Kategorie-A-bis-D-System aufbauen (Hook/Skript/Modell)"
jira_key: J01-115
jira_parent_key: J01-111
permalink: /de/jira/issues/J01-115/
---

**Stand:** 2026-03-20

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-115`.
Der Vorgang baut das maschinelle Prüfsystem auf, das die Einhaltung der
KI-Agenten-Regeln nach dem Vier-Kategorien-Modell prüft.
Voraussetzung ist der abgeschlossene Vorgang
[J01-113]({{ "/de/jira/issues/J01-113/" | relative_url }}).

## Ziel

Vier Prüfkategorien in Betrieb nehmen:

| Kategorie | Mechanismus | Beispiele |
| --- | --- | --- |
| A — vor Ausführung | Claude Code PreToolUse-Hook | `tools-python`, `atlassian`-Pfad |
| B — nach Ausführung, deterministisch | grep / git-Skripte | ISS-xxx in Docs, Commit-Key-Format |
| C — nach Ausführung, semantisch | Lokales Modell, je Regel gefiltert | EN/DE-Sync-Inhalt, Überprüfungsplan |
| D — dateiübergreifend, semantisch | API-Modell | Abhängigkeits-Typisierung, Kohärenz |

**Aufwandsverteilung (Schätzung):**
- Skript (grep/git) → ca. 60 % der Regeln
- Lokales Modell (Diff-Filterung) → ca. 35 %
- API-Modell → ca. 5 %

**Reihenfolge:** zuerst Kategorie-A-Hooks, dann B-Skripte, dann C/D.

**Lokales Modell auf MacBook Pro 16 GB Apple Silicon:**
- `mlx` (Apple Silicon) oder `ollama`
- Kandidaten: Qwen2.5 7B, Phi-3.5 mini, Llama 3.2 3B

## Aktueller Stand

- Vorgang angelegt, Sprint zugeordnet, Label `sprint-unplanned`.
- Konzept aus Rundenprotokoll 2026-03-20 liegt vor.
- Bau noch nicht begonnen; wartet auf J01-113.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Kategorie-A-Hook aktiv | PreToolUse-Hook blockiert nicht-konforme `tools-python`- und `atlassian`-Aufrufe | Claude Code `settings.json`, Hook-Skript | offen |
| Kategorie-B-Skript aktiv | grep-Skript meldet ISS-xxx-Treffer außerhalb zugelassener Migrationsdokus | Skript im Skill-Repo | offen |
| Regelwerk-Tabelle Regel → Kategorie vollständig | Alle Regeln aus J01-113 haben eine Kategorie-Zuordnung | Tabelle in J01-113 oder Skill | offen |
| Entscheidung ISS-xxx: grep + Whitelist oder Modell | Explizite Entscheidung dokumentiert | Arbeitsdoku oder ADR | offen |
| Öffentliche Arbeitsdoku vorhanden | `/de/jira/issues/J01-115/` und `/en/jira/issues/J01-115/` vorhanden | GitHub-Pages-Doku | erledigt |

## Links

- [J01-111: Epic KI-Regelwerk-Kohärenz und Prüfarchitektur]({{ "/de/jira/issues/J01-111/" | relative_url }})
- [J01-113: Regelwerk-Bereinigung]({{ "/de/jira/issues/J01-113/" | relative_url }})
- [J01-92: Shared-Agent-Regeln und Skill-Versionierung]({{ "/de/jira/issues/J01-92/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
