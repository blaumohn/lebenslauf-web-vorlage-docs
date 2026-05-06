---
layout: page
title: "135-3 — Define the mail return channel for runtime-admin results"
permalink: /en/jira/issues/J01-135/steps/J01-140/
jira_key: J01-140
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Goal: Define a controlled return channel for runtime-admin results so
sensitive results such as new CV tokens do not appear only on stdout or in
uncontrolled logs.

- `mail_stdout` remains possible as a dev helper.
- Preview and production-like flows should use SMTP.
- Result return and error output are treated separately.
- Log leaks remain an explicit checkpoint.

Success criterion: Runtime-admin results have a documented return channel that
does not rely on uncontrolled console output for preview/production.

## Closure 2026-05-06

J01-140 is done in Jira Cloud. The closing state comes from the ongoing Claude
session `4fe85d48-3c41-482a-86b8-11cad187ee02`; that session is still running
and was used here only for the completed J01-140 part.

Implemented closing state:

- `MailMessage` carries module, title, and body; the subject is derived from
  app name, module, and title.
- `MailService` is the shared mail service for the contact form and
  runtime-admin return messages.
- The recipient is read centrally from `MAIL_TO_EMAIL` and validated.
- `CONTACT_TO_EMAIL` no longer belongs to the active config path.
- CI/preview use the SMTP/Mailpit path; the contact-form smoke test checks the
  actual recipient.
- The source repo records the state in commit `15686cd`:
  `feat(mail): MailMessage/MailService verallgemeinern, MAIL_TO_EMAIL einführen (J01-140)`.

J01-139 remains in progress and uses this return channel for CV-token rotation
as a runtime-admin action.

## Boundary

J01-140 remains the issue for the controlled return channel. The runtime-admin
trigger path from
[J01-138]({{ "/en/jira/issues/J01-135/steps/J01-138/" | relative_url }})
was completed in the technical foundation of
[J01-142]({{ "/en/jira/issues/J01-135/steps/J01-142/" | relative_url }})
and is evidenced there. This page does not duplicate the trigger/switch state.

## Update 2026-05-04: SFTP Deploy Coherence

The preview deployment had accumulated a mixed responsibility area that is now
separated more clearly: transport, slot state, router state, template rendering
and tree operations are no longer bundled in `sftp_lib.py`. The visible command
paths remain unchanged; the existing entry scripts remain
`scripts/sftp-deploy.py` and `scripts/sftp-read-vendor-build-id.py`.

Current implementation state:

- `sftp_lib.py` now contains only SFTP transport and configuration loading.
- `sftp_deploy_state.py` contains `SlotState`, `DeployState` and
  `DeploymentPlan`.
- `sftp_deploy_templates.py` provides the HTTP resource path.
- `sftp-deploy.py` separates the command edge from the `SftpDeploy` flow class;
  `main()` reads config and `SFTP_INCLUDE_VENDOR`, while the class runs the
  deploy flow.
- The root HTTP resources live close to their target under `src/resources/http/`.
- The slot-root resource is named `src/resources/http/app-slot/.htaccess`; the
  misleading `root` name and the no longer referenced legacy `entry` resource
  were removed.
- `.deploy-state.ini` is the sole script state source; the inline
  `// deploy-state:` in the generated `index.php` was removed.
- `index.php` and the root `.htaccess` are static entry files; in the normal
  case, deploy only writes `.deploy-state.ini` as the switch point. Static
  entry files are uploaded only on first deploy; migration and recovery remain
  a separate admin operation.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| SMTP path | Preview/production use a mail return channel | `MailService`, `MAIL_TO_EMAIL`, Mailpit/contact smoke, commit `15686cd` | done |
| Dev path | `mail_stdout` remains clearly bounded as a dev helper | `MAIL_STDOUT`, `MailService::sendToStdout()` | done |
| Log protection | Sensitive results do not appear in uncontrolled logs | Return uses deliberate mail sending in the handler; J01-139 remains open for token-specific output | done |
| SFTP deploy state | `.deploy-state.ini` is the SSOT for deploy script state | `scripts/sftp_deploy_state.py`, `scripts/sftp-deploy.py`, `scripts/sftp-read-vendor-build-id.py` | done |
| SFTP deploy flow | Command edge and deploy flow are separated | `scripts/sftp-deploy.py` (`main()`, `SftpDeploy`) | done |
| SFTP deploy resources | Static entry files live under the HTTP resources | `src/resources/http/index.php`, `src/resources/http/.htaccess` | done |
| Slot-root resource | App-slot `.htaccess` is no longer named as HTTP root | `src/resources/http/app-slot/.htaccess`, `scripts/pipeline_lib.sh` | done |
| Inline router state | Static router no longer contains `// deploy-state:` | `src/resources/http/index.php` | done |
| Switch point | Swap deploys switch only through `.deploy-state.ini`; entry files belong to first deploy/admin recovery | `scripts/sftp-deploy.py` | done |

## Links

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }})
