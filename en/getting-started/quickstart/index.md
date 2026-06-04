---
layout: page
title: "Quickstart"
permalink: /en/getting-started/quickstart/
readme_order: 1
---

<small>*Source: [tests/ci/readme-dev-user-flow.sh](https://github.com/blaumohn/lebenslauf-web-vorlage/blob/main/tests/ci/readme-dev-user-flow.sh) > `schnellstart()`*</small>

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

## Own data and configuration

Own CV data lives under `.local/lebenslauf/`.
Email, SMTP and deployment target are set in `.local/dev.yaml` or `.local/preview.yaml`.

- [Set up private view]({{ "/en/getting-started/private-view/" | relative_url }})
- Run CI locally
