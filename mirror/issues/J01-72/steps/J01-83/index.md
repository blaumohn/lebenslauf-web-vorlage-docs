---
layout: page
title: "72-10 — CLI-Cache: erste Cache-V1 vorbereiten (Policy getrennt)"
permalink: /de/mirror/issues/J01-72/steps/J01-83/
---

Keine Jira-Cloud-Links, keine E-Mail-Adressen.

## Metadaten

- **Parent:** [J01-72]({{ "/de/mirror/issues/J01-72/" | relative_url }})
- **Schritt:** 72-10
- **Status:** In Bearbeitung
- **Aktualisiert:** 2026-03-17T11:40:27.759+0100

## Angaben

Schneidet J01-83 auf eine kleine, schnell ersetzbare erste Cache-Iteration zu und trennt den Policy-Strang ausdrücklich aus.

Vorbild ist J01-95: kleine lokale V1 statt vorgezogener Endlösung.

J01-83 liefert nur den Cache-/Rezeptpfad für eine erste Iteration.

Genau ein kleines Referenzrezept genügt; keine breite Rezeptbibliothek und keine Snapshot-Pflicht in V1.

Policy-Schärfung für atlassian-tools/curl ist nach J01-101 ausgelagert und bleibt getrennte Folgearbeit.

Die öffentliche Arbeitsdoku, das Tagebuch und das Quellenregister werden in derselben Runde nachgezogen.

## Links

- [ADR-0002 Tooling: atlassian-http-client Sicherheitsmodell]({{ "/de/decisions/adr-0002/" | relative_url }})
