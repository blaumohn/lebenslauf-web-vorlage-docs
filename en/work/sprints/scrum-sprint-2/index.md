---
layout: page
title: "SCRUM Sprint 2: planning"
permalink: /en/work/sprints/scrum-sprint-2/
---

**Window:** 2026-04-01 to 2026-04-15  
**Status:** active

## Participants

- Dani Y.
- Codex-Agent

## Sprint goal

Finish the preview deployment.

## Deliberate carry-over from Sprint 1

- The open goal issues from Sprint 1 are carried over deliberately:
  [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }}),
  [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }}),
  [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }})
- They stay `sprint-goal` because Sprint 2 continues the same goal on purpose.
- [J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }}) is included as
  `sprint-support` because it explicitly blocks `J01-9`.

## Sprint backlog

### Sprint goal

- [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }})
- [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }})
- [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }})

### Support

- [J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }}) —
  simplify the pipeline-spec manifest for a clear parameter flow

### Admin / frame

- [J01-119]({{ "/en/jira/issues/J01-119/" | relative_url }}) —
  harden the targeted Jira/pages sync against silent regressions
- [J01-120]({{ "/en/jira/issues/J01-120/" | relative_url }}) —
  close Sprint 1 cleanly and publish review/retro
- [J01-121]({{ "/en/jira/issues/J01-121/" | relative_url }}) —
  plan Sprint 2 and sort carry-over deliberately

## Not taken in for now

- Open leftovers from Sprint 1 remain in the backlog for now instead of being
  pulled into Sprint 2 silently:
  `J01-104`, `J01-109`, `J01-111`, `J01-113`, `J01-115`, `J01-116`, `J01-117`

## Planning decision

- Sprint 2 does not inherit every open Sprint-1 issue.
- Admission is based on:
  - direct relation to the preview goal
  - explicit blockers of the goal work
  - follow-up work that is already actually in progress
- This keeps the board manageable again even while the pre-preview phase still
  implies more variation than a mature product phase.

## Risks

- The three open goal issues from Sprint 1 remain substantial and still carry
  most of the preview risk.
- `J01-105` must actually help unblock `J01-9`; otherwise support work stays in
  the sprint without helping the goal.
- Admin work must not displace the sprint goal again.
- New unplanned work remains possible and must then be categorized visibly.
