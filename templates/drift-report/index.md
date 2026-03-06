---
layout: page
title: Drift-Report-Vorlage
permalink: /templates/drift-report/
---

## Zweck

Ein Drift-Report dokumentiert Abweichungen zwischen Doku-Behauptungen und
dem tatsächlich aktuellen Stand (Code, Konfiguration, Tooling, Betriebsablauf).

## Scope & Regeln

- Scope: Menschen-geschriebene Seiten (kein `mirror/`).
- Quellen: Repo-Code, Konfig-Dateien, Skripte, CLI-Hilfeausgaben.
- Public-Doku: Keine Nennung lokaler Export-/Arbeitsartefakte und keine
  internen Export-Bezeichner.
  - Ausnahme: Explizite Umwandlungs-/Migrationsdokus dürfen die internen
    Bezeichner nennen, wenn es für Nachvollziehbarkeit zwingend ist.

## Ablage

- Reports liegen unter `quality/drift-reports/YYYY-MM-DD/`.
- Pro Tag idealerweise ein Report (bei Bedarf mehrere, dann mit Suffix).

## Format (Tabelle)

Spalten (empfohlen):

- `Prio`: P0 (führt sicher zu falschem Vorgehen), P1 (irreführend),
  P2 (veraltet/unklar), P3 (Lücke/Platzhalter)
- `Seite`: Pfad oder Link in dieser Doku
- `Claim`: 1 Satz, was die Doku behauptet
- `Quelle`: Datei/Repo/Command, die den Ist-Stand belegt
- `Status`: `bestätigt`, `unklar`, `geplant`, `behoben`
- `Fix`: 1 Satz, was konkret geändert werden soll
- `Jira`: optional, nur Ticket-ID (z.B. `J01-123`)

