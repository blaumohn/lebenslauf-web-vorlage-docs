---
layout: page
title: "Spec: App system"
permalink: /en/specs/systems/app/
---

The app system is the executable product core of the project.
It renders the CV website, carries the build and runtime paths, and implements
the visible user behaviour.

## What it is

- the source-code system in the `lebenslauf-web-vorlage` repo
- the combination of CLI, build resources, HTTP runtime, and templates
- the place where product behaviour actually lives

## What it is not

- not the canonical public project docs
- not the general config spec library
- not the work and status system

## Why

- this is where the actual website template is built
- this system proves product, architecture, and delivery quality

## Structure

- CLI / build
- HTTP runtime
- build resources
- templates
- local data and overrides under `.local/`

## Roles

- developers maintain code, build, and runtime
- operators use setup, build, and runtime paths
- readers see product quality in the result

## Interfaces

- uses the [Pipeline spec system]({{ "/en/specs/systems/pipeline-spec/" | relative_url }})
- is explained publicly by the [Docs system]({{ "/en/specs/systems/docs-system/" | relative_url }})
- lives in the [GitHub and PR system]({{ "/en/specs/systems/github-collaboration/" | relative_url }})

## Current state and target picture

- Current state:
  - app, CLI, and runtime are already partly explained in public
- Target picture:
  - the product system and its boundaries are clearly mapped as a spec

## Parent systems

- [Project overall system]({{ "/en/specs/project/" | relative_url }})

## Child systems

- [CLI / Build]({{ "/en/areas/cli-build/" | relative_url }})
- [HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }})

## Related systems

- [Pipeline spec system]({{ "/en/specs/systems/pipeline-spec/" | relative_url }})
- [GitHub and PR system]({{ "/en/specs/systems/github-collaboration/" | relative_url }})

## Sources

- `lebenslauf-web-vorlage/README.md`
- `lebenslauf-web-vorlage/README.en.md`
- `lebenslauf-web-vorlage/src/resources/config/config.manifest.yaml`
- [CLI / Build]({{ "/en/areas/cli-build/" | relative_url }})
- [HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }})
