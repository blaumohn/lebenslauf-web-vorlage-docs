---
layout: page
title: "SCRUM Sprint 5: Planning — Production Live"
permalink: /en/work/sprints/scrum-sprint-5/
---

**Time window:** 2026-05-23 to 2026-06-05

**Status:** active

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

## Review

- Planned:
  - Production path is practically usable.
  - Smoke checks and operating docs are publicly traceable.
  - Sprint board in Jira and GitHub Pages remains populated and current.

## Retro

- To be added at sprint close.

## Carry-Over

- To be added at sprint close.
