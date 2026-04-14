---
layout: page
title: "105-2: Full P_0-to-P_n derivation and manifest thinning"
jira_key: J01-123
jira_parent_key: J01-105
permalink: /en/jira/issues/J01-105/steps/J01-123/
---

**Status:** 2026-04-12

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Step-specific public work status for
[105-2]({{ "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }}) under
[J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }}).
This page groups the actual app-manifest reduction path and separates it from
the seed edge case and the library cut.

## Goal

- `P_0` is built only from technically found parameters.
- Formal documentation remains an additional signal, but not an admission
  rule for `P_0`.
- Every parameter from `P_0` then gets a final state:
  kept, removed, or kept temporarily because of one clearly named
  alternative case.
- The app manifest describes only the confirmed thin contract.
- The derivation stays traceable through source evidence and check runs.

## Report

- In this step, `P_0` is not derived from a guessed target state but from
  technically found parameters.
- Each parameter first answers the technical evidence question:
  is there a concrete program path in the existing worktree?
- The matrix also shows in which pipeline/phase the finding lives and
  whether the same parameter is documented formally.
- Based on the current findings, `P_0` spans the technically found parameters from
  `python`, `build`, `runtime`, and `deploy`.
- After `J01-122`, `setup` no longer retains a technical parameter finding;
  the earlier candidate `LEBENSLAUF_PUBLIC_PROFILE` is
  therefore not included in `P_0`.
- `LEBENSLAUF_JSON_PFAD` is no longer part of the target state: there is
  no current functional JSON data path, so the parameter and its remaining
  code/config traces are removed completely.
- `CAPTCHA_TTL_SECONDS` stays a runtime parameter in the target state; the
  technical finding additionally covers the CLI cleanup path, which should
  only remove expired captchas.
- Each transition `P_i -> P_{i+1}` confirms exactly one small finding so the
  reduction remains verifiable instead of merely editorial.
- This step is the main path of the issue and carries the full parameter work
  in the app repo.

## Current status

- Jira subtask `J01-123` exists.
- The earlier coarse `P_0` list from `J01-105` is tightened here into a
  matrix of technically found parameters.
- Every currently included parameter now carries a technical finding with a
  pipeline/phase location; formal docs are marked only as an additional
  signal.
- `P_1` is now tightened further:
  `MAIL_STDOUT` lives in the contact runtime, `SMTP_*` lives in the `smtp`
  group only under `preview.runtime`, and `LEBENSLAUF_JSON_PFAD` is fully
  removed without legacy residue.
- `P_2` is now fixed as well:
  `APP_URL` no longer had a technical reader in the evaluated worktree and
  therefore drops out of the build contract and the example configs.
- `P_3` is now partially implemented as an architecture and operations
  follow-up: `PYTHON_PATHS` stays technically evidenced, `cli python` now
  uses `BasePipelineCommand` together with the shared path
  `src/cli/php/shared/PythonCommand.php` /
  `src/cli/php/shared/PythonRunner.php`, and `run` stays discarded.

## `P_1`: contact/SMTP contract tightened, JSON residue removed

The first small transition `P_0 -> P_1` is now fixed:

- `MAIL_STDOUT` belongs to the contact form and lives in the `contact` group.
- In the current target state, `SMTP_*` no longer belongs to the shared
  runtime contract and now lives as the `smtp` group only in `preview.runtime`.
- `CONTACT_TO_EMAIL` is an app config rule: when the key belongs to the
  runtime phase, the value must not be empty and must be a valid email address.
- `LEBENSLAUF_JSON_PFAD` does not remain as an old leftover; it is fully
  removed from manifest, config, and code.

This keeps `P_0` readable as the technical full finding while `P_1`
documents the first strong functional reduction step.

## `P_2`: `APP_URL` drops out as a merely formal candidate

The next small transition `P_1 -> P_2` is now decided as well:

- `APP_URL` no longer had a technical reader anywhere in the current app repo.
- The key remained only as a formal build candidate in the manifest and in
  the example build files.
- It therefore drops out completely from the build contract and from
  `dev-build.yaml` and `preview-build.yaml`.
- `config lint` for `dev/build` and `preview/build` stays green; the `dev`
  build runs without `APP_URL`, while the `preview` build currently stops on
  missing fixture data rather than on `APP_URL`.
- For future `P_j` steps, `tests:smoke` is therefore treated as the preferred
  functional proof; for `P_2` this run stayed open in the current
  environment because the smoke clone got stuck in the Composer/environment
  setup before the actual HTTP proof.

`APP_URL` is therefore no longer tracked as an open candidate but as a
completed removal.

## `P_3`: `PYTHON_PATHS` stays, CLI override becomes spec-bound

The next small transition `P_2 -> P_3` is now partially implemented as an
architecture and operations step:

- `PYTHON_PATHS` remains in the target state because the Python runner
  technically reads the value and builds `PYTHONPATH` for Python scripts from
  it.
- The effective Python config should no longer come from a parallel mix of
  manifest value plus separate `--add-path`, but unambiguously from
  `pipeline` + phase `python` + optional CLI overrides.
- The new layer `BasePipelineCommand` is now anchored in the app repo for
  that:
  on top of the general `BaseCommand` spec resolution, it adds only the real
  command phase together with `pipeline` and `--override`, resolves that
  command config once up front, and then hands only the finished
  `ConfigValues` to downstream pipeline commands.
- `PythonCommand` and `PythonRunner` now live under
  `src/cli/php/shared/`, so the Python path no longer stays in the older
  `util` layout.
- `ConfigCommand` remains a meta/spec command without a fixed command phase;
  there, `pipeline` and `phase` are request parameters.
- `BuildCommand` keeps `build` as its real command phase; the additional read
  of `runtime` remains the explicit `compileRuntimeConfig()` generation step
  and does not become the command phase.
- `RunCommand` is removed again:
  `dev.py` remains a Python script inside the CLI phase `python`, so local
  dev startup lives more coherently on the `composer` layer instead of as the
  misleading pipeline command `run`.

This means `P_3` is not another removal case. It tightens the command/spec
boundary and documents that `PYTHON_PATHS` really remains part of the thin
contract.

<span id="p-0-belegmatrix"></span>

## `P_0` evidence matrix {#p_0-belegmatrix}

Only parameters with a technical finding enter `P_0`.
The presentation now follows the manifest reading path
`Pipeline -> Phase -> Area -> Parameter`.
The technical source remains the decisive program path:
PHP code, CLI path, Python runner, shell script, or GitHub workflow.

{% include j01-123-p0-matrix.html lang="en" %}

## Findings kept from before the restructuring

These points were already fixed before the later schema refactor and remain
authoritative for `P_0`:

- `setup` no longer carries a technical parameter finding after `J01-122`;
  the earlier candidate `LEBENSLAUF_PUBLIC_PROFILE` therefore stays
  explicitly outside `P_0`.
- `deploy` belongs in the matrix because the workflow `preview-deploy`
  provides a technical finding; the `FTP_*` values are not merely formal
  candidates.
- `APP_URL` remains only a formal candidate until a technical reader is
  proven in the evaluated worktree.

## Earlier formal candidates outside `P_0`

| Domain phase | Parameter | Reason | Status |
| --- | --- | --- | --- |
| `build` | `APP_URL` | No technical reader is evidenced in the current app repo; the former formal candidate was removed from the contract and example configs with `P_2`. | removed with `P_2` |

## Excluded earlier candidates

| Phase | Parameter | Reason | Status |
| --- | --- | --- | --- |
| `setup` | `LEBENSLAUF_PUBLIC_PROFILE` | After `J01-122`, `setup` uses only `--copy-sample-content` with a fixed fixture; `SetupCommand` no longer reads a functional setup parameter. | not included in `P_0` |
| `runtime` | `LEBENSLAUF_PUBLIC_PROFILE` | No positive HTTP runtime evidence in the current source state; the parameter remains evidenced on the build side. | not included in `P_0` |
| `build` | `LEBENSLAUF_JSON_PFAD` | There is no current functional JSON data path anymore; the former intermediate path is removed without legacy residue. | removed from manifest, config, and code |

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| `P_0` complete | Every included parameter carries a technical finding with pipeline/phase context; excluded early candidates and formal candidates are marked explicitly | this step page, app repo | done |
| `P_1` implemented | `MAIL_STDOUT` lives in `contact`, `SMTP_*` lives in `smtp` only in `preview.runtime`, `CONTACT_TO_EMAIL` is validated, and `LEBENSLAUF_JSON_PFAD` is fully removed | app repo, this step page | done |
| `P_2` implemented | `APP_URL` was removed from the build contract and example configs because no technical reader remains | app repo, build check run, this step page | done |
| `P_3` partially implemented | `PYTHON_PATHS` remains as a technically evidenced Python-runner parameter; `BasePipelineCommand` is anchored in the app repo, `cli python` uses the shared path, and `run` stays discarded | app repo, this step page, work notes | in progress |
| Technical usage visible | Each parameter names the concrete program path | this step page | done |
| Formal add-on evidence visible | Each technically found parameter shows whether docs have been pulled along | this step page | done |
| Every transition evidenced | Each step `P_i -> P_{i+1}` has source evidence and preferably `tests:smoke` as the functional proof; if the smoke path does not apply, a fitting substitute run must be evidenced | app repo, work docs | in progress |
| Thin contract reached | Manifest contains only confirmed target parameters from `P_n` | `config.manifest.yaml` | in progress |
| Phase boundaries clear | `common` and the pipeline delta stay cleanly separated in the app contract | app repo, J01-105 | in progress |

## Open points

- Carry the earlier noted `PYTHON_PATHS` check forward against the new,
  strictly technical `P_0`, and further harden the now implemented
  `BasePipelineCommand` / `BaseCommand` separation in the CLI.
- Stabilize the smoke path itself so later `P_j` steps no longer stall in
  the clone/composer setup.
- Decide later whether `cli config` as a meta/spec command should move out of
  the main repo into spec tooling, without inflating `P_3`.

## Links

- [105-2 in the Jira mirror]({{ "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }})
- [J01-105 in the Jira mirror]({{ "/en/jira/issues/J01-105/" | relative_url }})
