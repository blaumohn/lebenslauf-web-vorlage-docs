---
layout: page
title: "Assess the project"
permalink: /en/getting-started/project-profile/
readme_order: 0
readme_intro: true
---

PHP site starter for personal websites on shared hosting —
developed and operated as an own project.
Public view with redacted contact details,
token-gated private full view without login,
complete dev and CI/CD pipeline.

**Demo:** [preview.ysdani.com](https://preview.ysdani.com)

The project was built as concrete delivery evidence: from requirements
through architecture decisions to production deployment.
The public documentation makes decisions, processes and
quality records transparently traceable.

## What the project demonstrates

- Public view with redacted contact details; token-gated private full view without login
- CV content in YAML, bilingual (DE/EN), validated through the build pipeline
- SFTP deployment on shared hosting without Blue-Green infrastructure (dual-tree deploy)
- Contact form security layer: rate limiting, CAPTCHA, IP-salt rotation

## Evidence

- [Sprint history]({{ "/en/work/sprints/" | relative_url }}) — public delivery records per sprint
- [Decisions (ADRs)]({{ "/en/decisions/" | relative_url }}) — architecture decisions with context
- [Test matrix]({{ "/en/quality/testmatrix/" | relative_url }}) — test coverage and quality status

## Entry points

- [Project overview]({{ "/en/getting-started/overview/" | relative_url }})
- [Technical highlights]({{ "/en/getting-started/technical-highlights/" | relative_url }})
- [Full documentation]({{ "/en/" | relative_url }})
