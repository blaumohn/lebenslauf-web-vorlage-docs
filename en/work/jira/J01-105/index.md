---
layout: page
title: "J01-105: Pipeline-Spec: Simplify manifest for clear parameter flow"
jira_key: J01-105
permalink: /en/jira/issues/J01-105/
---

**Status:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for Jira task `J01-105`.
The goal is to replace the `required`/`allowed` split in the pipeline-config
manifest with a direct parameter list per pipeline/phase, so that phase
boundaries are unambiguous and verifiable.

## Goal

- `required` and `allowed` collapse into one: a flat list per pipeline/phase
  names exactly the parameters that must be present and that are permitted.
- Code defaults (`get('KEY', 'default')`) are removed so that the
  parameter-vector approach yields real test results (prerequisite: ISS-003).
- The pipeline-spec-lib reads `$pipeline[$phase]` as a direct list instead of
  `['required']`/`['allowed']`.
- Tests are updated; the manifest then serves as a clean phase-boundary spec.

## Current status

- Concept worked out and Jira task created (2026-03-19).
- Related to J01-28 (broad analysis frame); not a mutual blocker.
- Prerequisite J01-37 (conditional required, mail dependency) to be clarified.
- Implementation not yet started.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Code defaults removed | No `get('KEY', 'default')` in source | Source analysis pipeline-config-spec-php | open |
| `LEBENSLAUF_PUBLIC_PROFILE` corrected | Only in `build`, not in `preview.runtime` | config.manifest.yaml | open |
| Manifest simplified | Pipeline/phase as direct list, no `required`/`allowed` | config.manifest.yaml | open |
| pipeline-spec-lib updated | `$pipeline[$phase]` as direct list | pipeline-config-spec-php | open |
| Tests green | Parameter-vector approach P_0 → P_n yields real results | Test run | open |
| J01-9 unblocked | J01-105 done, J01-9 no longer blocked | Jira | open |

## Open points

- J01-28: related issue (broad analysis frame, not a blocker).
- J01-37: Clarify conditional required for mail parameters.
- Decision: simplified model as its own step or directly in J01-105?

## Links

- [J01-9: Preview — reactivate workflow]({{ "/en/jira/issues/J01-9/" | relative_url }})
- [J01-28: Analysis: Risk patterns and findings list]({{ "/en/jira/issues/J01-28/" | relative_url }})
- [J01-31: Preview Readiness — system source processing]({{ "/en/jira/issues/J01-31/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
