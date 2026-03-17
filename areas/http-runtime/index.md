---
layout: page
title: "Bereich: HTTP-Runtime"
permalink: /de/areas/http-runtime/
---

Dieser Bereich hält für `J01-98` nur die preview-relevanten
Runtime-Guardrails fest.
Er ersetzt keinen vollständigen Betriebsleitfaden, sondern dokumentiert die
Stabilitätsbasis, die der aktuelle Sprint öffentlich nachweisbar braucht.

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

## Öffentliche Nachweise im Sprint

- Die Feature-Tests prüfen Kontaktformular, CAPTCHA-Bildausgabe und den
  benötigten Runtime-Kontext mit kompilierter Config.
- Die Config-Herleitung für `IP_SALT`, `APP_BASE_PATH` und weitere
  Laufzeitwerte liegt im
  [Bereich: CLI / Build]({{ "/de/areas/cli-build/" | relative_url }}).
- `J01-98` zieht hier nur die Runtime-Aspekte, die den Preview-Betrieb direkt
  absichern.

## Links

- [J01-98: öffentlicher Arbeitsstand]({{ "/de/work/jira/J01-98/" | relative_url }})
- [J01-16 im Jira-Mirror]({{ "/de/mirror/issues/J01-16/" | relative_url }})
- [Testmatrix]({{ "/de/quality/testmatrix/" | relative_url }})
