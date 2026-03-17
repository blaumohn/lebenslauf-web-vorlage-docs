---
layout: page
title: "Area: CLI / Build"
permalink: /en/areas/cli-build/
---

This area records the preview-relevant source and manifest rationale for
`J01-98`.
It describes only the narrow path that `SCRUM Sprint 1` needs for the public
preview migration.

## Pipeline and Phase Model

- The CLI executes phases directly: `cli <phase> <pipeline> [args]`.
- For the preview path, `setup`, `build`, `runtime`, and `deploy` matter most.
- Config loading moves from versioned defaults to local overrides and then into
  the compiled runtime file `var/config/config.php`.

## Manifest Rules

- `src/resources/config/config.manifest.yaml` defines variable groups, allowed
  areas, and required values per pipeline/phase.
- `IP_SALT` is limited to `system`, `local`, and `file`, so it may not come
  from arbitrary other sources.
- Deploy values such as `FTP_HOST`, `FTP_USER`, and `FTP_PASS` are restricted
  to safer source types.
- `APP_BASE_PATH` and `FTP_SERVER_DIR` explain the visible preview target
  without hidden special logic in the doc path.

## Public Preview Path

The narrow preview path for `J01-98` is:

1. `php bin/cli config lint <pipeline>` checks that the manifest and source
   logic fit together.
2. `php bin/cli setup preview` prepares the preview run.
3. `php bin/cli build preview` produces the deliverable state.
4. Runtime uses only the compiled config and no direct `getenv()` lookups.

## Boundary

- This page explains the technical shape for `J01-31`.
- Detailed operating rules for the local Pages preview stay in the
  [preview runbook]({{ "/en/operations/ghpages-preview/" | relative_url }}).
- Runtime-related stability aspects stay in
  [Area: HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }}).
- Everything beyond the active preview sprint stays outside `J01-98`.

## Links

- [J01-98: public work status]({{ "/en/work/jira/J01-98/" | relative_url }})
- [J01-31 in the Jira mirror]({{ "/en/mirror/issues/J01-31/" | relative_url }})
- [Test matrix]({{ "/en/quality/testmatrix/" | relative_url }})
