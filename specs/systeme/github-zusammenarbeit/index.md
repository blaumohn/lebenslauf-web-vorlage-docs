---
layout: page
title: "Spec: GitHub- und PR-System"
permalink: /de/specs/systeme/github-zusammenarbeit/
---

Das GitHub- und PR-System trägt Quellcode, Branches, Commits, Reviews und
Repo-Grenzen des Projektverbunds.

## Was es ist

- das System aus Repositories, Branches, Commits und Pull Requests
- die technische Integrations- und Review-Schicht
- der Ort, an dem Änderungen versioniert und geprüft werden

## Was es nicht ist

- nicht der operative Status-SSOT
- nicht die kanonische Regel- und Projektdoku
- nicht das Rohnotizsystem

## Warum

- der Projektverbund braucht klare Repo-Grenzen und nachvollziehbare Änderungen
- Produkt-, Doku- und Skill-Arbeit dürfen nicht in undurchsichtigen Mischungen
  enden

## Aufbau

- App-Repo
- Doku-Repo
- Config-Spec-Repo
- Skill-Repos
- weitere Hilfs-Repos

## Rollen

- Entwickler committen und reviewen
- Repos bilden technische Zuständigkeiten ab
- Git-Historie dient auch als Belegfamilie für spätere Doku

## Schnittstellen

- Jira liefert Arbeitskontext
- Doku erklärt stabile Ergebnisse öffentlich
- projektübergreifende Änderungen berühren mehrere Repos mit getrennten Commits

## Ist und Zielbild

- Ist:
  - Repo-Rollen und Git-Flüsse sind teilweise dokumentiert
- Zielbild:
  - klare Zuordnung zwischen Arbeitsträger, Repo und öffentlicher Erklärung

## Übergeordnete Systeme

- [Projekt-Gesamtsystem]({{ "/de/specs/projekt/" | relative_url }})

## Untergeordnete Systeme

- einzelne Repos des Projektverbunds
- Branch- und Integrationspfade

## Verwandte Systeme

- [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- [KI-/Skill-Rahmen]({{ "/de/specs/systeme/ki-skill-rahmen/" | relative_url }})

## Quellen

- `skills/koordination/references/repos.md`
- `skills/koordination/SKILL.md`
- [J01-106]({{ "/de/jira/issues/J01-106/" | relative_url }})
- [J01-98: Migrationslandkarte]({{ "/de/jira/issues/J01-98/migration-map/" | relative_url }})
