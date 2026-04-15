---
layout: page
title: "SCRUM Sprint 2: review, retro, and carry-over"
permalink: /en/work/sprints/scrum-sprint-2/
---

**Window:** 2026-04-01 to 2026-04-15  
**Closed:** 2026-04-15

## Participants

- Dani Y.
- Codex-Agent

## Sprint goal

Finish the preview deployment.

## Planned

- Sprint goal:
  [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }}),
  [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }}),
  [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }})
- Support:
  [J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }})
- Admin / framework:
  [J01-119]({{ "/en/jira/issues/J01-119/" | relative_url }}),
  [J01-120]({{ "/en/jira/issues/J01-120/" | relative_url }}), and
  [J01-121]({{ "/en/jira/issues/J01-121/" | relative_url }})
- Unplanned:
  [J01-126]({{ "/en/jira/issues/J01-126/" | relative_url }})

## Actually done

- Support delivered:
  [J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }}) was completed;
  the config spec and variable paths were checked, and the blocker to
  `J01-9` was removed.
- Admin/framework work delivered:
  [J01-119]({{ "/en/jira/issues/J01-119/" | relative_url }}),
  [J01-120]({{ "/en/jira/issues/J01-120/" | relative_url }}), and
  [J01-121]({{ "/en/jira/issues/J01-121/" | relative_url }}) were completed.
- Unplanned additional work delivered:
  [J01-126]({{ "/en/jira/issues/J01-126/" | relative_url }}) was completed.
- The sprint contained 8 top-level issues; 5 were completed and 3 goal issues
  remain open.

## Not finished / carry-over

- [J01-9]({{ "/en/jira/issues/J01-9/" | relative_url }})
- [J01-13]({{ "/en/jira/issues/J01-13/" | relative_url }})
- [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }})

## Review

- The sprint goal “Finish the preview deployment” remained correct, but it
  was not fully achieved again.
- The main progress was unblocking `J01-9` by completing `J01-105`.
- The actual preview operations work is now narrower: the PR is merged into
  `dev`, and the remaining work is mainly the preview run with evidence.
- The public Jira/docs operation became more stable through sync guardrails,
  sprint history, and the recent-feed work.

## Retro

- Worked well:
  - The technical blocker `J01-105` is done instead of continuing as an
    unclear support carry-over.
  - Sprint and mirror work are more traceable than at the start of the sprint.
- Missing:
  - The actual preview deployment was not run yet.
  - `J01-13` and `J01-31` remain open prerequisites.
- Consequence:
  - Sprint 3 carries only the remaining preview-goal issues and a small admin
    issue for the sprint transition.
  - New side work must again be labeled clearly as `sprint-support`,
    `sprint-admin`, or `sprint-unplanned`.

## Scope changes

- [J01-126]({{ "/en/jira/issues/J01-126/" | relative_url }}) entered the
  sprint as unplanned feed/navbar work.
- The backlog leftovers from Sprint 1 that were not carried into Sprint 2 stay
  outside the active sprint goal.

## Risks

- Preview work can still be displaced by necessary Jira/docs operations.
- `J01-9` is unblocked, but not operationally completed.
- `J01-13` and `J01-31` must not only passively carry over into the new sprint.
