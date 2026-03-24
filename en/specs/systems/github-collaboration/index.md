---
layout: page
title: "Spec: GitHub and PR system"
permalink: /en/specs/systems/github-collaboration/
---

The GitHub and PR system carries source code, branches, commits, reviews, and
repo boundaries across the project family.

## What it is

- the system of repositories, branches, commits, and pull requests
- the technical integration and review layer
- the place where changes are versioned and checked

## What it is not

- not the operational status SSOT
- not the canonical rule and project docs
- not the raw notes system

## Why

- the project family needs clear repo boundaries and traceable changes
- product, docs, and skill work must not end in opaque mixed changes

## Structure

- app repo
- docs repo
- config-spec repo
- skill repos
- supporting repos

## Roles

- developers commit and review
- repos express technical ownership
- Git history also serves as an evidence family for later docs

## Interfaces

- Jira provides work context
- docs explain stable outcomes publicly
- cross-repo changes touch several repos with separate commits

## Current state and target picture

- Current state:
  - repo roles and Git flows are documented only in parts
- Target picture:
  - clear mapping between work carrier, repo, and public explanation

## Parent systems

- [Project overall system]({{ "/en/specs/project/" | relative_url }})

## Child systems

- individual repos of the project family
- branch and integration paths

## Related systems

- [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- [AI/skill framework]({{ "/en/specs/systems/ai-skill-framework/" | relative_url }})

## Sources

- `skills/koordination/references/repos.md`
- `skills/koordination/SKILL.md`
- [J01-106]({{ "/en/jira/issues/J01-106/" | relative_url }})
- [J01-98: migration map]({{ "/en/jira/issues/J01-98/migration-map/" | relative_url }})
