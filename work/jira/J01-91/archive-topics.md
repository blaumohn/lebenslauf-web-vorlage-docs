---
layout: page
title: "J01-91: Archiv-Auswertung (Themen, ohne IDs) – 2026-03-06"
permalink: /de/work/jira/J01-91/archive-topics/
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

Diese Tabelle ist jetzt eine **Festlegung aus `J01-91`**.
Sie hält je Thema fest:

- welche Jira-Vorgänge vorrangig betroffen sind,
- welcher Dokutyp nach `policies/doku-richtlinie/` der Zielort ist,
- ob dafür heute schon eine passende Vorlage oder Zielstruktur existiert,
- und welcher URI-/Pfad der nächste belastbare Zielort ist.

Offene Folgearbeit bleibt in den jeweiligen Zielvorgängen oder kanonischen
Seiten, nicht mehr in dieser Tabelle.

| Thema | Übernahme-Stand | Ziel-Genauigkeit | Festgezogener Dokutyp | Template-/Strukturstand | Zielpfad / URI-Muster | Jira-Bezug | Notiz |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Pipeline/Phase-Terminologie | ja | zuerst vorgang-genau, danach kanonisch | `KEP-Lite` plus Bereichsseite | vorhanden; kein Glossar-Typ nötig | `work/jira/J01-58/`, danach `areas/cli-build/` | `J01-58`, `J01-34` | Begriffe werden auf Bereichsseiten geklärt; ein eigener Glossar-Typ ist nicht nötig. |
| Typisierung/Validierung | ja | zuerst vorgang-genau, danach kanonisch | `KEP-Lite` plus Richtlinie | vorhanden | `work/jira/J01-52/`, `work/jira/J01-37/`, danach `policies/programmierleitlinien/` | `J01-52`, `J01-37`, `J01-28` | Agile-Quellen bleiben Vorschlagsmaterial, nicht direkte End-Richtlinie. |
| Fehlerkonzept | ja | zuerst vorgang-genau, danach kanonisch | `KEP-Lite`; bei Alternativen später `ADR` | vorhanden | `work/jira/J01-54/`, danach `policies/programmierleitlinien/` oder `decisions/adr-xxxx/` | `J01-54` | Entscheidungsdoku erst dann als ADR, wenn Alternativen und Folgen ausdrücklich festgezogen werden. |
| Preview/Deployment-Readiness | ja | mehrere Vorgänge, danach kanonisch | `Runbook` plus `Testmatrix` | vorhanden | `work/jira/J01-31/`, `work/jira/J01-13/`, `work/jira/J01-9/`, `work/jira/J01-43/`, danach `operations/<slug>/` und `quality/testmatrix/` | `J01-31`, `J01-13`, `J01-9`, `J01-43` | Betriebsablauf und Nachweise werden getrennt geführt; kein eigener Abnahmecheck-Typ. |
| CLI-UX | ja | zuerst vorgang-genau, danach kanonisch | `KEP-Lite` oder Bereichsseite | vorhanden | `work/jira/J01-34/`, danach `areas/cli-build/` | `J01-34` | Endzustand gehört in die Bereichsdoku, Umbauarbeit in den Vorgang. |
| Config-Policy (Sources/Validation) | ja | zuerst vorgang-genau, danach kanonisch | `KEP-Lite` plus Bereichsseite oder Richtlinie | vorhanden | `work/jira/J01-37/`, `work/jira/J01-31/`, danach `areas/cli-build/` oder `policies/<slug>/` | `J01-37`, `J01-31`, `J01-40` | App-Sicht, Spec-/Policy-Regel und Umbauplan bleiben getrennte Doku-Bausteine. |
| i18n | ja | mehrere Vorgänge, danach kanonisch | `KEP-Lite` plus Bereichsseite | vorhanden | `work/jira/J01-46/`, `work/jira/J01-49/`, danach `areas/http-runtime/` | `J01-46`, `J01-49`, `J01-6` | Runtime-Messages und Template-Texte bleiben getrennte Folgethemen. |
| Runtime-Concurrency/Locking | ja | zuerst vorgang-genau, danach kanonisch | `ADR` oder `KEP-Lite` plus Bereichsseite | vorhanden | `work/jira/J01-16/`, `work/jira/J01-21/`, danach `areas/http-runtime/` oder `decisions/adr-xxxx/` | `J01-16`, `J01-21` | Betriebs- und Architekturteil getrennt; ADR nur bei echter Richtungsentscheidung. |
| Automations-Layer (Helper) | nein | derzeit kein Zielort | keiner; nur bei Reaktivierung `KEP-Lite` | vorhanden, aber nicht benötigt | vorerst kein Zielpfad | keiner direkt belegt | Im aktuellen Jira-Spiegel nicht als eigener Vorgang belegt; nur bei neuer Priorisierung wieder aufnehmen. |
| Teststrategie/Testmatrix | ja | zuerst vorgang-genau, danach kanonisch | `Testmatrix` | vorhanden; kein eigener Abnahmecheck-Typ nötig | `work/jira/J01-13/`, danach `quality/testmatrix/` | `J01-13` | Feingranulare Nachweise werden innerhalb der Testmatrix oder vorgangsgenau geführt. |
| Repo-Hygiene | ja | zuerst vorgang-genau, danach kanonisch | Richtlinie plus ggf. `Runbook` | vorhanden | `work/jira/J01-25/`, danach `policies/programmierleitlinien/` und ggf. `operations/<slug>/` | `J01-25` | Dauerregeln und konkrete Abläufe bleiben getrennt. |

## Betriebs- und Ablaufregeln aus `docs/agile` (Restpruefung)

| Regelrest | Quelle in `docs/agile` | Gilt heute noch? | Zielort | Status / naechster Schritt | Notiz |
| --- | --- | --- | --- | --- | --- |
| Branch-Flow fuer Preview-Arbeit | `issues/ISS-004-dev-branch-foundation-and-repo-hygiene.md`, `issues/ISS-005-preview-workflow-reenable-from-dev.md`, `issues/README.md` | ja | Projekt-Skill + Repo-`AGENTS.md` | in Arbeit | Kanonischer Fluss bleibt `feature/*` -> `dev` -> `preview`. |
| Repo-nahe Doku-/README-Arbeit ohne Feature-Bezug auf separatem Branch aus `dev` | abgeleitet aus `ISS-004`, `ISS-005`; konkret sichtbar geworden am README-Commit `docs: README auf GitHub Pages umstellen (J01-91)` | ja | Projekt-Skill + Repo-`AGENTS.md` | umgesetzt | README-Stand aus `feature/iss-005-preview` herausgeloest und direkt ueber `dev` gefuehrt. |
| `docs/agile` zuerst pflegen, danach technische Umsetzung in Feature-Branches | `docs/agile/README.md` | nein | keiner; als Legacy kenntlich lassen oder spaeter archivisch bereinigen | offen | Passt nicht mehr zur heutigen SSOT mit GitHub Pages + Jira. |
| `docs/agile` nur ueber eigenen Worktree auf `dev` pflegen | `docs/agile/README.md`, frueheres Repo-`AGENTS.md` | nein | keiner; aus aktiven Repo-Regeln entfernen | umgesetzt | Die Regel bleibt hoechstens noch als Archivkontext fuer alte Quellen relevant. |

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

`work/jira/J01-<KEY>/` bleibt Zielort, wenn Scope, Nachweise und offene
Entscheidungen an genau einen Vorgang gebunden sind.

`quality/drift-reports/J01-<KEY>/` bleibt auf echte Drift-Befunde beschränkt.

Kanonische Fachseiten unter `areas/`, `operations/`, `policies/`, `quality/`
und `decisions/` tragen nur den stabilen Endzustand.

Für die hier gelisteten Archiv-Themen ist weiterhin **kein** Thema primär ein
Drift-Report.

## Ergebnis der Restabstimmung

- Pro Thema ist festgezogen, ob eine oder mehrere Ziel-Dokus entstehen.
- `KEP-Lite` nutzt künftig das kanonische Muster `decisions/kep-xxxx/`.
- Ein eigener Glossar-Typ ist nicht nötig; Begriffe gehören in bestehende Fach-
  oder Richtlinienseiten.
- Ein eigener Abnahmecheck-Typ ist nicht nötig; Nachweise gehören in
  `quality/testmatrix/` oder in vorgangsgenaue Arbeitsdoku.
- Interne Referenzen bleiben aus Public-Doku heraus; Zuordnungen gehören in
  private Mapping-Notizen.

## Was für diese Seite noch bleibt

- Diese Seite wird bei neuen Archivquellen nur fortgeschrieben, wenn neue
  Themen oder Zielorte auftauchen.
- Die konkrete Umsetzung erfolgt in den genannten Zielvorgängen oder
  kanonischen Seiten.
