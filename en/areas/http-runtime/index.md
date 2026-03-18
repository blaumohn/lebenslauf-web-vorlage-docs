---
layout: page
title: "Area: HTTP runtime"
permalink: /en/areas/http-runtime/
---

This area documents the stable operational basis of the HTTP runtime path.
It captures which file areas, locking strategies, and write patterns apply
permanently — independent of any specific sprint.

## Preview-Relevant Runtime Building Blocks

- `var/config/config.php` is the compiled runtime config and stays the only
  runtime source for the HTTP path.
- `var/tmp/captcha` carries short-lived CAPTCHA challenges.
- `var/tmp/ratelimit` carries the rate-limit state for the contact path.
- `var/state/tokens` keeps the more durable state for token lists.

## Guardrails for the Contact Path

- `IP_SALT` is a required runtime-config value and stabilizes the hashing used
  for rate limits and CAPTCHA.
- The GET path of the contact form limits CAPTCHA fetches via
  `CAPTCHA_MAX_GET` and `RATE_LIMIT_WINDOW_SECONDS`.
- The POST path limits form attempts via `CONTACT_MAX_POST` in the same time
  window.
- Failed CAPTCHA or mail runs return controlled error pages or retry paths
  instead of leaving silent state behind.

## Atomic Write Patterns

- Runtime state is kept in files.
- Writes go through temporary files followed by `rename()`.
- This keeps either the old or the new state visible; half-written files should
  not become publicly effective in the active path.

## Locking

All state-mutating file accesses in the HTTP path run under a
`symfony/lock`-based `FlockStore` lock via `RuntimeLockRunner`.

### Lock keys per service

| Service | Lock key schema | Granularity |
| --- | --- | --- |
| `RateLimiter` | `ratelimit_{normalized_key}` | per IP key |
| `CaptchaService` | `captcha_{challenge_id}` | per challenge ID |
| `TokenService` (write) | `token_{normalized_profile}` | per profile |
| `TokenService` (read) | — (no lock) | lock-free |

### Timeout and polling rule

- Maximum wait time: **300 ms**
- Polling interval: **25 ms**
- On expiry: `RuntimeException("Lock-Timeout nach 300ms: {key}")`
- These are the defaults in `RuntimeLockRunner`; they can be overridden in
  the constructor.

### Concurrency test evidence

`ConcurrencyTest` proves that every write path actually runs under its expected
lock key and that the timeout fires when the key is already held.
Background and outcome:
[16-3: Race-adjacent tests]({{ "/en/jira/issues/J01-16/steps/J01-19/" | relative_url }}).

## Links

- [J01-98: public work status]({{ "/en/jira/issues/J01-98/" | relative_url }})
- [J01-16: Runtime concurrency, locking and atomic access]({{
  "/en/jira/issues/J01-16/" | relative_url }})
- [16-3: Race-adjacent tests]({{ "/en/jira/issues/J01-16/steps/J01-19/" | relative_url }})
- [J01-16 in the Jira mirror]({{ "/en/jira/issues/J01-16/" | relative_url }})
