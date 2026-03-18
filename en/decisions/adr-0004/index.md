---
layout: page
title: "ADR-0004 Öffentlich: Jira-Übersicht (statt Jira-Board publizieren)"
permalink: /en/decisions/adr-0004/
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
- The base record of a subtask is step number, title, and status.
- Pure step-page metadata such as parent, step number, status, key, or
  updated timestamp do not count as additional details.
- Subtasks only get their own step page if they contain additional details.
  - Additional details are the subtask's own domain content or canonical
    links beyond the base record and metadata.
  - A dedicated `work/jira/J01-<KEY>/` page or a canonical Jira remote link
    to that page counts as an additional detail.

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

- [Jira‑Übersicht (Index)]({{ "/en/jira/" | relative_url }})
- [Sprint-Board]({{ "/en/jira/sprint/" | relative_url }})
- [Backlog]({{ "/en/jira/backlog/" | relative_url }})
- [Erledigt]({{ "/en/jira/erledigt/" | relative_url }})
- Vorgang (Beispiel): [J01-72]({{ "/en/jira/issues/J01-72/" | relative_url }})
