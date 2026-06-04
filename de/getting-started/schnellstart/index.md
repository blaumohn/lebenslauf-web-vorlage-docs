---
layout: page
title: "Schnellstart"
permalink: /de/getting-started/schnellstart/
readme_order: 1
---

<small>*Quelle: `tests/ci/readme-dev-user-flow.sh` > `schnellstart()`*</small>

```bash
git clone https://github.com/blaumohn/lebenslauf-web-vorlage lebenslauf-web-vorlage
cd lebenslauf-web-vorlage
export PATH="$PWD/bin:$PATH"  # statt export: php bin/cli …
composer install
cli setup dev --with-sample-content
cli build dev
cli start dev > /tmp/readme-dev-ux-server.log 2>&1 &
dev_server_pid="$!"
wait_for_dev_server
```

## Eigene Daten und Konfiguration

Eigene Lebenslauf-Daten liegen unter `.local/lebenslauf/`.
E-Mail, SMTP und Deployment-Ziel werden in `.local/dev.yaml` bzw. `.local/preview.yaml` gesetzt.

- [Private Ansicht einrichten]({{ "/de/getting-started/private-ansicht/" | relative_url }})
- CI lokal prüfen
