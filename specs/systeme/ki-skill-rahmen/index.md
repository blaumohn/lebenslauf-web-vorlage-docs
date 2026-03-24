---
layout: page
title: "Spec: KI-/Skill-Rahmen"
permalink: /de/specs/systeme/ki-skill-rahmen/
---

Der KI-/Skill-Rahmen ist das versionierte Arbeits- und Regelwerk für
projektgebundene KI-Arbeit im Workspace.

## Was es ist

- der Verbund aus Workspace-`AGENTS.md`, Skill-Repos und projektbezogenen
  Skills
- die Schicht für wiederkehrende KI-Arbeitsgänge, Repo-Koordination und
  Regeltrennung
- die Heimat von Verweis- und Ausführungslogik für KI-Arbeit

## Was es nicht ist

- nicht die öffentliche Langfassung aller Projektregeln
- nicht das Produkt selbst
- nicht das Rohnotizsystem

## Warum

- KI-Arbeit braucht versionierte, wiederverwendbare und projektgebundene
  Arbeitsgänge
- Skills sollen Projektwissen verlinken, nicht duplizieren

## Aufbau

- Shared-Skills
- projektbezogene Skill-Repos
- projektgebundene Fach-Skills wie `koordination`, `docs-i18n`,
  `jira-state-sync`

## Rollen

- Shared-Skills tragen allgemeine Methode
- Projekt-Skills tragen konkrete Arbeitsgänge und Projektbindung
- Workspace-`AGENTS.md` bleibt Bootstrap statt Fachheimat

## Schnittstellen

- verweist auf [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }}) und [Specs]({{ "/de/specs/" | relative_url }})
- nutzt `tagebuch` für Provenienz
- arbeitet mit Jira- und Repo-System zusammen

## Ist und Zielbild

- Ist:
  - Projektkarte, Skills und Regelarbeit sind vorhanden
- Zielbild:
  - Specs werden zusätzliche kanonische Zielreferenzen für Skills

## Übergeordnete Systeme

- [Projekt-Gesamtsystem]({{ "/de/specs/projekt/" | relative_url }})

## Untergeordnete Systeme

- Shared-Skills
- Projekt-Skills
- Cache- und Skriptpfade

## Verwandte Systeme

- [`tagebuch`]({{ "/de/specs/systeme/tagebuch/" | relative_url }})
- [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- [GitHub- und PR-System]({{ "/de/specs/systeme/github-zusammenarbeit/" | relative_url }})

## Quellen

- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
- `skills/koordination/SKILL.md`
- `skills/docs-i18n/SKILL.md`
- `skills/jira-state-sync/SKILL.md`
- [J01-111]({{ "/de/jira/issues/J01-111/" | relative_url }})
- [J01-113: Anlage Regelwerk-Bestand]({{ "/de/jira/issues/J01-113/anlage-regelwerk-bestand/" | relative_url }})
