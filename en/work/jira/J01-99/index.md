---
layout: page
title: "J01-99: Clean up legacy Confluence remote links in Jira"
permalink: /en/work/jira/J01-99/
---

**Stand:** 2026-03-16

Canonical public work status for `J01-99`.
This step cleans up remaining legacy Confluence remote links in Jira and
anchors a repeatable audit path against legacy targets.

## Goal

Remote links in the J01 Jira area should either point to canonical GitHub Pages
targets or be removed deliberately when no canonical public target exists.

## Audit state on 2026-03-16

The new legacy audit in the verification script found in the project-wide set:

- 26 legacy Confluence remote links
- 19 affected Jira issues
- 22 links in 15 issues from the `J01-72`/tooling sequence
- plus 4 older context links on `J01-31`, `J01-16`, `J01-13`, `J01-9`
- no legacy links on `J01-91` itself

## Cleanup rules

- If a canonical GitHub Pages target exists:
  replace the old Confluence link with that target.
- If only a generic legacy specification link remains:
  move it to today's canonical domain page.
- If no clean canonical target exists anymore:
  remove the link instead of inventing a provisional target.

## Target mapping

| Jira keys | Action | Canonical target |
| --- | --- | --- |
| `J01-73` | replace | [ADR-0003]({{ "/en/decisions/adr-0003/" | relative_url }}) |
| `J01-75`, `J01-78` | replace | [Runbook: backfill step number and summary prefix]({{ "/en/operations/jira-backfill-schritt-nr/" | relative_url }}) |
| `J01-79`, `J01-82`, `J01-85` | replace | [API operations (wrapper)]({{ "/en/areas/proj-doku-tooling/api-betriebe/" | relative_url }}) |
| `J01-80`, `J01-81` | replace | [Programming guidelines]({{ "/en/policies/programmierleitlinien/" | relative_url }}) |
| `J01-83` | replace | [ADR-0002]({{ "/en/decisions/adr-0002/" | relative_url }}) |
| `J01-84` | replace | [Area: Jira and docs tooling]({{ "/en/areas/proj-doku-tooling/" | relative_url }}) and [System overview]({{ "/en/areas/proj-doku-tooling/aufbau/" | relative_url }}) |
| `J01-86`, `J01-87` | replace | [Public Jira overview]({{ "/en/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }}), [Runbook: update the Jira mirror]({{ "/en/operations/runbook/" | relative_url }}) and [ADR-0004]({{ "/en/decisions/adr-0004/" | relative_url }}) |
| `J01-88`, `J01-89`, `J01-90` | replace | [Public Jira overview]({{ "/en/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }}) |
| `J01-31` | replace | [Start page]({{ "/en/" | relative_url }}) |
| `J01-16` | replace | [Area: HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }}) |
| `J01-13` | replace | [Test matrix]({{ "/en/quality/testmatrix/" | relative_url }}) |
| `J01-9` | replace | [Operations (runbooks)]({{ "/en/operations/" | relative_url }}) |

## Guardrail

- `verify-jira-ghpages-links.sh --legacy-confluence-audit` reports legacy
  `atlassian.net/wiki` targets explicitly with Jira key, link ID, URL, and title.
- The audit is documented as a regular hygiene step in the runbook.
- Mirror and link sync continue to use Jira as the SSOT.

## Links

- [J01-91: closure snapshot]({{ "/en/work/jira/J01-91/" | relative_url }})
- [Runbook: update the Jira mirror]({{ "/en/operations/runbook/" | relative_url }})
- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
