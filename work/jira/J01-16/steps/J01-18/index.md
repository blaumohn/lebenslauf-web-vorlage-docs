---
layout: page
title: "16-2: Locking für Token-Rotation ausrollen"
permalink: /de/work/jira/J01-16/steps/J01-18/
---

**Stand:** 2026-03-18

Schrittspezifischer öffentlicher Arbeitsstand für
[16-2]({{ "/de/mirror/issues/J01-16/steps/J01-18/" | relative_url }}) unter
[J01-16]({{ "/de/work/jira/J01-16/" | relative_url }}).

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

## Links

- [16-2 im Jira-Mirror]({{ "/de/mirror/issues/J01-16/steps/J01-18/" | relative_url }})
- [J01-16: Runtime-Concurrency, Locking und atomare Zugriffe]({{
  "/de/work/jira/J01-16/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
