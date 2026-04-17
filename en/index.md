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

- **[organisational entry]({{ "/en/getting-started/" | relative_url }})**  
  project purpose, project map, and defining characteristics
- **[technical entry]({{ "/en/specs/" | relative_url }})**  
  system boundaries, operations model, delivery, and quality logic
- **[implementation entry]({{ "/en/operations/" | relative_url }})**  
  repos, build/runtime paths, policies, runbooks, and work docs

## Areas

The documentation is grouped by project area so that runbooks, decisions, and
other pages are easy to place and navigate.

- [Areas overview]({{ "/en/areas/" | relative_url }})

## Decisions / Operations / Status

- [Decisions (ADRs)]({{ "/en/decisions/" | relative_url }})
- [Operations (runbook)]({{ "/en/operations/" | relative_url }})
- [Sprint history (public)]({{ "/en/work/sprints/" | relative_url }})
- [Jira (public)]({{ "/en/jira/" | relative_url }})
- [Policies]({{ "/en/policies/" | relative_url }})
- [Specs]({{ "/en/specs/" | relative_url }})
- [Templates]({{ "/en/templates/" | relative_url }})
- [Quality]({{ "/en/quality/" | relative_url }})

## Principle

- No Jira Cloud links in the public docs.
