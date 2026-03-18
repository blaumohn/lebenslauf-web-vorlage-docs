---
layout: page
title: "J01-93: GitHub Pages und öffentliche Jira-Fläche zweisprachig machen"
jira_key: J01-93
permalink: /de/jira/issues/J01-93/
---

**Stand:** 2026-03-14

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-93`.
Der Vorgang führt die öffentliche Doku und die öffentliche Jira-Fläche als neutrale,
zweisprachige GitHub-Pages-Seite ein.

## Ziel

Die GitHub-Pages-Doku und die öffentliche Jira-Fläche werden vollständig unter
`/de/...` und `/en/...` geführt, mit neutraler Sprachwahl auf `/` und
Sprachwechsel direkt auf den jeweiligen Gegen-Seiten.

## Scope

- Sprachwahl auf `/`
- Sprachwahl auf Inhaltsseiten als `Deutsch | English`
- klare visuelle Trennung zwischen Site-Titel, Inhaltsnavigation und
  Sprachauswahl im Header
- DE/EN-Struktur für öffentliche Seiten
- DE/EN-Struktur für `jira/`
- verpflichtende EN-Nachpflege bei Änderungen an der öffentlichen Jira-Fläche
- Jira-Remote-Links nach GitHub Pages werden in der öffentlichen Jira-Fläche als relative Site-Links
  bestätigt und folgen dem Sprachkontext der Zielseite

## Stand im Vorgang

- GitHub Pages und die öffentliche Jira-Fläche laufen unter `/de/...` und `/en/...`.
- Jira-Remote-Links werden in der öffentlichen Jira-Fläche auf site-relative
  Pfade umgewandelt.
- Sprachgebundene GitHub-Pages-Ziele werden im DE-Kontext auf `/de/...` und
  im EN-Kontext auf `/en/...` gezeigt.
- Eine lokale Prüfung bestätigt die aus Jira importierten GitHub-Pages-Ziele
  direkt gegen dieses Repo.
- Der Vorgang ist in Jira auf `Erledigt` gesetzt; öffentlicher Stand und
  Jira-Fläche
  sind nachgezogen.

## Abschluss

- Die zweisprachige GitHub-Pages-Struktur für Doku und öffentliche Jira-Fläche
  ist umgesetzt.
- Die Linknormalisierung und lokale Zielprüfung für importierte Jira-Links
  laufen im aktuellen Betrieb mit.
- Offene Restarbeit liegt nicht mehr in `J01-93`, sondern bei späteren
  Folgeschritten.

## Abnahme

- `/` bleibt ohne JavaScript neutral.
- Die Sprachwahl zeigt die aktuelle Sprache ohne Link und die andere Sprache
  als Link.
- Header und Navigation lassen Hauptseite, Inhaltsnavigation und
  Sprachauswahl klar getrennt erkennen.
- Der mehrzeilige Site-Titel wirkt auch bei Umbruch als ein einzelner Link
  ohne übergroßen Leerraum zwischen den Zeilen.
- Änderungen an der öffentlichen Jira-Fläche ohne EN-Nachpflege werden
  sichtbar blockiert.
- Importierte Jira-Links zeigen dort keine absolute Doku-Domain mehr.
- Importierte Jira-Links werden lokal gegen die vorhandenen GitHub-Pages-Ziele
  geprüft.

## Links

- [Jira: J01-93]({{ "/de/jira/issues/J01-93/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
