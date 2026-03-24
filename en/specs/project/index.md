---
layout: page
title: "Spec: Project overall system"
permalink: /en/specs/project/
---

This project is a reusable CV website template and a central reference project
for product, architecture, delivery, and operations work.

## What it is

- a product and reference system around a CV website on shared hosting
- a project made of app, config spec, public docs, work framework, and
  recurring flows
- a public project surface that explains project purpose, system boundaries,
  and flows

## What it is not

- not only a docs or Jira project
- not a single repository
- not a showcase without real delivery, operations, and quality logic

## Why

- the website template should be practical and reusable
- the project should document how product, architecture, and delivery work fit
  together in one continuous example
- the public docs should make systems, flows, and decisions legible

## Structure

- app system
- pipeline spec system
- docs system
- Jira system
- GitHub and PR system
- `tagebuch`
- AI/skill framework
- `atlassian-tools`

## Readers and usage

- organisational readers find project purpose, boundaries, and key flows
- technical readers find system shape, interfaces, and operations model
- implementation-focused readers find repos, rules, work docs, and evidence

## Interfaces

- public site via GitHub Pages
- app code and PRs on GitHub
- Jira as the non-public work source with a public docs trace
- `tagebuch` as raw provenance

## Current state and target picture

- Current state:
  - project identity is spread across several pages and repos
- Target picture:
  - a clear project map under `specs/`

## Parent systems

- no higher project system inside this docs layer

## Child systems

- [App system]({{ "/en/specs/systems/app/" | relative_url }})
- [Pipeline spec system]({{ "/en/specs/systems/pipeline-spec/" | relative_url }})
- [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- [GitHub and PR system]({{ "/en/specs/systems/github-collaboration/" | relative_url }})
- [`tagebuch`]({{ "/en/specs/systems/tagebuch/" | relative_url }})
- [AI/skill framework]({{ "/en/specs/systems/ai-skill-framework/" | relative_url }})
- [`atlassian-tools`]({{ "/en/specs/systems/atlassian-tools/" | relative_url }})

## Related systems

- [Specs]({{ "/en/specs/" | relative_url }})
- [Getting started / quickstart]({{ "/en/getting-started/" | relative_url }})

## Sources

- [Start page]({{ "/en/" | relative_url }})
- [Getting started / quickstart]({{ "/en/getting-started/" | relative_url }})
- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
- `lebenslauf-web-vorlage/README.md`
- `pipeline-config-spec-php/README.de.md`
