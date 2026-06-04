---
layout: page
title: "Quickstart"
permalink: /en/getting-started/quickstart/
readme_order: 1
---

**`schnellstart()`**

```bash
schnellstart() {
  git clone https://github.com/blaumohn/lebenslauf-web-vorlage lebenslauf-web-vorlage
  cd lebenslauf-web-vorlage
  export PATH="$PWD/bin:$PATH"  # statt export: php bin/cli …
  composer install
  cli setup dev --with-sample-content
  cli build dev
  cli start dev > /tmp/readme-dev-ux-server.log 2>&1 &
  dev_server_pid="$!"
  wait_for_dev_server
}
```

Source: `tests/ci/readme-dev-user-flow.sh`. The clone command uses the public GitHub URL here.

## Own data and configuration

Own CV data lives under `.local/lebenslauf/`.
Email, SMTP and deployment target are set in `.local/dev.yaml` or `.local/preview.yaml`.

- [Set up private view]({{ "/en/getting-started/private-view/" | relative_url }})
- Run CI locally
