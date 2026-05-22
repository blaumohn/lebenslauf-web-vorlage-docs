---
layout: page
title: "62-1 — Enable mail in deployment"
permalink: /en/jira/issues/J01-62/steps/J01-144/
jira_key: J01-144
jira_parent_key: J01-62
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Goal

Enable mail in deployment so preview and later production can use SMTP through
pipeline config and environment values.

Parent: [J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }}).

## Current State

The first PR prepares the CI path:

- static CI infrastructure values for SMTP and SFTP live in
  `docker-compose.ci.yml`
- the local SFTP smoke uses a fixed CI test host key and a fixed
  `SSH_KNOWN_HOST_LINE`
- the SMTP smoke reads runtime config through `pipeline_config runtime`
- the SMTP smoke checks Mailpit directly with auth and TLS, without coupling
  to `src/Http`

The real preview proof with Mailtrap remains open and may trigger further
corrections to environment or workflow values.

## Follow-up 2026-05-14: Pipeline Spec Validation

The Claude session on 2026-05-14 clarified the validation gaps in the
pipeline-config data flow after comparing `cli ci preview`, Docker Compose,
and GitHub workflows. The detailed protocol lives in `tagebuch`; this page
keeps only the public commit trace and issue link.

| Repo | Commit | Contribution |
| --- | --- | --- |
| `pipeline-config-spec-php` | `80c20e6` | reshaped manifest, policy, compiler, and `PipelineConfig` API for full pipeline validation |
| `pipeline-config-spec-php` | `bd5be1e` | added `SPEC.md`, `SPEC.en.md`, and spec tests |
| `lebenslauf-web-vorlage` | `7c317e9` | moved the main repo to the new `PipelineConfig` API |
| `lebenslauf-web-vorlage` | `6ec0ae9` | updated the vendored pipeline-spec lib copy to `bd5be1e` |

The library commits are present on `origin/main`. The remote library push that
was still open in the session is therefore caught up; later preview work
continues in the subsequent J01-144 app commits.

## Follow-up 2026-05-09: Remaining Work Before Preview Proof

The later Codex sessions further clarified the local CI preview line:

- `SMTP_ENCRYPTION` is limited to `none` or `tls`; `ssl` fails early.
- `SMTP_FROM_EMAIL` remains required because `MailService` sets the sender
  explicitly; an unused `SMTP_EMAIL` value can be removed.
- `CI_TEST_CASE` must be passed into the container for targeted Compose runs.
- For Mailpit, `SMTP_PORT: 1025` must remain in CI preview config; otherwise
  the smoke test tries port `587`.
- Inline config must stay compatible with the read-only CI container.

For production, the open item is therefore not the mail feature itself, but
the real preview proof with the later environment values.

## Follow-up 2026-05-13: Deploy Correlation

The zero-downtime switch needs a unique `GITHUB_RUN_ID` so the SFTP deploy can
tie prepared slots and the PHP admin switch to the same run.

- The GitHub workflows pass the run identifier explicitly through `env:` from
  `github.run_id` and `github.run_attempt`.
- The shared preview CD part lives in a reusable GitHub workflow so preview
  deploy and admin reset use the same setup, config, and deploy steps.
- Local preview CI creates a dedicated `GITHUB_RUN_ID` per test case in the CI
  runner and passes it through Docker Compose to the `ci-preview` container.
- The SFTP swap writes run markers for the app and vendor slots before
  triggering `deploy_switch`.
- The Python admin dispatch HTTP trigger uses the registered PHP route
  `/admin/run` via GET.
- `composer test` stays the short PHPUnit entry point; Python unit tests run
  explicitly through `composer run test:python` or together with PHPUnit
  through `composer run test:all`.
- The Python unit test run buffers output from successful tests so expected
  side-output does not leak into the normal test report.

## Follow-up 2026-05-15: Task Test Output

The PHPUnit run had successful task error-path tests whose expected
`error_log()` messages still appeared in `composer test:php`.

- The affected `TaskRunner` tests now redirect expected error logs into a
  temporary log file in the test directory.
- Mail STDOUT output remains intentionally capturable so the error notification
  test can still assert the mail body.
- `composer test:php` still passes; the reported `[task] Fehler ...` and
  `[task] Mailversand fehlgeschlagen ...` lines no longer appear.

## Follow-up 2026-05-16: Contact Smoke Against Deployed Preview

The previous contact smoke started a local PHP server during the post-deploy
check and used `127.0.0.1`. That made the form path locally testable, but it
was not a valid proof for the deployed preview web container.

- `run_contact_smoke` now uses
  `cli python "$PIPELINE" --phase deploy --phase runtime tests/ci/contact_smoke.py`.
- The Python smoke calls the contact form through `APP_ROOT_URL` from the
  deploy phase.
- The Captcha solution is read through `SftpClient` from the deployed
  `<active-app-slot>/var/tmp/captcha/<captcha_id>.json`, not from the local
  build artifact.
- The expected recipient comes from the runtime phase through `PipelineCfg`.
- The preview web container mounts the CI Mailpit CA and updates CA
  certificates during startup so the real app mail path verifies the same
  STARTTLS path as the direct SMTP smoke.
- The post-deploy check now covers the web container, deployed runtime state,
  SFTP access, and Mailpit evidence in the same preview integration path.

## Follow-up 2026-05-17: HTTP smoke logs failed URL

During the `test-push-deploy` evidence run, the post-deploy HTTP smoke failed
with a `curl` HTTP 500 error without showing the affected URL in the CI log.
The shell smoke now handles failed `curl` fetches explicitly and writes the
checked URL to STDERR as `[smoke] HTTP-Abruf fehlgeschlagen: ...`. The original
`curl` error output stays visible, but now has the target context needed for
failure analysis.

## Follow-up 2026-05-18: Deploy switch and webroot protection covered

The follow-up finding was not in the upload of the test file itself: the new
app slot contained `public/ci-diff-test.html`, but the visible deploy state
stayed on the old slot. The cause was the deploy-switch contract for app slot
markers. App markers live at `app-<slot>/.deploy-run`, vendor markers live at
`vendor-<slot>/.deploy-run`. The handler now checks missing markers explicitly
and without a PHP warning.

Additional Python tests cover the shared-hosting boundary of the new webroot:
the webroot router serves static files only from the active
`app-<slot>/public/`. The non-public app-slot paths `app-<slot>/`,
`app-<slot>/src/`, and `app-<slot>/var/` keep `Require all denied`.

## Follow-up 2026-05-20: SFTP REPL transparency

The local SFTP REPL now replaces the separate local cleanup helper
`scripts/local/sftp-clear-dir.py` with an interactive `clear` command.
`rmdir` now follows the SFTP/POSIX meaning and removes only empty
directories.

For nontrivial operations, the REPL also prints the SFTP operation that was
used:

- `clear <path>` recursively empties a remote directory without deleting the
  directory itself.
- `rename <old> <new>` first tries `sftp.posix_rename`, then `sftp.rename`,
  and falls back to read/write/delete only for regular files.
- `mkdirp`, `stat`, `df`, `status`, and `version` add local diagnostics and
  file operations.
- Unsupported server extensions such as `statvfs` are reported visibly
  instead of disappearing silently.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| CI smoke | `composer run ci:preview` passes with SFTP, HTTP, SMTP, and contact smokes | app repo, PR for `J01-144` | done |
| SMTP auth | wrong SMTP password is rejected in CI smoke, correct password sends test mail | `tests/ci/smtp-smoke.py` | done |
| SFTP host key | preview CI no longer needs dynamic `ssh-keyscan` | `docker-compose.ci.yml`, `bin/ci` | done |
| CI preview config | `CI_TEST_CASE`, `SMTP_PORT: 1025`, `GITHUB_RUN_ID`, and read-only inline config are stable | app repo, Codex follow-up | partially done |
| Pipeline spec validation | pipeline config is fully validated before phase resolution; spec document and spec tests exist | `pipeline-config-spec-php` commits `80c20e6`, `bd5be1e`; app commits `7c317e9`, `6ec0ae9` | done |
| Python test run | Python unit tests run through `.venv/bin/python` only when explicitly requested | `composer.json`, `tests/py` | done |
| PHP test output | Expected task error paths do not pollute the successful PHPUnit run with STDERR error lines | `tests/php/TaskDeployTest.php`, `composer test:php` | done |
| Contact smoke | post-deploy contact form runs through `APP_ROOT_URL` and reads Captcha state from the deployed preview through SFTP | `tests/ci/contact_smoke.py`, `bin/ci`, `tests/py/test_contact_smoke.py` | done |
| Admin trigger | SFTP deploy triggers the registered admin route via GET after task upload | `src/cli/py/admin/dispatch.py`, `tests/py/test_admin_dispatch.py` | done |
| HTTP smoke error context | `curl` errors name the checked URL in the CI log | `scripts/pipeline_lib.sh`, `tests/py/test_ci_workflows.py` | done |
| Deploy switch markers | `deploy_switch` checks app and vendor slot markers through the deployed slot directories and writes `.deploy-state.ini` | `DeploySwitchTaskHandler.php`, `TaskDeployTest.php` | done |
| Webroot protection | only `app-<slot>/public/` is served through the router; `src/` and `var/` stay denied | `src/resources/deploy-root/`, `tests/py/test_sftp_deploy_state.py` | done |
| SFTP REPL | local SFTP commands report used operations and replace `sftp-clear-dir.py` | `src/cli/py/deploy/sftp_shell.py`, `tests/py/test_sftp_shell.py` | done |
| Preview Mailtrap | preview deployment sends through Mailtrap with real environment values | pending manual preview test | open |
| Follow-up fix | deviations from the Mailtrap test are fixed in this step or a follow-up PR | PR / evidence note | open |

## Links

- [Parent J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }})
