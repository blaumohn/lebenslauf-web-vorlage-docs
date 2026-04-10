---
layout: page
title: "105-2: Full P_0-to-P_n derivation and manifest thinning"
jira_key: J01-123
jira_parent_key: J01-105
permalink: /en/jira/issues/J01-105/steps/J01-123/
---

**Status:** 2026-04-08

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
| Technical usage visible | Each parameter names the concrete program path | this step page | done |
| Formal add-on evidence visible | Each technically found parameter shows whether docs have been pulled along | this step page | done |
| Every transition evidenced | Each step `P_i -> P_{i+1}` has source evidence and preferably `tests:smoke` as the functional proof; if the smoke path does not apply, a fitting substitute run must be evidenced | app repo, work docs | in progress |
| Thin contract reached | Manifest contains only confirmed target parameters from `P_n` | `config.manifest.yaml` | in progress |
| Phase boundaries clear | `common` and the pipeline delta stay cleanly separated in the app contract | app repo, J01-105 | in progress |

## Open points

- Carry the earlier noted `PYTHON_PATHS` check forward against the new,
  strictly technical `P_0`.
- Stabilize the smoke path itself so later `P_j` steps no longer stall in
  the clone/composer setup.
- Decide later whether individual parameter explanations belong in canonical
  area or system docs once `P_n` is stable.

## Links

- [105-2 in the Jira mirror]({{ "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }})
- [J01-105 in the Jira mirror]({{ "/en/jira/issues/J01-105/" | relative_url }})
