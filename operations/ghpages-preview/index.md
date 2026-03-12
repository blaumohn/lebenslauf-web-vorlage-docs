---
layout: page
title: "Runbook: GitHub Pages lokal previewen"
permalink: /de/operations/ghpages-preview/
---

## Zweck

Die GitHub-Pages-Seite lokal als Jekyll-Server starten, um Inhalte/Links zu pruefen,
ohne GitHub Pages abzuwarten.

## Voraussetzungen

- Docker (inkl. `docker compose`)
- `compose.yaml` ist vorhanden

## Schritte

Preview-Server starten (Port 4000):

```bash
docker compose up --build ghpages-preview
```

Shell im Container (Debugging):

```bash
docker compose run --rm ghpages-shell
```

## Hinweise

- Der Preview-Server laeuft auf `http://localhost:4000/`.
- Vor dem Start wird der abgeleitete EN-Mirror aus dem DE-Mirror synchronisiert.
- Interne Links sollen mit `relative_url` gebaut werden, damit `baseurl` korrekt greift (bei dieser Site leer).

## Troubleshooting

- Port belegt: in `compose.yaml` ein anderes Port-Mapping setzen (z. B. `4001:4000`).
