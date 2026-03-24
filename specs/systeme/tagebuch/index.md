---
layout: page
title: "Spec: tagebuch"
permalink: /de/specs/systeme/tagebuch/
---

Das `tagebuch` ist das Provenienz-, Such- und Herleitungssystem des Projekts.

## Was es ist

- ein Markdown-basiertes Rohnotizsystem
- der Ort für Suchfälle, Austausch-Notizen, Rundenprotokolle und Register
- eine abgeleitete, aber nicht öffentliche Quellenbasis für spätere Doku

## Was es nicht ist

- nicht die kanonische öffentliche Projektdoku
- nicht Jira
- nicht das Produkt-Repo

## Warum

- Entscheidungen und Herleitungen sollen nachvollziehbar bleiben
- Rohmaterial braucht einen Ort, der frühe Ordnung nicht erzwingt

## Aufbau

- `notes/inbox/`
- `notes/meta/`
- `notes/index/`
- `notes/raw/`

## Rollen

- Menschen und KI legen Rohmaterial und Suchnotizen ab
- Register bündeln relevante Quellenfälle
- öffentliche Doku übernimmt daraus nur stabile Aussagen

## Schnittstellen

- liefert Provenienz an das [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- wird von Skills als Quellenort genutzt
- bleibt vom [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }}) getrennt

## Ist und Zielbild

- Ist:
  - Rohmaterial und Register sind vorhanden
- Zielbild:
  - das `tagebuch` bleibt Rohstoff und wird nicht zur zweiten Fachdoku

## Übergeordnete Systeme

- [Projekt-Gesamtsystem]({{ "/de/specs/projekt/" | relative_url }})

## Untergeordnete Systeme

- Quellenregister
- Meta-Notizen
- Inbox-Notizen

## Verwandte Systeme

- [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- [KI-/Skill-Rahmen]({{ "/de/specs/systeme/ki-skill-rahmen/" | relative_url }})

## Quellen

- `tagebuch/notes/meta/system.md`
- `tagebuch/notes/index/quellenregister.md`
- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
- [J01-96]({{ "/de/jira/issues/J01-96/" | relative_url }})
