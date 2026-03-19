---
layout: page
title: "Runbook: preview GitHub Pages locally"
permalink: /en/operations/ghpages-preview/
---

## Purpose

Start the GitHub Pages site locally as a Jekyll server so content and links can
be checked without waiting for GitHub Pages.

For `J01-98`, this page is the canonical target for the preview-relevant
branch and promotion path migrated out of `docs/agile`.

## Requirements

- Docker (including `docker compose`)
- `compose.yaml` is present

## Steps

Start the preview server (port 4000):

```bash
docker compose up --build ghpages-preview
```

Open a shell in the container (debugging):

```bash
docker compose run --rm ghpages-shell
```

## Current Repo Flow

- This docs repo no longer uses a generic `feature/*`-/`dev`-/`preview` flow.
- After local preview and required checks, changes are integrated directly
  into `main`.
- The earlier promotion path from `J01-98` remains historical context, not an
  active repo standard.

## Required Checks Before Integration

- Maintain `de/` and `en/` together.
- Check internal links built with `relative_url`.
- Start the local Pages preview and open the affected target pages directly.
- Make sure new or updated Jira work docs link to the matching public page.
- Only then integrate the state into `main`.

## Notes

- The preview server runs on `http://localhost:4000/`.
- Before startup, derived EN pages are synchronized from the DE base.
- Internal links should use `relative_url` so `baseurl` is handled correctly
  (empty in this site).
- The local preview checks content, navigation, and link paths.
  It does not replace the factual evidence tracked in the
  [test matrix]({{ "/en/quality/testmatrix/" | relative_url }}).
- Sprint-relevant preview work from `J01-98` stays tied to this page,
  the [test matrix]({{ "/en/quality/testmatrix/" | relative_url }})
  and the affected area pages.

## Troubleshooting

- If the port is taken, change the port mapping in `compose.yaml`
  (for example `4001:4000`).
- If links work locally but the EN mirror is missing:
  refresh the derived EN pages in the repo first and then restart the preview
  server.

## Links

- [J01-98: public work status]({{ "/en/jira/issues/J01-98/" | relative_url }})
- [J01-9 in the public Jira area]({{ "/en/jira/issues/J01-9/" | relative_url }})
- [Test matrix]({{ "/en/quality/testmatrix/" | relative_url }})
