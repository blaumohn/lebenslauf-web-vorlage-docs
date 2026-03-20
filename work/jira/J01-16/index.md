---
layout: page
title: "J01-16: Runtime-Concurrency, Locking und atomare Zugriffe"
jira_key: J01-16
permalink: /de/jira/issues/J01-16/
---

**Stand:** 2026-03-20

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-16`.
Der Vorgang führt den bereits erprobten Runtime-Rahmen aus
[J01-21]({{ "/de/jira/issues/J01-21/" | relative_url }}) auf weitere kritische
Dateizugriffe aus und bündelt die abgeschlossene Concurrency- und
Locking-Ausrollung des Preview-Pfads.

## Ziel

Kritische Runtime-Schreibpfade im Preview-Betrieb unter Parallelzugriff
konsistent machen:

- Rate-Limit
- CAPTCHA-Verifikation
- Token-Rotation

Dabei soll `J01-16` den Rahmen aus `J01-21` sichtbar übernehmen, aber nur dort
kopieren, wo das Fachverhalten es wirklich trägt.

## Referenzpfad

Der erledigte Vorgang [J01-21]({{ "/de/jira/issues/J01-21/" | relative_url }})
ist das Vorbild für diesen Strang.
Von dort werden für `J01-16` verbindlich übernommen:

- Locking über `symfony/lock`
- begrenzter Lock-Erwerb mit Polling und Timeout
- atomische Writes für zustandsverändernde Dateipfade
- testbare Lock-Key-Strategie statt verdeckter Seiteneffekte
- deterministische Fehler- und Recovery-Pfade

Bewusst **nicht** blind übernommen wird jedes Detail des `IP_SALT`-Pfads.
Insbesondere bleiben mehrstufige Marker wie `IN_PROGRESS` und `READY` für
andere Verwalter nur dann passend, wenn ihr eigenes Fachverhalten denselben
Übergang wirklich braucht.

## Abschlussbild

- Locking für Rate-Limit- und CAPTCHA-Pfade ist über
  [16-1: Locking für Rate-Limit und CAPTCHA ausrollen]({{
  "/de/jira/issues/J01-16/steps/J01-17/" | relative_url }}) abgeschlossen.
- Locking für Token-Rotation ist über
  [16-2: Locking für Token-Rotation ausrollen]({{
  "/de/jira/issues/J01-16/steps/J01-18/" | relative_url }}) abgeschlossen.
- Race-nahe Tests für die neuen Zielbereiche sind über
  [16-3: Race-nahe Tests ergänzen]({{
  "/de/jira/issues/J01-16/steps/J01-19/" | relative_url }}) abgeschlossen.
- Die öffentliche Betriebsnotiz zum gelockten Runtime-Bereich ist über
  [16-4: Betriebsnotiz aktualisieren]({{
  "/de/jira/issues/J01-16/steps/J01-20/" | relative_url }}) nachgezogen.

## Delta 2026-03-20

- Die zuvor noch uncommitteten App-Reste aus `16-1` und `16-2` wurden im
  Quell-Repo auf `feature/j01-16-runtime-locking` in zwei getrennten Commits
  nachgezogen:
  `ee45a62` für `J01-17` und `8ab08e4` für `J01-18`.
- `php bin/cli config lint dev` läuft grün.
- Die betroffenen PHPUnit-Tests für `CaptchaService`, `RateLimiter`,
  `TokenService` und `ConcurrencyTest` laufen mit gesetztem `TMPDIR` grün.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Rate-Limit- und CAPTCHA-Schreibpfade laufen unter Lock | `16-1` dokumentiert Lock-Zuschnitt, atomische Writes und Zieloperationen | [16-1]({{ "/de/jira/issues/J01-16/steps/J01-17/" | relative_url }}) | erledigt |
| Token-Rotation ist gegen Parallelzugriff abgesichert | `16-2` führt Lock-Key, atomisches Schreibverhalten und grüne Tests | [16-2]({{ "/de/jira/issues/J01-16/steps/J01-18/" | relative_url }}) | erledigt |
| Race-nahe Tests sichern die Locking-Ausrollung ab | `16-3` zeigt die sieben Testnachweise für Timeout- und Konsistenzfälle | [16-3]({{ "/de/jira/issues/J01-16/steps/J01-19/" | relative_url }}) | erledigt |
| Öffentliche Runtime-Betriebsdoku trägt denselben Endstand | `16-4` zieht den Bereich auf einen stabilen Langzeitzustand nach | [16-4]({{ "/de/jira/issues/J01-16/steps/J01-20/" | relative_url }}) | erledigt |
| Jira, Arbeitsdoku und öffentlicher Jira-Stand sind konsistent | `J01-16` ist in Jira auf `Erledigt` mit `Lösung = Fertig` gesetzt; die öffentliche Doku widerspricht nicht mehr | Jira-Cloud, diese Seite, öffentlicher Jira-Nachzug | erledigt |

## Öffentliche Wirkung im Preview-Pfad

`J01-16` ist Teil des Sprint-Ziels für das Preview-Deployment.
Der Vorgang macht die Stabilitätsbasis sichtbar, auf die der Preview-Pfad sich
für wiederholbare Runtime-Zugriffe stützt.
Die kanonische Bereichsaussage bleibt im
[Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }}); diese
Seite hält den vorgangsbezogenen Abschlussstand.

## Provenienz

Der fachliche Ursprung liegt im früheren `docs/agile`-Strang `ISS-012`, der
direkt an den schmaleren Referenzpfad aus `ISS-011` anschloss.
Im heutigen Jira-Zuschnitt werden diese beiden historischen Quellen über
`J01-16` und den erledigten Referenzvorgang `J01-21` öffentlich geführt.
Die Tagebuch-Notizen vom 2026-03-18 und 2026-03-19 dokumentieren zusätzlich,
dass `16-3`, `16-4` und der Abschluss von `J01-16` im Sprint tatsächlich
vollzogen wurden, auch wenn der öffentliche Nachzug zeitweise hinterherhing.
Die heutige Korrekturrunde schließt zusätzlich den bis dahin noch offenen
Unterschied zwischen öffentlicher Schrittdoku und lokalem App-Arbeitsbaum.

## Abschluss

`J01-16` ist fachlich abgeschlossen.
Der Runtime-Rahmen aus `J01-21` ist für Rate-Limit, CAPTCHA und
Token-Rotation ausgerollt, die race-nahen Tests liegen vor, und die
öffentliche Betriebsnotiz trägt denselben Endstand.
Der noch offene Punkt lag nicht mehr in Jira oder im Code, sondern nur im
verspäteten öffentlichen Sync dieser Arbeitsdoku.

## Links

- [J01-21: Runtime-IP_SALT-Verwaltung und Guardrails]({{
  "/de/jira/issues/J01-21/" | relative_url }})
- [16-1: Locking für Rate-Limit und CAPTCHA ausrollen]({{
  "/de/jira/issues/J01-16/steps/J01-17/" | relative_url }})
- [16-2: Locking für Token-Rotation ausrollen]({{
  "/de/jira/issues/J01-16/steps/J01-18/" | relative_url }})
- [16-3: Race-nahe Tests ergänzen]({{
  "/de/jira/issues/J01-16/steps/J01-19/" | relative_url }})
- [16-4: Betriebsnotiz aktualisieren]({{
  "/de/jira/issues/J01-16/steps/J01-20/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
- [J01-16 im Jira-Mirror]({{ "/de/jira/issues/J01-16/" | relative_url }})
- [Sprint 1: Planning]({{ "/de/work/sprints/scrum-sprint-1/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
