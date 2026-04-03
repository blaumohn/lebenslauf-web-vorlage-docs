---
layout: page
title: "105-1: Setup seed path: domain correction"
jira_key: J01-122
jira_parent_key: J01-105
permalink: /en/jira/issues/J01-105/steps/J01-122/
---

**Status:** 2026-04-03

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Step-specific public work status for
[105-1]({{ "/en/jira/issues/J01-105/steps/J01-122/" | relative_url }}) under
[J01-105]({{ "/en/jira/issues/J01-105/" | relative_url }}).
This page isolates the setup seed case because it fixes a model error before
the wider manifest thinning can be trusted.

## Goal

- `setup` must no longer depend on `LEBENSLAUF_PUBLIC_PROFILE`.
- Sample content is provided only through one fixed source and one fixed
  target.
- Existing user data must not be overwritten silently by the setup path.

## Report

- Initial finding: the former seed path coupled sample content to the build
  profile, which made the setup semantics incoherent.
- Target state from the issue derivation:
  `--copy-sample-content` instead of `--create-demo-content`,
  fixed source `src/resources/fixtures/lebenslauf/daten-gueltig.yaml`,
  fixed target `daten-sample.yaml`,
  explicit failure when the target already exists.
- Implemented in the app worktree `feature/j01-105-simplify-manifest`:
  `SetupCommand` now delegates sample seeding to `SampleContentCopier`, which
  only uses the fixed fixture and the fixed target path.
- Evidence added: PHPUnit covers the successful copy path and the failure path
  for an existing target; the smoke test uses
  `setup --copy-sample-content`.

## Current status

- Jira subtask `J01-122` exists.
- The domain target state is separated from the rest of `J01-105` and is
  publicly referenceable.
- Code and test evidence have been added in the app worktree.
- Public repo docs reflect the new seed path in the README and environment
  docs.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Setup decoupled | `LEBENSLAUF_PUBLIC_PROFILE` no longer appears in the seed path | `src/cli/php/Command/SetupCommand.php`, `src/cli/php/Setup/SampleContentCopier.php` | done |
| Fixed sample source | Seed reads `daten-gueltig.yaml` as a fixed fixture | `src/cli/php/Setup/SampleContentCopier.php` | done |
| Fixed target name | Seed writes to `daten-sample.yaml` | `src/cli/php/Setup/SampleContentCopier.php` | done |
| No silent overwrite | Existing target triggers a clear error path | `tests/php/SampleContentCopierTest.php` | done |
| CLI and docs mirrored | Flag and seed path are consistent in README, environment docs, and smoke test | `README.md`, `README.en.md`, `docs/ENVIRONMENTS.md`, `tests/py/smoke.py` | done |

## Open points

- No step-specific open points remain.
- Remaining work for `J01-105` lives in the sibling steps.

## Links

- [105-1 in the Jira mirror]({{ "/en/jira/issues/J01-105/steps/J01-122/" | relative_url }})
- [J01-105 in the Jira mirror]({{ "/en/jira/issues/J01-105/" | relative_url }})
