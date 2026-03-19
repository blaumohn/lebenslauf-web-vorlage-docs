---
layout: page
title: "J01-108: Public Jira issue pages without overview box"
jira_key: J01-108
permalink: /en/jira/issues/J01-108/
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-108`.
This issue removes the overview box from the public issue-page context so the
pages only show real parent or public-step context instead of repeating a
second mini navigation.

## Goal

- The context bar on public Jira issue pages shows no overview links.
- Parent and public-step context remain available.
- Pages without such context show no context bar at all.
- Public work doc and Jira remote link are present.

## Current status

- `J01-108` was created and added to the active sprint.
- The canonical Jira remote link points to this work doc.
- `_includes/jira-work-context.html` now shows only parent and public steps.
- The overview section with `Jira home`, `Sprint`, `Backlog` and
  `History`/`Done` was removed.

## Verification plan

| Check | Expectation | Proof / place | Status |
| --- | --- | --- | --- |
| Overviews removed | No second mini navigation on issue pages | `_includes/jira-work-context.html` | erledigt |
| Parent remains visible | Step pages and child pages still show the parent | public Jira issue pages | erledigt |
| Public steps remain visible | Parent pages with step subpages still list them in context | public Jira issue pages | erledigt |
| Empty bar removed | Pages without parent and without public steps show no context bar | public Jira issue pages | erledigt |
| Public work doc available | `/de/jira/issues/J01-108/` and `/en/jira/issues/J01-108/` exist | GitHub-Pages docs | erledigt |

## Links

- [Jira work docs]({{ "/en/jira/" | relative_url }})
- [J01-104: GitHub Pages: link rule for public step pages]({{ "/en/jira/issues/J01-104/" | relative_url }})
