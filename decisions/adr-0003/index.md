---
layout: page
title: "ADR-0003 Schritt-Reihenfolge: Rank -> Schritt-Nr, Summary-Prefix"
permalink: /decisions/adr-0003/
---

**Status:** Akzeptiert

## Kontext {#kontext}

Subtasks repräsentieren Schritte innerhalb eines Parent-Issues. In team-managed Boards ist das Anzeigen von Custom Fields auf Karten ggf. eingeschränkt; außerdem muss die Reihenfolge nach Umrankieren konsistent bleiben.

## Entscheidung {#entscheidung}

Die Schritt-Reihenfolge wird aus Jira **Rank** abgeleitet:

- Der Backfill setzt pro Parent die numerische Schritt-Nummer in `customfield_10071` („Schritt-Nr“) als 1..n.
- Für Board-Lesbarkeit wird zusätzlich ein Summary-Prefix im Format `<ParentNum>-<SchrittNum> ` gesetzt (Beispiel: `9-1 …`).

## Konsequenzen {#konsequenzen}

- Nach Umrankieren genügt erneuter Backfill (optional mit Force), um Schritt-Nr und Prefix zu synchronisieren.
- Summary wird maschinell verändert; das ist bewusst und kontrolliert (Scope: Subtasks der angegebenen Parents).

## Alternativen {#alternativen}

- Nur Custom Field, kein Prefix: abgelehnt (Parent/Step nicht auf Karten sichtbar).
- Eigener Issue-Key-ähnlicher Identifier: nicht möglich (Jira-Keys sind unveränderlich).

## Links {#links}

- [Runbook: Backfill Schritt-Nr und Summary-Prefix]({{ "/operations/jira-backfill-schritt-nr/" | relative_url }})
