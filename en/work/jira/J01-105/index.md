---
layout: page
title: "J01-105: Pipeline-Spec: Simplify manifest for clear parameter flow"
jira_key: J01-105
permalink: /en/jira/issues/J01-105/
---

**Status:** 2026-04-01

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for Jira task `J01-105`.
The goal is to replace the `required`/`allowed` split in the pipeline-config
manifest with a direct parameter list per pipeline/phase, so that phase
boundaries are unambiguous and verifiable.

## Goal

- `required` and `allowed` collapse into one: phase logic is described through
  a mix of `pipelines.global`, `pipelines.common.<phase>`, and
  `pipelines.<pipeline>.<phase>`, which expand into concrete parameter sets.
- Code defaults (`get('KEY', 'default')`) are removed so that the
  parameter-vector approach yields real test results (prerequisite: ISS-003).
- `variables` stays the parameter catalog in the app repo; `context` is
  carried as the `pipeline_phase` area.
- The pipeline-spec-lib reads area and partial-area references, expands them,
  and validates disjointness between `global`, `common`, and the concrete
  pipeline.
- Tests are updated; the manifest then serves as a clean phase-boundary spec.

## Current status

- Concept worked out and public work docs updated to match the agreed draft
  (2026-03-20).
- Related to J01-28 (broad analysis frame); not a mutual blocker.
- J01-37 stays an adjacent follow-up topic and is not part of this doc-only
  pass.
- Manifest, config YAMLs, and PHP usage are adjusted in the working branch to
  the group schema and the explicit SMTP sender path (2026-04-01).

## Planned Target Model

- One manifest file stays in the app repo.
- `variables` defines only parameters, groups, `sources`, and `meta`.
- Every variable key gets a `meta` object.
- `pipelines.global` applies to all pipelines and phases.
- `pipelines.common.<phase>` contains the phase-wide intersection.
- `pipelines.<pipeline>.<phase>` adds only the true pipeline-specific
  difference.
- Phase lists may reference full areas or partial areas.
- After expansion there must be no overlap between `global`, `common`, and the
  concrete pipeline.

## Derivation of the Thin Manifest

The derivation is recorded in the issue itself as a smoothed technical path:

1. Source analysis: determine per phase which parameters are actually read.
2. P_0: derive the first complete phase set from that source analysis.
3. Remove defaults first: silent code defaults would otherwise corrupt later
   thinning.
4. Stabilize tests: missing and foreign parameters must fail visibly.
5. Thin the manifest: reduce P_0 to the final phase contract.

Confirmed findings from source analysis:

- `setup`: `LEBENSLAUF_PUBLIC_PROFILE` matters only for
  `--reset-sample-content`.
- `build`: uses `LEBENSLAUF_DATEN_PFAD`,
  `LEBENSLAUF_YAML_PFAD`, `LEBENSLAUF_JSON_PFAD`,
  `LEBENSLAUF_PUBLIC_PROFILE`, `LEBENSLAUF_LANG_DEFAULT`,
  `LEBENSLAUF_LANGS`, and the build-side `APP_BASE_PATH`.
- `runtime`: uses `APP_BASE_PATH`, `TRUST_PROXY`,
  `CAPTCHA_TTL_SECONDS`, `CAPTCHA_MAX_GET`,
  `CONTACT_MAX_POST`, `CONTACT_TO_EMAIL`,
  `RATE_LIMIT_WINDOW_SECONDS`, `MAIL_STDOUT`, `SMTP_*`,
  `LEBENSLAUF_LANG_DEFAULT`, and `LEBENSLAUF_LANGS`.
- `python`: uses `PYTHON_CMD` and optional `PYTHON_PATHS`.
- `deploy`: uses only the deploy parameters `FTP_*`.

This leads to the key finding of the task:
`LEBENSLAUF_PUBLIC_PROFILE` belongs in `setup` and `build`, but not in
`runtime`.

## Out of Scope for This Doc Pass

- no implementation of manifest or lib changes in the source repos
- no implementation of J01-37
- no claim that the described target model is already active in code

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Derivation documented | Source analysis, P_0, and thinning path are traceable in the issue | Jira docs DE/EN | done |
| Target model documented | `variables`, `pipelines.global`, `common`, and pipeline differences are described | Jira docs DE/EN | done |
| `pipeline_phase` named | Former `context` area is recorded as `pipeline_phase` | Jira docs DE/EN | done |
| Area syntax explained | Full-area and partial-area syntax is described as the planned model | Jira docs DE/EN | done |
| Disjointness rule explained | No overlap between `global`, `common`, and concrete pipeline | Jira docs DE/EN | done |
| Code defaults removed | No `get('KEY', 'default')` in source | Source analysis source repos | open |
| `LEBENSLAUF_PUBLIC_PROFILE` corrected | Only in `build`, not in `preview.runtime` | config.manifest.yaml | open |
| Manifest simplified | Target model implemented in source repos | config.manifest.yaml | partially done |
| SMTP sender clarified | Sender now runs only via `SMTP_FROM_EMAIL` and `SMTP_FROM_NAME`; `CONTACT_TO_EMAIL` remains separate | config.manifest.yaml, MailService.php | done |
| pipeline-spec-lib updated | Expander and validation for the target model are implemented | pipeline-config-spec-php | open |
| Tests green | Parameter-vector approach P_0 → P_n yields real results | Test run | open |
| J01-9 unblocked | J01-105 done, J01-9 no longer blocked | Jira | open |

## Open points

- J01-28: related issue (broad analysis frame, not a blocker).
- The described target structure is documented, but not yet implemented in the
  source repos.
- J01-37 remains a separate follow-up for conditional required logic.

## Links

- [J01-9: Preview — reactivate workflow]({{ "/en/jira/issues/J01-9/" | relative_url }})
- [J01-28: Analysis: Risk patterns and findings list]({{ "/en/jira/issues/J01-28/" | relative_url }})
- [J01-31: Preview Readiness — system source processing]({{ "/en/jira/issues/J01-31/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
