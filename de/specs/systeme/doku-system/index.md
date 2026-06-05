---
layout: page
title: "Spec: Doku-System"
permalink: /de/specs/systeme/doku-system/
---

Das Doku-System ist die kanonische öffentliche Projektfläche in GitHub Pages.
Hier werden Regeln, Bereichsdoku, Runbooks, Arbeitsdokus und Specs
veröffentlicht.

## Was es ist

- das Repo `lebenslauf-web-vorlage-docs`
- die öffentliche Dokumentation unter `/de/...` und `/en/...`
- der kanonische Ort für öffentliche Projektregeln und stabile Erklärseiten

## Was es nicht ist

- nicht Jira selbst
- nicht das Rohnotizsystem
- nicht das Produkt-Repo

## Warum

- das Projekt braucht einen öffentlichen, statischen und kanonischen Doku-Ort
- Skills und Leser sollen Projektwissen nicht aus verstreuten Einzelquellen
  zusammensuchen müssen

## Aufbau

- `areas/`
- `policies/`
- `operations/`
- `decisions/`
- `work/`
- `specs/`

## Rollen

- Leser orientieren sich hier öffentlich
- Autoren pflegen stabile Regeln und Erklärungen
- Jira-Arbeitsdokus machen Arbeitsschritte öffentlich nachvollziehbar

## Schnittstellen

- spiegelt Arbeitsstände aus dem [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- verweist auf Repos im [GitHub- und PR-System]({{ "/de/specs/systeme/github-zusammenarbeit/" | relative_url }})
- nutzt `tagebuch` nur als Provenienzquelle

## Ist und Zielbild

- Ist:
  - öffentliche Doku, Jira-Fläche und Regeln existieren
- Zielbild:
  - zusätzlich klare Projekt-, System- und Ablauf-Specs als Landkarte

## Übergeordnete Systeme

- [Projekt-Gesamtsystem]({{ "/de/specs/projekt/" | relative_url }})

## Untergeordnete Systeme

- Bereichsdoku
- Richtlinien und Runbooks
- öffentliche Jira-Arbeitsdokus
- Specs

## Verwandte Systeme

- [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- [`tagebuch`]({{ "/de/specs/systeme/tagebuch/" | relative_url }})

## Quellen

- [Doku-Richtlinie]({{ "/de/policies/doku-richtlinie/" | relative_url }})
- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
- [Jira]({{ "/de/jira/" | relative_url }})
- `lebenslauf-web-vorlage-docs/README.md`
