---
layout: page
title: "J01-83: Prepare the first cache V1 and separate policy work"
permalink: /en/work/jira/J01-83/
---

**Stand:** 2026-03-17

Canonical public work status for `J01-83`.
This issue narrows the earlier, broader CLI-cache step down to a small, easily
replaceable first cache iteration and explicitly separates the policy
hardening into its own follow-up item.

## Goal

Prepare a small cache V1 that gives humans and agents one reliable recipe for
recurring Jira work without prematurely pulling in the later security or curl
hardening path.

## Source and chronology basis

- 2026-02-24:
  The J01 notes first recorded a CLI cache or recipe catalog as an
  intermediate step.
- 2026-02-24:
  The system overview and [ADR-0002]({{ "/en/decisions/adr-0002/" |
  relative_url }}) anchored that cache context publicly, but still mixed it
  with stronger policy language.
- 2026-02-25 and 2026-02-26:
  The `tagebuch` refined the topic first as “cache vs. Codex skill” and then
  as “cache artefact vs. Codex skill”.
- 2026-03-14:
  [J01-95]({{ "/en/work/jira/J01-95/" | relative_url }}) provided the right
  pattern for this round:
  small local V1, quickly usable, replaceable later.
- Negative finding:
  the exported `docs/agile` sources did not contain their own cache track, so
  this was not a missing leftover in `J01-91/archive-topics.md`.

## Prepared now

- narrowed `J01-83` in Jira down to the cache V1
- split the policy track into its own Jira candidate `J01-101`
- added the new public work doc for `J01-83`
- carried the source basis into the `tagebuch` as a dedicated search case and
  round note
- implemented one small reference recipe in the skill repo:
  `shared-tooling/jira-pages/cache-recipes/parent-subtasks.md`

## Implemented reference recipe

The V1 is now implemented as exactly one small cache artefact.
That artefact covers the read case:
read a Jira parent issue and derive the contained subtasks from it.

The copyable core command is:

```bash
atlassian jira http get "/rest/api/3/issue/<PARENT_KEY>?fields=subtasks,summary,status"
```

The reference recipe contains only the fields needed for this V1:

- purpose
- copyable command
- placeholders
- expected output fields
- success signals
- failure signals and limits

In V1, success means:

- exit code `0`
- parseable JSON
- a present `fields.subtasks` field
- readable subtask fields `key`, `fields.summary`, `fields.status.name`

Explicitly not part of this V1:

- saving the full response as a file
- a local JSON snapshot cache
- new CLI subcommands
- new policy hardening in `atlassian-http-client`

## V1 scope

- exactly one small reference recipe is enough
- that recipe only describes:
  purpose, copyable command, placeholders, expected output fields,
  success signals, and limits
- the solution stays intentionally small and quickly replaceable
- the model is the V1 posture from `J01-95`, not its concrete feature set

## Not part of J01-83

- no broad recipe library
- no mandatory snapshots
- no new policy hardening in `atlassian-tools/curl`
- no new security or curl hardening as the DoD for this first iteration

## Boundary to the policy track

- [J01-101]({{ "/en/work/jira/J01-101/" | relative_url }}) carries the
  separate policy follow-up work.
- `J01-83` remains the cache track and does not pull that policy work back
  into scope implicitly.

## Links

- [J01-95: Build a journaled Jira/pages sync with resume]({{
  "/en/work/jira/J01-95/" | relative_url }})
- [J01-101: Prepare CLI-cache policy hardening as separate follow-up work]({{
  "/en/work/jira/J01-101/" | relative_url }})
- [ADR-0002: atlassian-http-client security model]({{
  "/en/decisions/adr-0002/" | relative_url }})
- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
