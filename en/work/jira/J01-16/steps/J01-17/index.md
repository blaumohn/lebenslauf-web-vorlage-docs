---
layout: page
title: "16-1: Locking für Rate-Limit und CAPTCHA ausrollen"
permalink: /en/work/jira/J01-16/steps/J01-17/
---

**Stand:** 2026-03-18

Schrittspezifischer öffentlicher Arbeitsstand für `16-1` unter `J01-16`.
Diese Seite bündelt nur den Zuschnitt für Rate-Limit- und CAPTCHA-Locking und
trennt ihn bewusst von den weiteren offenen Schritten `16-2` bis `16-4`.

## Ziel

Den bewährten Runtime-Rahmen aus
[J01-21]({{ "/en/work/jira/J01-21/" | relative_url }}) auf die noch offenen
Rate-Limit- und CAPTCHA-Pfade ausrollen, ohne die vollständige `IP_SALT`-
Fachlogik zu kopieren.

## Verbindlich zu übernehmen

- `RuntimeLockRunner` als gemeinsamer Lock-Helfer für kritische
  Schreibabschnitte
- `RuntimeAtomicWriter` für atomische Dateischreibmuster
- Locking über `symfony/lock` mit begrenztem Erwerb per Polling und Timeout
- deterministische Fehlerpfade statt verdeckter Nebenwirkungen
- prüfbare, bereichsspezifische Lock-Key-Zuschnitte

## Verbindlich nicht blind zu übernehmen

- die vollständige Fachlogik des `IP_SALT`-Pfads
- Markerfolgen wie `IN_PROGRESS` und `READY`, wenn der Zielpfad keine
  gleichartige Zustandsmaschine braucht
- Token-Rotation; sie gehört in `16-2`
- race-nahe Gesamttests; sie gehören in `16-3`
- die Betriebsnotiz; sie gehört in `16-4`

## Zielbereiche und Lock-Granularität

| Bereich | Zieloperation | Lock-Zuschnitt | Write-Verhalten |
| --- | --- | --- | --- |
| Rate-Limit | `allow(key, max, window)` | pro `key` | Counter-Datei unter Lock lesen, fortschreiben, atomisch schreiben |
| CAPTCHA | `verify(captchaId, answer, ipHash)` | pro `captchaId` | Challenge-Datei unter Lock lesen, bewerten, `fail_count` oder `used_at` atomisch schreiben |
| CAPTCHA | `createChallenge(ipHash)` | kein Lock zwingend bei eindeutiger ID | neue Challenge-Datei atomisch anlegen |
| CAPTCHA | `cleanupExpired()` | optional globaler Wartungs-Lock | abgelaufene oder verbrauchte Dateien gezielt löschen |

## Wiederverwendung aus J01-21

Für `16-1` wird der Referenzpfad aus
[J01-21]({{ "/en/work/jira/J01-21/" | relative_url }}) nicht über komplette
Fachschichten kopiert, sondern über einen gemeinsamen Runtime-Rahmen
wiederverwendet:

- derselbe Lock-Mechanismus
- dieselbe atomische Write-Disziplin
- derselbe Fail-Fast-Grundsatz
- dieselbe Trennung zwischen gemeinsamem I/O-Rahmen und bereichsspezifischer
  Fachentscheidung

Damit wird `16-1` als Ausrollung bewährter Module geschnitten, nicht als
zweite `IP_SALT`-Implementierung unter anderem Namen.

## Öffentlicher Ausführungsnachweis

`16-1` gilt fachlich erst dann als sauber ausgeführt, wenn öffentlich
nachvollziehbar ist:

- welche Zieloperationen unter Lock laufen
- welcher Lock-Key-Zuschnitt gilt
- welche Pfade nur atomisch schreiben, aber keinen Write-Lock brauchen
- welche race-nahen Tests diese Zuschnitte später in `16-3` absichern

## Links

- [J01-16: Runtime-Concurrency, Locking und atomare Zugriffe]({{
  "/en/work/jira/J01-16/" | relative_url }})
- [J01-21: Runtime-IP_SALT-Verwaltung und Guardrails]({{
  "/en/work/jira/J01-21/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/en/areas/http-runtime/" | relative_url }})
- [J01-16 im Jira-Mirror]({{ "/en/mirror/issues/J01-16/" | relative_url }})
