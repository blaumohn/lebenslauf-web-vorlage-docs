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

## Manifest metadata

- `meta.desc` gives a short functional description of one parameter.
- `meta.example` shows an example value.
- `meta.example` is the home for example values. These values are only
  guidance and are not effective config values.
- `meta.notes` carries short local hints about that parameter.
- Validation-relevant parameter dependencies should not remain free text in
  `meta.notes`; they belong in a dedicated rule path such as `J01-37`.

## Config Values

- Active config files contain only effective operating values.
- Effective operating values may be accepted standards, deliberately chosen
  dev/preview values, or instance-specific deployment values.
- Pure example values do not belong in active config files.
- If a pipeline phase needs a value and no valid source provides it,
  validation must fail.

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

- `pipeline-config-spec-php/README.md`
- `pipeline-config-spec-php/README.de.md`
- `lebenslauf-web-vorlage/src/resources/config/config.manifest.yaml`
- [CLI / Build]({{ "/en/areas/cli-build/" | relative_url }})
- [J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }})
