---
layout: page
title: "16-1 — Locking für Rate-Limit und CAPTCHA ausrollen"
permalink: /de/mirror/issues/J01-16/steps/J01-17/
---

Keine Jira-Cloud-Links, keine E-Mail-Adressen.

## Metadaten

- **Parent:** [J01-16]({{ "/de/mirror/issues/J01-16/" | relative_url }})
- **Schritt:** 16-1
- **Status:** Erledigt
- **Aktualisiert:** 2026-03-18

## Ausführungsnachweis

| Zieloperation | Lock-Key | Write-Verhalten |
| --- | --- | --- |
| `RateLimiter.allow(key, ...)` | `ratelimit_{safeKey}` pro Key | atomar unter Lock |
| `CaptchaService.verify(captchaId, ...)` | `captcha_{captchaId}` pro ID | `fail_count` oder `used_at` atomar unter Lock |
| `CaptchaService.createChallenge(ipHash)` | kein Lock | neue Challenge-Datei atomar |
| `CaptchaService.cleanupExpired()` | kein Lock | löscht nur abgelaufene / verbrauchte Dateien |

`RuntimeLockRunner` und `RuntimeAtomicWriter` wurden in einen gemeinsamen,
bereichsneutralen Ordner `Http\Runtime` verschoben (ISS-012, Punkt 4).
`AppContext` teilt eine `lockRunner`- und `writer`-Instanz für alle drei Dienste.

## Links

- [16-1: Locking für Rate-Limit und CAPTCHA ausrollen]({{ "/de/work/jira/J01-16/steps/J01-17/" | relative_url }})
