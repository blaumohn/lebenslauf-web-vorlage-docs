---
layout: page
title: "KI-Projektkarte: Wo Skills Projektanforderungen finden"
permalink: /de/policies/ki-projektkarte/
---

## Ziel

Für projektbezogene KI-Skills eine kleine, kanonische Karte bereitstellen,
damit Projektanforderungen nicht im Skill dupliziert werden müssen.

## Systemrollen

- **Workspace- und Repo-`AGENTS.md`**:
  Always-on-Regeln und repo-lokale Zusatzregeln zur Laufzeit.
- **GitHub-Pages-Doku**:
  kanonische Projektanforderungen, Vorgangsregeln, Link- und Spiegelregeln.
- **`tagebuch`**:
  Provenienz, Suchfälle, Rundenprotokolle und Herleitung.
- **Skills**:
  Verweis-Karte, skillinterne Werkzeuge, Befehlscaches und wiederkehrende
  operative Arbeitsgänge.

## Was ein Skill hier finden soll

- wo Vorgangsarbeit öffentlich unter `work/jira/J01-<KEY>/` liegt
- wo kanonische Projektregeln unter `policies/`, `operations/`, `areas/` und
  `decisions/` liegen
- wo der Mirror nur abgeleitete Sicht ist und nicht SSOT
- wo Provenienz und Quellenlage im `tagebuch` nachgesehen werden

## Was ein Skill selbst tragen darf

- eine knappe Projektkarte mit Links auf die kanonischen Quellen
- skillinterne Hilfen wie Cache-Rezepte und Skriptpfade
- den konkreten wiederkehrenden Arbeitsgang des Skills

## Was ein Skill nicht duplizieren soll

- projektweite Anforderungen, die schon kanonisch in GitHub Pages stehen
- vollständige Vorgangsdefinitionen aus `work/jira/`
- Themenhistorien oder Meta-Register, wenn dafür bereits Doku oder
  Quellenregister existieren

## Kanonische Einstiege

- [Doku-Richtlinie]({{ "/de/policies/doku-richtlinie/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/work/jira/" | relative_url }})
- [Jira- und Doku-Tooling: Jira-Übersicht]({{ "/de/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})

## Quellen und Provenienz

- Das `tagebuch` bleibt der Ort für Suchfälle, Rundenprotokolle und Herleitung.
- Skills verweisen auf das Quellenregister oder auf gezielt passende Notizen,
  führen aber keine doppelte Projektgeschichte.
