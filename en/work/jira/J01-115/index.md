---
layout: page
title: "J01-115: AI verification architecture: build category-A-to-D system (hook/script/model)"
jira_key: J01-115
jira_parent_key: J01-111
permalink: /en/jira/issues/J01-115/
---

**Stand:** 2026-03-20

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-115`.
This issue builds the automated checking system that verifies compliance with
the AI agent rules using a four-category model.
Prerequisite: completed issue
[J01-113]({{ "/en/jira/issues/J01-113/" | relative_url }}).

## Goal

Put four verification categories into operation:

| Category | Mechanism | Examples |
| --- | --- | --- |
| A — before execution | Claude Code PreToolUse hook | `tools-python`, `atlassian` path |
| B — after execution, deterministic | grep / git scripts | ISS-xxx in docs, commit key format |
| C — after execution, semantic | Local model, filtered per rule | EN/DE sync content, verification plan |
| D — cross-file, semantic | API model | dependency typing, coherence |

**Effort distribution (estimate):**
- Script (grep/git) → approx. 60 % of rules
- Local model (diff filtering) → approx. 35 %
- API model → approx. 5 %

**Order:** category-A hooks first, then B scripts, then C/D.

**Local model on MacBook Pro 16 GB Apple Silicon:**
- `mlx` (Apple Silicon) or `ollama`
- Candidates: Qwen2.5 7B, Phi-3.5 mini, Llama 3.2 3B

## Current status

- Issue created, sprint assigned, label `sprint-unplanned`.
- Concept from round notes 2026-03-20 available.
- Build not yet started; waiting for J01-113.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Category-A hook active | PreToolUse hook blocks non-conforming `tools-python` and `atlassian` calls | Claude Code `settings.json`, hook script | open |
| Category-B script active | grep script flags ISS-xxx hits outside permitted migration docs | script in skill repo | open |
| Rule → category table complete | All rules from J01-113 have a category assignment | table in J01-113 or skill | open |
| ISS-xxx decision: grep + whitelist or model | Explicit decision documented | work doc or ADR | open |
| Public work docs present | `/de/jira/issues/J01-115/` and `/en/jira/issues/J01-115/` exist | GitHub Pages | done |

## Links

- [J01-111: Epic AI rule coherence and verification architecture]({{ "/en/jira/issues/J01-111/" | relative_url }})
- [J01-113: Rule cleanup]({{ "/en/jira/issues/J01-113/" | relative_url }})
- [J01-92: Shared agent rules and skill versioning]({{ "/en/jira/issues/J01-92/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
