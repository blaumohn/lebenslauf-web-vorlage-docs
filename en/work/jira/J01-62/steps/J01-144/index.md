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

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| CI smoke | `composer run ci:preview` passes with SFTP, HTTP, SMTP, and contact smokes | app repo, PR for `J01-144` | done |
| SMTP auth | wrong SMTP password is rejected in CI smoke, correct password sends test mail | `tests/ci/smtp-smoke.py` | done |
| SFTP host key | preview CI no longer needs dynamic `ssh-keyscan` | `docker-compose.ci.yml`, `bin/ci` | done |
| CI preview config | `CI_TEST_CASE`, `SMTP_PORT: 1025`, `GITHUB_RUN_ID`, and read-only inline config are stable | app repo, Codex follow-up | partially done |
| Python test run | Python unit tests run through `.venv/bin/python` only when explicitly requested | `composer.json`, `tests/py` | done |
| PHP test output | Expected task error paths do not pollute the successful PHPUnit run with STDERR error lines | `tests/php/TaskDeployTest.php`, `composer test:php` | done |
| Admin trigger | SFTP deploy triggers the registered admin route via GET after task upload | `src/cli/py/admin/dispatch.py`, `tests/py/test_admin_dispatch.py` | done |
| Preview Mailtrap | preview deployment sends through Mailtrap with real environment values | pending manual preview test | open |
| Follow-up fix | deviations from the Mailtrap test are fixed in this step or a follow-up PR | PR / evidence note | open |

## Links

- [Parent J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }})
