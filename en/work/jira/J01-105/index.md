---
layout: page
title: "J01-105: Pipeline-Spec: Simplify manifest for clear parameter flow"
jira_key: J01-105
permalink: /en/jira/issues/J01-105/
---

**Status:** 2026-04-09

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for Jira task `J01-105`.
The goal is to move the pipeline-config manifest to a clearer structural
model with `variable-groups`, explicit `phases`, and real `pipelines`, so
that phase boundaries are unambiguous and verifiable without introducing
extra `required` or `policy` semantics.

## Goal

- `variable-groups` is the canonical catalog for groups, variables, `meta`,
  and `sources`.
- `phases.<phase>` contains the shared variable contract of the phase.
- `pipelines.<pipeline>.<phase>` adds only the real pipeline-specific delta.
- A group reference uses either `group: "*"` for the whole group or
  `group: [KEY, ...]` for an explicit subset.
- Code defaults (`get('KEY', 'default')`) are removed so that the
  parameter-vector approach yields real test results (prerequisite: ISS-003).
- `PIPELINE` and `PHASE` do not live in an app-side manifest area; the
  pipeline phase stays separate library metadata and is not a config variable.
- The pipeline-spec-lib reads group and subset references, expands them, and
  validates pipeline names, phase names, and disjointness between the phase
  and the concrete pipeline.
- Functional dependencies between variables stay visible in `meta.notes`;
  losing them during the earlier J01-105 path is treated as a regression.
- Tests are updated; the manifest then serves as a clean phase-boundary spec.

## Current status

- Concept worked out and public work docs updated to match the agreed draft
  (2026-03-20).
- Related to J01-28 (broad analysis frame); not a mutual blocker.
- J01-37 stays an adjacent follow-up topic and is not part of this doc-only
  pass.
- The plan is now split into four real Jira subtasks with dedicated public
  step pages; temporary planning notes in `var/tmp` are replaced.
- The step-context block in the mirror was tightened to a sibling view:
  step pages now show other public steps as siblings of the same parent,
  ordered by step number rather than by file path.
- Manifest, config YAMLs, and PHP usage are adjusted in the working branch to
  the group schema and the explicit SMTP sender path (2026-04-01); the next
  step now pulls the reduced structure-only model into place.
- `PIPELINE` and `PHASE` stay separate library metadata in the target state;
  there is no app-side `pipeline_phase` area.
- The lib README is updated in the same task to the real structure model
  with `variable-groups`, `phases`, `pipelines`, and compact group mappings.
- Earlier dependency hints in `meta.notes` are restored on the affected
  variables; their earlier loss during J01-105 was not a target state.
- The app environment doc `docs/ENVIRONMENTS.md` is removed as a duplicate
  intermediate location; README and manifest keep only local app hints, while
  pipeline-spec rules point to the spec and library docs.
- The possible object consolidation in the CLI path is no longer pushed into
  this step tree: it now runs as its own follow-up issue `J01-129` outside
  `105-1` to `105-4`.

## Plan as Steps

- [105-1 Setup seed path: domain correction]({{
  "/en/jira/issues/J01-105/steps/J01-122/" | relative_url }}) isolates the
  sample-seed fix from the rest of the manifest work.
- [105-2 Full P_0-to-P_n derivation and manifest thinning]({{
  "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }}) carries the
  actual reduction path across all app parameters.
- [105-3 Align pipeline-spec-lib and README with the target model]({{
  "/en/jira/issues/J01-105/steps/J01-125/" | relative_url }}) covers the
  library expander, disjointness rule, and lib docs.
- [105-4 Prove test runs, J01-9 unblocking, and the closing picture]({{
  "/en/jira/issues/J01-105/steps/J01-124/" | relative_url }}) groups the
  cross-repo closing evidence.

The possible follow-up to expose the config resolved early in
`BasePipelineCommand` as an object is intentionally not cut as `105-5`, but
as follow-up work in [J01-129]({{ "/en/jira/issues/J01-129/" | relative_url }}).

## Planned Target Model

- One manifest file stays in the app repo.
- `variable-groups` defines groups, variables, `sources`, and `meta` as a
  mapping.
- Every variable key gets a `meta` object.
- `phases.<phase>` contains the shared variable contract of a phase.
- `pipelines.<pipeline>.<phase>` adds only the true pipeline-specific
  difference.
- Group references are compact mappings: `group: "*"` or
  `group: [KEY, ...]`.
- After expansion there must be no overlap between the shared phase rule and
  the concrete pipeline addition.
- The compiled config array contains only config variables; the pipeline phase
  is stored separately as library metadata and no longer uses a runtime
  legacy fallback.
- A separate `pipelines.global` layer is no longer part of the confirmed
  target state after the later library decision.

## Derivation of the Thin Manifest

The derivation is recorded in the issue itself as a smoothed technical path.
It runs as `P_0 -> P_1 -> ... -> P_n`, where each step carries one small,
tested parameter decision.

1. `P_0`: full current parameter set of the working branch.
2. Fix model errors first: silent defaults and wrong couplings must be removed
   before thinning.
3. Each `P_i -> P_{i+1}` step confirms one small finding: a parameter is
   removed, kept, or kept temporarily because of an alternative case.
4. Every step needs source evidence plus a check run.
5. `P_n` is the confirmed thin contract, not just a guess.

Earlier coarse `P_0` of the app manifest:

- This list remains the broad issue-level overview.
- Since 2026-04-03, the per-parameter matrix of technically found `P_0`
  parameters lives on
  [105-2]({{ "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }}).
- That step page is authoritative for strict decisions about inclusion in
  `P_0`, formal add-on evidence, and pipeline/phase placement.

- `python`: `PYTHON_CMD`, `PYTHON_PATHS`
- `build`: `APP_BASE_PATH`, `LEBENSLAUF_DATEN_PFAD`,
  `LEBENSLAUF_YAML_PFAD`,
  `LEBENSLAUF_PUBLIC_PROFILE`, `LEBENSLAUF_LANG_DEFAULT`,
  `LEBENSLAUF_LANGS`
- `runtime`: `APP_BASE_PATH`, `TRUST_PROXY`,
  `LEBENSLAUF_LANG_DEFAULT`, `LEBENSLAUF_LANGS`,
  `CAPTCHA_TTL_SECONDS`, `CAPTCHA_MAX_GET`,
  `CONTACT_MAX_POST`, `CONTACT_TO_EMAIL`,
  `RATE_LIMIT_WINDOW_SECONDS`, `MAIL_STDOUT`,
  `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`, `SMTP_PASS`,
  `SMTP_ENCRYPTION`, `SMTP_FROM_EMAIL`, `SMTP_FROM_NAME`
- `deploy`: `FTP_SERVER_DIR`, `FTP_PORT`, `FTP_HOST`, `FTP_USER`, `FTP_PASS`

Confirmed findings from source analysis:

- `setup`: the former seed path was wrongly coupled to
  `LEBENSLAUF_PUBLIC_PROFILE`. The target state uses
  `--copy-sample-content` with the fixed fixture
  `src/resources/fixtures/lebenslauf/daten-gueltig.yaml`
  and the fixed target `daten-sample.yaml`. After that,
  `LEBENSLAUF_PUBLIC_PROFILE` drops out of `setup`.
- `build`: uses `LEBENSLAUF_DATEN_PFAD`,
  `LEBENSLAUF_YAML_PFAD`,
  `LEBENSLAUF_PUBLIC_PROFILE`, `LEBENSLAUF_LANG_DEFAULT`,
  `LEBENSLAUF_LANGS`, and the build-side `APP_BASE_PATH`.
- `runtime`: uses `APP_BASE_PATH`, `TRUST_PROXY`,
  `CAPTCHA_TTL_SECONDS`, `CAPTCHA_MAX_GET`,
  `CONTACT_MAX_POST`, `CONTACT_TO_EMAIL`,
  `RATE_LIMIT_WINDOW_SECONDS`, `MAIL_STDOUT`, `SMTP_*`,
  `LEBENSLAUF_LANG_DEFAULT`, and `LEBENSLAUF_LANGS`.
- `python`: uses `PYTHON_CMD` and optional `PYTHON_PATHS`.
- `deploy`: uses only the deploy parameters `FTP_*`.

Early confirmed findings before the formal renumbering are:

- Pre-finding: `LEBENSLAUF_PUBLIC_PROFILE` drops out of `setup`; this seed
  finding belongs functionally to `J01-122` and comes before the strictly
  evidenced `P_0` of `J01-123`.
- Earlier noted check path: validate `PYTHON_PATHS` against the optional
  code path.
- Earlier noted check path: treat `APP_URL` as a formal build candidate and
  keep checking for a possible technical reader.

After that, the remaining formalized `P_0` parameters are processed until
each one has a final status.

The first explicitly documented transition `P_0 -> P_1` is now:

- `MAIL_STDOUT` stays in `common.runtime`.
- `SMTP_*` moves out of `common.runtime` into `preview.runtime`.
- `LEBENSLAUF_JSON_PFAD` is fully removed without legacy residue.

The next explicitly documented transition `P_1 -> P_2` is now:

- `APP_URL` no longer had a technical reader in the app repo.
- The former formal candidate therefore drops out of the build contract and
  the example build configs.

The following `P_j` transitions now use this working rule:

- `tests:smoke` is the preferred functional proof for a removal.
- `lint` remains contract validation, but does not replace an execution proof.
- If `tests:smoke` does not apply to the affected path or stalls on the
  environment, a fitting substitute run must be evidenced explicitly.

The general meaning of `meta.desc`, `meta.example`, and `meta.notes` is
documented canonically in
[Spec: Pipeline spec system]({{ "/en/specs/systems/pipeline-spec/" | relative_url }}).
At the same time, J01-105 now makes clear that concrete functional
dependencies should remain visible on the variable entry itself; their
earlier loss in `meta.notes` was a regression.

## Out of Scope for This Doc Pass

- no implementation of manifest or lib changes in the source repos
- no implementation of J01-37
- no claim that the described target model is already active in code

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Derivation documented | Source analysis, the matrix of technically found `P_0` parameters, and `P_0 -> ... -> P_n` are traceable in the issue | Jira docs DE/EN | in progress |
| Target model documented | `variable-groups`, `phases`, real `pipelines`, compact group mappings, and pipeline differences are described; earlier drafts with `global`, `common`, `group-key`, `policy` are cleaned up | Jira docs DE/EN | done |
| `PIPELINE` / `PHASE` explained | No app-side `pipeline_phase`; both keys are injected by the lib | Jira docs DE/EN | done |
| Area syntax explained | Full-area and partial-area syntax is described as the planned model | Jira docs DE/EN | done |
| Disjointness rule explained | No overlap between shared phase and concrete pipeline | Jira docs DE/EN | done |
| Code defaults removed | No J01-105 case relies on content-level fallback defaults anymore; a positive interim state is evidenced, but the final closeout proof is still open | Source analysis source repos, `tagebuch` | interim state evidenced |
| `LEBENSLAUF_PUBLIC_PROFILE` corrected | No longer in `setup` or `runtime`, only in the build path | config.manifest.yaml | open |
| Lib README corrected | No old `required`/`allowed`, `policy`, `group-key`, or `common` schema remains in lib docs; the README uses the new structure model | `pipeline-config-spec-php/README.md`, `pipeline-config-spec-php/README.de.md` | done |
| Manifest simplified | Target model implemented in source repos | config.manifest.yaml | partially done |
| `P_1` documented | The first reduction step (`MAIL_STDOUT` in `common`, `SMTP_*` only in `preview`, JSON residue removed) is traceable in J01-123 and the parent page | Jira docs DE/EN, app repo | done |
| `P_2` documented | `APP_URL` was removed from the build contract because no technical reader remained; J01-123 and the parent page reflect that | Jira docs DE/EN, app repo | done |
| Smoke rule tightened | `tests:smoke` is the preferred functional proof for `P_j`; exceptions require an evidenced substitute run | Jira docs DE/EN, `tests/py/smoke.py` | done |
| SMTP sender clarified | Sender now runs only via `SMTP_FROM_EMAIL` and `SMTP_FROM_NAME`; `CONTACT_TO_EMAIL` remains separate | config.manifest.yaml, MailService.php | done |
| `meta.notes` sharpened again | Functional dependencies are visible again on the affected variables; the earlier thinning is corrected | config.manifest.yaml, Jira docs | in progress |
| Environment docs deduplicated | `docs/ENVIRONMENTS.md` is removed; README, manifest, and pipeline-spec docs carry the remaining responsibilities without rule duplication | app repo, public spec docs | done |
| pipeline-spec-lib updated | Expander for `phases`, `pipelines`, mapping-style group rules, and internal phase keys are implemented in library history | pipeline-config-spec-php | done |
| Tests green | There is an evidenced positive interim state for lib tests and phase-wise `config lint`; full closeout evidence is still open | Test run, `tagebuch` | interim state evidenced |
| J01-9 unblocked | J01-105 done, J01-9 no longer blocked | Jira | open |

## Open points

- J01-28: related issue (broad analysis frame, not a blocker).
- The general `meta` semantics live in the pipeline-spec system docs, not
  only on this issue page; concrete dependencies still remain visible on the
  variable entry in `meta.notes`.
- The secret path for `SMTP_PASS` and FTP credentials is clear in the source
  state, but not yet called out as its own finding in the public doc.
- The earlier regression and later restoration of `meta.notes` hints are not
  yet visible as an explicit finding in the public history.
- J01-37 remains a separate follow-up; J01-105 does not introduce new
  conditional or policy semantics for that.

## Links

- [J01-9: Preview — reactivate workflow]({{ "/en/jira/issues/J01-9/" | relative_url }})
- [J01-28: Analysis: Risk patterns and findings list]({{ "/en/jira/issues/J01-28/" | relative_url }})
- [J01-31: Preview Readiness — system source processing]({{ "/en/jira/issues/J01-31/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
