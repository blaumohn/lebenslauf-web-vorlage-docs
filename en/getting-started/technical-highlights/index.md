---
layout: page
title: "Technical highlights"
permalink: /en/getting-started/technical-highlights/
readme_order: 4
---

- **Two-tree deploy** — atomic deployment without downtime on shared hosting,
  no blue-green infrastructure required (vendor-a/b + app-a/b)
- **Pipeline spec** — language-neutral configuration across PHP, Python and shell boundaries,
  unidirectional data flow, machine-readable YAML specification
- **Pipeline phase model** — the app knows its own runtime state (setup, build, runtime, deploy);
  separates CLI from HTTP runtime complexity

## Decisions

Technical background and alternatives in the
[ADRs]({{ "/en/decisions/" | relative_url }}).
