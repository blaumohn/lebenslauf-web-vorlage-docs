---
layout: page
title: "J01-111: KI-Regelwerk-Kohärenz und Prüfarchitektur"
jira_key: J01-111
permalink: /de/jira/issues/J01-111/
---

**Stand:** 2026-03-20

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für das Epic `J01-111`.
Das Epic bündelt zwei eng verwandte, aber getrennt umzusetzende Arbeitsstränge
rund um die KI-Agenten-Regelstruktur im Projektverbund
`lebenslauf-web-vorlage`.

## Ziel

- Regelwerk bereinigen: Verdoppelungen entfernen, drei Ebenen sauber trennen,
  je Regel eine formale Prüfkategorie zuordnen.
- Prüfarchitektur aufbauen: Vier-Kategorien-System aus Hook, Skript, lokalem
  Modell und API-Modell, das das bereinigte Regelwerk maschinell prüft.

## Enthaltene Vorgänge

- [J01-113: Regelwerk-Bereinigung]({{ "/de/jira/issues/J01-113/" | relative_url }}) —
  Voraussetzung
- [J01-115: KI-Prüfarchitektur]({{ "/de/jira/issues/J01-115/" | relative_url }}) —
  baut auf J01-113 auf

## Aktueller Stand

- Epic angelegt, beide Tasks dem Epic zugeordnet.
- J01-113 blockiert J01-115.
- Beide Vorgänge im aktiven Sprint, Label `sprint-unplanned`.

## Links

- [J01-92: Shared-Agent-Regeln und Skill-Versionierung]({{ "/de/jira/issues/J01-92/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
