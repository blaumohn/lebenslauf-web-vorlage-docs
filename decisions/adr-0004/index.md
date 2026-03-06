---
layout: page
title: "ADR-0004 Öffentlich: Jira-Übersicht (statt Jira-Board publizieren)"
permalink: /decisions/adr-0004/
---

**Status:** Akzeptiert (2026-02-27)

## Kontext {#kontext}

Wir wollen Sprint und Projektzustand öffentlich teilen, ohne Jira-Projekt oder Jira-Board öffentlich zu machen.

Ein Confluence-Jira-Makro ist zwar read-only, aber die Daten werden trotzdem aus Jira gelesen; anonyme Nutzer sehen die Issues nur, wenn Jira/Projekt ebenfalls anonymes Browse erlaubt.

Direktes Veröffentlichen des Jira-Boards oder Jira-Projekts hat daher nicht funktioniert (oder wäre sicherheitlich zu teuer).

## Entscheidung {#entscheidung}

Wir veröffentlichen eine statische **Jira-Übersicht** als GitHub Pages in diesem Repo:

- Sprint-Board als Tabelle
- Backlog/Erledigt als Listen
- Zusätzlich Detailseiten pro Vorgang

Die Jira-Übersicht wird manuell aktualisiert (nach Jira-Änderungen); später optional periodisch oder per Webhook.

## Regeln (öffentlich) {#regeln}

- Keine Jira-Cloud-Links.
- Keine E-Mail-Adressen.
- Jira-Keys werden als Text gezeigt.
- Subtasks werden standardmäßig **ohne Key** gezeigt (nur Schritt-Nr/Titel/Zustand).
- Subtasks bekommen nur dann eine eigene Schritt-Seite, wenn sie zusätzliche Angaben enthalten.

## Konsequenzen {#konsequenzen}

- **+** Öffentlich teilbar, ohne Jira zu öffnen; automatisch read-only.
- **+** Layout kontrollierbar (Board-Tabelle, Listen, Details).
- **-** Nicht live; Jira-Übersicht muss aktualisiert werden.
- **-** Zusätzliche Pflege (Skript/Prozess) und potenzieller Drift.

## Alternativen {#alternativen}

- Jira/Projekt öffentlich machen: abgelehnt (Berechtigungen und Privatsphäre).
- Confluence-Jira-Makro direkt nutzen: abgelehnt (anonym sieht ohne Jira-Browse nichts).
- Webhook oder Atlassian-App: vertagt (Endpoint und Deploy und mehr Aufwand).
- Periodischer Batch-Refresh (Cron oder CI): später möglich.

## Links {#links}

- [Jira‑Übersicht (Index)]({{ "/mirror/" | relative_url }})
- [Sprint-Board]({{ "/mirror/sprint-board/" | relative_url }})
- [Backlog]({{ "/mirror/backlog/" | relative_url }})
- [Erledigt]({{ "/mirror/erledigt/" | relative_url }})
- Vorgang (Beispiel): [J01-72]({{ "/mirror/issues/J01-72/" | relative_url }})
