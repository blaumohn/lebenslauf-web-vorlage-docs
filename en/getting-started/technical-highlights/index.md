---
layout: page
title: "Technical highlights"
permalink: /en/getting-started/technical-highlights/
readme_order: 4
---

- **[Two-tree deploy]({{ "/en/jira/issues/J01-135/steps/J01-142/" | relative_url }})** —
  atomic deployment without downtime on shared hosting, no blue-green
  infrastructure required (vendor-a/b + app-a/b).
- **[Pipeline spec]({{ "/en/specs/systems/pipeline-spec/" | relative_url }})** —
  language-neutral configuration across PHP, Python and shell boundaries,
  unidirectional data flow, machine-readable YAML specification.
- **[Pipeline phase model]({{ "/en/areas/cli-build/" | relative_url }})** —
  the app knows its own runtime state (setup, build, runtime, deploy);
  separates CLI from HTTP runtime complexity.

## Decisions

Technical background and alternatives in the
[ADRs]({{ "/en/decisions/" | relative_url }}).
