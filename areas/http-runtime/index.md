---
layout: page
title: "Bereich: HTTP-Runtime"
permalink: /de/areas/http-runtime/
---

Dieser Bereich dokumentiert die stabile Betriebsbasis des HTTP-Runtime-Pfads.
Er hält fest, welche Dateibereiche, Locking-Strategien und Schreibmuster
dauerhaft gelten — unabhängig vom jeweiligen Sprint.

## Preview-relevante Runtime-Bausteine

- `var/config/config.php` ist die kompilierte Runtime-Config und bleibt die
  einzige Laufzeitquelle für den HTTP-Pfad.
- `var/tmp/captcha` trägt kurzlebige CAPTCHA-Challenges.
- `var/tmp/ratelimit` trägt die Rate-Limit-Zustände für den Kontaktpfad.
- `var/state/tokens` hält den wichtigeren langlebigen Zustand für
  Token-Listen.

## Guardrails für den Kontaktpfad

- `IP_SALT` ist Pflichtwert der Runtime-Config und stabilisiert die
  Hash-Bildung für Rate-Limit und CAPTCHA.
- Der GET-Pfad des Kontaktformulars begrenzt CAPTCHA-Abrufe über
  `CAPTCHA_MAX_GET` und `RATE_LIMIT_WINDOW_SECONDS`.
- Der POST-Pfad begrenzt Formularversuche über `CONTACT_MAX_POST` im selben
  Zeitfenster.
- Fehlerhafte CAPTCHA- oder Mail-Läufe geben kontrolliert Fehlerseiten oder
  Wiederholpfade zurück, statt stillen Zustand zu hinterlassen.

## Atomare Schreibmuster

- Laufzeitzustand wird dateibasiert gehalten.
- Schreibvorgänge laufen über Temp-Dateien mit anschließendem `rename()`.
- Damit bleibt entweder der alte oder der neue Zustand sichtbar;
  halbfertige Dateien sollen im aktiven Pfad nicht öffentlich wirksam werden.

## Locking

Alle zustandsverändernden Dateizugriffe im HTTP-Pfad laufen unter einem
`symfony/lock`-basierten `FlockStore`-Lock über `RuntimeLockRunner`.

### Lock-Keys je Dienst

| Dienst | Lock-Key-Schema | Granularität |
| --- | --- | --- |
| `RateLimiter` | `ratelimit_{normalized_key}` | pro IP-Schlüssel |
| `CaptchaService` | `captcha_{challenge_id}` | pro Challenge-ID |
| `TokenService` (Schreiben) | `token_{normalized_profile}` | pro Profil |
| `TokenService` (Lesen) | — (kein Lock) | lock-frei |

### Timeout- und Polling-Regel

- Maximale Wartezeit: **300 ms**
- Polling-Intervall: **25 ms**
- Bei Überschreitung: `RuntimeException("Lock-Timeout nach 300ms: {key}")`
- Die Werte sind Standardwerte in `RuntimeLockRunner`; sie lassen sich
  im Konstruktor überschreiben.

### Race-Test-Nachweis

Der `ConcurrencyTest` belegt, dass jeder Schreibpfad tatsächlich unter
dem erwarteten Lock-Key läuft und der Timeout greift, wenn der Key belegt
ist. Hintergrund und Ergebnis:
[16-3: Race-nahe Tests]({{ "/de/jira/issues/J01-16/steps/J01-19/" | relative_url }}).

## Links

- [J01-98: öffentlicher Arbeitsstand]({{ "/de/jira/issues/J01-98/" | relative_url }})
- [J01-16: Runtime-Concurrency, Locking und atomare Zugriffe]({{
  "/de/jira/issues/J01-16/" | relative_url }})
- [16-3: Race-nahe Tests]({{ "/de/jira/issues/J01-16/steps/J01-19/" | relative_url }})
- [J01-16 im Jira-Mirror]({{ "/de/jira/issues/J01-16/" | relative_url }})
