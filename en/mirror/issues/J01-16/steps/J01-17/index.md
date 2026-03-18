---
layout: page
title: "16-1 — Locking für Rate-Limit und CAPTCHA ausrollen"
permalink: /en/mirror/issues/J01-16/steps/J01-17/
---

No Jira Cloud links, no email addresses.

## Metadata

- **Parent:** [J01-16]({{ "/en/mirror/issues/J01-16/" | relative_url }})
- **Step:** 16-1
- **Status:** Done
- **Updated:** 2026-03-18

## Execution record

| Target operation | Lock key | Write behaviour |
| --- | --- | --- |
| `RateLimiter.allow(key, ...)` | `ratelimit_{safeKey}` per key | atomic under lock |
| `CaptchaService.verify(captchaId, ...)` | `captcha_{captchaId}` per ID | `fail_count` or `used_at` atomic under lock |
| `CaptchaService.createChallenge(ipHash)` | no lock | new challenge file written atomically |
| `CaptchaService.cleanupExpired()` | no lock | deletes expired / used files only |

`RuntimeLockRunner` and `RuntimeAtomicWriter` were moved to a shared,
domain-neutral directory `Http\Runtime` (ISS-012, point 4).
`AppContext` shares a single `lockRunner` and `writer` instance across all three services.

## Links

- [16-1: Locking für Rate-Limit und CAPTCHA ausrollen]({{ "/en/work/jira/J01-16/steps/J01-17/" | relative_url }})
