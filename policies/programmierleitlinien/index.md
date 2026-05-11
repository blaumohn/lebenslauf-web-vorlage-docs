---
layout: page
title: Programmierleitlinien
permalink: /de/policies/programmierleitlinien/
---

Diese Leitlinien sollen Code für Review, Wartung und Betrieb klar machen.

## Automatisierte Prüfung

Automatisierbare Stil- und Qualitätsregeln werden in Linter-Konfigurationen
gepflegt, nicht in dieser Leitlinie dupliziert.

Als kompaktes Vorbild für die Art der Stilprüfung dient die
[Pylint-Konfiguration in `lebenslauf-web-vorlage`](https://github.com/blaumohn/lebenslauf-web-vorlage/blob/main/.pylintrc).

Die konkreten Werkzeuge und Werte werden je Repo in den jeweiligen
Linter-Konfigurationen gepflegt.

## Fachliche Stilregeln

- Jede Funktion hat genau eine klar erkennbare Aufgabe.
- Funktionsnamen beschreiben die Aufgabe fachlich konkret.
- Programmdateien sollen den fachlichen Ablauf möglichst von oben nach unten
  lesbar machen: zuerst Zweck und Hauptfluss, danach Details.
- Öffentliche Funktionen, Orchestrierung und Hauptpfade stehen vor
  kleinteiligen Hilfsfunktionen, sofern Sprache oder Repo-Konvention keine
  andere Reihenfolge verlangen.
- Hilfsfunktionen stehen dort, wo sie den Hauptfluss verständlich machen; wenn
  sie ihn verdecken, gehören sie in ein eigenes Modul.
- Diese Sortierung dient der Verständlichkeit. Reine Umordnung ohne fachlichen
  Nutzen ist keine eigene Refaktorierungsaufgabe.

## Tests & Sicherheit

- Passende Linting- und Testprüfungen müssen erfolgreich laufen, bevor eine
  Änderung als erledigt gilt.
- Tests dort ergänzen, wo Fehler teuer wären (Parsing, I/O, Deploy-Pfade).
- Secrets nie in Logs oder Doku.
- Öffentliche Doku: keine Jira-Cloud-Links und keine personenbezogenen Daten.

## Dokumentation im Code

- Öffentliche Erklärungen in GitHub Pages.
- Runbooks für Schrittfolgen (Betrieb/Wartung/Störung).
- Entscheidungen als ADRs, Vorschläge als KEP-Lite.

## Commits (Jira-Verknüpfung)

- Commit-Messages enthalten einen Jira-Key (z. B. `J01-91`), damit Jira die
  Änderung zuverlässig zuordnen kann.
- Format: Conventional Commit + Jira-Key am Ende (empfohlen in Klammern).
  Beispiel: `docs: drift-report strukturieren (J01-91)`
