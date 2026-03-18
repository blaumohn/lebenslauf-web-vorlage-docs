---
layout: page
title: "72-10 — CLI-Cache: erste Cache-V1 vorbereiten (Policy getrennt)"
permalink: /en/mirror/issues/J01-72/steps/J01-83/
jira_key: J01-83
jira_parent_key: J01-72
---

No Jira Cloud links, no email addresses.

<div class="jira-context-bar">
  <span class="jira-context-bar__label">Context</span>
  <span class="jira-context-bar__section">
    <span class="jira-context-bar__section-label">This page</span>
    <a class="jira-context-bar__link" href="{{ "/en/work/jira/J01-83/" | relative_url }}">J01-83 work doc</a>  </span>  <span class="jira-context-bar__section">
    <span class="jira-context-bar__section-label">Parent</span>
    <a class="jira-context-bar__link" href="{{ "/en/mirror/issues/J01-72/" | relative_url }}">J01-72 in the Jira mirror</a>    <a class="jira-context-bar__link" href="{{ "/en/work/jira/J01-72/" | relative_url }}">J01-72 work doc</a>  </span></div>

## Metadata

- **Parent:** [J01-72]({{ "/en/mirror/issues/J01-72/" | relative_url }})
- **Step:** 72-10
- **Status:** Done
- **Updated:** 2026-03-17T13:49:00.196+0100

## Details

Schneidet J01-83 auf eine kleine, schnell ersetzbare erste Cache-Iteration zu und trennt den Policy-Strang ausdrücklich aus.

Vorbild ist J01-95: kleine lokale V1 statt vorgezogener Endlösung.

J01-83 liefert die erste Cache-V1 als aktiv genutzten Skill-Baustein.

Das bestehende Rezept parent-subtasks ist die erste Cache-Zelle, nicht der gesamte Endzustand des Cache.

Alle befehl-nutzenden Projekt-Skills suchen vor wiederkehrenden Jira- oder Confluence-Befehlen zuerst im Cache-Pfad nach einem passenden Rezept.

Wenn ein passendes Rezept fehlt oder driftet, wird es im selben Arbeitsgang angelegt oder nachgezogen.

Die V1 bleibt bewusst klein: keine breite Rezeptbibliothek und keine Snapshot-Pflicht.

Policy-Schärfung für atlassian-tools/curl ist nach J01-101 ausgelagert und bleibt getrennte Folgearbeit.

Die öffentliche work doc, das Tagebuch und der Mirror werden in derselben Runde nachgezogen.

## Links

- [ADR-0002 Tooling: atlassian-http-client Sicherheitsmodell]({{ "/en/decisions/adr-0002/" | relative_url }})
- [J01-83: Erste Cache-V1 vorbereiten und Policy trennen]({{ "/en/work/jira/J01-83/" | relative_url }})
