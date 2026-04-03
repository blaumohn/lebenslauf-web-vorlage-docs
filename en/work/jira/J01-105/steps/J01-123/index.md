---
layout: page
title: "105-3: Align pipeline-spec-lib and README with the target model"
jira_key: J01-123
jira_parent_key: J01-105
permalink: /en/jira/issues/J01-105/steps/J01-123/
---

**Status:** 2026-04-03

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Step-specific public work status for
[105-3]({{ "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }}) under
[J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }}).
This page isolates the library contract so the app manifest and the library
behavior do not drift apart again.

## Goal

- The pipeline-spec-lib expands the target model with
  `pipelines.global`, `pipelines.common.<phase>`, and
  `pipelines.<pipeline>.<phase>`.
- The library validates disjointness between shared and pipeline-specific
  parameters.
- The README documents only the real group and phase model.

## Report

- The visible schema error was not only in the app manifest but also in the
  outdated lib README that still described `required`/`allowed`.
- This step therefore groups the lib code path and the lib docs into one
  dedicated subtask.
- `PIPELINE` and `PHASE` stay internal to the library in the target state;
  there is no app-side `pipeline_phase` contract.

## Current status

- Jira subtask `J01-123` exists.
- The lib cut is publicly separated from the app-side reduction work.
- Implementation, tests, and README evidence are still open.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Expander reads target model | Library expands `global`, `common.<phase>`, and the pipeline delta correctly | `pipeline-config-spec-php` | open |
| Disjointness validated | Overlap between `common` and pipeline delta is rejected | `pipeline-config-spec-php`, tests | open |
| README corrected | No `required`/`allowed` schema remains in lib docs | `pipeline-config-spec-php/README*.md` | open |
| Internal phase keys explained | `PIPELINE` and `PHASE` are no longer described as an app-manifest area | lib docs, J01-105 | open |

## Open points

- Keep the general `meta` semantics only in the canonical pipeline-spec docs.
- Split clearly which tests belong in the lib and which remain in the main
  repo.

## Links

- [105-3 in the Jira mirror]({{ "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }})
- [J01-105 in the Jira mirror]({{ "/en/jira/issues/J01-105/" | relative_url }})

