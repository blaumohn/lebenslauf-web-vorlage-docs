---
layout: page
title: "Schnellstart"
permalink: /de/getting-started/schnellstart/
readme_order: 1
---

```bash
composer install
php bin/cli setup dev --with-sample-content
php bin/cli build dev
composer run dev
```

`--with-sample-content` legt Beispieldaten an, ohne bestehende Daten zu überschreiben.
`composer run dev` kompiliert die Runtime-Konfiguration und startet den Entwicklungsserver.

## Eigene Daten und Konfiguration

Eigene Lebenslauf-Daten liegen unter `.local/lebenslauf/`.
E-Mail, SMTP und Deployment-Ziel werden in `.local/dev.yaml` bzw. `.local/preview.yaml` gesetzt.

- [Private Ansicht einrichten]({{ "/de/getting-started/private-ansicht/" | relative_url }})
- [CI lokal prüfen]({{ "/de/getting-started/ci-lokal/" | relative_url }})
