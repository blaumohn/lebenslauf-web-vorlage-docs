---
layout: page
title: "9-6 — Align Preview CI with the Pipeline Model"
permalink: /en/jira/issues/J01-9/steps/J01-134/
jira_key: J01-134
jira_parent_key: J01-9
---

<!-- generated:jira:step=1 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Goal

Align the local CI path and the GitHub preview flow with the leading
`pipeline + phase` project model so that preview failures become quickly
reproducible locally, preview-specific outputs stay verifiable locally,
and the workflow remains only a thin consumer of `bin/ci`.

## Current State

- `J01-134` now exists in SSOT Jira as a step under `J01-9`, is set to
  `In Progress`, and carries the canonical remote link to this work log.
- `bin/ci` now contains the reusable core for the preview path:
  `composer install`, config preparation, contract checks, setup, build,
  deploy verification, and output in `github-output` format.
- `pipeline-config-spec-php/src/Internal/ConfigLoader.php` now separates
  the loading path more clearly into orchestration, file loading, and
  merge steps. That keeps `load()` shorter and follows the style goal of
  "one task per function" more closely.
- The loader file model now follows the spec without `common.yaml` and
  without a pipeline-only file. The order is now
  `config/<phase>.yaml`, `.local/<phase>.yaml`,
  `config/<pipeline>-<phase>.yaml`, `.local/<pipeline>-<phase>.yaml`.
- The new `--overrides` spec is being finished in parallel by someone
  else and is nearly done. This step page therefore records only the
  confirmed state for `J01-134` and does not interfere with the ongoing
  source work.
- `tests/ci/run.sh` now contains only the git clone entry and then calls
  a pipeline matrix from `bin/ci`.
- The local matrix still covers `dev` and `preview` in the same
  `docker-compose.ci.yml`, but now uses separate local entry points:
  `composer run ci:dev` and `composer run ci:preview`.
- `composer tests:ci` was the earlier aggregate name; locally,
  `ci:dev` and `ci:preview` are now the canonical entry points.
- `ci:preview` starts only the preview path and stops the stack with
  `--abort-on-container-exit --exit-code-from ci-preview` so the
  long-lived helper service `sftp-server` does not keep the run open; a
  small wrapper then shuts the stack down completely with
  `docker compose down`.
- The preview smoke path now also includes `preview-web` as an HTTP/PHP
  runtime on the same deploy volume. `dev` still uses the local PHP
  server; only `preview` checks the pages through `preview-web:80`.
- The Paramiko-based upload now emits only concise CI phase messages
  for connection start, upload start, upload completion, and connection
  shutdown. The completion line includes files, directories, bytes, and
  duration without exposing secrets or producing per-file or
  per-directory noise.
- The app repo now has a versioned `pre-push` hook that runs both local
  CI commands one after the other.
- The GitHub workflow `preview-deploy.yml` no longer keeps the former
  domain logic from `Prepare config inputs` to `Resolve deploy outputs`
  as separate YAML steps and instead calls the central preview path via
  `bin/ci pipeline-check`.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| SSOT step exists | `J01-134` exists in Jira under `J01-9` | Jira | done |
| SSOT status matches | `J01-134` is set to `In Progress` | Jira | done |
| Remote link is canonical | Jira points to this public work log | Jira + this page | done |
| Pipeline model stays primary | `bin/ci` operates along `pipeline + phase`; no second domain CI model appears | `lebenslauf-web-vorlage/bin/ci` | done |
| Local preview reproduction | The Docker matrix covers `preview` locally, stops and removes the stack cleanly after `ci-preview`, and checks HTTP against `preview-web:80` | `lebenslauf-web-vorlage/composer.json`, `lebenslauf-web-vorlage/scripts/run-ci-preview.sh`, `lebenslauf-web-vorlage/docker-compose.ci.yml`, `lebenslauf-web-vorlage/scripts/pipeline_lib.sh` | done |
| Preview outputs stay verifiable locally | `ftp_host`, `ftp_user`, `ftp_pass`, `ftp_port`, `ftp_server_dir` are verified locally | `lebenslauf-web-vorlage/bin/ci`, `lebenslauf-web-vorlage/tests/php/CiCommandTest.php` | done |
| Preview upload stays visible in logs | The Paramiko upload reports phases and completion values without leaking secrets | `lebenslauf-web-vorlage/scripts/sftp-deploy.py`, `composer run ci:preview` | done |
| Loader style aligned with the model | `ConfigLoader::load()` stays narrow and delegates loading plus merging to helper functions | `pipeline-config-spec-php/src/Internal/ConfigLoader.php` | done |
| Loader file model follows the spec | No `common.yaml`, no pipeline-only file; phase comes before pipeline phase | `pipeline-config-spec-php/src/Internal/ConfigLoader.php`, `pipeline-config-spec-php/tests/ConfigLoaderTest.php`, `pipeline-config-spec-php/README.de.md`, `pipeline-config-spec-php/README.md` | done |
| `--overrides` spec stays separate | The nearly finished parallel spec is not claimed as complete here | Work context of this round | in progress |
| Workflow stays consumer-only | The former YAML domain steps disappear; the workflow calls the central preview path | `lebenslauf-web-vorlage/.github/workflows/preview-deploy.yml` | done |
| Hook and local entry stay current | `composer run ci:dev` and `composer run ci:preview` are the canonical entries; `pre-push` calls both | `lebenslauf-web-vorlage/composer.json`, `lebenslauf-web-vorlage/scripts/hooks/pre-push`, `lebenslauf-web-vorlage/README.md` | done |

## Links

- [J01-9 in the Jira mirror]({{ "/en/jira/issues/J01-9/" | relative_url }})
- [J01-9 step 9-4]({{ "/en/jira/issues/J01-9/steps/J01-132/" | relative_url }})
- [J01-9 step 9-5]({{ "/en/jira/issues/J01-9/steps/J01-133/" | relative_url }})
