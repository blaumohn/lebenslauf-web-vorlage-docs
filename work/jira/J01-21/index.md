---
layout: page
title: "J01-21: Runtime-IP_SALT-Verwaltung und Guardrails"
permalink: /de/work/jira/J01-21/
---

**Stand:** 2026-03-17

<div class="jira-context-bar">
  <span class="jira-context-bar__label">Kontext</span>
  <a class="jira-context-bar__link" href="{{ "/de/mirror/issues/J01-21/" | relative_url }}">J01-21 im Jira-Mirror</a>
</div>

Kanonischer öffentlicher Arbeitsstand für `J01-21`.
Der Vorgang hält den bereits erledigten Referenzpfad für die Runtime-Verwaltung
von `IP_SALT` fest und macht sichtbar, welche Teile dieses Rahmens später in
`J01-16` auf weitere Runtime-Bereiche ausgerollt werden.

## Ziel

`IP_SALT` als runtime-internen Betriebszustand stabil verwalten, statt ihn als
gewöhnlichen aktiven Config-Wert zu behandeln.
Der Pfad soll gleichzeitig den kleinsten belastbaren Referenzrahmen für
Locking, atomare Writes, Guardrails und Recovery im Runtime-Betrieb liefern.

## Abschlussbild

- `IP_SALT` wird runtime-intern unter `var/state` verwaltet
- fehlender oder inkonsistenter Zustand wird deterministisch unter Lock
  bereinigt oder neu erzeugt
- atomare Schreibmuster sichern den Zustandswechsel über Temp-Datei plus
  `rename()`
- Reset und Recovery laufen über einen klaren Betriebsweg statt über
  versteckte Setup-Schalter
- Testnachweise für Erfolgs-, Guardrail- und Fehlerpfade liegen vor

## Referenzrahmen

`J01-21` ist kein offener Sprint-Rest mehr, sondern der erledigte
Referenzvorgang für den Runtime-Rahmen:

- Locking über `symfony/lock`
- begrenzter Lock-Erwerb mit Polling und Timeout
- atomische Writes für Runtime-Zustand
- testbarer Guardrail- und Recovery-Pfad
- klare Trennung zwischen Config-Herkunft und runtime-internem Betriebszustand

Nicht jeder Detailpunkt aus `J01-21` wird später 1:1 auf andere
Runtime-Verwalter übertragen.
Verbindlich als Vorbild sind nur der Locking-Rahmen, atomische Writes,
deterministische Fehlerpfade und ein prüfbarer Lock-Key-Zuschnitt.

## Wiederverwendbarer Rahmen für J01-16

Der fachlich wiederverwendbare Kern aus `J01-21` ist bewusst schmal.
Für die Ausrollung in `J01-16` sollen vor allem diese gemeinsamen Module und
Regeln wiederverwendet werden:

- `RuntimeLockRunner` als gemeinsamer Lock-Rahmen
- `RuntimeAtomicWriter` als gemeinsamer atomischer Schreib-Helfer
- `LockFactory` plus `symfony/lock` als einheitlicher Lock-Mechanismus
- begrenzter Lock-Erwerb mit Polling und Timeout
- Fail-Fast im kritischen Abschnitt mit sicherer Freigabe im Abschluss

Nicht als gemeinsame Pflichtbausteine wiederzuverwenden sind dagegen:

- die konkrete `IP_SALT`-Zustandsmaschine
- globale Recovery-Schritte, die an `IP_SALT` gebunden sind
- Marker wie `IN_PROGRESS` und `READY`, sofern ein anderer Verwalter nur
  einfache Read-Modify-Write-Logik braucht

Der Referenzwert von `J01-21` liegt damit im Rahmen, nicht in der vollständigen
Kopie seines Fachverhaltens.

## Folgebezug zu J01-16

[J01-16]({{ "/de/work/jira/J01-16/" | relative_url }}) zieht diesen Rahmen
auf weitere Runtime-Modelle:

- Rate-Limit unter `var/tmp/ratelimit`
- CAPTCHA-Pfade unter `var/tmp/captcha`
- Token-Rotation unter `var/state/tokens`

`J01-21` bleibt dabei der schmale Vorbildpfad.
`J01-16` ist die breitere Ausrollung, nicht die Neuerfindung desselben
Grundmusters.

Der schrittspezifische Zuschnitt für `16-1` wird in der eigenen
[16-1-Arbeitsdoku]({{ "/de/work/jira/J01-16/steps/J01-17/" | relative_url }})
geführt, damit `J01-21` nur den wiederverwendbaren Rahmen und nicht die
Detailplanung einzelner `16-*`-Schritte trägt.

## Provenienz

Der fachliche Ursprung dieses Vorgangs liegt im früheren `docs/agile`-Strang
`ISS-011`.
Öffentlich führend bleibt heute jedoch `J01-21`; der alte `ISS-*`-Bezug dient
nur noch als Herkunft und nicht mehr als Navigationsschlüssel.

## Links

- [J01-16: Runtime-Concurrency, Locking und atomare Zugriffe]({{
  "/de/work/jira/J01-16/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
- [J01-21 im Jira-Mirror]({{ "/de/mirror/issues/J01-21/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/work/jira/" | relative_url }})
