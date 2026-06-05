---
layout: page
title: "SCRUM Sprint 5: Review, Retro, and Carry-Over — Production Live"
permalink: /en/work/sprints/scrum-sprint-5/
---

**Time window:** 2026-05-23 to 2026-06-04

**Status:** completed

## Participants

- Dani Y.
- Codex agent

## Sprint Goal

Bring production live: close production branch, environment, smoke-check,
mail/token/runtime-admin, and operating-docs work so the production path is
practically usable.

## Sprint Backlog

### Sprint Goal

- [J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }}) —
  production branch and environment rules
- [J01-65]({{ "/en/jira/issues/J01-65/" | relative_url }}) —
  production artifact and smoke checks
- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }}) —
  CI/CD tools for CV token generation and runtime admin operation

### Sprint Support

- [J01-68]({{ "/en/jira/issues/J01-68/" | relative_url }}) —
  production operating docs and runbook

### Sprint Admin

- [J01-150]({{ "/en/jira/issues/J01-150/" | relative_url }}) —
  plan Sprint 5 and bring production live
- [J01-145]({{ "/en/jira/issues/J01-145/" | relative_url }}) —
  ongoing documentation maintenance

### Unplanned / Ongoing

- [J01-137]({{ "/en/jira/issues/J01-137/" | relative_url }}) —
  ongoing CV UI adjustments
- [J01-151]({{ "/en/jira/issues/J01-151/" | relative_url }}) —
  ongoing technical chores

## Planning Decision

- Sprint 5 deliberately carries over the open production remainder from
  Sprint 4 as goal work.
- Ongoing documentation maintenance stays visible in the sprint because it
  carries the public Jira/docs mirror and sprint artifacts.
- Ongoing CV UI work stays visible as additional ongoing work, but is not part
  of the sprint goal.
- Ongoing technical chores get their own Sprint 5 container issue so
  Dependabot and similar maintenance work does not land in documentation or UI
  issues.

## Risks

- Production must not remain only technically prepared; the sprint must cut
  toward a practically usable live path.
- Runtime-admin and CV-token work must not sit beside the deployment path
  without clear operating boundaries.
- Docs and mirror work must accompany the sprint without displacing the goal.

## Scope Changes

- 2026-05-23: Sprint started; ongoing docs/CV issues deliberately included.
- 2026-05-28: Added `J01-151` as the ongoing technical chore container issue.
- 2026-06-01: Split the remaining go-live work under `J01-62` into
  `J01-152`, `J01-153`, and `J01-154`.
- 2026-06-04: Sprint closed; go-live confirmed as achieved.

## Review

- The sprint goal “Produktion live!” was achieved.
- The shared deploy workflow for `preview` and `prod`, branch-based
  environment selection, and production pipeline config are implemented.
- The production content source is loaded through SFTP in the CI path; the
  publish path builds, uploads, and publishes CV HTML followed by an HTTP
  smoke check.
- Post-deploy smokes, rollback behavior, and deploy history are present in
  production code and tests.
- The public sprint and issue state was not fully updated at sprint close and
  is corrected by this closing run.

## Retro

- The sprint scope was useful as a guiding focus, while most implementation
  happened through concrete subtasks and technical commits.
- Ongoing container issues remained useful for documentation and small chores;
  titles containing “Sprint 4” or “Sprint 5” are misleading after sprint
  close and need a deliberate follow-up scope.
- Planning pages must not remain in planning state beyond go-live. The closing
  run must update the sprint page, issue states, and Jira together.

## Carry-Over

- `J01-150` is complete as the sprint-admin issue.
- Remaining domain or ongoing issues are not automatically unfinished go-live
  work. They remain backlog or maintenance issues and need deliberate
  placement before a new sprint.

## Source Review

Every section of this sprint page was checked against these sources:

- `tagebuch`: sprint start on 2026-05-23, go-live reconciliation on
  2026-06-01, J01-64 follow-up on 2026-06-03, and the week 22 session index.
- Codex and Claude sessions through the condensed session registers and the
  thread/session IDs listed there.
- Commit history: main-repository commits for `J01-64`, `J01-152`,
  `J01-153`, and go-live follow-up work through 2026-06-04.

Planning and risk statements that were no longer current were converted into
review, retro, or carry-over statements. Historical planning decisions remain
as a decision record.
