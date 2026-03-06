---
layout: page
title: "Archiv-Auswertung (Themen, ohne IDs) – 2026-03-06"
permalink: /quality/drift-reports/J01-91/archive-topics/
---

Ziel: Aus archivierten Projektverwaltungs-Texten (lokal) nur die Themen
extrahieren, die voraussichtlich in der aktuellen öffentlichen Doku fehlen
oder besser verankert gehören.

Leitplanke: Public-Doku nennt keine internen Export-Bezeichner und keine
lokalen Export-/Umwandlungsartefakte (Ausnahme: explizite Umwandlungsdokus).

## Wiederkehrende Themen (abstrahiert)

- Terminologie/Modell: Pipeline/Phase (repo-weit konsistent)
- Typensicherheit/Validierung: weniger „Guards“, mehr strukturierte Checks
- Fehlerkonzept: zentral, konsistent, dokumentiert (App + Lib)
- Preview/Deployment-Readiness: Vorbedingungen, Checks, Rollback
- CLI-UX: fehlende Config, klare Fehlermeldungen, Phase-Konzept
- Config-Policy: conditional validation, sources, required/allowed
- i18n: Runtime-Meldungen, Seitenvorlagen/Templates, Übersetzungspflege
- Runtime-Concurrency: Locking, atomare Zugriffe, Timeouts
- Automations-Layer: JSON/local helper layer (wenn sinnvoll, klein halten)
- Teststrategie/Testmatrix: Abnahmechecks + Verlinkung zu konkreten Checks
- Repo-Hygiene: Branch-Strategie, Commit-/PR-Konventionen

## Empfohlene Ablage (wenn übernommen)

- `areas/cli-build/`:
  - CLI-UX, Pipeline/Phase-Terminologie, Build/Preview-Checks
  - Config-Policy (Integration/App-Sicht)
- `areas/http-runtime/`:
  - Runtime-Concurrency/Locking, atomare Zugriffe
  - i18n (Runtime-Messages, Web-Ausgaben)
- `policies/programmierleitlinien/` (oder neue Richtlinie bei Bedarf):
  - Fehlerkonzept, Typisierung/Validierung, Konventionen
- `quality/testmatrix/`:
  - Abnahmechecks als konkrete Seiten + (geplante) Verlinkung aus Jira
- `decisions/`:
  - Entscheidungen, die Alternativen/Folgen haben (nicht als „How-To“)
- `operations/`:
  - Preview/Deployment-Betrieb als Runbooks

## Empfehlung: Zusätzlicher Doku-Typ (nur falls nötig)

Aktuell wirken zwei zusätzliche Typen potenziell sinnvoll:

- **Glossar / Begriffe** (klein):
  - Wenn Pipeline/Phase/Runtime/Build/Preview missverständlich ist und
    mehrfach erklärt werden muss.
- **Abnahmecheck-Seite** (pro Feature/Release):
  - Wenn „Testmatrix“ zu grob ist und Jira wirklich auf einzelne Checks
    verlinken soll.
