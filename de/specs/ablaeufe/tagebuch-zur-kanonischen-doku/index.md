---
layout: page
title: "Spec: tagebuch zur kanonischen Doku"
permalink: /de/specs/ablaeufe/tagebuch-zur-kanonischen-doku/
---

Dieser Ablauf beschreibt, wie Rohmaterial aus dem `tagebuch` in kanonische
öffentliche Doku überführt wird.

## Zweck

- Herleitung sichtbar machen, ohne Rohmaterial direkt zur Public-Doku zu machen

## Auslöser

- Herkunftsfrage, neue Recherche oder nötige Begründung für eine öffentliche
  Aussage

## Beteiligte Systeme

- [`tagebuch`]({{ "/de/specs/systeme/tagebuch/" | relative_url }})
- [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- [KI-/Skill-Rahmen]({{ "/de/specs/systeme/ki-skill-rahmen/" | relative_url }})

## Ein- und Ausgänge

- Eingänge:
  - Suchfall, Notizen, Register, Austausch-Protokolle
- Ausgänge:
  - belegte öffentliche Aussage oder aktualisierte Arbeitsdoku

## Ablauf

1. Quellenregister oder passende Notizen im `tagebuch` prüfen
2. relevante Rohquellen gezielt lesen
3. stabile Aussage von Rohmaterial trennen
4. Aussage in Public-Doku oder Vorgangsseite verankern
5. bei Bedarf Quellenregister oder Rundenprotokoll ergänzen

## Übergaben

- Suchfall -> Rohnotiz
- Rohnotiz -> hergeleitete Aussage
- hergeleitete Aussage -> kanonische Doku

## Grenzen und Nicht-Ziele

- keine Rohnotiz 1:1 in Public-Doku kopieren
- kein zweiter öffentlicher SSOT neben GitHub Pages

## Verweise auf operative Doku

- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
- [J01-96]({{ "/de/jira/issues/J01-96/" | relative_url }})

## Quellen

- `tagebuch/notes/meta/system.md`
- `tagebuch/notes/index/quellenregister.md`
- [J01-96]({{ "/de/jira/issues/J01-96/" | relative_url }})
