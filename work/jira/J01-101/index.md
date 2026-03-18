---
layout: page
title: "J01-101: Policy-Schärfung für CLI-Cache getrennt vorbereiten"
permalink: /de/work/jira/J01-101/
---

**Stand:** 2026-03-17

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-101`.
Der Vorgang trägt die vom Cache getrennte Policy-Folgearbeit für den
CLI-Cache-Strang im Bereich `atlassian-tools/curl`.

## Ziel

Die spätere Policy-Schärfung für den CLI-Cache als eigenen Backlog-Kandidaten
vorhalten, damit `J01-83` klein und austauschbar bleiben kann.

## Rolle im Backlog

- nicht Teil der ersten Cache-Iteration aus `J01-83`
- expliziter Kandidat für einen späteren Sprint
- kein versteckter Rest im Cache-V1-Scope

## Themen im Vorgang

- spätere Prüfung von Public-only-Regeln und Output-Grenzen
- mögliche Curl-/Wrapper-Schärfung im Bereich `atlassian-tools/curl`
- getrennte Sicherheits- und Policy-Bewertung statt impliziter Mitnahme im
  Cache-Strang

## Abgrenzung zu J01-83

- [J01-83]({{ "/de/work/jira/J01-83/" | relative_url }}) bleibt auf die
  kleine Cache-V1 beschränkt.
- `J01-101` zieht nichts in die erste Iteration hinein, was breitere
  Sicherheits- oder Policy-Prüfung braucht.

## Links

- [J01-83: Erste Cache-V1 vorbereiten und Policy trennen]({{
  "/de/work/jira/J01-83/" | relative_url }})
- [ADR-0002: atlassian-http-client Sicherheitsmodell]({{
  "/de/decisions/adr-0002/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/work/jira/" | relative_url }})
