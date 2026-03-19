---
layout: page
title: "J01-107: Make Jira metadata for J01-91 migration issues explicit"
jira_key: J01-107
permalink: /en/jira/issues/J01-107/
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-107`.
This issue pulls the Jira metadata for the migration chain from `J01-91`
forward so that follow-up work, scope boundaries and context are visible in
Jira itself, not only in textual work docs.

## Goal

- `J01-91` is explicitly linked in Jira with `J01-98`, `J01-100` and
  `J01-103`.
- Boundaries between `J01-98`, `J01-100` and `J01-103` are visible as Jira
  metadata.
- Public work docs mention the new metadata state.
- The public Jira output is synced after the metadata change.

## Current status

- `J01-107` was created and added to the active sprint.
- The canonical Jira remote link points to this work doc.
- Jira issue links of type `Relates` are set for the migration chain:
  - `J01-91` ↔ `J01-98`
  - `J01-91` ↔ `J01-100`
  - `J01-91` ↔ `J01-103`
  - `J01-98` ↔ `J01-100`
  - `J01-100` ↔ `J01-103`
- The affected work docs now mention the metadata state.
- The public Jira output was refreshed and verified for the affected keys.

## Verification plan

| Check | Expectation | Proof / place | Status |
| --- | --- | --- | --- |
| Central snapshot linked | `J01-91` shows the three follow-up/rest issues in `issuelinks` | Jira metadata for `J01-91` | erledigt |
| Sprint boundary visible | `J01-98` is linked with `J01-100` as the scope boundary | Jira metadata for `J01-98` and `J01-100` | erledigt |
| Rest and fulfilment separated | `J01-100` and `J01-103` are explicitly connected | Jira metadata for `J01-100` and `J01-103` | erledigt |
| Public docs updated | The affected work docs mention the new link state | this page + `J01-91`, `J01-98`, `J01-100`, `J01-103` | erledigt |
| Public Jira output synced | GitHub Pages reflects the current metadata state | public Jira sync | erledigt |

## Links

- [J01-91: status/snapshot]({{ "/en/jira/issues/J01-91/" | relative_url }})
- [J01-98: sprint-relevant preview migration]({{ "/en/jira/issues/J01-98/" | relative_url }})
- [J01-100: docs/agile leftovers after sprint 1]({{ "/en/jira/issues/J01-100/" | relative_url }})
- [J01-103: follow up open J01-91 target fulfilment]({{ "/en/jira/issues/J01-103/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
