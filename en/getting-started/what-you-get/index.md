---
layout: page
title: "Overview"
permalink: /en/getting-started/overview/
readme_order: 2
---

A production-ready PHP site starter for shared hosting: public view with
redacted contact details, token-gated private full view without login,
i18n CV content in YAML, and complete dev and CI/CD pipelines.

- **Public view** — CV with redacted contact details
- **Private view** — full view via URL token (`/cv?token=…`), no login required
- **i18n YAML content** — CV data in German and English
- **Ready-made pipelines** — local development with Docker, CI checks and SFTP deployment
- **Security layer** — rate limiting, CAPTCHA and IP-salt rotation for the contact form

## More

- [Quickstart]({{ "/en/getting-started/quickstart/" | relative_url }})
- [Set up private view]({{ "/en/getting-started/private-view/" | relative_url }})
- [Technical highlights]({{ "/en/getting-started/technical-highlights/" | relative_url }})
