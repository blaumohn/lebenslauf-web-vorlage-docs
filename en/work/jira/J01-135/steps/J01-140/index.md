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
- `sftp_deploy_templates.py` renders the deployment files from resources.
- `sftp-deploy.py` separates the command edge from the `SftpDeploy` flow class;
  `main()` reads config and `SFTP_INCLUDE_VENDOR`, while the class runs the
  deploy flow.
- The root HTTP resources live close to their target under `src/resources/http/`.
- The slot-root resource is named `src/resources/http/app-slot/.htaccess`; the
  misleading `root` name and the no longer referenced legacy `entry` resource
  were removed.
- `.deploy-state.ini` is the sole script state source; the inline
  `// deploy-state:` in the generated `index.php` was removed.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| SMTP path | Preview/production use a mail return channel | Configuration or test | open |
| Dev path | `mail_stdout` remains clearly bounded as a dev helper | Runbook or config docs | open |
| Log protection | Sensitive results do not appear in uncontrolled logs | Test or review | open |
| SFTP deploy state | `.deploy-state.ini` is the SSOT for deploy script state | `scripts/sftp_deploy_state.py`, `scripts/sftp-deploy.py`, `scripts/sftp-read-vendor-build-id.py` | done |
| SFTP deploy flow | Command edge and deploy flow are separated | `scripts/sftp-deploy.py` (`main()`, `SftpDeploy`) | done |
| SFTP deploy resources | Router and `.htaccess` content is rendered from HTTP resources | `src/resources/http/`, `scripts/sftp_deploy_templates.py` | done |
| Slot-root resource | App-slot `.htaccess` is no longer named as HTTP root | `src/resources/http/app-slot/.htaccess`, `scripts/pipeline_lib.sh` | done |
| Inline router state | Generated router no longer contains `// deploy-state:` | `src/resources/http/index.php.tpl` | done |

## Links

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }})
