---
layout: page
title: "J01-62 — Production: Branch- und Environment-Regeln aktivieren"
permalink: /en/jira/issues/J01-62/
jira_key: J01-62

---
<!-- generated:jira:subtasks_cksum=337646038 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Links

-

## Description

Goal: make the production branch and environment rules binding.

- Define the branch-to-environment mapping.
- Prepare environment activation.

## Current State

The go-live state was re-evaluated on 2026-06-01 against the main repository,
Jira, and the agent sessions since the session table from 2026-05-30.

The following items are now complete:

- Deployment mail path (`J01-144`): task mails with the preview sender and
  `deploy_switch` context arrive in practice.
- Branch mapping (`J01-63`): `deploy.yml` triggers for `preview` and `prod`;
  `PIPELINE` and the GitHub environment are derived from `github.ref_name`.
- Environment activation (`J01-64`): `origin/preview` and `origin/prod` point
  to the activated deploy state with the generic deploy workflow.

The remaining go-live work is no longer the original branch/environment
foundation, but three concrete follow-up steps:

- Provide CI content YAML for the production build (`J01-152`).
- Derive home and index content from real site data (`J01-154`).
- Evaluate the publish path and live content changes (`J01-153`).

Smoke and runbook topics remain in the existing production lines `J01-65` and
`J01-68`.

## Verification Plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Deployment mail path | Preview deploy sends task mail with preview sender and deploy context | Received task mail for `deploy_switch`, `J01-144` | done |
| Branch mapping | `preview` and `prod` trigger the same deploy workflow with branch-based environment selection | `.github/workflows/deploy.yml`, `origin/preview`, `origin/prod` | done |
| Environment activation | GitHub environment and `PIPELINE` come from `github.ref_name`; production and preview branches exist remotely | `.github/workflows/deploy.yml`, Git remote branches | done |
| CI content YAML | Production build receives non-versioned content YAML through the CI driver | `J01-152` | open |
| Home/index content | Home page shows real site data instead of only minimal placeholders | `J01-154` | open |
| Publish/content changes | Live content changes are assessed; operating path is clear | `J01-153` | open |
| Smoke/runbook boundary | Production smoke and operating procedures are linked outside `J01-62` | `J01-65`, `J01-68` | open |

## Subtasks

- [**62-1 Mail im Deployment aktivieren**]({{ "/en/jira/issues/J01-62/steps/J01-144/" | relative_url }}) — Done
- **62-2 Branch-Mapping festlegen** — Done
- [**62-3 Environment aktivieren**]({{ "/en/jira/issues/J01-62/steps/J01-64/" | relative_url }}) — Done
- [**62-4 Deploy-Contract: Zustandsmaschine formal dokumentieren (Schritt 1)**]({{ "/en/jira/issues/J01-147/" | relative_url }}) — In Progress
- [**62-5 DeployPhase-Enum und DeployMachine-Skeleton implementieren**]({{ "/en/jira/issues/J01-148/" | relative_url }}) — Done
- [**62-6 RuleBasedStateMachine-Grundgeruest fuer DeployMachine hinzufuegen**]({{ "/en/jira/issues/J01-149/" | relative_url }}) — In Progress
- **62-7 CI-Inhalts-YAML fuer Prod-Build bereitstellen** — To Do
- **62-8 Home- und Index-Inhalt aus Seitendaten ableiten** — To Do
- **62-9 Publish-Pfad und laufende Inhaltsaenderungen bewerten** — To Do
