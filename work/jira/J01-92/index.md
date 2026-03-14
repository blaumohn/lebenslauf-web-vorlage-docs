---
layout: page
title: "J01-92: Shared-Agent-Regeln und Skill-Versionierung"
permalink: /de/work/jira/J01-92/
---

**Stand:** 2026-03-14

Diese Seite hält den öffentlichen Arbeitsstand zu `J01-92` fest.
Der Vorgang bündelt die Versionierung projektbezogener KI-Skills und die
Verankerung wiederkehrender Agent-Arbeitsweisen.

## Ziel

Shared-Regeln für Codex-Agenten workspace-weit verankern, ohne repo-spezifische
Regeln, Skills und öffentliche Doku zu vermischen.

## Jetzt umgesetzt

- Workspace-`AGENTS.md` für `/Users/usr2/edv/werk` eingeführt
- Shared-Skill `arbeitsregeln` als kanonische Langfassung ergänzt
- Dokumentationspflicht für jede Änderung als Always-on-Regel ergänzt
- Klein-Commit-Regel für Always-on-Arbeit ergänzt:
  Conventional Commits, kleine fachliche Pakete, keine unnötig liegenden Diffs
- Jira-Schritt `J01-92` auf aktive Arbeit gesetzt und kommentiert
- Shared-Skills auf echte Projektfreiheit geschärft:
  keine festen Repo-Namen, Jira-Projekt-Keys oder Projektpfade im Shared-Ziel
- Flache Legacy-Einstiege unter `.agents/skills/` als kanonische Skill-Orte
  entfernt
- Projektgebundene Mirror-/Koordinations-Betriebe im Projekt-Skill-Repo
  belassen

## Nächste Schritte

1. Repo-AGENTS gegen die neuen Shared-Regeln abgleichen.
2. Weitere teilweise allgemeine Projektbetriebe nur nach echter Entkopplung
   nach `shared/` ziehen.
3. Den aktualisierten Jira-Zustand in den öffentlichen Mirror nachziehen.

## Links

- [Mirror: J01-72 / Schritt J01-92]({{ "/de/mirror/issues/J01-72/steps/J01-92/" | relative_url }})

## Hinweise

- Workspace-AGENTS enthält nur Always-on-Kurzregeln.
- Detaillierte Fachabläufe bleiben in Skills.
- Repo-spezifische Pfad- und Worktree-Regeln bleiben in den jeweiligen
  Repo-`AGENTS.md`.
- Shared heißt in diesem Kontext:
  ohne harte Projektbindung; Projekt-Spezifika bleiben im Projekt-Skill-Repo.
