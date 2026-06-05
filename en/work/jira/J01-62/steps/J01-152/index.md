---
layout: page
title: "62-7 — Provide CI content source for production build"
permalink: /en/jira/issues/J01-62/steps/J01-152/
jira_key: J01-152
jira_parent_key: J01-62
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Goal

Make the production content source available to the CI build without
versioning private content.

## Completion State

Functionally implemented and set to `Erledigt` in Jira.

The CI path loads the CV content source through SFTP and tests this path in the
pipeline. The primary evidence is main-repository commit `318d77e`.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Content source | CI loads the production content source through SFTP | Main-repository commit `318d77e` | done |
| Pipeline test | The fetch path is testable in CI | Main-repository tests for commit `318d77e` | done |
| Jira status | Jira shows the functional completion | `J01-152` | done |

## Links

- [Parent J01-62]({{ "/en/jira/issues/J01-62/" | relative_url }})
