---
layout: page
title: "Spec: AI agent workflow"
permalink: /en/specs/flows/ai-agent-workflow/
---

This flow describes the recurring workflow for project-bound AI work.

## Purpose

- execute AI work reproducibly, source-based, and repo-cleanly

## Trigger

- user request or follow-up work inside an existing issue

## Participating systems

- [AI/skill framework]({{ "/en/specs/systems/ai-skill-framework/" | relative_url }})
- [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- [`tagebuch`]({{ "/en/specs/systems/tagebuch/" | relative_url }})
- [GitHub and PR system]({{ "/en/specs/systems/github-collaboration/" | relative_url }})

## Inputs and outputs

- Inputs:
  - task, context, source hints
- Outputs:
  - implemented change, public work doc, optional round note

## Flow

1. load the matching skills and rules
2. clarify scope, Jira reference, and target repos
3. inspect sources in docs, skill repos, and the `tagebuch`
4. implement changes repo by repo
5. follow up docs, commits, and evidence

## Handovers

- user request -> skill workflow
- source check -> repo work
- repo work -> public docs and commit

## Boundaries and non-goals

- no implicit scope expansion
- no mixed multi-repo commits

## Links to operational docs

- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
- [J01-111]({{ "/en/jira/issues/J01-111/" | relative_url }})
- [J01-113]({{ "/en/jira/issues/J01-113/" | relative_url }})

## Sources

- `skills/koordination/SKILL.md`
- `skills/docs-i18n/SKILL.md`
- `skills/jira-state-sync/SKILL.md`
- [J01-113: rule inventory appendix]({{ "/en/jira/issues/J01-113/anlage-regelwerk-bestand/" | relative_url }})
