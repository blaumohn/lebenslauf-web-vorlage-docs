---
layout: page
title: "Quickstart"
permalink: /en/getting-started/quickstart/
readme_order: 1
---

```bash
composer install
php bin/cli setup dev --with-sample-content
php bin/cli build dev
composer run dev
```

`--with-sample-content` creates sample data without overwriting existing data.
`composer run dev` compiles the runtime configuration and starts the development server.

## Own data and configuration

Own CV data lives under `.local/lebenslauf/`.
Email, SMTP and deployment target are set in `.local/dev.yaml` or `.local/preview.yaml`.

- [Set up private view]({{ "/en/getting-started/private-view/" | relative_url }})
- Run CI locally
