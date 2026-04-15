---
layout: page
title: "SCRUM Sprint 3: planning"
permalink: /en/work/sprints/scrum-sprint-3/
---

**Window:** 2026-04-15 to 2026-04-29  
**Status:** active

## Participants

- Dani Y.
- Codex-Agent

## Sprint goal

Finish the preview deployment.

## Deliberate carry-over from Sprint 2

- The open goal issues from Sprint 2 are carried over deliberately:
  [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }}),
  [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }}),
  [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }})
- They stay `sprint-goal` because the preview goal remains the lead focus.
- [J01-131]({{ "/en/jira/issues/J01-131/" | relative_url }}) is included as
  `sprint-admin` because the sprint transition itself must be documented and
  checked.

## Sprint backlog

### Sprint goal

- [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }}) —
  run and evidence the preview deployment after the `dev` merge
- [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }}) —
  finalize the preview test matrix and decisions
- [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }}) —
  clarify preview readiness for system-source processing

### Admin / framework

- [J01-131]({{ "/en/jira/issues/J01-131/" | relative_url }}) —
  plan Sprint 3, close Sprint 2, and update public artifacts

## Not taken in for now

- Completed Sprint-2 work stays in history:
  `J01-105`, `J01-119`, `J01-120`, `J01-121`, `J01-126`
- Backlog work without direct preview-goal relation stays outside the active
  sprint.

## Planning decision

- Sprint 3 continues the preview goal but narrows the active scope to the
  three open goal issues and the administrative sprint transition.
- The earlier support blocker `J01-105` is not carried over because it is done
  and no longer blocks `J01-9`.
- New side work is only taken in when explicitly labeled as `sprint-support`,
  `sprint-admin`, or `sprint-unplanned`.

## Risks

- `J01-9` remains the operational bottleneck: the preview run now needs to be
  executed and evidenced.
- `J01-13` and `J01-31` can continue delaying the preview deployment if they
  are not actively decided.
- Docs/Jira operations must stay current, but must not displace the preview
  goal again.
