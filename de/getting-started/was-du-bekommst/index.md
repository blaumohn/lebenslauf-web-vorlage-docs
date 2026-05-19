---
layout: page
title: "Überblick"
permalink: /de/getting-started/ueberblick/
readme_order: 2
---

Betriebsfertiger PHP-Seitenstarter für Shared Hosting: öffentliche Ansicht
mit geschwärzten Kontaktdaten, token-gesicherte private Vollansicht ohne Login,
i18n-Lebenslauf-Inhalt in YAML und fertige Dev- und CI/CD-Pipelines.

- **Öffentliche Sicht** — Lebenslauf mit geschwärzten Kontaktdaten
- **Private Sicht** — vollständige Ansicht per URL-Token (`/cv?token=…`), kein Login nötig
- **i18n YAML-Inhalt** — Lebenslauf-Daten in Deutsch und Englisch
- **Fertige Pipelines** — lokale Entwicklung mit Docker, CI-Prüfung und SFTP-Deployment
- **Sicherheitsschicht** — Rate-Limit, CAPTCHA und IP-Salt-Rotation für das Kontaktformular

## Mehr

- [Schnellstart]({{ "/de/getting-started/schnellstart/" | relative_url }})
- [Private Ansicht einrichten]({{ "/de/getting-started/private-ansicht/" | relative_url }})
- [Technische Besonderheiten]({{ "/de/getting-started/technische-besonderheiten/" | relative_url }})
