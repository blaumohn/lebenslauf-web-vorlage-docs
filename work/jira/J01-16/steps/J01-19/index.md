---
layout: page
title: "16-3: Race-nahe Tests ergänzen"
permalink: /de/work/jira/J01-16/steps/J01-19/
---

**Stand:** 2026-03-18

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[16-3]({{ "/de/mirror/issues/J01-16/steps/J01-19/" | relative_url }}) unter
[J01-16]({{ "/de/work/jira/J01-16/" | relative_url }}).

## Ziel

Race-nahe Tests für die Schreibpfade ergänzen, die in `16-1` und `16-2` unter
Lock gestellt wurden: `RateLimiter`, `CaptchaService` und `TokenService`.

## Teststrategie

PHP ist single-threaded; echter Parallelzugriff erfordert Prozess-Forks.
Stattdessen wird der Lock-Key jedes Dienstes manuell durch eine direkte
`FlockStore`-Instanz belegt, bevor der Dienst-Aufruf startet.
Damit werden die folgenden Eigenschaften überprüft:

- Der Schreibpfad läuft tatsächlich unter dem erwarteten Lock-Key
  (kein „am Lock vorbei").
- Der `RuntimeLockRunner` bricht mit einem Lock-Timeout ab, wenn der Key
  bereits belegt ist.
- Nach Lock-Freigabe ist der Schreibzustand konsistent lesbar.
- Lese-Operationen in `TokenService` benötigen keinen Lock (kein Timeout).

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| `RateLimiter.allow()` läuft unter Lock | Timeout, wenn `ratelimit_{key}` bereits belegt | `ConcurrencyTest::testRateLimiterAllowTimesOutWhenLockBusy` | Erledigt |
| Aufeinanderfolgende `allow()`-Aufrufe sind serialisiert | Zähler korrekt erhöht, Limit wird eingehalten | `ConcurrencyTest::testRateLimiterSerializesCallsForSameKey` | Erledigt |
| `CaptchaService.verify()` läuft unter Lock | Timeout, wenn `captcha_{id}` bereits belegt | `ConcurrencyTest::testCaptchaVerifyTimesOutWhenLockBusy` | Erledigt |
| `used_at` wird unter Lock atomar geschrieben | Challenge nach Verify inaktiv, kein zerrissener Zustand | `ConcurrencyTest::testCaptchaVerifyUsedAtWrittenUnderLock` | Erledigt |
| `TokenService.rotate()` läuft unter Lock | Timeout, wenn `token_{profile}` bereits belegt | `ConcurrencyTest::testTokenRotateTimesOutWhenLockBusy` | Erledigt |
| `rotate()` schreibt atomar | Hashes nach Rotation konsistent lesbar | `ConcurrencyTest::testTokenRotateWritesAtomically` | Erledigt |
| Lese-Operationen brauchen keinen Lock | `verify()` und `findProfileForToken()` laufen durch, auch wenn Token-Lock belegt ist | `ConcurrencyTest::testTokenReadOperationsNeedNoLock` | Erledigt |
| Gesamttest-Suite grün | 33/33 PHPUnit-Tests nach Änderung | `php vendor/bin/phpunit` | Erledigt |

## Links

- [16-3 im Jira-Mirror]({{ "/de/mirror/issues/J01-16/steps/J01-19/" | relative_url }})
- [J01-16 im Jira-Mirror]({{ "/de/mirror/issues/J01-16/" | relative_url }})
- [J01-16: Runtime-Concurrency, Locking und atomare Zugriffe]({{
  "/de/work/jira/J01-16/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
