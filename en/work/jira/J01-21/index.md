---
layout: page
title: "J01-21: Runtime IP_SALT management and guardrails"
permalink: /en/work/jira/J01-21/
---

**Stand:** 2026-03-17

Canonical public work status for `J01-21`.
This issue records the already completed reference path for runtime
`IP_SALT` management and makes visible which parts of that frame are later
rolled out to further runtime areas in `J01-16`.

## Goal

Manage `IP_SALT` as a runtime-internal operating state instead of treating it
as a normal active config value.
At the same time, this path should provide the smallest reliable reference
frame for locking, atomic writes, guardrails, and recovery in runtime
operations.

## Closure state

- `IP_SALT` is managed internally in runtime under `var/state`
- missing or inconsistent state is repaired or regenerated deterministically
  under lock
- atomic write patterns protect state transitions through temp files plus
  `rename()`
- reset and recovery use an explicit operating path instead of hidden setup
  switches
- test evidence exists for success, guardrail, and failure paths

## Reference frame

`J01-21` is no longer an open sprint leftover, but the completed reference
issue for the runtime frame:

- locking via `symfony/lock`
- bounded lock acquisition with polling and timeout
- atomic writes for runtime state
- testable guardrail and recovery path
- clear separation between config origin and runtime-internal operating state

Not every detail from `J01-21` is meant to transfer 1:1 to other runtime
managers.
Only the locking frame, atomic writes, deterministic failure paths, and a
checkable lock-key shape are binding as the model.

## Follow-up relationship to J01-16

[J01-16]({{ "/en/work/jira/J01-16/" | relative_url }}) extends this frame to
further runtime models:

- rate limiting under `var/tmp/ratelimit`
- CAPTCHA paths under `var/tmp/captcha`
- token rotation under `var/state/tokens`

`J01-21` remains the narrow reference path here.
`J01-16` is the broader rollout, not a reinvention of the same base pattern.

## Provenance

The content origin of this issue lies in the earlier `docs/agile` track
`ISS-011`.
Publicly, however, `J01-21` is now the leading identifier; the older `ISS-*`
reference remains provenance only and no longer acts as the navigation key.

## Links

- [J01-16: runtime concurrency, locking, and atomic access]({{
  "/en/work/jira/J01-16/" | relative_url }})
- [Area: HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }})
- [J01-21 in the Jira mirror]({{ "/en/mirror/issues/J01-21/" | relative_url }})
- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
