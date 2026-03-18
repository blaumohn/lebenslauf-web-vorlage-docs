---
layout: page
title: "16-4: Update operational note"
permalink: /en/work/jira/J01-16/steps/J01-20/
---

**Status:** 2026-03-18

{% include jira-work-context.html %}

Step-specific public work record for
[16-4]({{ "/en/mirror/issues/J01-16/steps/J01-20/" | relative_url }}) under
[J01-16]({{ "/en/work/jira/J01-16/" | relative_url }}).

## Goal

Move the public operations area
[HTTP-Runtime]({{ "/en/areas/http-runtime/" | relative_url }})
from its sprint-specific framing to a stable long-term state, and extend it
with a complete locking section.

## What was changed

- Introductory sentence updated: stable operational basis instead of
  J01-98 sprint reference.
- New **Locking** section with:
  - Lock key schema per service (`RateLimiter`, `CaptchaService`,
    `TokenService`)
  - Timeout and polling rule (300 ms / 25 ms)
  - Reference to `ConcurrencyTest` as race-test evidence via 16-3.
- Links section updated: J01-16 work doc and 16-3 step added; test-matrix
  link removed (page does not exist).

## Review plan

| Check | Expected | Status |
| --- | --- | --- |
| Introduction without sprint reference | No "J01-98" in the opening sentence | Done |
| Locking section present | Lock keys, timeout rule, evidence link | Done |
| Link to 16-3 | Reference to `ConcurrencyTest` step | Done |
| DE + EN consistent | Both language versions content-equivalent | Done |

## Links

- [16-4 in the Jira mirror]({{ "/en/mirror/issues/J01-16/steps/J01-20/" | relative_url }})
- [J01-16 in the Jira mirror]({{ "/en/mirror/issues/J01-16/" | relative_url }})
- [J01-16: Runtime concurrency, locking and atomic access]({{
  "/en/work/jira/J01-16/" | relative_url }})
- [Area: HTTP-Runtime]({{ "/en/areas/http-runtime/" | relative_url }})
- [16-3: Race-adjacent tests]({{ "/en/work/jira/J01-16/steps/J01-19/" | relative_url }})
