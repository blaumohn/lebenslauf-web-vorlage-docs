---
layout: page
title: "J01-130: GitHub Pages: evaluate backlog, recent feed, and Jira UI"
jira_key: J01-130
jira_parent_key: J01-84
permalink: /en/jira/issues/J01-130/
---

**Status:** 2026-04-15

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Goal

Evaluate whether the public GitHub Pages Jira area makes backlog, recent-feed,
and status UI state effective enough for project-management work.
This issue is an evaluation task; concrete UI or hook fixes should follow only
from the findings.

## Starting Point

Two operational questions became visible during `J01-128`:

- `_data/recent_commits.yml` can look stale immediately after a commit when
  the feed is generated before the final commit hash exists.
- The English backlog page mirrors Jira summaries unchanged even though it
  appears as an English interface.

It is also still open whether status hints such as `Zu erledigen` and `To Do`
are visually effective and distinguishable enough in the backlog UI.

## Evaluation Questions

| Question | Expected result | Status |
| --- | --- | --- |
| Recent feed current? | Clear rule for when and how `_data/recent_commits.yml` is maintained | open |
| Feed operation traceable? | Decision between pre-commit, pre-push, separate sync, or intentional delay | open |
| English title strategy? | Decision whether EN pages mirror Jira summaries or use editorial translations | open |
| Backlog UI effective? | Assessment of whether status, grouping, and visual differences are quickly readable | open |
| Jira role respected? | Alignment with Jira as SSOT and public docs as work documentation | open |

## Non-Goals

- No direct UI implementation in this issue.
- No immediate change to the recent-feed hook.
- No upfront decision that English backlog titles must always be translated.

## Links

- [J01-84 in the Jira mirror]({{ "/en/jira/issues/J01-84/" | relative_url }})
- [J01-126 in the Jira mirror]({{ "/en/jira/issues/J01-126/" | relative_url }})
- [Backlog]({{ "/en/jira/backlog/" | relative_url }})
- [Recent Changes]({{ "/en/recent/" | relative_url }})
