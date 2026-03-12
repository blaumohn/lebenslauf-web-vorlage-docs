---
layout: page
title: "J01-91: Archiv-Auswertung (Themen, ohne IDs) – 2026-03-06"
permalink: /en/work/jira/J01-91/archive-topics/
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

Diese Tabelle ist eine **Bewertung auf Prüfstand**, keine Festlegung.
Sie bewertet je Thema:

- welche Jira-Vorgänge **wahrscheinlich** betroffen sind,
- welche Dokutypen nach `policies/doku-richtlinie/` **naheliegen**,
- ob dafür schon eine passende Vorlage unter `templates/` existiert,
- und welche URI-/Pfadfamilie **wahrscheinlich** passt.

Genau dort, wo diese Punkte noch nicht belastbar sind, bleibt der Stand
ausdrücklich `offen`.

| Thema | Übernahme-Stand | Genauigkeit (Bewertung) | Dokutyp(en) prüfen | Template-Stand | Möglicher Zielpfad / URI-Muster | Jira-Bezug (Kandidaten) | Notiz |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Pipeline/Phase-Terminologie | wahrscheinlich | zuerst vorgang-genaue Vorarbeit, danach kanonisch | `KEP-Lite`, Bereichsseite, optional Glossar | `KEP-Lite` vorhanden; Glossar fehlt | `work/jira/J01-58/` oder später `areas/cli-build/` | `J01-58`, `J01-34` | Glossar nur wenn Bereichsseite die Begriffe nicht sauber trägt; neuer Typ bräuchte Policy-Delta + Vorlage. |
| Typisierung/Validierung | wahrscheinlich | zuerst vorgang-genau, danach kanonisch | `KEP-Lite` + Richtlinie | vorhanden | `work/jira/J01-52/`, `work/jira/J01-37/` oder später `policies/programmierleitlinien/` | `J01-52`, `J01-37`, `J01-28` | Die Agile-Quellen wirken eher wie Umbau-/Trennungsvorschläge und sollten nicht 1:1 als End-Richtlinie übernommen werden. |
| Fehlerkonzept | wahrscheinlich | zuerst vorgang-genau, danach kanonisch | `KEP-Lite` + Richtlinie, evtl. `ADR` | vorhanden | `work/jira/J01-54/` oder später `policies/programmierleitlinien/` bzw. `decisions/adr-xxxx/` | `J01-54` | Wenn Alternativen/Folgen explizit entschieden werden müssen, ist `ADR` wahrscheinlicher als nur Richtlinie. |
| Preview/Deployment-Readiness | wahrscheinlich | mehrere Vorgänge, danach kanonisch | `Runbook` + `Testmatrix`, ggf. `KEP-Lite` | vorhanden | `work/jira/J01-31/`, `work/jira/J01-13/`, `work/jira/J01-9/`, `work/jira/J01-43/` oder später `operations/<slug>/`, `quality/testmatrix/` | `J01-31`, `J01-13`, `J01-9`, `J01-43` | Die Agile-Dokus wirken hier klar trennbar: Betriebsablauf, Nachweise und Änderungsplan sind nicht dieselbe Doku. |
| CLI-UX | wahrscheinlich | zuerst vorgang-genau, danach kanonisch | `KEP-Lite` oder Bereichsseite | `KEP-Lite` vorhanden; Bereich nutzt vorhandene Überblicks-/Richtlinienvorlage | `work/jira/J01-34/` oder später `areas/cli-build/` | `J01-34` | Endzustand eher als Bereichsdoku; konkrete Umbauarbeit eher als `KEP-Lite`. |
| Config-Policy (Sources/Validation) | wahrscheinlich | zuerst vorgang-genau, danach kanonisch | `KEP-Lite` + Bereichsseite + ggf. Richtlinie | vorhanden | `work/jira/J01-37/`, `work/jira/J01-31/` oder später `areas/cli-build/`, `policies/<slug>/` | `J01-37`, `J01-31`, `J01-40` | Hier ist die Trennung besonders wichtig: App-Sicht, Spec-/Policy-Regel und Umbauplan sind verschiedene Dokus. |
| i18n | wahrscheinlich | mehrere Vorgänge, danach kanonisch | `KEP-Lite` + Bereichsseite | vorhanden | `work/jira/J01-46/`, `work/jira/J01-49/` oder später `areas/http-runtime/` | `J01-46`, `J01-49`, `J01-6` | Runtime-Messages und Template-Texte sollten vermutlich nicht in einer einzigen Endseite landen. |
| Runtime-Concurrency/Locking | wahrscheinlich | zuerst vorgang-genau, danach kanonisch | `ADR` oder `KEP-Lite` + Bereichsseite | vorhanden | `work/jira/J01-16/`, `work/jira/J01-21/` oder später `areas/http-runtime/`, ggf. `decisions/adr-xxxx/` | `J01-16`, `J01-21` | Lock-Strategie/Guardrails riechen nach Entscheidungsdoku; Betriebs- und Architekturteil gehört getrennt. |
| Automations-Layer (Helper) | eher nein | derzeit offen; kein kanonischer Zielort belegt | falls reaktiviert: `KEP-Lite` | vorhanden | vorerst kein Zielpfad festziehen | kein `J01-*` direkt belegt | Im Archiv ist das Thema da, im aktuellen Jira-Spiegel aber nicht als eigener Vorgang belegt; erst bei neuer Priorisierung wieder aufnehmen. |
| Teststrategie/Testmatrix | wahrscheinlich | zuerst vorgang-genau, danach kanonisch | `Testmatrix`, optional Abnahmecheck-Seiten | `Testmatrix` vorhanden; Abnahmecheck fehlt | `work/jira/J01-13/` oder später `quality/testmatrix/` | `J01-13` | Abnahmecheck als eigener Typ nur wenn eine feinere, direkt verlinkbare Einheit wirklich gebraucht wird. |
| Repo-Hygiene | wahrscheinlich | zuerst vorgang-genau, danach kanonisch | Richtlinie + ggf. `Runbook` | vorhanden | `work/jira/J01-25/` oder später `policies/programmierleitlinien/`, ggf. `operations/<slug>/` | `J01-25` | Dauerregeln und konkrete Abläufe sollten getrennt werden. |

## Dateiliste aus `docs/agile` (Kernquellen pro Thema)

- **Pipeline/Phase-Terminologie**
  - `backlog/items/BLC-004-pipeline-phase-terminologie-repo-weit.md`
  - `issues/ISS-006-cli-ux-config-missing-and-pipeline-phase.md`
  - `issues/STY-001-qualitaetsrahmen-repo-app-und-config-lib.md`
- **Typisierung/Validierung**
  - `backlog/items/BLC-001-typensicherheit-statt-guards.md`
  - `issues/ISS-003-phase-rules-typing-and-clarity.md`
  - `issues/ISS-007-conditional-config-validation.md`
  - `issues/ISS-002-preview-system-source-readiness.md`
- **Fehlerkonzept**
  - `backlog/items/BLC-002-zentrales-fehlerkonzept.md`
  - `issues/ISS-008-i18n-cli-runtime-messages-app-und-config-lib.md`
- **Preview/Deployment-Readiness**
  - `issues/ISS-002-preview-system-source-readiness.md`
  - `issues/ISS-004-dev-branch-foundation-and-repo-hygiene.md`
  - `issues/ISS-005-preview-workflow-reenable-from-dev.md`
  - `issues/ISS-010-preview-workflow-testmatrix-und-entscheidungen.md`
  - `issues/ISS-013-ftp-ftps-verwaltungs-skripte-fuer-preview-betrieb.md`
- **CLI-UX**
  - `issues/ISS-006-cli-ux-config-missing-and-pipeline-phase.md`
- **Config-Policy (Sources/Validation)**
  - `issues/ISS-007-conditional-config-validation.md`
  - `issues/ISS-002-preview-system-source-readiness.md`
  - `issues/ISS-014-app-interne-konstanten-fuer-pfade-und-runtime-schluessel.md`
- **i18n**
  - `issues/ISS-008-i18n-cli-runtime-messages-app-und-config-lib.md`
  - `issues/STY-002-i18n-seitenvorlagen-und-templates.md`
- **Runtime-Concurrency/Locking**
  - `issues/ISS-011-ip-salt-runtime-verwaltung-und-guardrails.md`
  - `issues/ISS-012-runtime-concurrency-locking-und-atomare-zugriffe.md`
  - `issues/ISS-011-012-anlage-naeherung-und-commitfolge.md`
  - `issues/ISS-012-anlage-verwalter-programmfluss-und-betriebsvergleich.md`
- **Automations-Layer (Helper)**
  - `issues/ISS-009-json-local-automation-layer.md`
- **Teststrategie/Testmatrix**
  - `issues/ISS-010-preview-workflow-testmatrix-und-entscheidungen.md`
  - `issues/ISS-005-preview-workflow-reenable-from-dev.md`
- **Repo-Hygiene**
  - `issues/ISS-004-dev-branch-foundation-and-repo-hygiene.md`

Leitplanke:
- Die Dateiliste markiert nur die Kernquellen aus `docs/agile`.
- Sie ist noch **keine** Aussage darüber, ob daraus je Thema eine oder mehrere
  Ziel-Dokus entstehen.

## Mögliche Zielorte / URI-Muster (nach Dokutyp)

- Vorgang-genaue Vorarbeit:
  - `work/jira/J01-<KEY>/`
- Bereichsseiten / kanonische Fachbeschreibung:
  - `areas/cli-build/`
  - `areas/http-runtime/`
- Richtlinien:
  - `policies/programmierleitlinien/` oder andere `policies/<slug>/`
- Runbooks:
  - `operations/<slug>/`
- Testmatrix:
  - `quality/testmatrix/` oder `quality/testmatrix/<slug>/`
- ADR:
  - `decisions/adr-xxxx/`
- KEP-Lite:
  - Vorlage ist vorhanden, ein kanonisches URI-Muster unter `decisions/`
    ist im Repo aber noch nicht belegt; bis zur Klärung nur als Policy-Delta
    vormerken.
- Neue Typen:
  - erst nach `templates/<typ>/`, Eintrag in `templates/` und Policy-Delta
    mit kanonischem URI-/Pfadmuster.

## Empfehlung: Zusätzlicher Doku-Typ (nur falls nötig)

Aktuell wirken zwei zusätzliche Typen potenziell sinnvoll:

- **Glossar / Begriffe** (klein):
  - Wenn Pipeline/Phase/Runtime/Build/Preview missverständlich ist und
    mehrfach erklärt werden muss.
  - Fehlt aktuell als Typ: bräuchte `templates/<typ>/` + Policy-Delta.
- **Abnahmecheck-Seite** (pro Feature/Release):
  - Wenn „Testmatrix“ zu grob ist und Jira wirklich auf einzelne Checks
    verlinken soll.
  - Fehlt aktuell als Typ: bräuchte `templates/<typ>/` + Policy-Delta.

## Präzisierung: Ziel-Dokutyp + Ziel-Genauigkeit

- `work/jira/J01-<KEY>/`:
  - wenn Scope, offene Entscheidungen, Mapping, Nachweise oder Zwischenstände
    an genau einen Jira-Vorgang gebunden sind.
- `quality/drift-reports/J01-<KEY>/`:
  - nur wenn ein Drift-Befund dokumentiert wird
    (Behauptung ↔ Quelle ↔ Status ↔ Fix).
- Kanonische Fachseiten (`areas/`, `operations/`, `policies/`, `quality/`,
  `decisions/`):
  - wenn der Inhalt über einen einzelnen Vorgang hinaus stabil gelten soll.
- Für die hier gelisteten Archiv-Themen ist aktuell **kein** Thema primär ein
  Drift-Report; der offene Teil ist überwiegend vorgang-genaue Vorbereitung und
  spätere kanonische Übernahme.

## Offen (Restabstimmung)

- Pro Thema fehlt noch die belastbare Entscheidung, ob aus der Agile-Quelle
  **eine** Zielseite oder **mehrere getrennte Dokus** entstehen.
- Für `KEP-Lite` fehlt aktuell trotz vorhandener Vorlage ein im Repo belegtes
  kanonisches URI-/Pfadmuster.
- Zu prüfen bleibt, ob ein kleines Glossar für Begriffe wirklich nötig ist oder
  ob die Terminologie auf Bereichsseiten ausreicht.
- Zu prüfen bleibt, ob Abnahmecheck-Seiten wirklich gebraucht werden oder ob
  `quality/testmatrix/` plus vorgang-genaue Nachweise genügt.
- Es ist noch nicht belegt, ob die Archivquellen überwiegend nur Referenzen auf
  interne IDs enthalten und ob diese bereits nach J01-xx überführt wurden.
  - Public-Doku bleibt ohne interne IDs; die Zuordnung (falls nötig) gehört in
    eine private Mapping-Notiz.

## Was für diese Seite noch fehlt

- Pro Thema die `docs/agile`-Quelle(n) in getrennte Doku-Bausteine zerlegen:
  Vorschlag, Entscheidung, Betrieb, Nachweis, Richtlinie nicht vermischen.
- Pro Doku-Baustein den Dokutyp nach `policies/doku-richtlinie/` festziehen.
- Pro gewähltem Dokutyp prüfen:
  - Vorlage unter `templates/` vorhanden?
  - kanonischer URI-/Pfad im Repo belegt?
- Für neue Dokutypen zuerst Policy-Delta + Vorlage anlegen, erst danach in die
  Tabelle als echte Empfehlung aufnehmen.
- Erst nach dieser Klärung die Spalten „Übernahme-Stand“ und „Zielpfad“ von
  Bewertung auf Festlegung heben.
