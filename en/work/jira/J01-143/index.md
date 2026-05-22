---
layout: page
title: "J01-143 — Evaluate GitHub integration for automatic docs updates"
permalink: /en/jira/issues/J01-143/
jira_key: J01-143
jira_parent_key: J01-84
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Goal: Decide and implement how GitHub- and Jira-related documentation
operations can keep the public docs current automatically without introducing
an unclear platform dependency.

To check:

- Whether a Jira API and GitHub integration is possible and whether the needed
  functions are available in the Jira base tier.
- Whether docs updates should instead be tied to Git push operations through a
  hook.
- Whether docs updates should instead run through a GitHub workflow after the
  push.
- Whether another, more robust option fits better.

Success criterion: The options are evaluated, a target variant is selected,
and the chosen update path is implemented or bounded as a concrete follow-up
implementation task.

## Sprint Boundary

This issue is backlog work in docs/Jira tooling and is deliberately not in the
active sprint.

## Decision

The first target variant is a local Git hook and full-sync path:

- `scripts/sync-jira-commits.py full` scans the complete local Git history of
  the project repos and generates `_data/jira_commits.json`.
- `scripts/hooks/post-commit` adds only the current commit if its subject ends
  with a Jira key in parentheses.
- `scripts/hooks/commit-msg` enforces the future format
  `<type>(<scope>): <title> (J01-123)` with an accepted Conventional Commit
  type.
- `_includes/jira-commits.html` renders matching commits automatically on Jira
  issue pages.

This avoids a direct GitHub API dependency; the local Git history remains the
robust source.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Jira/GitHub integration | Availability and tier limits are checked | Decision: local Git history instead of API requirement | done |
| Hook variant | Git push hook alternative is evaluated | `scripts/hooks/post-commit`, `scripts/hooks/commit-msg` | done |
| Workflow variant | GitHub workflow alternative is evaluated | Analysis or decision note | open |
| Decision | Target variant is selected with rationale | “Decision” section | done |
| Implementation | Chosen path is implemented or clearly bounded as follow-up work | `sync-jira-commits.py`, hooks, include, runbook | done |

## Links

- [J01-84]({{ "/en/jira/issues/J01-84/" | relative_url }})
- [Area: Jira and documentation tooling]({{ "/en/areas/proj-doku-tooling/" | relative_url }})
- [Runbook: Git Hooks for Docs Sync and Commit Format]({{ "/en/operations/recent-changes-hook/" | relative_url }})
