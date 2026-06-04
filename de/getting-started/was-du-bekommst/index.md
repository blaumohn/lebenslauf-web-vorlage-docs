---
layout: page
title: "Überblick"
permalink: /de/getting-started/ueberblick/
readme_order: 2
---

Betriebsfertiger PHP-Seitenstarter für Shared Hosting: öffentliche Ansicht
mit geschwärzten Kontaktdaten, token-gesicherte private Vollansicht ohne Login,
i18n-Lebenslauf-Inhalt in YAML und fertige Dev- und CI/CD-Pipelines.

- **[Öffentliche Sicht]({{ "/de/specs/systeme/app/" | relative_url }})** —
  Lebenslauf mit geschwärzten Kontaktdaten.
- **[Private Sicht]({{ "/de/getting-started/private-ansicht/" | relative_url }})** —
  vollständige Ansicht per URL-Token (`/cv?token=…`), kein Login nötig.
- **[i18n YAML-Inhalt]({{ "/de/specs/systeme/app/" | relative_url }})** —
  Lebenslauf-Daten in Deutsch und Englisch.
- **[Fertige Pipelines]({{ "/de/areas/cli-build/" | relative_url }})** —
  lokale Entwicklung mit Docker, CI-Prüfung und SFTP-Deployment.
- **[Sicherheitsschicht]({{ "/de/areas/http-runtime/" | relative_url }})** —
  Rate-Limit, CAPTCHA und IP-Salt-Rotation für das Kontaktformular.

## Mehr

- [Schnellstart]({{ "/de/getting-started/schnellstart/" | relative_url }})
- [Private Ansicht einrichten]({{ "/de/getting-started/private-ansicht/" | relative_url }})
- [Technische Besonderheiten]({{ "/de/getting-started/technische-besonderheiten/" | relative_url }})
