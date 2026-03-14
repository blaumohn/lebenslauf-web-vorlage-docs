---
layout: page
title: "J01-93: GitHub Pages und Jira-Spiegel zweisprachig machen"
permalink: /de/work/jira/J01-93/
---

**Stand:** 2026-03-14

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
- Jira-Remote-Links nach GitHub Pages werden im Mirror als relative Site-Links
  bestätigt und folgen dem Sprachkontext der Zielseite

## Stand im Vorgang

- GitHub Pages und Mirror laufen unter `/de/...` und `/en/...`.
- Jira-Remote-Links werden im Mirror auf site-relative Pfade umgewandelt.
- Sprachgebundene GitHub-Pages-Ziele werden im DE-Mirror auf `/de/...` und im
  EN-Mirror auf `/en/...` gezeigt.
- Eine lokale Prüfung bestätigt die aus Jira importierten GitHub-Pages-Ziele
  direkt gegen dieses Repo.

## Abnahme

- `/` bleibt ohne JavaScript neutral.
- Die Sprachwahl zeigt die aktuelle Sprache ohne Link und die andere Sprache
  als Link.
- Header und Navigation lassen Hauptseite, Inhaltsnavigation und
  Sprachauswahl klar getrennt erkennen.
- Der mehrzeilige Site-Titel wirkt auch bei Umbruch als ein einzelner Link
  ohne übergroßen Leerraum zwischen den Zeilen.
- Mirror-Änderungen ohne EN-Nachpflege werden sichtbar blockiert.
- Importierte Jira-Links zeigen im Mirror keine absolute Doku-Domain mehr.
- Importierte Jira-Links werden lokal gegen die vorhandenen GitHub-Pages-Ziele
  geprüft.

## Links

- [Mirror: J01-93]({{ "/de/mirror/issues/J01-93/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/work/jira/" | relative_url }})
