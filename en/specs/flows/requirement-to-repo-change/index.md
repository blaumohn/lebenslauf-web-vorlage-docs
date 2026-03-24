---
layout: page
title: "Spec: Requirement to repo change"
permalink: /en/specs/flows/requirement-to-repo-change/
---

This flow describes the stable path from a new requirement to the implemented
change in the correct repo.

## Purpose

- keep scope, work docs, sources, and repo change aligned

## Trigger

- new product, docs, skill, or operations requirement

## Participating systems

- [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- [GitHub and PR system]({{ "/en/specs/systems/github-collaboration/" | relative_url }})
- [AI/skill framework]({{ "/en/specs/systems/ai-skill-framework/" | relative_url }})

## Inputs and outputs

- Inputs:
  - requirement, problem, or change request
- Outputs:
  - Jira issue, public work doc, repo change, commit

## Flow

1. check or create the matching Jira issue
2. create or update the public work doc under `work/jira/`
3. clarify sources and target location
4. change the correct repo or several clearly separated repos
5. verify, commit, and integrate

## Handovers

- Jira -> public work doc
- work doc -> repo change
- repo change -> public explanation or closure picture

## Boundaries and non-goals

- not a replacement for detailed runbooks
- no mixed commits across repos

## Links to operational docs

- [Runbook: update public Jira pages]({{ "/en/operations/runbook/" | relative_url }})
- [J01-117]({{ "/en/jira/issues/J01-117/" | relative_url }})

## Sources

- `skills/koordination/SKILL.md`
- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
- [J01-102]({{ "/en/jira/issues/J01-102/" | relative_url }})
