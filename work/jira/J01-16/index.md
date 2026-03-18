---
layout: page
title: "J01-16: Runtime-Concurrency, Locking und atomare Zugriffe"
jira_key: J01-16
permalink: /de/jira/issues/J01-16/
---

**Stand:** 2026-03-17

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-16`.
Der Vorgang führt den bereits erprobten Runtime-Rahmen aus
[J01-21]({{ "/de/jira/issues/J01-21/" | relative_url }}) auf weitere kritische
Dateizugriffe aus und bündelt den noch offenen Concurrency- und Locking-Rest
des Preview-Pfads.

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

## Offener Zuschnitt

- Locking für Rate-Limit- und CAPTCHA-Pfade ausrollen
  über [16-1: Locking für Rate-Limit und CAPTCHA ausrollen]({{
  "/de/jira/issues/J01-16/steps/J01-17/" | relative_url }})
- Locking für Token-Rotation ausrollen
- race-nahe Tests für die neuen Zielbereiche ergänzen
- öffentliche Betriebsnotiz zum gelockten Runtime-Bereich nachziehen

## Öffentliche Wirkung im Preview-Pfad

`J01-16` ist Teil des Sprint-Ziels für das Preview-Deployment.
Der Vorgang macht die Stabilitätsbasis sichtbar, auf die der Preview-Pfad sich
für wiederholbare Runtime-Zugriffe stützt.
Die kanonische Bereichsaussage bleibt im
[Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }}); diese
Seite hält den vorgangsbezogenen offenen Arbeitsstand.

## Provenienz

Der fachliche Ursprung liegt im früheren `docs/agile`-Strang `ISS-012`, der
direkt an den schmaleren Referenzpfad aus `ISS-011` anschloss.
Im heutigen Jira-Zuschnitt werden diese beiden historischen Quellen über
`J01-16` und den erledigten Referenzvorgang `J01-21` öffentlich geführt.

## Links

- [J01-21: Runtime-IP_SALT-Verwaltung und Guardrails]({{
  "/de/jira/issues/J01-21/" | relative_url }})
- [16-1: Locking für Rate-Limit und CAPTCHA ausrollen]({{
  "/de/jira/issues/J01-16/steps/J01-17/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
- [J01-16 im Jira-Mirror]({{ "/de/jira/issues/J01-16/" | relative_url }})
- [Sprint 1: Planning]({{ "/de/work/sprints/scrum-sprint-1/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
