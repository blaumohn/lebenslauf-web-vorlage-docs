---
layout: page
title: Lebenslauf-Web-Vorlage
permalink: /de/
---

Dieses Projekt ist eine wiederverwendbare PHP-Vorlage für eine
Lebenslauf-Website und ein Referenzprojekt für Produkt-, Architektur-,
Delivery- und Betriebsarbeit.

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

- fachlicher Einstieg:
  Projektzweck, Projektlandkarte und zentrale Eigenschaften
- technischer Einstieg:
  Systemgrenzen, Betriebsmodell, Delivery- und Qualitätslogik
- Umsetzungseinstieg:
  Repos, Build-/Runtime-Pfade, Policies, Runbooks und Arbeitsdoku

## Bereiche

Die Dokumentation ist nach Projektbereichen strukturiert, damit Seiten
wie z. B. Runbooks oder Entscheidungen sofort einordbar sind.

- [Bereiche (Überblick)]({{ "/de/areas/" | relative_url }})

## Entscheidungen / Betrieb / Zustand

- [Entscheidungen (ADRs)]({{ "/de/decisions/" | relative_url }})
- [Betrieb (Runbook)]({{ "/de/operations/" | relative_url }})
- [Sprint-Historie (öffentlich)]({{ "/de/work/sprints/" | relative_url }})
- [Jira‑Übersicht (öffentlich)]({{ "/de/jira/" | relative_url }})
- [Richtlinien]({{ "/de/policies/" | relative_url }})
- [Specs]({{ "/de/specs/" | relative_url }})
- [Vorlagen]({{ "/de/templates/" | relative_url }})
- [Qualität]({{ "/de/quality/" | relative_url }})

## Grundsatz

- Keine Jira-Cloud-Links in der öffentlichen Doku.
