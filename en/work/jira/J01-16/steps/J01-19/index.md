---
layout: page
title: "16-3: Add race-adjacent tests"
jira_key: J01-19
jira_parent_key: J01-16
permalink: /en/jira/issues/J01-16/steps/J01-19/
---

**Status:** 2026-03-18

{% include jira-work-context.html %}

Step-specific public work record for
[16-3]({{ "/en/jira/issues/J01-16/steps/J01-19/" | relative_url }}) under
[J01-16]({{ "/en/jira/issues/J01-16/" | relative_url }}).

## Goal

Add race-adjacent tests for the write paths locked in `16-1` and `16-2`:
`RateLimiter`, `CaptchaService` and `TokenService`.

## Test strategy

PHP is single-threaded; true parallel access requires process forks.
Instead, each service's lock key is manually held by a direct `FlockStore`
instance before the service call starts.
This verifies the following properties:

- The write path actually runs under the expected lock key (no bypass).
- `RuntimeLockRunner` aborts with a lock timeout when the key is already held.
- After the lock is released, the written state is consistently readable.
- Read operations in `TokenService` do not require a lock (no timeout).

## Review plan

| Check | Expected | Evidence / location | Status |
| --- | --- | --- | --- |
| `RateLimiter.allow()` runs under lock | Timeout when `ratelimit_{key}` is already held | `ConcurrencyTest::testRateLimiterAllowTimesOutWhenLockBusy` | Done |
| Sequential `allow()` calls are serialised | Counter incremented correctly, limit enforced | `ConcurrencyTest::testRateLimiterSerializesCallsForSameKey` | Done |
| `CaptchaService.verify()` runs under lock | Timeout when `captcha_{id}` is already held | `ConcurrencyTest::testCaptchaVerifyTimesOutWhenLockBusy` | Done |
| `used_at` written atomically under lock | Challenge inactive after verify, no torn state | `ConcurrencyTest::testCaptchaVerifyUsedAtWrittenUnderLock` | Done |
| `TokenService.rotate()` runs under lock | Timeout when `token_{profile}` is already held | `ConcurrencyTest::testTokenRotateTimesOutWhenLockBusy` | Done |
| `rotate()` writes atomically | Hashes consistently readable after rotation | `ConcurrencyTest::testTokenRotateWritesAtomically` | Done |
| Read operations need no lock | `verify()` and `findProfileForToken()` complete even when token lock is held | `ConcurrencyTest::testTokenReadOperationsNeedNoLock` | Done |
| Full test suite green | 33/33 PHPUnit tests after change | `php vendor/bin/phpunit` | Done |

## Links

- [Jira: 16-3]({{ "/en/jira/issues/J01-16/steps/J01-19/" | relative_url }})
- [Jira: J01-16]({{ "/en/jira/issues/J01-16/" | relative_url }})
- [J01-16: Runtime concurrency, locking and atomic access]({{
  "/en/jira/issues/J01-16/" | relative_url }})
- [Area: HTTP-Runtime]({{ "/en/areas/http-runtime/" | relative_url }})
