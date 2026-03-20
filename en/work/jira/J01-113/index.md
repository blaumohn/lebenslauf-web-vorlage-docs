---
layout: page
title: "J01-113: Rule cleanup: separate levels 1–2–3 and assign verification categories A/B/C/D"
jira_key: J01-113
jira_parent_key: J01-111
permalink: /en/jira/issues/J01-113/
---

**Stand:** 2026-03-20

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-113`.
This issue cleans up the AI agent rule structure in the project: remove
duplications, separate three levels cleanly, assign a formal verification
category to each rule.

## Goal

- Consolidate identical rules (communication, UTF-8, grammar feedback) that
  are redundantly present in the workspace `AGENTS.md`,
  `lebenslauf-web-vorlage-docs/AGENTS.md`, `atlassian-tools/AGENTS.md`, and
  `tagebuch/AGENTS.md`.
- Separate three levels clearly:
  - Level 1 — Workspace `AGENTS.md`: principles, workspace-wide
  - Level 2 — Skills: workflows, project-specific
  - Level 3 — Repo `AGENTS.md`: only genuine repo-specific rules
- Formally anchor six rules that currently exist only implicitly in session
  context (lib/app branch base, DE/EN sync, `blocks` vs. `relates` typing,
  local mirror, `--help` before unknown commands).
- Assign a verification category to each rule:
  - A — before execution (PreToolUse hook)
  - B — after execution, deterministic (grep/git scripts)
  - C — after execution, semantic (local model)
  - D — cross-file, semantic (API model)

## Current status

- Issue created, sprint assigned, label `sprint-unplanned`.
- Analysis from round notes 2026-03-20 available.
- Implementation not yet started.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| No duplicate rules | Communication, UTF-8, grammar rules appear only once in the right level | WS `AGENTS.md`, repo-local `AGENTS.md` | open |
| Levels 1/2/3 clearly separated | WS holds only principles; skills hold workflows; repo AGENTS only repo-specifics | all AGENTS.md files in workspace | open |
| Six implicit rules formally anchored | Each rule has a documented source in WS, skill, or repo AGENTS | rule inventory | open |
| Verification category assigned per rule | Complete table rule → category exists | work doc or skill | open |
| Public work docs present | `/de/jira/issues/J01-113/` and `/en/jira/issues/J01-113/` exist | GitHub Pages | done |

## Open points

- Specific category assignment per rule not yet worked out.
- Granularity mixing in WS § documentation obligation (general duties vs.
  sprint details) needs to be resolved.

## Links

- [J01-111: Epic AI rule coherence and verification architecture]({{ "/en/jira/issues/J01-111/" | relative_url }})
- [J01-115: AI verification architecture]({{ "/en/jira/issues/J01-115/" | relative_url }})
- [J01-92: Shared agent rules and skill versioning]({{ "/en/jira/issues/J01-92/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
