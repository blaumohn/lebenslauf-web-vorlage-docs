---
layout: page
title: CV Web Template
permalink: /en/
---

This project is a reusable PHP template for a CV website and a reference
project for product, architecture, delivery, and operations work.
It builds on the earlier static
[lebenslauf-vorlage](https://github.com/blaumohn/lebenslauf-vorlage)
template for content and i18n and extends it with today’s dynamic PHP
layer.

The public docs highlight three defining characteristics: public and
token-gated private variants with redacted contact details, a CLI
build pipeline (YAML → validated → HTML), and a file-based security
layer for the contact form (rate limiting, CAPTCHA, IP-salt rotation
with `symfony/lock`).

## Entry

- [Getting started / quickstart]({{ "/en/getting-started/" | relative_url }})
- [Project map and specs]({{ "/en/specs/" | relative_url }})

## Repositories

- [App repo](https://github.com/blaumohn/lebenslauf-web-vorlage)
- [GitHub Pages repo](https://github.com/blaumohn/lebenslauf-web-vorlage-docs)

Public docs live in GitHub Pages.
The app repo contains source code, but no regular project docs under `docs/`.

## Reader paths

- **[Assess the project]({{ "/en/getting-started/project-profile/" | relative_url }})**  
  Demo, project overview and delivery evidence
- **[organisational entry]({{ "/en/specs/project/" | relative_url }})**  
  project purpose, project map, and defining characteristics
- **[technical entry]({{ "/en/specs/" | relative_url }})**  
  system boundaries, system design, and stable processes
- **[implementation entry]({{ "/en/getting-started/" | relative_url }})**  
  repos, doc locations, and SSOT context

## Principle

- No Jira Cloud links in the public docs.
