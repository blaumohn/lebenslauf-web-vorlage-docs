---
layout: page
title: "J01-92: shared agent rules and skill versioning"
permalink: /en/work/jira/J01-92/
---

**Status date:** 2026-03-14

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

## Next steps

1. Align repo-local `AGENTS` files with the new shared rules.
2. Move only genuinely decoupled workflow parts into `shared/`.
3. Pull the updated Jira state into the public mirror.

## Links

- [Mirror: J01-72 / step J01-92]({{ "/en/mirror/issues/J01-72/steps/J01-92/" | relative_url }})

## Notes

- The workspace `AGENTS` file only contains compact always-on rules.
- Detailed recurring workflows stay in skills.
- Repo-specific path and worktree rules stay in the respective repo `AGENTS.md`.
- Shared means: no hard project binding; project specifics stay in the project
  skill repo.
