---
layout: page
title: "J01-126: GitHub Pages: Recent changes – navbar page with commit feed"
jira_key: J01-126
permalink: /en/jira/issues/J01-126/
---

**Stand:** 2026-04-12

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work state for `J01-126`.
This issue introduces an automatically maintained "Recent changes" page:
a pre-commit hook generates `_data/recent_commits.yml` from the latest
commits across three project repos and stages the file before each commit
in the docs repo, so it is published automatically with the next push.

## Goal

- keep `_data/recent_commits.yml` up to date automatically
- exclude artifact commits (only `_data/recent_commits.yml` changed) from the feed
- refresh remote refs before generating via `git fetch`
- tests guard the behaviour against regression

## Current state

- pre-commit hook replaces the previous pre-push hook;
  the file is carried along in the regular commit, no second push needed
- `generate-recent-commits.sh` fetches remote refs and filters artifact commits
  via pathspec (`-- . ':!_data/recent_commits.yml'`)
- shell smoke tests for the script and hook added
- runbook updated

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Hook present | `scripts/hooks/pre-commit` exists and is executable | `scripts/hooks/pre-commit` | done |
| Hook stages file | `_data/recent_commits.yml` is staged after hook run | `tests/pre-commit-hook.sh` | done |
| fetch before log | Remote refs are updated before `git log` | `scripts/generate-recent-commits.sh` | done |
| Artifact commits filtered | Commits that only change `_data/recent_commits.yml` are absent from YAML | `tests/generate-recent-commits.sh` | done |
| Tests present | `tests/` contains two shell smoke tests | `tests/` | done |
| Runbook current | Runbook describes the pre-commit flow | `operations/recent-changes-hook/index.md` | done |

## Links

- [Operations: pre-commit hook for recent changes]({{ "/en/operations/recent-changes-hook/" | relative_url }})
