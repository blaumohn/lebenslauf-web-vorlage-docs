---
layout: page
title: "105-2: Full P_0-to-P_n derivation and manifest thinning"
jira_key: J01-125
jira_parent_key: J01-105
permalink: /en/jira/issues/J01-105/steps/J01-125/
---

**Status:** 2026-04-03

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Step-specific public work status for
[105-2]({{ "/en/jira/issues/J01-105/steps/J01-125/" | relative_url }}) under
[J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }}).
This page groups the actual app-manifest reduction path and separates it from
the seed edge case and the library cut.

## Goal

- Every parameter from `P_0` gets a final state:
  kept, removed, or kept temporarily because of one clearly named
  alternative case.
- The app manifest describes only the confirmed thin contract.
- The derivation stays traceable through source evidence and check runs.

## Report

- `P_0` spans the `setup`, `python`, `build`, `runtime`, and `deploy`
  phases.
- Each transition `P_i -> P_{i+1}` confirms exactly one small finding so the
  reduction remains verifiable instead of merely editorial.
- This step is the main path of the issue and carries the full parameter work
  in the app repo.

## Current status

- Jira subtask `J01-125` exists.
- The public `J01-105` page already contains `P_0` and the first confirmed
  reduction steps.
- Full processing of all remaining parameters and their checks is still open.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| `P_0` complete | All current parameters are captured in the starting set | J01-105, app repo | open |
| Every transition evidenced | Each step `P_i -> P_{i+1}` has source evidence and a check run | app repo, work docs | open |
| Thin contract reached | Manifest contains only confirmed target parameters | `config.manifest.yaml` | open |
| Phase boundaries clear | `global`, `common`, and pipeline delta stay cleanly separated in the app contract | app repo, J01-105 | open |

## Open points

- Continue the rest of `P_0` with the same small-step discipline as `P_1`
  through `P_3`.
- Decide whether individual parameter explanations belong in canonical area
  docs once the state becomes stable.

## Links

- [105-2 in the Jira mirror]({{ "/en/jira/issues/J01-105/steps/J01-125/" | relative_url }})
- [J01-105 in the Jira mirror]({{ "/en/jira/issues/J01-105/" | relative_url }})

