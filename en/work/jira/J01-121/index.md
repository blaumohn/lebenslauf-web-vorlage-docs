---
layout: page
title: "J01-121: Plan SCRUM Sprint 2 and sort preview carry-over"
jira_key: J01-121
jira_parent_key: J01-84
permalink: /en/jira/issues/J01-121/
---

**Stand:** 2026-04-15

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-121`.
This issue starts the next active sprint after Sprint 1, sorts the preview
carry-over deliberately, and makes Sprint 2 planning publicly traceable.

## Goal

- Start `SCRUM Sprint 2` as the new active sprint with the goal
  “Finish the preview deployment”.
- Deliberately carry over the unfinished goal issues from Sprint 1 instead of
  inheriting everything automatically.
- Keep the remaining operational part of `J01-9` visible in the sprint.
- Keep actually handled admin follow-up work visible in the new sprint.

## Current status

- `SCRUM Sprint 2` exists in Jira and is active.
- The deliberate `sprint-goal` carry-over is:
  [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }}),
  [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }}),
  [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }})
- The actually handled admin follow-up work in the sprint is:
  [J01-119]({{ "/en/jira/issues/J01-119/" | relative_url }}),
  [J01-120]({{ "/en/jira/issues/J01-120/" | relative_url }}),
  `J01-121`
- `J01-105` is done; the remaining open part is the preview deployment of
  `J01-9`.
- Other open Sprint-1 leftovers such as `J01-104`, `J01-109`, `J01-111`,
  `J01-113`, `J01-115`, `J01-116`, and `J01-117` remain in the backlog for
  now.

## Verification plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| New sprint active | Jira shows `SCRUM Sprint 2` as `active` | Jira board 1 / Sprint 35 | open |
| Goal work carried over deliberately | `J01-9`, `J01-13`, `J01-31` are in the active sprint with `sprint-goal` | Jira Sprint 2, sprint board | open |
| Operational rest visible | `J01-9` remains the open preview-deployment rest; `J01-105` is done | Jira Sprint 2, sprint board | done |
| Admin follow-up visible | `J01-119`, `J01-120`, `J01-121` are in the active sprint with `sprint-admin` | Jira Sprint 2, sprint board | open |
| Public Sprint-2 planning exists | `work/sprints/scrum-sprint-2/` describes goal, carry-over, and what stayed out | public sprint doc | open |

## Completion picture or open points

- Carry-over is no longer only named retrospectively; it is now actively
  sorted into Sprint 2.
- The earlier blocker `J01-105` is done; only the preview deployment of
  `J01-9` remains open.
- What remains open is later in-sprint steering, not the basic decision to
  start the next active sprint.

## Links

- [J01-120: Close SCRUM Sprint 1 and publish review/retro]({{ "/en/jira/issues/J01-120/" | relative_url }})
- [Sprint history]({{ "/en/work/sprints/" | relative_url }})
- [Sprint policy]({{ "/en/policies/sprint-richtlinie/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
