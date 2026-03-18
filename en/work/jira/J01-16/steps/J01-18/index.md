---
layout: page
title: "16-2: Roll out locking for token rotation"
permalink: /en/work/jira/J01-16/steps/J01-18/
---

**Status:** 2026-03-18

Step-specific public work record for
[16-2]({{ "/en/mirror/issues/J01-16/steps/J01-18/" | relative_url }}) under
[J01-16]({{ "/en/work/jira/J01-16/" | relative_url }}).

## Goal

Roll out the runtime frame from `16-1` to `TokenService.rotate()`.
Only the write path is affected; read operations remain unchanged.

## Target areas and lock granularity

| Area | Target operation | Lock scope | Write behaviour |
| --- | --- | --- | --- |
| Token | `rotate(profile, tokens)` | per `profile` | token file overwritten atomically under lock |
| Token | `verify(profile, token)` | no lock | read only |
| Token | `findProfileForToken(token)` | no lock | read only |

`rotate()` is a pure write (no read-modify-write sequence).
The lock protects against two concurrent rotations of the same profile.
`RuntimeAtomicWriter` protects against torn reads by parallel `verify()` calls.

## Review plan

| Check | Expected | Evidence / location | Status |
| --- | --- | --- | --- |
| `rotate()` runs under lock | Lock key `token_{profile}` per profile; concurrent rotation of the same profile is serialised | `TokenService::rotateLocked()` | Done |
| File written atomically | `RuntimeAtomicWriter` via temp+rename; readers never see a partially written token file | `TokenService::rotateLocked()` | Done |
| Read operations unchanged | `verify()`, `findProfileForToken()`, `readHashes()` without lock, no regression risk | `TokenService.php` | Done |
| Tests green | 26/26 PHPUnit tests after change | `php vendor/bin/phpunit` | Done |

## Links

- [16-2 in Jira mirror]({{ "/en/mirror/issues/J01-16/steps/J01-18/" | relative_url }})
- [J01-16: Runtime concurrency, locking and atomic access]({{
  "/en/work/jira/J01-16/" | relative_url }})
- [Area: HTTP-Runtime]({{ "/en/areas/http-runtime/" | relative_url }})
