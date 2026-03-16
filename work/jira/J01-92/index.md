---
layout: page
title: "J01-92: Shared-Agent-Regeln und Skill-Versionierung"
permalink: /de/work/jira/J01-92/
---

**Stand:** 2026-03-16

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
- neuen Dokutyp `feature-matrix` mit Vorlage, Policy-Eintrag und kanonischem
  URI-Muster eingeführt
- kanonische Feature-Matrix für Jira- und Doku-Tooling unter
  `areas/proj-doku-tooling/feature-matrix/` angelegt
- skillnahe Jira-/Pages-Helfer aus `lebenslauf-web-vorlage-docs/scripts/`
  in das Projekt-Skill-Repo zurückgezogen
- im Doku-Repo in diesem Themenblock nur die aktuell benötigten
  Container-/Build-Vorläufe belassen
- Jira-Vorgang `J01-92` nach dem Umsetzungsstand auf `Erledigt` gezogen

## Nächste Schritte

1. Spätere Ziel- oder Tooling-Reifung der markierten Kandidaten nur per
   separatem Folge-Vorgang entscheiden.
2. Repo-AGENTS gegen die neuen Shared-Regeln abgleichen.

## Links

- [Mirror: J01-72 / Schritt J01-92]({{ "/de/mirror/issues/J01-72/steps/J01-92/" | relative_url }})
- [Feature-Matrix: Jira- und Doku-Tooling]({{ "/de/areas/proj-doku-tooling/feature-matrix/" | relative_url }})

## Hinweise

- Workspace-AGENTS enthält nur Always-on-Kurzregeln.
- Detaillierte Fachabläufe bleiben in Skills.
- Skillnahe Helfer starten im Projekt-Skill-Repo; ein Wechsel nach Ziel- oder
  Tooling-Repo braucht eine eigene Abstimmung.
- Repo-spezifische Pfad- und Worktree-Regeln bleiben in den jeweiligen
  Repo-`AGENTS.md`.
- Shared heißt in diesem Kontext:
  ohne harte Projektbindung; Projekt-Spezifika bleiben im Projekt-Skill-Repo.
