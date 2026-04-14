---
layout: page
title: "J01-129: CLI config as an object instead of repeated argument passing"
jira_key: J01-129
permalink: /en/jira/issues/J01-129/
---

**Status:** 2026-04-14

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-129`.
This issue evaluates and outlines a possible follow-up refactor after
`J01-105`: `BasePipelineCommand` should resolve pipeline phase and config
variables early and then expose them as an accessible config object, so
downstream commands no longer need to pass the same config repeatedly as
method or function arguments.

## Goal

- clarify early resolution in `BasePipelineCommand` as a fixed entry point
- evaluate whether an accessible config object makes the CLI path clearer
- reduce repeated passing of the same config through the command path
- state the boundary to `J01-105` and `J01-123 / P_3` explicitly

## Current status

- `J01-129` exists as its own issue.
- Its functional origin lies in `J01-123 / P_3`, where
  `BasePipelineCommand` is already described as the layer for early
  pipeline and override resolution.
- The object-consolidation question is no longer part of the current
  closing picture of `J01-105`; it is cut as follow-up work for a later
  sprint or the backlog.
- `J01-129` is therefore mirrored publicly as its own issue and not as an
  additional `105-5` step under `J01-105`.

## Boundary

- Not part of `J01-105`:
  - no further manifest thinning
  - no additional `P_i` reduction step
  - no extra step in the existing `105-1` to `105-4` tree
- Still related to `J01-105`:
  - follow-up from `J01-123 / P_3`
  - same CLI/spec boundary
  - same question of a stable command shape

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Issue mirrored independently | `J01-129` has its own DE/EN issue page | Jira docs DE/EN | done |
| No `105-5` created | `J01-105` still shows only `105-1` to `105-4` | `J01-105` DE/EN | done |
| Follow-up link visible | `J01-105` and `J01-123` mention `J01-129` as separated follow-up work | Jira docs DE/EN | done |
| Architecture question named clearly | Goal and boundary of the possible config object are traceable | this issue page | done |
| Sprint left open | The issue reads as follow-up work for a later sprint or the backlog | this issue page | done |

## Links

- [J01-105 in the Jira mirror]({{ "/en/jira/issues/J01-105/" | relative_url }})
- [105-2 in the Jira mirror]({{ "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }})
