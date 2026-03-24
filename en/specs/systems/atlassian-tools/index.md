---
layout: page
title: "Spec: atlassian-tools"
permalink: /en/specs/systems/atlassian-tools/
---

`atlassian-tools` is the technical bridge between the project and the Atlassian
systems.

## What it is

- a tooling system for Jira- and Confluence-related API calls
- the combination of the `atlassian` CLI and the `atlassian-http-client`
- a security and operations frame for controlled requests

## What it is not

- not Jira itself
- not the public docs
- not the general skill or notes system

## Why

- Jira reads and writes should run repeatably and safely
- tokens and technical request logic should not live in the caller

## Structure

- `atlassian-http-client`
- `atlassian` CLI
- `jira ext ...` operations

## Roles

- the tool owner holds secrets and config
- callers use only the CLI
- project workflows use safe short commands or HTTP paths

## Interfaces

- serves the [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- is used in skills and runbooks
- provides the technical basis for Jira state sync

## Current state and target picture

- Current state:
  - system overview and API operations are already described publicly
- Target picture:
  - `atlassian-tools` is clearly anchored as its own subsystem

## Parent systems

- [Project overall system]({{ "/en/specs/project/" | relative_url }})

## Child systems

- HTTP client
- CLI
- ext operations

## Related systems

- [Jira system]({{ "/en/specs/systems/jira-system/" | relative_url }})
- [AI/skill framework]({{ "/en/specs/systems/ai-skill-framework/" | relative_url }})

## Sources

- [Jira and docs tooling: system overview]({{ "/en/areas/proj-doku-tooling/aufbau/" | relative_url }})
- [API operations]({{ "/en/areas/proj-doku-tooling/api-betriebe/" | relative_url }})
- [J01-91: area inventory]({{ "/en/jira/issues/J01-91/area-inventory/" | relative_url }})
