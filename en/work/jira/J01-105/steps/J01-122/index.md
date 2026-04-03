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
  `--copy-sample-content` instead of `--reset-sample-content`,
  fixed source `src/resources/fixtures/lebenslauf/daten-gueltig.yaml`,
  fixed target `daten-sample.yaml`,
  explicit failure when the target already exists.
- This step records the domain cut and the evidence plan; implementation and
  check runs remain open in the source repo.

## Current status

- Jira subtask `J01-122` exists.
- The domain target state is separated from the rest of `J01-105` and is
  publicly referenceable.
- Code and test evidence are still open for this step.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Setup decoupled | `LEBENSLAUF_PUBLIC_PROFILE` no longer appears in the seed path | app repo, setup code | open |
| Fixed sample source | Seed reads `daten-gueltig.yaml` as a fixed fixture | app repo, setup code | open |
| Fixed target name | Seed writes to `daten-sample.yaml` | app repo, setup code | open |
| No silent overwrite | Existing target triggers a clear error path | app repo, check run | open |

## Open points

- Align how the new seed path must be reflected in CLI, README, and tests.
- Decide whether existing setup tests are extended or newly cut.

## Links

- [105-1 in the Jira mirror]({{ "/en/jira/issues/J01-105/steps/J01-122/" | relative_url }})
- [J01-105 in the Jira mirror]({{ "/en/jira/issues/J01-105/" | relative_url }})

