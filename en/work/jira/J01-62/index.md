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

The three concrete follow-up steps identified on 2026-06-01 are now
functionally complete:

- CI loads the production content source through SFTP (`J01-152`).
- Production uses real public profile data instead of the dev profile
  (`J01-154`).
- The publish path builds, uploads, publishes, and smoke-checks CV HTML
  (`J01-153`).

Go-live is confirmed as achieved. Deploy-contract and DeployMachine work
remains visible as technical follow-up and does not invalidate the live state.

## Verification Plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Deployment mail path | Preview deploy sends task mail with preview sender and deploy context | Received task mail for `deploy_switch`, `J01-144` | done |
| Branch mapping | `preview` and `prod` trigger the same deploy workflow with branch-based environment selection | `.github/workflows/deploy.yml`, `origin/preview`, `origin/prod` | done |
| Environment activation | GitHub environment and `PIPELINE` come from `github.ref_name`; production and preview branches exist remotely | `.github/workflows/deploy.yml`, Git remote branches | done |
| CI content source | Production CI can load content through SFTP | Main-repository commit `318d77e`, `J01-152` | functionally done; Jira update open |
| Home/index content | Production uses a valid public profile instead of the dev profile | Main-repository commit `d5202b6`, `J01-154` | functionally done; Jira update open |
| Publish/content changes | CV HTML is published atomically and checked through HTTP | Main-repository commits `33768cf`, `5ad711f`, `97a3cdb`, `7341f10` | functionally done; Jira update open |
| Go-live | Production is live | Human confirmation on 2026-06-04, Sprint 5 review | done |

## Source Review

Every section was checked against `tagebuch`, Codex/Claude session registers,
and commit history. The earlier remaining-work description was no longer
complete after the implementations from 2026-06-02 through 2026-06-04 and
was replaced by the completion state.

## Subtasks

- [**62-1 Mail im Deployment aktivieren**]({{ "/en/jira/issues/J01-62/steps/J01-144/" | relative_url }}) — Done
- **62-2 Branch-Mapping festlegen** — Done
- [**62-3 Environment aktivieren**]({{ "/en/jira/issues/J01-62/steps/J01-64/" | relative_url }}) — Done
- [**62-4 Deploy-Contract: Zustandsmaschine formal dokumentieren (Schritt 1)**]({{ "/en/jira/issues/J01-147/" | relative_url }}) — In Progress
- [**62-5 DeployPhase-Enum und DeployMachine-Skeleton implementieren**]({{ "/en/jira/issues/J01-148/" | relative_url }}) — Done
- [**62-6 RuleBasedStateMachine-Grundgeruest fuer DeployMachine hinzufuegen**]({{ "/en/jira/issues/J01-149/" | relative_url }}) — In Progress
- [**62-7 CI-Inhalts-YAML fuer Prod-Build bereitstellen**]({{ "/en/jira/issues/J01-62/steps/J01-152/" | relative_url }}) — functionally done; Jira update open
- [**62-8 Home- und Index-Inhalt aus Seitendaten ableiten**]({{ "/en/jira/issues/J01-62/steps/J01-154/" | relative_url }}) — functionally done; Jira update open
- [**62-9 Publish-Pfad und laufende Inhaltsaenderungen bewerten**]({{ "/en/jira/issues/J01-62/steps/J01-153/" | relative_url }}) — functionally done; Jira update open
