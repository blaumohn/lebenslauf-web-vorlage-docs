---
layout: page
title: Programmierleitlinien
permalink: /policies/programmierleitlinien/
---

Diese Leitlinien sollen Code für Review, Wartung und Betrieb klar machen.

## Struktur

- Kleine Funktionen: eine Aufgabe, klarer Name, frühe Rückgaben.
- Geringe Verschachtelung (max. 2 Ebenen).
- Keine tiefen Ausdrucksverschachtelungen: Zwischenschritte benennen.

## Tests & Sicherheit

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
