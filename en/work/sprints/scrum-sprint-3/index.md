---
layout: page
title: "SCRUM Sprint 3: review, retro, and carry-over"
permalink: /en/work/sprints/scrum-sprint-3/
---

**Window:** 2026-04-15 to 2026-04-29  
**Status:** closed on 2026-04-28

## Participants

- Dani Y.
- Codex-Agent

## Sprint goal

Finish the preview deployment.

## Sprint context from Sprint 2

- [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }}) was continued as
  clear operational preview work.
- [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }}) and
  [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }}) were present in
  the sprint context, but their concrete contribution to the last sprint is
  not reliably clear in retrospect.
- They are therefore not described as completed or meaningfully continued goal
  work; their relationship should be checked later in a drift report.
- [J01-131]({{ "/en/jira/issues/J01-131/" | relative_url }}) is included as
  `sprint-admin` because the sprint transition itself must be documented and
  checked.

## Sprint backlog

### Sprint goal

- [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }}) —
  run and evidence the preview deployment after the `dev` merge

### Unclear sprint context

- [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }}) —
  meaning and sprint contribution are not reliably clear.
- [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }}) —
  meaning and sprint contribution are not reliably clear.

### Admin / framework

- [J01-131]({{ "/en/jira/issues/J01-131/" | relative_url }}) —
  plan Sprint 3, close Sprint 2, and update public artifacts

## Not taken in for now

- Completed Sprint-2 work stays in history:
  `J01-105`, `J01-119`, `J01-120`, `J01-121`, `J01-126`
- Backlog work without direct preview-goal relation stays outside the active
  sprint.

## Planning decision

- Sprint 3 continues the preview goal; in retrospect, only
  [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }}) is reliable as
  clear operational goal work.
- [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }}) and
  [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }}) remain visible as
  unclear sprint context and belong in a later drift check.
- The earlier support blocker `J01-105` is not carried over because it is done
  and no longer blocks `J01-9`.
- New side work is only taken in when explicitly labeled as `sprint-support`,
  `sprint-admin`, or `sprint-unplanned`.

## Risks

- `J01-9` remains the operational bottleneck: the preview run now needs to be
  executed and evidenced.
- `J01-13` and `J01-31` show planning ambiguity: their meaning in the last
  sprint is not evidenced clearly enough.
- Docs/Jira operations must stay current, but must not displace the preview
  goal again.

## Review

### Done

- [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }}) was set to
  `Done` together with steps `J01-10`, `J01-11`, `J01-12`, `J01-132`,
  `J01-133`, and `J01-134`.
- The early step pages for `9-1` to `9-3` were made publicly visible so the
  closure state remains traceable.
- [J01-131]({{ "/en/jira/issues/J01-131/" | relative_url }}) was completed as
  sprint-admin work.

### Left unclear

- [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }}) and
  [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }}) are real tasks,
  but their contribution in the last sprint is currently unclear.
- Both issues should later be classified in a drift report instead of being
  shown here as clear goal work or a clearly missed goal.

## Retro

- Worked well: the preview workflow is closed as one coherent issue.
- Missing: the role of `J01-13` and `J01-31` in the sprint was not clear
  enough.
- Next change: the sprint focus is stated more tightly as production and
  operations start.

## Carry-over

- No automatic carry-over for `J01-13` and `J01-31`.
- Both issues remain outside the Sprint 4 goal as later drift-check work.
- Sprint 4 starts instead with the new main lines CI/CD/runtime-admin
  operations and production deployment.
