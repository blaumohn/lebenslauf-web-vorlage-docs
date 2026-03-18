---
layout: page
title: Lebenslauf-Web-Vorlage
permalink: /de/
---

PHP-Vorlage für eine Lebenslauf-Site auf Shared-Hosting.

Drei Eigenschaften, die über eine einfache CV-Seite hinausgehen:
öffentliche und token-gesicherte private Ansicht mit Schwärzung der
Kontaktdaten, eine CLI-Build-Pipeline (YAML → validiert → HTML),
und ein dateibasierter Sicherheitsrahmen für das Kontaktformular
(Rate-Limit, CAPTCHA, IP-Salt-Rotation mit `symfony/lock`).

## Einstieg

- [Einstieg / Quickstart]({{ "/de/getting-started/" | relative_url }})

## Repos

- [App-Repo](https://github.com/blaumohn/lebenslauf-web-vorlage)
- [GitHub-Pages-Repo](https://github.com/blaumohn/lebenslauf-web-vorlage-docs)

Die öffentliche Doku liegt in GitHub Pages.
Das App-Repo enthält Quelltext, aber keine reguläre Projektdoku unter `docs/`.

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
- [Vorlagen]({{ "/de/templates/" | relative_url }})
- [Qualität]({{ "/de/quality/" | relative_url }})

## Grundsatz

- Keine Jira-Cloud-Links in der öffentlichen Doku.
