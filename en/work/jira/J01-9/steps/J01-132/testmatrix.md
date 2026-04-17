---
layout: page
title: "9-4 Test Matrix — Preview Deploy Resolution"
permalink: /en/jira/issues/J01-9/steps/J01-132/testmatrix/
jira_key: J01-132
jira_parent_key: J01-9
---

Test matrix: preview deploy resolution

Goal
- Keep the preview workflow covered so that `preview/runtime` and
  `preview/deploy` resolution stay verifiable along their real
  responsibilities.

Scope
- `pipeline-config-spec-php`: resolution matrix and source rules
- `lebenslauf-web-vorlage`: CLI integration and workflow consumption
- GitHub workflow: phase-specific `.local` materialization plus late deploy
  resolution right before `FTP deploy`

Matrix
- `preview/runtime` -> unit/compile ->
  `PreviewResolveMatrixTest` compiles `runtime` with `SMTP_PASS` from
  `system` and keeps `pipeline_phase` ->
  `pipeline-config-spec-php/tests/PreviewResolveMatrixTest.php`
- `preview/deploy` with file and local source -> unit/describe ->
  `PreviewResolveMatrixTest` proves `FTP_PORT` from file and
  `FTP_HOST`/`FTP_USER`/`FTP_PASS` from `.local` ->
  `pipeline-config-spec-php/tests/PreviewResolveMatrixTest.php`
- `preview/deploy` with system precedence -> unit/describe ->
  `PreviewResolveMatrixTest` proves `system` before `.local` ->
  `pipeline-config-spec-php/tests/PreviewResolveMatrixTest.php`
- `preview/deploy` failure paths -> unit/validation ->
  `PreviewResolveMatrixTest` covers missing required values and forbidden
  sources -> `pipeline-config-spec-php/tests/PreviewResolveMatrixTest.php`
- `config get preview --phase deploy` -> app integration ->
  `ConfigCommandTest` reads `FTP_PORT` from the deploy path ->
  `lebenslauf-web-vorlage/tests/php/ConfigCommandTest.php`
- `config get preview --phase runtime` -> app integration ->
  `ConfigCommandTest` reads `SMTP_PASS` from the runtime path ->
  `lebenslauf-web-vorlage/tests/php/ConfigCommandTest.php`
- `config lint preview --phase deploy` -> app integration ->
  `ConfigCommandTest` confirms the deploy-phase run ->
  `lebenslauf-web-vorlage/tests/php/ConfigCommandTest.php`
- `build preview` -> app integration ->
  `preview-build.yaml` points to `src/resources/fixtures/lebenslauf` so
  the preview build can run with existing sample data ->
  `lebenslauf-web-vorlage/src/resources/config/preview-build.yaml`
- workflow inputs -> workflow/integration ->
  `preview-deploy.yml` first creates `.local/preview-runtime.yaml` and
  `.local/preview-deploy.yaml` through `bin/ci prepare-config` ->
  `lebenslauf-web-vorlage/.github/workflows/preview-deploy.yml`,
  `lebenslauf-web-vorlage/bin/ci`
- `resolve-deploy` -> CI integration ->
  `CiCommandTest` confirms the neutral output and the
  `--format github-output` adapter ->
  `lebenslauf-web-vorlage/tests/php/CiCommandTest.php`
- `deploy-check --dir` -> CI integration ->
  `CiCommandTest` confirms the accepted target-path syntax for temporary
  artifacts outside the repo root ->
  `lebenslauf-web-vorlage/tests/php/CiCommandTest.php`
- `FTP deploy` -> workflow/integration ->
  `preview-deploy.yml` calls
  `bin/ci resolve-deploy ... --format github-output` and passes only
  step outputs to the action; the upload artifact lives under
  `var/deploy/` ->
  `lebenslauf-web-vorlage/.github/workflows/preview-deploy.yml`

Evidence
- [J01-132 step page]({{ "/en/jira/issues/J01-9/steps/J01-132/" | relative_url }})
- [J01-105 step 105-4]({{ "/en/jira/issues/J01-105/steps/J01-124/" | relative_url }})
