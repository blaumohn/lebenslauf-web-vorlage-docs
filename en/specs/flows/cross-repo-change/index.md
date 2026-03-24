---
layout: page
title: "Spec: Cross-repo change"
permalink: /en/specs/flows/cross-repo-change/
---

This flow describes changes that touch more than one repo in the project
family.

## Purpose

- coordinate multi-repo work cleanly without mixing targets or commits

## Trigger

- one change touches product, docs, skills, or config library together

## Participating systems

- [GitHub and PR system]({{ "/en/specs/systems/github-collaboration/" | relative_url }})
- [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- [AI/skill framework]({{ "/en/specs/systems/ai-skill-framework/" | relative_url }})

## Inputs and outputs

- Inputs:
  - one domain change with several repo targets
- Outputs:
  - separate repo changes with a shared Jira reference

## Flow

1. determine the affected repos and target artefacts
2. define the primary work carrier and follow-up repos
3. choose the right branch and worktree context per repo
4. implement and commit changes separately
5. bring docs and Jira to one consistent state

## Handovers

- cross-repo need -> repo assignment
- repo assignment -> separate worktrees
- separate changes -> shared public context

## Boundaries and non-goals

- no mixed cross-repo commits
- do not squeeze project rules into one product repo

## Links to operational docs

- `skills/koordination/SKILL.md`
- [J01-91: area inventory]({{ "/en/jira/issues/J01-91/area-inventory/" | relative_url }})

## Sources

- `skills/koordination/SKILL.md`
- `skills/koordination/references/repos.md`
- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
