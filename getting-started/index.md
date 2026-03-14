---
layout: page
title: Einstieg / Quickstart
permalink: /de/getting-started/
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

Hinweis: vor dem ersten Start `.local/dev-runtime.yaml` anlegen
(siehe `src/resources/config/dev-runtime.yaml`).

## Repos und Doku-Ort

- App-Repo: <https://github.com/blaumohn/lebenslauf-web-vorlage>
- GitHub-Pages-Repo: <https://github.com/blaumohn/lebenslauf-web-vorlage-docs>

Das App-Repo enthält den Quelltext.
Die öffentliche Projekt- und Betriebsdoku liegt in GitHub Pages, nicht unter
`docs/` im App-Repo.

## Kontext (SSOT)

SSOT (Doku): GitHub Pages (dieses Repo).

SSOT (Vorgänge/Status): Jira (Projekt `J01`, nicht öffentlich).

Öffentlich:

- Formale Dokumente und Projektdoku: dieses GitHub-Pages-Repo.
- Quellcode: App-Repo auf GitHub.
- Statische Jira-Übersicht (ohne Jira-Cloud-Links): `/mirror/`.

Nicht öffentlich:

- Interne Arbeitsnotizen: privates Notizrepo.
