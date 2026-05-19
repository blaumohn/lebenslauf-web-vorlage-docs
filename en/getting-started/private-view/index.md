---
layout: page
title: "Set up private view"
permalink: /en/getting-started/private-view/
readme_order: 3
---

The private view shows the full CV via URL token — no login, no account.
Set up after `composer run dev`:

1. **Generate token** — `php bin/cli token rotate preview`
2. **Create `.local/preview.yaml`** — set `APP_ROOT_URL` and deployment values.
   Secure with `chmod 600`: only trusted users may read the file.
3. **Set GitHub Secrets/Vars** — required fields from `src/resources/pipeline-config/manifest.yaml`,
   section `pipelines.preview`, in the GitHub environment `preview`.
4. **Check CI locally** — `composer run ci:preview`
5. **Open** — `https://domain/cv?token=<token>`

## Security model

`.local/preview.yaml` contains credentials and token values.
`chmod 600` prevents AI agents and other processes with reduced trust
from reading the file.
