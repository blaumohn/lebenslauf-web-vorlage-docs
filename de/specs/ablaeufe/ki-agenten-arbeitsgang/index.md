---
layout: page
title: "Spec: KI-Agenten-Arbeitsgang"
permalink: /de/specs/ablaeufe/ki-agenten-arbeitsgang/
---

Dieser Ablauf beschreibt den wiederkehrenden Arbeitsgang für projektgebundene
KI-Arbeit.

## Zweck

- KI-Arbeit reproduzierbar, quellenbasiert und repo-sauber ausführen

## Auslöser

- Nutzerauftrag oder Folgearbeit in einem bestehenden Vorgang

## Beteiligte Systeme

- [KI-/Skill-Rahmen]({{ "/de/specs/systeme/ki-skill-rahmen/" | relative_url }})
- [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- [`tagebuch`]({{ "/de/specs/systeme/tagebuch/" | relative_url }})
- [GitHub- und PR-System]({{ "/de/specs/systeme/github-zusammenarbeit/" | relative_url }})

## Ein- und Ausgänge

- Eingänge:
  - Auftrag, Kontext, Quellenhinweise
- Ausgänge:
  - umgesetzte Änderung, öffentliche Arbeitsdoku, ggf. Rundenprotokoll

## Ablauf

1. passende Skills und Regeln laden
2. Scope, Jira-Bezug und Ziel-Repos klären
3. Quellen im Doku-System, Skill-Repo und `tagebuch` prüfen
4. Änderungen repo-getrennt umsetzen
5. Doku, Commits und Nachweise nachziehen

## Übergaben

- Nutzerauftrag -> Skill-Arbeitsgang
- Quellenprüfung -> Repo-Arbeit
- Repo-Arbeit -> öffentliche Doku und Commit

## Grenzen und Nicht-Ziele

- keine implizite Scope-Erweiterung
- keine Vermischung von Repo-Arbeit in einem Commit

## Verweise auf operative Doku

- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
- [J01-111]({{ "/de/jira/issues/J01-111/" | relative_url }})
- [J01-113]({{ "/de/jira/issues/J01-113/" | relative_url }})

## Quellen

- `skills/koordination/SKILL.md`
- `skills/docs-i18n/SKILL.md`
- `skills/jira-state-sync/SKILL.md`
- [J01-113: Anlage Regelwerk-Bestand]({{ "/de/jira/issues/J01-113/anlage-regelwerk-bestand/" | relative_url }})
