---
layout: page
title: "J01-118: Sharpen `tagebuch` context for non-project notes in the AI-agent flow"
jira_key: J01-118
jira_parent_key: J01-111
permalink: /en/jira/issues/J01-118/
---

**Stand:** 2026-03-30

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-118`.
This issue sharpens how the AI/skill/AGENTS context reads the `tagebuch`
repository: not every round-log note created there is automatically project
work for the Lebenslauf project, and not every note needs a Jira reference.
The issue depends on `J01-113`, but is not part of its goal text.

## Goal

- Sharpen the project binding of the `tagebuch` repository in the AI flow so
  non-project personal notes remain valid.
- Prevent an AI agent from assigning every new `tagebuch` note to the
  Lebenslauf project and its Jira obligations by default.
- Keep the derivation path explicit:
  - `J01-113` sharpens levels, bootstrap, skill-repo `AGENTS.md`, and the
    project map.
  - `J01-118` derives a narrower rule for non-project `tagebuch` notes from
    that groundwork.
- Anchor the change only where the project context for `tagebuch` is actually
  derived:
  - project map
  - skill-repo rules
  - workflows that interpret `tagebuch`

## Current status

- `J01-118` created as a new issue under `J01-111`.
- Dependency made visible:
  - `J01-118` is blocked by `J01-113`.
- Trigger case exists:
  - a personal round-log note in `tagebuch` was deliberately added without a
    Jira reference.
- Derivable from `J01-113/#goal`:
  - that issue covers level separation, skill home, and the agent/pages
    boundary
  - the concrete exception sharpening for non-project `tagebuch` notes is
    follow-up work, not part of that goal text
- Implementation in skills/project map still open.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Non-project `tagebuch` notes remain possible | New personal notes can be added without Jira mention | `tagebuch`, skill/AGENTS rules | open |
| Project binding is no longer inferred by default | AI flow distinguishes project work from personal `tagebuch` notes | skill-repo `AGENTS.md`, project map, affected skills | open |
| Derivation from `J01-113` stays visible | `J01-118` references `J01-113` as prerequisite, not as goal scope | Jira link + work doc | done |
| Rules stay in the right homes | No unnecessary duplication in product or docs repos | `.agents/skills/`, `policies/ki-projektkarte/` | open |

## Open points

- The exact wording in the project map and skill-repo rules is still open.
- It is still open whether a source-register or system note in `tagebuch`
  should also be added.
- The open branch situation across several repos remains a separate cleanup
  topic.

## Links

- [J01-111: Epic AI rule coherence and verification architecture]({{ "/en/jira/issues/J01-111/" | relative_url }})
- [J01-113: Rule cleanup]({{ "/en/jira/issues/J01-113/" | relative_url }})
- [J01-115: AI verification architecture]({{ "/en/jira/issues/J01-115/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
