---
layout: page
title: "Runbook: preview GitHub Pages locally"
permalink: /en/operations/ghpages-preview/
---

## Purpose

Start the GitHub Pages site locally as a Jekyll server so content and links can
be checked without waiting for GitHub Pages.

## Requirements

- Docker (inkl. `docker compose`)
- `compose.yaml` ist vorhanden

## Steps

Preview-Server starten (Port 4000):

```bash
docker compose up --build ghpages-preview
```

Shell im Container (Debugging):

```bash
docker compose run --rm ghpages-shell
```

## Notes

- The preview server runs on `http://localhost:4000/`.
- Before startup, the derived EN mirror is synchronized from the DE mirror.
- Internal links should use `relative_url` so `baseurl` is handled correctly
  (empty in this site).

## Troubleshooting

- If the port is taken, change the port mapping in `compose.yaml`
  (for example `4001:4000`).
