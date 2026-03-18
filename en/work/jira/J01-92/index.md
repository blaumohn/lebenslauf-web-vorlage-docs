---
layout: page
title: "J01-92: shared agent rules and skill versioning"
jira_key: J01-92
jira_parent_key: J01-72
permalink: /en/jira/issues/J01-72/steps/J01-92/
---

**Status date:** 2026-03-16

{% include jira-work-context.html %}

This page captures the public work status for `J01-92`.
The task bundles versioned AI skills and recurring agent work rules.

## Goal

Establish shared Codex rules across the workspace without mixing repo-specific
rules, skills, and public docs.

## Implemented now

- Added a workspace `AGENTS.md` for `/Users/usr2/edv/werk`
- Added the shared `arbeitsregeln` skill as the canonical long-form source
- Added the documentation duty as an always-on rule for every change
- Added the small-commit rule:
  Conventional Commits, small cohesive packages, no unnecessary lingering diffs
- Moved Jira step `J01-92` into active work and added a status comment
- Tightened shared skills to true project independence:
  no fixed repo names, Jira project keys, or project paths in the shared target
- Removed flat legacy entry points under `.agents/skills/` as canonical skill
  locations
- Kept project-bound mirror and coordination workflows in the project skill repo
- introduced the new `feature-matrix` doc type with template, policy entry, and
  canonical URI pattern
- added the canonical Jira/docs tooling feature matrix under
  `areas/proj-doku-tooling/feature-matrix/`
- moved skill-facing Jira/pages helpers out of
  `lebenslauf-web-vorlage-docs/scripts/` and back into the project skill repo
- kept only the currently required container/build prereqs in the docs repo for
  this topic
- moved Jira issue `J01-92` to `Done` after the implementation landed

## Next steps

1. Decide any later target- or tooling-repo maturation for the marked
   candidates only in a separate follow-up task.
2. Align repo-local `AGENTS` files with the new shared rules.

## Links

- [Mirror: J01-72 / step J01-92]({{ "/en/jira/issues/J01-72/steps/J01-92/" | relative_url }})
- [Feature matrix: Jira and docs tooling]({{ "/en/areas/proj-doku-tooling/feature-matrix/" | relative_url }})

## Notes

- The workspace `AGENTS` file only contains compact always-on rules.
- Detailed recurring workflows stay in skills.
- Skill-facing helpers start in the project skill repo; any move into target or
  tooling repos needs its own decision.
- Repo-specific path and worktree rules stay in the respective repo `AGENTS.md`.
- Shared means: no hard project binding; project specifics stay in the project
  skill repo.
