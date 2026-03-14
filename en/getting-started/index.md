---
layout: page
title: Getting started / quickstart
permalink: /en/getting-started/
---

```bash
composer install
```

```bash
php bin/cli setup dev
```

```bash
php bin/cli run dev
```

Note: create `.local/dev-runtime.yaml` before the first start
(see `src/resources/config/dev-runtime.yaml`).

## Repositories and docs location

- App repo: <https://github.com/blaumohn/lebenslauf-web-vorlage>
- GitHub Pages repo: <https://github.com/blaumohn/lebenslauf-web-vorlage-docs>

The app repo contains the source code.
Public project and operations docs live in GitHub Pages, not under `docs/`
inside the app repo.

## Context (SSOT)

SSOT (docs): GitHub Pages (this repo).

SSOT (issues/status): Jira (project `J01`, not public).

Public:

- Formal docs and public project docs: this GitHub Pages repo.
- Source code: the app repo on GitHub.
- Static Jira mirror (without Jira Cloud links): `/en/mirror/`.

Not public:

- Internal working notes: private notes repo.
