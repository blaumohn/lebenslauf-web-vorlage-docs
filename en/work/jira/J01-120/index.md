---
layout: page
title: "J01-120: Close SCRUM Sprint 1 and publish review/retro"
jira_key: J01-120
jira_parent_key: J01-84
permalink: /en/jira/issues/J01-120/
---

**Stand:** 2026-04-01

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-120`.
This issue executes the operational sprint close after the frame established in
`J01-94`: close Sprint 1 cleanly in Jira, mirror it publicly as review, retro,
and carry-over, and make the deviation drivers explicit.

## Goal

- Clean up `SCRUM Sprint 1`, which was time-expired but still active in Jira.
- Turn the public sprint doc from planning-only into review, retro, and
  carry-over.
- Make visible what was completed and what stayed open.
- Document the deviation drivers so later sprints can be run more realistically
  in the pre-preview phase.

## Current status

- `SCRUM Sprint 1` was set to `closed` in Jira on 2026-04-01.
- Jira now reports a `completeDate` for Sprint 1 and no active sprints.
- `J01-120` exists as follow-up work linked to `J01-94`.
- A new command-cache recipe for “read sprint contents and close sprint” was
  added in the skill repo.
- The public sprint page `work/sprints/scrum-sprint-1/` is being updated in
  this run to show review, retro, and carry-over.

## Verification plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Sprint closed in Jira | `SCRUM Sprint 1` is `closed` and no longer `active` | Jira Sprint 1 | open |
| Public sprint doc updated | `work/sprints/scrum-sprint-1/` no longer shows planning only | public sprint page | open |
| Deviations split visibly | Completed, open, unplanned, and conditions are documented separately | sprint page, `tagebuch` | open |
| Recipe added | `close-sprint.md` documents the verified Jira path | skill repo `cache-recipes/close-sprint.md` | open |

## Completion picture or open points

- The sprint frame established in `J01-94` is now not only defined, but also
  applied to a real overdue sprint close.
- The follow-up decision for Sprint 2 and the deliberate carry-over grouping
  now continues in [J01-121]({{ "/en/jira/issues/J01-121/" | relative_url }}).

## Links

- [J01-94: Scrum sprint frame and public sprint history]({{ "/en/jira/issues/J01-94/" | relative_url }})
- [J01-121: Plan SCRUM Sprint 2 and sort preview carry-over]({{ "/en/jira/issues/J01-121/" | relative_url }})
- [Sprint history]({{ "/en/work/sprints/" | relative_url }})
- [Sprint policy]({{ "/en/policies/sprint-richtlinie/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
