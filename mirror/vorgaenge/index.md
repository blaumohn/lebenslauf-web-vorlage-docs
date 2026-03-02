---
layout: page
title: "Jira-Spiegel: Vorgänge (statisch)"
permalink: /mirror/vorgaenge/
---

**Stand:** 2026-03-02 11:00 +0100

Statischer Jira-Spiegel (ohne Jira-Cloud-Links).

## Epics

### [J01-5 — Qualitätsrahmen für App und Config-Lib](/mirror/issues/J01-5/)

- [J01-9 — Preview: Workflow wieder aktivieren](/mirror/issues/J01-9/)
  - 9-1 CI-Gates finalisieren
  - 9-2 Deploy-Checks validieren
  - 9-3 Branch-Flow dokumentieren
- [J01-13 — Preview: Testmatrix und Entscheidungen finalisieren](/mirror/issues/J01-13/)
  - 13-1 Entscheidungstabelle finalisieren
  - 13-2 Testmatrix-Nachweise verlinken
- [J01-16 — Runtime: Concurrency, Locking und atomare Zugriffe](/mirror/issues/J01-16/)
  - 16-1 Locking für Rate-Limit und CAPTCHA ausrollen
  - 16-2 Locking für Token-Rotation ausrollen
  - 16-3 Race-nahe Tests ergänzen
  - 16-4 Betriebsnotiz aktualisieren
- [J01-28 — Analyse: Risikomuster und Befundliste](/mirror/issues/J01-28/)
  - 28-1 Befunde erfassen
  - 28-2 Priorisierung und Folge-Tickets
- [J01-31 — Preview Readiness: System-Source-Verarbeitung](/mirror/issues/J01-31/)
  - 31-1 Guard-Strategie finalisieren
  - 31-2 Produktions-Pattern Vergleich dokumentieren
- [J01-34 — CLI-UX: Missing-Config und Pipeline-Phase](/mirror/issues/J01-34/)
  - 34-1 Pipeline-Phase-Syntax festlegen
  - 34-2 Missing-Config-Befehl definieren
- [J01-37 — Config: Konditionelle Validierung](/mirror/issues/J01-37/)
  - 37-1 Schema um Bedingungen erweitern
  - 37-2 Validierung + Doku ergänzen
- [J01-40 — Runtime: Technische Konstanten vereinheitlichen](/mirror/issues/J01-40/)
  - 40-1 Konstanten-Schnitt definieren
  - 40-2 Pfad/Key-Duplikate entfernen
- [J01-43 — Preview: FTP/FTPS-Verwaltungsskripte](/mirror/issues/J01-43/)
  - 43-1 Marker/Signaldatei-Flow definieren
  - 43-2 Doku + Tests ergänzen

### [J01-6 — i18n für Seitenvorlagen und Templates](/mirror/issues/J01-6/)

- [J01-46 — i18n: CLI- und Runtime-Nachrichten](/mirror/issues/J01-46/)
  - 46-1 Message-IDs und Format definieren
  - 46-2 Ausgaben in App + Config-Lib umstellen
- [J01-49 — i18n: Template-Texte i18n-fähig machen](/mirror/issues/J01-49/)
  - 49-1 Template-Text-Keys definieren
  - 49-2 DE/EN Mindestumfang liefern

### [J01-7 — Production Deployment](/mirror/issues/J01-7/)

- [J01-62 — Production: Branch- und Environment-Regeln aktivieren](/mirror/issues/J01-62/)
  - 62-1 Branch-Mapping festlegen
  - 62-2 Environment aktivieren
- [J01-65 — Production: Artefakt- und Smoke-Checks definieren](/mirror/issues/J01-65/)
  - 65-1 Artefaktliste festlegen
  - 65-2 Post-Deploy-Smoke definieren
- [J01-68 — Production: Betriebsdoku und Runbook](/mirror/issues/J01-68/)
  - 68-1 Betriebsdoku erstellen
  - 68-2 Rollback/Notfallpfad skizzieren

### [J01-8 — Backlog-Kandidaten](/mirror/issues/J01-8/)

- [J01-52 — Backlog: Typensicherheit statt Guards](/mirror/issues/J01-52/)
  - 52-1 Scope skizzieren
- [J01-54 — Backlog: Zentrales Fehlerkonzept](/mirror/issues/J01-54/)
  - 54-1 Scope skizzieren
- [J01-56 — Backlog: Bibliotheks-APIs konsequent ausschoepfen](/mirror/issues/J01-56/)
  - 56-1 Scope skizzieren
- [J01-58 — Backlog: Pipeline-Phase Terminologie repo-weit](/mirror/issues/J01-58/)
  - 58-1 Scope skizzieren
- [J01-60 — Backlog: SMTP-Empfangsnachweis mit Konto-Beteiligung](/mirror/issues/J01-60/)
  - 60-1 Scope skizzieren

### [J01-84 — Atlassian-System vorbereiten (SSOT)](/mirror/issues/J01-84/)

- [J01-72 — Atlassian-System vorbereiten (SSOT) – Iteration 1: Umsetzungsschritte](/mirror/issues/J01-72/)
  - 72-1 Altlast: J01-3 Status klären
  - 72-2 Sprint 2: Backfill ausführen (Schritt-Nr + Prefix)
  - 72-3 Rank-Endpoint verifizieren (No-Op)
  - 72-4 CLI: jira ext backfill schritt-nr implementieren
  - 72-5 Spiegel-Anzeige für Epics/Aufgaben: Vorgangsnummern + eigene Seiten
  - 72-6 Spiegel-Links umstellen (nur Confluence-Spiegel-Links)
  - 72-7 Spiegel-Anzeige für Unteraufgaben: nur Summary-Prefix
  - 72-8 Projektweit: Subtask-Reihenfolge gegen Export prüfen
  - 72-9 Board-Sicht prüfen (Prefix-Format 9-1)
  - 72-10 CLI-Cache: Public-only Policy + Output-Redaction + Endpoint-Allowlist
  - 72-11 Öffentlich: Confluence-Spiegel für Sprint + Backlog (ohne Links)
  - 72-12 Doku-Struktur: Confluence konsolidieren, GitHub Pages ausbauen
- [J01-85 — Atlassian-System vorbereiten (SSOT) – Tooling-Backlog-Container](/mirror/issues/J01-85/)
  - 85-1 Refactor: Coding-Standards durchgehend umsetzen
  - 85-2 API-Betriebe (Wrapper), http als Escape-Hatch
  - 85-3 Backlog: Confluence-Spiegel periodisch aktualisieren (Batch; optional Warteschlange)

## Ohne Epic

- [J01-79 — Atlassian CLI: API-Betriebe (Wrapper), http als Escape-Hatch](/mirror/issues/J01-79/)
- [J01-80 — Atlassian Tools: Refactor – AGENTS Coding-Standards durchgehend umsetzen](/mirror/issues/J01-80/)
