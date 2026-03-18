---
layout: page
title: "16-4: Betriebsnotiz aktualisieren"
jira_key: J01-20
jira_parent_key: J01-16
permalink: /de/jira/issues/J01-16/steps/J01-20/
---

**Stand:** 2026-03-18

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[16-4]({{ "/de/jira/issues/J01-16/steps/J01-20/" | relative_url }}) unter
[J01-16]({{ "/de/jira/issues/J01-16/" | relative_url }}).

## Ziel

Den öffentlichen Betriebsbereich
[HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
von seiner sprint-spezifischen Rahmung auf einen stabilen Langzeitzustand
umstellen und um einen vollständigen Locking-Abschnitt erweitern.

## Was geändert wurde

- Einleitungssatz neu: stabile Betriebsbasis statt J01-98-Sprintbezug.
- Neuer Abschnitt **Locking** mit:
  - Lock-Key-Schema je Dienst (`RateLimiter`, `CaptchaService`,
    `TokenService`)
  - Timeout- und Polling-Regel (300 ms / 25 ms)
  - Verweis auf `ConcurrencyTest` als Race-Test-Nachweis via 16-3.
- Links-Abschnitt aktualisiert: J01-16-Arbeitsdoku und 16-3-Schritt
  ergänzt, Testmatrix-Link entfernt (Seite existiert nicht).

## Überprüfungsplan

| Prüfpunkt | Erwartung | Status |
| --- | --- | --- |
| Einleitung ohne Sprint-Bezug | Kein „J01-98" im Einleitungssatz | Erledigt |
| Locking-Abschnitt vorhanden | Lock-Keys, Timeout-Regel, Nachweis-Link | Erledigt |
| Link zu 16-3 | Verweis auf `ConcurrencyTest`-Schritt | Erledigt |
| DE + EN konsistent | Beide Sprachversionen inhaltlich gleich | Erledigt |

## Links

- [16-4 im Jira-Mirror]({{ "/de/jira/issues/J01-16/steps/J01-20/" | relative_url }})
- [J01-16 im Jira-Mirror]({{ "/de/jira/issues/J01-16/" | relative_url }})
- [J01-16: Runtime-Concurrency, Locking und atomare Zugriffe]({{
  "/de/jira/issues/J01-16/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
- [16-3: Race-nahe Tests]({{ "/de/jira/issues/J01-16/steps/J01-19/" | relative_url }})
