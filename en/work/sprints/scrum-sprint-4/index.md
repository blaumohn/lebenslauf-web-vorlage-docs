---
layout: page
title: "SCRUM Sprint 4: planning"
permalink: /en/work/sprints/scrum-sprint-4/
---

**Window:** 2026-04-28 to 2026-05-12  
**Status:** active

## Participants

- Dani Y.
- Codex-Agent

## Sprint goal

Start CI/CD tooling for CV-token generation and runtime-admin operations, and
open the production deployment path in practice.

## Sprint backlog

### Sprint goal

- [J01-135]({{ "/en/jira/issues/J01-135/" | relative_url }}) —
  CI/CD tooling for CV-token generation and runtime-admin operations
- [J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }}) —
  activate production branch and environment rules
- [J01-65]({{ "/en/jira/issues/J01-65/" | relative_url }}) —
  define production artifact and smoke checks

### Sprint support

- [J01-68]({{ "/en/jira/issues/J01-68/" | relative_url }}) —
  production operations docs and runbook

### Sprint admin

- [J01-136]({{ "/en/jira/issues/J01-136/" | relative_url }}) —
  plan Sprint 4, close Sprint 3, and update public artifacts

## Planning decision

- `J01-13` and `J01-31` stay outside the active sprint because their meaning
  and contribution in the last sprint are currently not reliably clear.
- That clarification is later drift-report work, not part of the Sprint 4
  goal.
- The new goal work is read as two lines:
  CI/CD/runtime-admin operations and production deployment.
- Production starts with the existing issues under epic
  [J01-7]({{ "/en/jira/issues/J01-7/" | relative_url }}).

## Risks

- CV-token generation and runtime-admin operations must not remain loose manual
  work beside the pipeline.
- Production deployment needs clear branch, environment, and smoke-check
  boundaries early.
- Sprint-admin work remains visible, but must not displace the two goal lines.
