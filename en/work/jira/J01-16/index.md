---
layout: page
title: "J01-16: Runtime concurrency, locking, and atomic access"
permalink: /en/work/jira/J01-16/
---

**Stand:** 2026-03-17

Canonical public work status for `J01-16`.
This issue extends the already proven runtime frame from
[J01-21]({{ "/en/work/jira/J01-21/" | relative_url }}) to further critical
file accesses and bundles the still-open concurrency and locking remainder of
the preview path.

## Goal

Make critical runtime write paths consistent under parallel access in preview
operations:

- rate limiting
- CAPTCHA verification
- token rotation

`J01-16` should visibly inherit the frame from `J01-21`, but only copy it
where the domain behaviour actually supports that transfer.

## Reference path

The completed issue [J01-21]({{ "/en/work/jira/J01-21/" | relative_url }}) is
the model for this track.
For `J01-16`, the following parts are binding from that path:

- locking via `symfony/lock`
- bounded lock acquisition with polling and timeout
- atomic writes for state-changing file paths
- a testable lock-key strategy instead of hidden side effects
- deterministic failure and recovery paths

`J01-16` does **not** blindly copy every detail from the `IP_SALT` path.
In particular, multi-step markers such as `IN_PROGRESS` and `READY` only fit
other managers when their own domain flow truly requires the same transition.

## Open scope

- roll out locking to rate-limit and CAPTCHA paths
- roll out locking to rate-limit and CAPTCHA paths
  via [16-1: Locking für Rate-Limit und CAPTCHA ausrollen]({{
  "/en/work/jira/J01-16/steps/J01-17/" | relative_url }})
- roll out locking to token rotation
- add race-adjacent tests for the new target areas
- update the public operating note for the locked runtime areas

## Public effect in the preview path

`J01-16` is part of the sprint goal for the preview deployment.
The issue makes visible the stability basis that the preview path relies on
for repeatable runtime access.
The canonical area statement remains in
[Area: HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }}); this
page keeps the issue-specific open work status.

## Provenance

The content origin lies in the earlier `docs/agile` track `ISS-012`, which
directly followed the narrower reference path from `ISS-011`.
In today's Jira structure, these two historical sources are carried publicly
through `J01-16` and the completed reference issue `J01-21`.

## Links

- [J01-21: runtime IP_SALT management and guardrails]({{
  "/en/work/jira/J01-21/" | relative_url }})
- [16-1: Locking für Rate-Limit und CAPTCHA ausrollen]({{
  "/en/work/jira/J01-16/steps/J01-17/" | relative_url }})
- [Area: HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }})
- [J01-16 in the Jira mirror]({{ "/en/mirror/issues/J01-16/" | relative_url }})
- [Sprint 1: Planning]({{ "/en/work/sprints/scrum-sprint-1/" | relative_url }})
- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
