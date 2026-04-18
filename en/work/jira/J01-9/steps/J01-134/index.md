---
layout: page
title: "9-6 — Align Preview CI with the pipeline model"
permalink: /en/jira/issues/J01-9/steps/J01-134/
jira_key: J01-134
jira_parent_key: J01-9
---

<!-- generated:jira:step=1 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Goal

Align the local CI and the GitHub preview flow with the leading project
model `pipeline + phase` so that preview failures become quickly
reproducible locally, preview-specific outputs are verifiable locally,
and the workflow remains only a thin consumer of `bin/ci`.

## Current State

- `bin/ci` now carries the reusable preview core:
  `composer install`, config preparation, contract checks, setup, build,
  deploy verification, and `github-output` emission.
- `tests/ci/run.sh` is reduced to the git-clone entry and then delegates
  to a pipeline matrix in `bin/ci`.
- The local matrix covers `dev` and `preview` in the same
  `docker-compose.ci.yml`.
- `composer tests:ci` replaces the former `tests:smoke` name.
- The app repo now ships a versioned `pre-push` hook that runs exactly
  that CI path.
- The GitHub workflow `preview-deploy.yml` no longer keeps the former
  `Prepare config inputs` to `Resolve deploy outputs` logic as separate
  YAML steps and instead calls the central preview path through
  `bin/ci pipeline-check`.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Pipeline model stays primary | `bin/ci` operates along `pipeline + phase`; no second CI domain model appears | `lebenslauf-web-vorlage/bin/ci` | done |
| Local preview reproduction | The Docker matrix covers `preview` locally and checks the full preview path | `lebenslauf-web-vorlage/tests/ci/run.sh`, `lebenslauf-web-vorlage/docker-compose.ci.yml` | done |
| Preview outputs stay verifiable | `ftp_host`, `ftp_user`, `ftp_pass`, `ftp_port`, `ftp_server_dir` are verified locally | `lebenslauf-web-vorlage/bin/ci`, `lebenslauf-web-vorlage/tests/php/CiCommandTest.php` | done |
| Workflow stays consumer only | The former YAML logic disappears; the workflow calls the central preview path | `lebenslauf-web-vorlage/.github/workflows/preview-deploy.yml` | done |
| Hook and local entry are current | `composer tests:ci` is the canonical local entry; `pre-push` calls it | `lebenslauf-web-vorlage/composer.json`, `lebenslauf-web-vorlage/scripts/hooks/pre-push`, `lebenslauf-web-vorlage/README.en.md` | done |

## Links

- [J01-9 in the Jira mirror]({{ "/en/jira/issues/J01-9/" | relative_url }})
- [J01-9 step 9-4]({{ "/en/jira/issues/J01-9/steps/J01-132/" | relative_url }})
