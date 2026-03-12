---
layout: page
title: "J01-93: GitHub Pages und Jira-Spiegel zweisprachig machen"
permalink: /de/work/jira/J01-93/
---

**Stand:** 2026-03-12

Kanonischer öffentlicher Arbeitsstand für `J01-93`.
Der Vorgang führt die öffentliche Doku und den Jira-Spiegel als neutrale,
zweisprachige GitHub-Pages-Seite ein.

## Ziel

Die GitHub-Pages-Doku und der statische Jira-Spiegel werden vollständig unter
`/de/...` und `/en/...` geführt, mit neutraler Sprachwahl auf `/` und
Sprachwechsel direkt auf den jeweiligen Gegen-Seiten.

## Scope

- Sprachwahl auf `/`
- Sprachwahl auf Inhaltsseiten als `Deutsch | English`
- klare visuelle Trennung zwischen Site-Titel, Inhaltsnavigation und
  Sprachauswahl im Header
- DE/EN-Struktur für öffentliche Seiten
- DE/EN-Struktur für `mirror/`
- verpflichtende EN-Nachpflege bei Mirror-Änderungen

## Jetzt als Nächstes

1. Jekyll-Struktur auf DE/EN-URLs umstellen.
2. Header und Navigation sprachabhängig machen.
3. Mirror-Generator auf DE/EN-Ausgabe erweitern.
4. Vorschau-Workflow so anpassen, dass beide Sprachbäume in einem Lauf
   verfügbar sind.

## Abnahme

- `/` bleibt ohne JavaScript neutral.
- Die Sprachwahl zeigt die aktuelle Sprache ohne Link und die andere Sprache
  als Link.
- Header und Navigation lassen Hauptseite, Inhaltsnavigation und
  Sprachauswahl klar getrennt erkennen.
- Der mehrzeilige Site-Titel wirkt auch bei Umbruch als ein einzelner Link
  ohne übergroßen Leerraum zwischen den Zeilen.
- Mirror-Änderungen ohne EN-Nachpflege werden sichtbar blockiert.

## Links

- [Mirror: J01-93]({{ "/de/mirror/issues/J01-93/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/work/jira/" | relative_url }})
