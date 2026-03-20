---
layout: page
title: "J01-16: Runtime concurrency, locking, and atomic access"
jira_key: J01-16
permalink: /en/jira/issues/J01-16/
---

**Stand:** 2026-03-20

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-16`.
This issue extends the already proven runtime frame from
[J01-21]({{ "/en/jira/issues/J01-21/" | relative_url }}) to further critical
file accesses and bundles the completed concurrency and locking rollout of the
preview path.

## Goal

Make critical runtime write paths consistent under parallel access in preview
operations:

- rate limiting
- CAPTCHA verification
- token rotation

`J01-16` should visibly inherit the frame from `J01-21`, but only copy it
where the domain behaviour actually supports that transfer.

## Reference path

The completed issue [J01-21]({{ "/en/jira/issues/J01-21/" | relative_url }}) is
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

## Completed scope

- locking for rate-limit and CAPTCHA paths is completed via
  [16-1: Locking für Rate-Limit und CAPTCHA ausrollen]({{
  "/en/jira/issues/J01-16/steps/J01-17/" | relative_url }})
- locking for token rotation is completed via
  [16-2: Locking für Token-Rotation ausrollen]({{
  "/en/jira/issues/J01-16/steps/J01-18/" | relative_url }})
- race-adjacent tests for the new target areas are completed via
  [16-3: Race-nahe Tests ergänzen]({{
  "/en/jira/issues/J01-16/steps/J01-19/" | relative_url }})
- the public operating note for the locked runtime areas is updated via
  [16-4: Betriebsnotiz aktualisieren]({{
  "/en/jira/issues/J01-16/steps/J01-20/" | relative_url }})

## Verification plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Rate-limit and CAPTCHA write paths run under lock | `16-1` documents lock scope, atomic writes, and target operations | [16-1]({{ "/en/jira/issues/J01-16/steps/J01-17/" | relative_url }}) | done |
| Token rotation is protected against parallel access | `16-2` records lock key, atomic write behaviour, and green tests | [16-2]({{ "/en/jira/issues/J01-16/steps/J01-18/" | relative_url }}) | done |
| Race-adjacent tests secure the rollout | `16-3` shows the seven timeout and consistency checks | [16-3]({{ "/en/jira/issues/J01-16/steps/J01-19/" | relative_url }}) | done |
| Public runtime operating docs carry the same end state | `16-4` moves the area docs to a stable long-term description | [16-4]({{ "/en/jira/issues/J01-16/steps/J01-20/" | relative_url }}) | done |
| Jira, work doc, and public Jira output are consistent | `J01-16` stays `Done` with `Resolution = Fertig`; the public doc no longer describes open scope | Jira Cloud, this page, public Jira refresh | done |

## Public effect in the preview path

`J01-16` is part of the sprint goal for the preview deployment.
The issue makes visible the stability basis that the preview path relies on
for repeatable runtime access.
The canonical area statement remains in
[Area: HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }}); this
page keeps the issue-specific completed work status.

## Provenance

The content origin lies in the earlier `docs/agile` track `ISS-012`, which
directly followed the narrower reference path from `ISS-011`.
In today's Jira structure, these two historical sources are carried publicly
through `J01-16` and the completed reference issue `J01-21`.
The journal notes from March 18 and March 19, 2026 additionally confirm that
`16-3`, `16-4`, and the closeout of `J01-16` were actually finished in the
sprint, even though the public sync temporarily lagged behind.

## Conclusion

`J01-16` is functionally complete.
The runtime frame from `J01-21` is rolled out for rate limiting, CAPTCHA, and
token rotation, the race-adjacent tests are in place, and the public operating
note carries the same end state.
The remaining mismatch was no longer in Jira or in code, but only in the late
public sync of this work doc.

## Links

- [J01-21: runtime IP_SALT management and guardrails]({{
  "/en/jira/issues/J01-21/" | relative_url }})
- [16-1: Locking für Rate-Limit und CAPTCHA ausrollen]({{
  "/en/jira/issues/J01-16/steps/J01-17/" | relative_url }})
- [16-2: Locking für Token-Rotation ausrollen]({{
  "/en/jira/issues/J01-16/steps/J01-18/" | relative_url }})
- [16-3: Race-nahe Tests ergänzen]({{
  "/en/jira/issues/J01-16/steps/J01-19/" | relative_url }})
- [16-4: Betriebsnotiz aktualisieren]({{
  "/en/jira/issues/J01-16/steps/J01-20/" | relative_url }})
- [Area: HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }})
- [Jira: J01-16]({{ "/en/jira/issues/J01-16/" | relative_url }})
- [Sprint 1: Planning]({{ "/en/work/sprints/scrum-sprint-1/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
