---
layout: page
title: "J01-91: Archiv-Auswertung (Themen, ohne IDs) – 2026-03-06"
permalink: /work/jira/J01-91/archive-topics/
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

## Arbeitsliste (Themen → Übernahme)

Diese Tabelle ist bewusst grob. „Offen“ ist ok, aber muss explizit bleiben,
bis eine Entscheidung getroffen ist.

| Thema | Übernehmen | Dokutyp | Zielpfad | Jira-Bezug | Notiz |
| --- | --- | --- | --- | --- | --- |
| Pipeline/Phase-Terminologie | offen | Bereich / ggf. Glossar (neu) | `areas/cli-build/` | J01-91 | Klären, ob ein kleines Glossar wirklich nötig ist. |
| Typisierung/Validierung | offen | Richtlinie | `policies/programmierleitlinien/` | J01-91 | Konkrete Regeln statt „Guard“-Sammlung. |
| Fehlerkonzept | offen | Richtlinie | `policies/programmierleitlinien/` | J01-91 | Einheitliches Fehler-/Exit-Code-Konzept. |
| Preview/Deployment-Readiness | offen | Runbook | `operations/` | J01-91 | Vorbedingungen/Checks/Rollback als Betrieb. |
| CLI-UX | offen | Bereich | `areas/cli-build/` | J01-91 | Fehlermeldungen, fehlende Config, Phase-Konzept. |
| Config-Policy (Sources/Validation) | offen | Bereich + Policy | `areas/cli-build/` | J01-91 | Schnitt: App ↔ Spec-Repo. |
| i18n | offen | Bereich | `areas/http-runtime/` | J01-91 | Runtime-Meldungen, Templates, Pflege. |
| Runtime-Concurrency/Locking | offen | Bereich | `areas/http-runtime/` | J01-91 | Atomare Zugriffe, Timeouts, Locking. |
| Automations-Layer (Helper) | offen | Bereich | `areas/cli-build/` | J01-91 | Klein halten; nur wenn Nutzen klar. |
| Teststrategie/Testmatrix | offen | Qualität + ggf. Abnahmechecks (neu) | `quality/testmatrix/` | J01-91 | Feinere Check-Seiten nur falls Jira wirklich darauf linken soll. |
| Repo-Hygiene | offen | Richtlinie | `policies/programmierleitlinien/` | J01-91 | Branch-/Commit-/PR-Konventionen. |

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

## Offen (Abstimmung / nächste Präzisierung)

- Pro Thema fehlt aktuell die explizite Entscheidung:
  - Übernehmen ja/nein/offen.
  - Ziel-Dokutyp (ADR/KEP-Lite/Runbook/Policy/Glossar/Abnahmecheck) und Zielpfad.
- Es ist noch nicht belegt, ob die Archivquellen überwiegend nur Referenzen auf
  interne IDs enthalten und ob diese bereits nach J01-xx überführt wurden.
  - Public-Doku bleibt ohne interne IDs; die Zuordnung (falls nötig) gehört in
    eine private Mapping-Notiz.

