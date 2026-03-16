---
layout: page
title: "J01-98: Execute J01-91 phase 2 on canonical targets"
permalink: /en/work/jira/J01-98/
---

**Stand:** 2026-03-16

Canonical public work status for `J01-98`.
This issue turns the fixed phase-2 follow-up work from `J01-91` into concrete
changes on canonical targets and matching issue-specific work docs.

## Goal

Do not only name the targets from `J01-91`, but implement them in the right
public places:

- canonical domain pages under `areas/`, `operations/`, `policies/`,
  `decisions/`, `quality/`
- issue-specific remaining work under `work/jira/J01-<KEY>/`
- no new catch-all structure and no new doc types

## Implemented now

- `J01-98` created as the dedicated follow-up issue for `J01-91`
- placed into the active sprint and labeled `sprint-support`
- scope fixed against `J01-91`:
  terminology, evidence, and target locations are now pulled through directly
  on canonical pages or matching work docs
- `J01-91` can now stay closed as the structure and decision issue

## Working rules

- Do not move work back into `J01-91`; it remains the closure snapshot only.
- Keep checking new structural changes against `policies/doku-richtlinie/`.
- If a topic is stable beyond this issue:
  move it into a canonical domain page.
- If a topic is still issue-bound:
  keep it on the matching `work/jira/J01-<KEY>/` page.

## Next implementation blocks

1. Pull the terminology decisions from `J01-91` through the affected area pages.
2. Anchor evidence in `quality/testmatrix/` or the matching work doc where it
   belongs.
3. Continue open leftovers from `archive-topics.md` only at fixed target
   locations.

## Links

- [J01-91: status/snapshot (closure)]({{ "/en/work/jira/J01-91/" | relative_url }})
- [Docs policy]({{ "/en/policies/doku-richtlinie/" | relative_url }})
- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
