---
layout: page
title: "105-3: Align pipeline-spec-lib and README with the target model"
jira_key: J01-125
jira_parent_key: J01-105
permalink: /en/jira/issues/J01-105/steps/J01-125/
---

**Status:** 2026-04-08

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Step-specific public work status for
[105-3]({{ "/en/jira/issues/J01-105/steps/J01-125/" | relative_url }}) under
[J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }}).
This page isolates the library contract so the app manifest and the library
behavior do not drift apart again.

## Goal

- The pipeline-spec-lib expands the target model with
  `variable-groups` as a mapping, `phases.<phase>`, and
  `pipelines.<pipeline>.<phase>`.
- The library validates disjointness between shared and pipeline-specific
  parameters.
- The library validates pipeline and phase names against the manifest; known
  empty phases stay valid.
- The README documents only the real group and phase model.

## Report

- The visible schema error was not only in the app manifest but also in the
  outdated lib README that still described `required`/`allowed`.
- This step therefore groups the lib code path and the lib docs into one
  dedicated subtask.
- `PIPELINE` and `PHASE` stay internal to the library in the target state;
  there is no app-side `pipeline_phase` contract.
- The compiled output is now one file with two sections:
  `pipeline_phase` and `values`. This keeps the pipeline phase separate from
  config variables inside the compiled payload itself.
- The pipeline phase itself still stays a separate validation target:
  `pipeline` must exist under `pipelines`, `phase` under `phases`, before the
  functional config variables of that pipeline phase are checked.
- The intermediate ideas of adding `policy`, object-list group references,
  and `pipelines.common.<phase>` are discarded.
- The confirmed target state is phase-centered: shared variables live in
  `phases.<phase>`; real pipelines and their additions live in
  `pipelines`.
- A present, intentionally empty phase such as `dev/setup` no longer needs an
  artificial manifest placeholder like `setup: []`. Typos in pipeline or
  phase names still fail.

## Current status

- Jira subtask `J01-125` exists.
- The lib cut is publicly separated from the app-side reduction work.
- Library code, README, and internal phase-key handling are already aligned in
  the library history.
- `compile()` no longer writes flat `PIPELINE`/`PHASE` keys; the consumer
  path reads `pipeline_phase` directly from the structured compiled payload
  without a legacy fallback.
- Known empty phases without group references are accepted; the consumer path
  `config lint dev --phase setup` works without an app-side workaround.
- The final schema reading is fixed: no pseudo-`common`, no `group-key`
  object lists, and no `policy` semantics.
- The German library README is aligned with the same schema reading and no
  longer documents `group-key`/`select` object lists.
- The remaining open part is mainly the cross-repo closeout evidence.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Expander reads target model | Library expands `variable-groups.<group>`, `phases.<phase>`, `pipelines.<pipeline>.<phase>`, `group: "*"`, and `group: [KEY]` correctly | `pipeline-config-spec-php` | done |
| Disjointness validated | Overlap between phase variables and pipeline addition is rejected | `pipeline-config-spec-php`, tests | done |
| README corrected | No `required`/`allowed`, `policy`, `group-key`, or `common` schema remains in lib docs | `pipeline-config-spec-php/README.md`, `pipeline-config-spec-php/README.de.md` | done |
| Internal phase keys explained | `PIPELINE` and `PHASE` are no longer described as an app-manifest area | lib docs, J01-105 | done |
| Compiled output separates pipeline phase and variables | `compile()` writes one payload with `pipeline_phase` and `values` | lib tests, main-repo runtime | done |
| Empty phases stay valid | Known empty phases are valid; `dev/setup` needs no placeholder `setup: []`; unknown names fail | lib tests, main-repo lints | done |

## Open points

- Keep the general `meta` semantics canonical while restoring concrete
  dependencies in variable-level `meta.notes`.
- Split clearly which tests belong in the lib and which remain in the main
  repo.

## Links

- [105-3 in the Jira mirror]({{ "/en/jira/issues/J01-105/steps/J01-125/" | relative_url }})
- [J01-105 in the Jira mirror]({{ "/en/jira/issues/J01-105/" | relative_url }})
- [J01-9: Preview — reactivate workflow]({{ "/en/jira/issues/J01-9/" | relative_url }})
