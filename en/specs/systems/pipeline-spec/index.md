---
layout: page
title: "Spec: Pipeline spec system"
permalink: /en/specs/systems/pipeline-spec/
---

The pipeline spec system describes, validates, and compiles configuration states
along pipelines and phases.

## What it is

- the `pipeline-config-spec-php` library
- a rule and execution system for YAML loading, manifest validation, and config
  compilation
- the layer that makes phase and source logic explicit

## What it is not

- not the end product itself
- not the public work docs
- not only a file location for defaults

## Why

- app and deployment paths need verifiable config boundaries
- the project should not hide pipeline and phase logic implicitly in code

## Structure

- YAML loader
- manifest logic
- source and policy checks
- compiler for config snapshots

## Roles

- library and app developers
- operators of build, runtime, and deploy paths

## Interfaces

- provides rules to the [App system]({{ "/en/specs/systems/app/" | relative_url }})
- is explained publicly by [CLI / Build]({{ "/en/areas/cli-build/" | relative_url }})
- is sharpened through [J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }})

## Current state and target picture

- Current state:
  - config order and manifest basics are documented
- Target picture:
  - project-wide clear and testable phase boundaries

## Parent systems

- [Project overall system]({{ "/en/specs/project/" | relative_url }})

## Child systems

- manifest model
- source and compiler logic

## Related systems

- [App system]({{ "/en/specs/systems/app/" | relative_url }})
- [GitHub and PR system]({{ "/en/specs/systems/github-collaboration/" | relative_url }})

## Sources

- `pipeline-config-spec-php/README.de.md`
- `lebenslauf-web-vorlage/docs/ENVIRONMENTS.md`
- [CLI / Build]({{ "/en/areas/cli-build/" | relative_url }})
- [J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }})
