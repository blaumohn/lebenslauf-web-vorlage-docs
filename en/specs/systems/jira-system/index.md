---
layout: page
title: "Spec: Jira system"
permalink: /en/specs/systems/jira-system/
---

The Jira system is the operational work, status, and sprint system of the
project.

## What it is

- the non-public SSOT for issues, status, sprint assignment, and labels
- the place for operational work steering
- the source from which the public Jira area is derived

## What it is not

- not the canonical public docs
- not the code or PR system
- not the raw notes or provenance layer

## Why

- work, priority, and status need an operational system
- public GitHub Pages pages should not force Jira Cloud links or an internal
  raw view

## Structure

- issues and steps
- sprint state and sprint labels
- links between issues
- remote links to public docs

## Roles

- product and project steering
- operational work coordination
- source for public Jira work docs

## Interfaces

- operated technically via [`atlassian-tools`]({{ "/en/specs/systems/atlassian-tools/" | relative_url }})
- mirrored publicly in the [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- connected to delivery through the [GitHub and PR system]({{ "/en/specs/systems/github-collaboration/" | relative_url }})

## Current state and target picture

- Current state:
  - Jira is the operational SSOT for status and sprint
- Target picture:
  - public docs and Jira stay cleanly separated but clearly linked

## Parent systems

- [Project overall system]({{ "/en/specs/project/" | relative_url }})

## Child systems

- sprint and label logic
- issues and steps
- remote link maintenance

## Related systems

- [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- [`atlassian-tools`]({{ "/en/specs/systems/atlassian-tools/" | relative_url }})

## Sources

- [AI project map]({{ "/en/policies/ki-projektkarte/" | relative_url }})
- [Runbook: update public Jira pages]({{ "/en/operations/runbook/" | relative_url }})
- [J01-106]({{ "/en/jira/issues/J01-106/" | relative_url }})
- `skills/jira-state-sync/SKILL.md`
