---
layout: page
title: "J01-98: Migration map and public rationale"
permalink: /en/jira/issues/J01-98/migration-map/
---

This page records the deeper public work doc for `J01-98`.
It explains the sprint-relevant leftovers from `J01-91` in a way that remains
understandable without access to internal work notes.

## Purpose

`J01-98` carries only the part of the earlier `docs/agile` migration that
directly supports the current preview sprint.
This page therefore answers three questions:

- Which topic blocks from the earlier sources still matter for the sprint?
- Which current public target locations should receive these topics?
- Which leftovers explicitly do **not** belong in `J01-98`, but move to
  [J01-100]({{ "/en/jira/issues/J01-100/" | relative_url }})?

## Public rationale

The archived `docs/agile` sources did not leave one generic migration task for
the preview path, but four distinct topic blocks:

1. the preview workflow with promotion path, required checks, and
   preview-specific operating assumptions
2. the test matrix with evidence for build, runtime, and deploy smoke checks
3. runtime hardening for locking, atomic access, and race-adjacent risks
4. system-source and config-policy behaviour in the preview path

This narrowing was later sharpened by the work-focused review from March 2026:

- The preview migration should support the active sprint path only.
- Everything that does not directly lead to preview deployment stays outside
  this issue.
- Public docs must carry the statement themselves; internal notes are
  provenance only, never public targets.

The rationale is based on three source families:

- older archive states from the `docs/agile` export on 2026-02-21,
  for the later Jira target carriers `J01-31`, `J01-9`, `J01-13`, and
  `J01-16`
- the commit history of the branches `preview`, `feature/iss-005-preview`,
  and `dev`
- later internal work states from 2026-03-16 and 2026-03-17,
  where the sprint boundary against `J01-100` was fixed explicitly

## Topic blocks and current target locations

| Topic block | Public statement for `J01-98` | Current target location | Jira reference | Git evidence |
| --- | --- | --- | --- |
| Preview workflow and promotion path | The sprint needs a clear `feature/* -> dev -> preview` flow, required checks before promotion, and preview-specific operating rules. | `operations/<slug>/` | `J01-9` | `4b95d4e`, `9e9c2ff`, `2af9f95` |
| Test matrix and evidence | The sprint needs visible evidence for `config lint`, setup, build, tests, artifact checks, and the smoke path. | `quality/testmatrix/` | `J01-13` | `4b95d4e`, `2af9f95`, `e1daa6d` |
| Runtime locking and atomic access | The preview path needs a public explanation for locking, timeout/polling rules, and atomic write patterns. The narrow reference path is completed in `J01-21`, while the broader rollout remains open in `J01-16`. | `areas/http-runtime/` | `J01-16`, `J01-21` | `b015e77`, `49d02fa`, `044e12d`, `cc42f0d`, `3fffdaa` |
| System source and config policy | The preview-relevant config rationale must explain how sources, manifest rules, and pipeline/phase logic work together. | `areas/cli-build/` | `J01-31` | `4b95d4e`, `9b5c891`, `c3cef7a` |

## Commit history as a source family

The commit history is a separate reliable source for `J01-98` because it shows
which parts of the preview path actually landed in code, workflow, and repo
docs.

### `preview`

- `4b95d4e`:
  `config lint` plus CLI `setup` and CLI `build` were anchored as the visible
  preview path.
- This means for `J01-98`:
  `J01-9`, `J01-13`, and `J01-31` need public docs that explain exactly this
  lean preview path.

### `feature/iss-005-preview`

- `9e9c2ff`:
  preview workflow and checks were reactivated.
- `2af9f95`:
  the preview workflow was unified through `bin/ci`.
- `9b5c891`:
  the term `Pipeline-Phase` was unified in the active path.
- `c3cef7a`:
  example values were moved from active config files into manifest metadata.
- `e1daa6d`:
  feature tests required additional guardrails for `IP_SALT` and temp-dir.

This commit group is the main source for the public relationship between
`J01-9`, `J01-13`, and `J01-31`.

### `feature/iss-005-preview` with ISS-011/ISS-012 rollout

- `b015e77`:
  `LockRunner` and `AtomicWriter` were introduced.
- `49d02fa`:
  runtime and CLI integration for the `IP_SALT` path were anchored.
- `044e12d`:
  runtime guardrail tests were added.
- `cc42f0d`:
  the concurrency frame was moved into services and state ports.
- `3fffdaa`:
  the runtime hardening was documented in `docs/ENVIRONMENTS.md`.

This commit group is the main source for the public relationship between
`J01-21` as the reference path and `J01-16` as the broader rollout in preview
operations.

### `dev`

- `03b4c4c`:
  the `preview` state was taken into `dev`.
- `1207510`:
  `docs/agile` was removed from the active repo.
- later `docs(agile)` and README steps in `dev` show that the earlier work
  basis can no longer be assumed as a living doc location.

This means for `J01-98`:
the public rationale must combine archive sources, commit history, and later
scope sharpening instead of linking to a still-active `docs/agile` tree.

## Scope boundary against J01-100

| Remaining topic | Stays in `J01-98`? | Reason |
| --- | --- | --- |
| Preview workflow in today's Jira framing `J01-9` | yes | It directly supports the active sprint. |
| Test-matrix and evidence block in today's Jira framing `J01-13` | yes | It is required sprint evidence for the preview path. |
| Runtime concurrency and locking hardening in today's Jira framing `J01-16` | yes, as far as it publicly secures preview operations | The sprint needs the explained stability basis, not every later deepening step. |
| System-source and source-policy rationale in today's Jira framing `J01-31` | yes | It explains the preview path and its config logic. |
| later `docs/agile` leftovers without direct preview relevance | no | These topics do not directly support the sprint and stay in `J01-100`. |
| new doc types or general area-buildout work outside the sprint path | no | `J01-98` migrates sprint-relevant content only and does not open a new doc class. |

## Source state and recency

The older `docs/agile` sources still provide the content basis for `J01-98`.
Publicly, however, today's leading structure is the Jira target set
`J01-9`, `J01-13`, `J01-16`, and `J01-31`.

- The topic block for `J01-9` takes over the earlier preview workflow,
  triggers, required checks, and preview-specific operating assumptions.
- The topic block for `J01-13` takes over the test matrix, the evidence
  structure, and the visible remaining gaps for build, runtime, and deploy
  smoke.
- The topic block for `J01-16` takes over the rationale for locking, atomic
  writes, and race-adjacent runtime tests.
- The completed model path for `IP_SALT` now sits in today's Jira framing
  under `J01-21` and carries the narrow reference frame for this rollout.
- The topic block for `J01-31` takes over system-source handling and the source
  rules that technically justify the preview path.

The commit history confirms these topics again in the implemented repo state:

- `preview` shows the lean productive entry path with `config lint`,
  `setup`, and `build`.
- `feature/iss-005-preview` shows the actual integration of workflow,
  config metadata, terminology, and guardrails.
- `dev` shows the later consolidation state and the removal of `docs/agile`
  from the active repo.

The later work states from March 2026 do not replace these topics. Instead,
they sharpen how the topics are used in the sprint:

- A general phase-2 migration became a narrow preview scope.
- The boundary against later follow-up work was tied publicly to `J01-100`.
- Public docs must carry the rationale themselves and may not depend on
  internal notes as a reading path.

## Next migration blocks

1. Extend the public preview workflow for `J01-9` further only in a
   sprint-near way.
2. Grow the sprint matrix for `J01-13` only when new evidence secures the
   active preview path more than once.
3. Continue the runtime and CLI/build pages for `J01-16` and `J01-31` only
   within the preview guardrails.
4. Keep everything that does not directly support these four blocks inside
   [J01-100]({{ "/en/jira/issues/J01-100/" | relative_url }}).

## Links

- [J01-98: public work status]({{ "/en/jira/issues/J01-98/" | relative_url }})
- [J01-91: status/snapshot (closure)]({{ "/en/jira/issues/J01-91/" | relative_url }})
- [J01-100: docs/agile leftovers after sprint 1]({{ "/en/jira/issues/J01-100/" | relative_url }})
