---
layout: page
title: "16-2: Locking für Token-Rotation ausrollen"
jira_key: J01-18
jira_parent_key: J01-16
permalink: /de/jira/issues/J01-16/steps/J01-18/
---

**Stand:** 2026-03-18

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[16-2]({{ "/de/jira/issues/J01-16/steps/J01-18/" | relative_url }}) unter
[J01-16]({{ "/de/jira/issues/J01-16/" | relative_url }}).

## Ziel

Den Runtime-Rahmen aus `16-1` auf `TokenService.rotate()` ausrollen.
Nur der Schreibpfad ist betroffen; Lese-Operationen bleiben unverändert.

## Zielbereiche und Lock-Granularität

| Bereich | Zieloperation | Lock-Zuschnitt | Write-Verhalten |
| --- | --- | --- | --- |
| Token | `rotate(profile, tokens)` | pro `profile` | Token-Datei atomar überschreiben unter Lock |
| Token | `verify(profile, token)` | kein Lock | nur lesen |
| Token | `findProfileForToken(token)` | kein Lock | nur lesen |

`rotate()` ist ein reiner Schreibvorgang (keine Read-Modify-Write-Folge).
Der Lock schützt gegen zwei gleichzeitige Rotationen desselben Profils.
Der `RuntimeAtomicWriter` schützt gegen zerrissene Lesezugriffe durch
parallele `verify()`-Aufrufe.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| `rotate()` läuft unter Lock | Lock-Key `token_{profile}` pro Profil; gleichzeitige Rotation desselben Profils wird serialisiert | `TokenService::rotateLocked()` | Erledigt |
| Datei wird atomar geschrieben | `RuntimeAtomicWriter` via temp+rename; Leser sehen nie eine halb geschriebene Token-Datei | `TokenService::rotateLocked()` | Erledigt |
| Lese-Operationen unberührt | `verify()`, `findProfileForToken()`, `readHashes()` ohne Lock, kein Regressions-Risiko | `TokenService.php` | Erledigt |
| Tests grün | 26/26 PHPUnit-Tests nach Änderung | `php vendor/bin/phpunit` | Erledigt |

## Delta 2026-03-20

Der im App-Repo noch offene Rest zu `16-2` wurde heute explizit
repo-seitig abgeschlossen:

- Commit `8ab08e4` zieht `TokenService` samt letzter Verdrahtung in
  `AppContext` auf den in dieser Schrittdoku beschriebenen Stand.
- `php bin/cli config lint dev` läuft grün.
- `TokenServiceTest` und die zugehörigen `ConcurrencyTest`-Fälle laufen mit
  gesetztem `TMPDIR` grün.

## Links

- [16-2 im Jira-Mirror]({{ "/de/jira/issues/J01-16/steps/J01-18/" | relative_url }})
- [J01-16 im Jira-Mirror]({{ "/de/jira/issues/J01-16/" | relative_url }})
- [J01-16: Runtime-Concurrency, Locking und atomare Zugriffe]({{
  "/de/jira/issues/J01-16/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
