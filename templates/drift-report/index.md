---
layout: page
title: Drift-Report-Vorlage
permalink: /de/templates/drift-report/
---

## Zweck

Ein Drift-Report dokumentiert Abweichungen zwischen Doku-Behauptungen und
dem tatsächlich aktuellen Stand (Code, Konfiguration, Tooling, Betriebsablauf).

## Scope & Regeln

- Scope: Menschen-geschriebene Seiten (kein `mirror/`).
- Quellen: Repo-Code, Konfig-Dateien, Skripte, CLI-Hilfeausgaben.
- Public-Doku: Keine Nennung temporärer Export-/Umwandlungsartefakte und keine
  internen Export-Bezeichner (z. B. Export-IDs) außerhalb expliziter
  Umwandlungsdokus.
  - Hinweis: Produktive lokale Projektdateien (z. B. lokale Runtime-Overrides)
    sind davon nicht gemeint, solange sie keine Secrets enthalten.
  - Ausnahme: Explizite Umwandlungs-/Migrationsdokus dürfen interne Bezeichner
    nennen, wenn es für Nachvollziehbarkeit/Reproduktion nötig ist.

## Ablage

- Reports liegen primär unter `quality/drift-reports/<JIRA-KEY>/`.
- Das Datum steht im Titel/Stand (und optional als Abschnitt), nicht im Pfad.
- Falls ein Ticket mehrere Reports braucht: Unterseiten oder ein Unterordner
  `YYYY-MM-DD/` unterhalb des Jira-Keys.

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
