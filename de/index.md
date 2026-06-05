---
layout: page
title: Lebenslauf-Web-Vorlage
permalink: /de/
---

Dieses Projekt ist eine wiederverwendbare PHP-Vorlage für eine
Lebenslauf-Website und ein Referenzprojekt für Produkt-, Architektur-,
Delivery- und Betriebsarbeit.
Es baut auf der früheren statischen Vorlage aus
[lebenslauf-vorlage](https://github.com/blaumohn/lebenslauf-vorlage) für
Inhalt und i18n auf und ergänzt sie um den heutigen dynamischen PHP-Bereich.

Die öffentliche Doku dokumentiert dazu drei prägende Eigenschaften:
öffentliche und token-gesicherte private Ansicht mit Schwärzung der
Kontaktdaten, eine CLI-Build-Pipeline (YAML → validiert → HTML) und einen
dateibasierten Sicherheitsrahmen für das Kontaktformular
(Rate-Limit, CAPTCHA, IP-Salt-Rotation mit `symfony/lock`).

## Einstieg

- [Einstieg / Quickstart]({{ "/de/getting-started/" | relative_url }})
- [Projektlandkarte und Specs]({{ "/de/specs/" | relative_url }})

## Repos

- [App-Repo](https://github.com/blaumohn/lebenslauf-web-vorlage)
- [GitHub-Pages-Repo](https://github.com/blaumohn/lebenslauf-web-vorlage-docs)

Die öffentliche Doku liegt in GitHub Pages.
Das App-Repo enthält Quelltext, aber keine reguläre Projektdoku unter `docs/`.

## Leserpfade

- **[Projekt einschätzen]({{ "/de/getting-started/projektprofil/" | relative_url }})**  
  Demo, Projektüberblick und Liefernachweis
- **[fachlicher Einstieg]({{ "/de/specs/projekt/" | relative_url }})**  
  Projektzweck, Projektlandkarte und zentrale Eigenschaften
- **[technischer Einstieg]({{ "/de/specs/" | relative_url }})**  
  Systemgrenzen, Systemzuschnitt und stabile Abläufe
- **[Umsetzungseinstieg]({{ "/de/getting-started/" | relative_url }})**  
  Repos, Doku-Orte und SSOT-Kontext

## Grundsatz

- Keine Jira-Cloud-Links in der öffentlichen Doku.
