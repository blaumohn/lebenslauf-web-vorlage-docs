---
layout: page
title: "J01-109: Align GitHub Pages permalinks for public Jira docs"
jira_key: J01-109
permalink: /en/jira/issues/J01-109/
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-109`.
This issue fixes a permalink drift between older step paths and the short paths
already used by today's public Jira docs.

## Goal

- make broken GitHub Pages links resolve again from short paths
- restore one consistent canonical URI scheme for public work docs
- pull Jira remote links and the public Jira area onto the same targets

## Current status

- `J01-109` was created, added to the active sprint, and labeled
  `sprint-admin`.
- The drift does not only affect `J01-103` → `J01-91/archive-topics`, but
  several older work docs from the `J01-72` track.
- The affected set currently includes `J01-73`, `J01-83`, `J01-91`,
  `J01-92`, `J01-94`, `J01-95`, and `J01-99` in both language trees; for
  `J01-91` this also includes `archive-topics`, `area-inventory`, and
  `policy-deltas`.
- Jira remote links for the affected issues now point to the canonical
  `/de/jira/issues/...` targets.
- The public Jira mirror and the local journal/cache state are verified to be
  back in sync after the link update.

## Verification plan

| Check | Expectation | Proof / place | Status |
| --- | --- | --- | --- |
| Short-path links hit real target pages | All short paths already used in the repo render to existing work docs | affected `work/jira/` pages + local preview | erledigt |
| Affected permalinks are unified | Frontmatter uses the short-path scheme for all drift cases | affected DE/EN work docs | erledigt |
| Old step-path explanations are updated | Textual hints and self-links now mention the new canonical targets | affected work docs | erledigt |
| Jira remote links move to short paths | Jira shows the same canonical DE link for the affected issues | Jira remote links for `J01-73`, `J01-83`, `J01-91`, `J01-92`, `J01-94`, `J01-95`, `J01-99`, `J01-109` | erledigt |
| Public Jira area is synced | Mirror/backlog/history show the new issue and updated link targets | public Jira sync | erledigt |

## Links

- [J01-91: status/snapshot]({{ "/en/jira/issues/J01-91/" | relative_url }})
- [J01-103: follow up open J01-91 target fulfilment]({{ "/en/jira/issues/J01-103/" | relative_url }})
- [J01-107: make Jira metadata for J01-91 migration issues explicit]({{ "/en/jira/issues/J01-107/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
