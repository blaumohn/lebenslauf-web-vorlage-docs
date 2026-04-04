---
layout: page
title: "105-2: Full P_0-to-P_n derivation and manifest thinning"
jira_key: J01-123
jira_parent_key: J01-105
permalink: /en/jira/issues/J01-105/steps/J01-123/
---

**Status:** 2026-04-03

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
- The actual reduction steps from the formalized `P_0` onward remain in
  progress; the seed correction from `J01-122` now counts as a pre-finding
  before the new numbering.

## `P_0` evidence matrix

Only parameters with a technical finding enter `P_0`.
`Technical usage` means the concrete program path:
PHP code, CLI path, Python runner, shell script, or GitHub workflow.

| Domain phase | Parameter | Pipeline/Phase | Technical finding | Technical usage | Technical source | Formally documented | Formal source | `P_0` status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `python` | `PYTHON_CMD` | `dev/python`, `preview/python` | yes | Python runner | `src/cli/php/PythonResolver.php` | yes | `src/resources/config/dev-python.yaml`, `README.md`, `docs/ENVIRONMENTS.md` | included |
| `python` | `PYTHON_PATHS` | `dev/python`, `preview/python` | yes | Python runner | `src/cli/php/util/PythonRunner.php` | yes | `src/resources/config/dev-python.yaml`, `README.md`, `docs/ENVIRONMENTS.md` | included |
| `build` | `APP_BASE_PATH` | `dev/build`, `preview/build` | yes | CV build and render path | `src/cli/php/Cv/CvUploadService.php`, `src/cli/php/ConfigValues.php` | yes | `src/resources/config/dev-build.yaml`, `J01-105` | included |
| `build` | `LEBENSLAUF_DATEN_PFAD` | `dev/build`, `preview/build` | yes | Content source for CV build | `src/cli/php/Cv/ContentSourceResolver.php` | yes | `README.md`, `README.en.md` | included |
| `build` | `LEBENSLAUF_YAML_PFAD` | `dev/build`, `preview/build` | yes | Content source and dev watcher | `src/cli/php/Cv/ContentSourceResolver.php`, `src/cli/py/dev/dev.py` | no | - | included |
| `build` | `LEBENSLAUF_JSON_PFAD` | `dev/build`, `preview/build` | yes | JSON target path for CV build | `src/cli/php/Cv/ContentSourceResolver.php` | no | - | included |
| `build` | `LEBENSLAUF_PUBLIC_PROFILE` | `dev/build`, `preview/build` | yes | CV build, upload, and preview config check | `src/cli/php/Cv/CvBuildService.php`, `src/cli/php/Cv/CvUploadService.php`, `bin/ci` | yes | `README.md`, `J01-105` | included |
| `build` | `LEBENSLAUF_LANG_DEFAULT` | `dev/build`, `preview/build` | yes | Upload and render path | `src/cli/php/Cv/CvUploadService.php` | yes | `src/resources/config/dev-build.yaml`, `J01-105` | included |
| `build` | `LEBENSLAUF_LANGS` | `dev/build`, `preview/build` | yes | Upload and render path | `src/cli/php/Cv/CvUploadService.php` | yes | `src/resources/config/dev-build.yaml`, `J01-105` | included |
| `runtime` | `APP_BASE_PATH` | `dev/runtime`, `preview/runtime` | yes | HTTP runtime | `src/Http/ConfigCompiled.php`, `src/Http/AppBuilder.php` | yes | `src/resources/config/dev-runtime.yaml`, `README.en.md` | included |
| `runtime` | `TRUST_PROXY` | `dev/runtime`, `preview/runtime` | yes | HTTP runtime | `src/Http/Actions/ContactFormAction.php`, `src/Http/Actions/ContactSubmitAction.php` | no | - | included |
| `runtime` | `LEBENSLAUF_LANG_DEFAULT` | `dev/runtime`, `preview/runtime` | yes | HTTP runtime | `src/Http/Actions/CvAction.php` | yes | `README.md`, `README.en.md` | included |
| `runtime` | `LEBENSLAUF_LANGS` | `dev/runtime`, `preview/runtime` | yes | HTTP runtime | `src/Http/Actions/CvAction.php` | yes | `README.md`, `README.en.md` | included |
| `runtime` | `CAPTCHA_TTL_SECONDS` | `dev/runtime`, `preview/runtime` | yes | HTTP runtime and captcha CLI | `src/Http/AppContext.php`, `src/cli/php/Command/CaptchaCommand.php` | no | - | included |
| `runtime` | `CAPTCHA_MAX_GET` | `dev/runtime`, `preview/runtime` | yes | HTTP runtime | `src/Http/Actions/ContactFormAction.php` | no | - | included |
| `runtime` | `CONTACT_MAX_POST` | `dev/runtime`, `preview/runtime` | yes | HTTP runtime | `src/Http/Actions/ContactSubmitAction.php` | no | - | included |
| `runtime` | `CONTACT_TO_EMAIL` | `dev/runtime`, `preview/runtime` | yes | Mail service | `src/Http/Contact/MailService.php` | yes | `README.md`, `README.en.md` | included |
| `runtime` | `RATE_LIMIT_WINDOW_SECONDS` | `dev/runtime`, `preview/runtime` | yes | HTTP runtime | `src/Http/Actions/ContactFormAction.php`, `src/Http/Actions/ContactSubmitAction.php` | no | - | included |
| `runtime` | `MAIL_STDOUT` | `dev/runtime`, `preview/runtime` | yes | Mail service and preview config check | `src/Http/Contact/MailService.php`, `bin/ci` | no | - | included |
| `runtime` | `SMTP_HOST` | `dev/runtime`, `preview/runtime` | yes | Mail service | `src/Http/Contact/MailService.php` | no | - | included |
| `runtime` | `SMTP_PORT` | `dev/runtime`, `preview/runtime` | yes | Mail service | `src/Http/Contact/MailService.php` | no | - | included |
| `runtime` | `SMTP_USER` | `dev/runtime`, `preview/runtime` | yes | Mail service | `src/Http/Contact/MailService.php` | no | - | included |
| `runtime` | `SMTP_PASS` | `dev/runtime`, `preview/runtime` | yes | Mail service | `src/Http/Contact/MailService.php` | yes | `config.manifest.yaml` | included |
| `runtime` | `SMTP_ENCRYPTION` | `dev/runtime`, `preview/runtime` | yes | Mail service | `src/Http/Contact/MailService.php` | no | - | included |
| `runtime` | `SMTP_FROM_EMAIL` | `dev/runtime`, `preview/runtime` | yes | Mail service | `src/Http/Contact/MailService.php` | yes | `README.md`, `README.en.md` | included |
| `runtime` | `SMTP_FROM_NAME` | `dev/runtime`, `preview/runtime` | yes | Mail service | `src/Http/Contact/MailService.php` | yes | `README.md`, `README.en.md` | included |
| `deploy` | `FTP_SERVER_DIR` | `preview/deploy` | yes | GitHub workflow `preview-deploy` | `.github/workflows/preview-deploy.yml` | yes | `src/resources/config/preview-deploy.yaml`, `README.en.md`, `J01-105` | included |
| `deploy` | `FTP_PORT` | `preview/deploy` | yes | GitHub workflow `preview-deploy` | `.github/workflows/preview-deploy.yml` | yes | `src/resources/config/preview-deploy.yaml`, `J01-105` | included |
| `deploy` | `FTP_HOST` | `preview/deploy` | yes | GitHub workflow `preview-deploy` | `.github/workflows/preview-deploy.yml` | yes | `config.manifest.yaml`, `J01-105` | included |
| `deploy` | `FTP_USER` | `preview/deploy` | yes | GitHub workflow `preview-deploy` | `.github/workflows/preview-deploy.yml` | yes | `config.manifest.yaml`, `J01-105` | included |
| `deploy` | `FTP_PASS` | `preview/deploy` | yes | GitHub workflow `preview-deploy` | `.github/workflows/preview-deploy.yml` | yes | `config.manifest.yaml`, `J01-105` | included |

## Formal candidates outside `P_0`

| Domain phase | Parameter | Reason | Formal source |
| --- | --- | --- | --- |
| `build` | `APP_URL` | No technical reader has been found yet in the evaluated worktree; it therefore stays outside `P_0` until a program path is proven. | `src/resources/config/dev-build.yaml`, `src/resources/config/preview-build.yaml`, `J01-105` |

## Excluded earlier candidates

| Phase | Parameter | Reason | Status |
| --- | --- | --- | --- |
| `setup` | `LEBENSLAUF_PUBLIC_PROFILE` | After `J01-122`, `setup` uses only `--copy-sample-content` with a fixed fixture; `SetupCommand` no longer reads a functional setup parameter. | not included in `P_0` |
| `runtime` | `LEBENSLAUF_PUBLIC_PROFILE` | No positive HTTP runtime evidence in the current source state; the parameter remains evidenced on the build side. | not included in `P_0` |

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| `P_0` complete | Every included parameter carries a technical finding with pipeline/phase context; excluded early candidates and formal candidates are marked explicitly | this step page, app repo | done |
| Technical usage visible | Each parameter names the concrete program path | this step page | done |
| Formal add-on evidence visible | Each technically found parameter shows whether docs have been pulled along | this step page | done |
| Every transition evidenced | Each step `P_i -> P_{i+1}` has source evidence and a check run | app repo, work docs | in progress |
| Thin contract reached | Manifest contains only confirmed target parameters from `P_n` | `config.manifest.yaml` | in progress |
| Phase boundaries clear | `common` and the pipeline delta stay cleanly separated in the app contract | app repo, J01-105 | in progress |

## Open points

- Renumber the next transitions from this formalized `P_0`; the seed finding
  from `J01-122` stays a pre-finding before `P_0`.
- Carry the earlier noted `PYTHON_PATHS` and `APP_URL` checks forward
  against the new, strictly technical `P_0`.
- Keep checking `APP_URL` specifically for any technical reader beyond the
  current formal sources.
- Decide later whether individual parameter explanations belong in canonical
  area or system docs once `P_n` is stable.

## Links

- [105-2 in the Jira mirror]({{ "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }})
- [J01-105 in the Jira mirror]({{ "/en/jira/issues/J01-105/" | relative_url }})
