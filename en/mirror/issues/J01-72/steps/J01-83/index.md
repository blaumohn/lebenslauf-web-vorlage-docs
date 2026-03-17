---
layout: page
title: "72-10 — CLI-Cache: erste Cache-V1 vorbereiten (Policy getrennt)"
permalink: /en/mirror/issues/J01-72/steps/J01-83/
---

No Jira Cloud links, no email addresses.

## Metadata

- **Parent:** [J01-72]({{ "/en/mirror/issues/J01-72/" | relative_url }})
- **Step:** 72-10
- **Status:** In Progress
- **Updated:** 2026-03-17T11:40:27.759+0100

## Details

Schneidet J01-83 auf eine kleine, schnell ersetzbare erste Cache-Iteration zu und trennt den Policy-Strang ausdrücklich aus.

Vorbild ist J01-95: kleine lokale V1 statt vorgezogener Endlösung.

J01-83 liefert nur den Cache-/Rezeptpfad für eine erste Iteration.

Genau ein kleines Referenzrezept genügt; keine breite Rezeptbibliothek und keine Snapshot-Pflicht in V1.

Policy-Schärfung für atlassian-tools/curl ist nach J01-101 ausgelagert und bleibt getrennte Folgearbeit.

Die öffentliche Arbeitsdoku, das Tagebuch und das Quellenregister werden in derselben Runde nachgezogen.

## Links

- [ADR-0002 Tooling: atlassian-http-client Sicherheitsmodell]({{ "/en/decisions/adr-0002/" | relative_url }})
