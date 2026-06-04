---
layout: page
title: "Schnellstart"
permalink: /de/getting-started/schnellstart/
readme_order: 1
---

<small>*Quelle: [tests/ci/readme-dev-user-flow.sh](https://github.com/blaumohn/lebenslauf-web-vorlage/blob/main/tests/ci/readme-dev-user-flow.sh) > `schnellstart()`*</small>

```bash
git clone "$REPLACE_WITH_REPOSITORY_URL" lebenslauf-web-vorlage
cd lebenslauf-web-vorlage
composer install
php bin/cli setup dev --with-sample-content
php bin/cli build dev
php bin/cli start dev > /tmp/readme-dev-ux-server.log 2>&1 &
dev_server_pid="$!"
wait_for_dev_server
```

## Eigene Daten und Konfiguration

Eigene Lebenslauf-Daten liegen unter `.local/lebenslauf/`.
E-Mail, SMTP und Deployment-Ziel werden in `.local/dev.yaml` bzw. `.local/preview.yaml` gesetzt.

- [Private Ansicht einrichten]({{ "/de/getting-started/private-ansicht/" | relative_url }})
- CI lokal prüfen
