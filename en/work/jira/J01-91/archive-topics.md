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

This table is now the **J01-91 decision record**.
For each topic it fixes:

- the primary Jira follow-up issues,
- the target doc type under `policies/doku-richtlinie/`,
- whether a matching template or structure already exists,
- and the next stable URI/path family.

Remaining follow-up work moves into the target issues or canonical pages, not
back into this table.

## Statuslogik ab 2026-03-18

Diese Seite trennt ab jetzt bewusst zwischen **Entscheidung** und
**Ausführung**.

- `Übernahmeentscheidung` beschreibt das Soll:
  - `soll übernommen werden`
  - `noch offen`
  - `derzeit kein Übernahmeziel`
- `Umsetzungsstand` beschreibt das Ist:
  - `nicht begonnen`
  - `in Arbeit`
  - `teilweise umgesetzt`
  - `vollständig umgesetzt`
  - `entfällt`

Ein Gegenstand kann also `soll übernommen werden` und zugleich
`nicht begonnen` sein.

| Topic | Take-over state | Target precision | Fixed doc type | Template/structure state | Target path / URI pattern | Jira links | Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Pipeline/Phase terminology | yes | issue-specific first, canonical later | `KEP-Lite` plus area page | available; no glossary type needed | `work/jira/J01-58/`, then `areas/cli-build/` | `J01-58`, `J01-34` | Terms belong on area pages; no separate glossary type is needed. |
| Typing/validation | yes | issue-specific first, canonical later | `KEP-Lite` plus policy | available | `work/jira/J01-52/`, `work/jira/J01-37/`, then `policies/programmierleitlinien/` | `J01-52`, `J01-37`, `J01-28` | Agile material remains proposal input, not a direct end-state policy. |
| Error model | yes | issue-specific first, canonical later | `KEP-Lite`; later `ADR` if alternatives matter | available | `work/jira/J01-54/`, then `policies/programmierleitlinien/` or `decisions/adr-xxxx/` | `J01-54` | Use ADR only once alternatives and consequences are explicitly decided. |
| Preview/deployment readiness | yes | multiple issues, canonical later | `Runbook` plus `Testmatrix` | available | `work/jira/J01-31/`, `work/jira/J01-13/`, `work/jira/J01-9/`, `work/jira/J01-43/`, then `operations/<slug>/` and `quality/testmatrix/` | `J01-31`, `J01-13`, `J01-9`, `J01-43` | Operations flow and evidence stay separate; no dedicated acceptance-check type. |
| CLI UX | yes | issue-specific first, canonical later | `KEP-Lite` or area page | available | `work/jira/J01-34/`, then `areas/cli-build/` | `J01-34` | The end state belongs in area docs, implementation work in the issue. |
| Config policy (sources/validation) | yes | issue-specific first, canonical later | `KEP-Lite` plus area page or policy | available | `work/jira/J01-37/`, `work/jira/J01-31/`, then `areas/cli-build/` or `policies/<slug>/` | `J01-37`, `J01-31`, `J01-40` | App view, spec/policy rule and migration plan stay separate. |
| i18n | yes | multiple issues, canonical later | `KEP-Lite` plus area page | available | `work/jira/J01-46/`, `work/jira/J01-49/`, then `areas/http-runtime/` | `J01-46`, `J01-49`, `J01-6` | Runtime messages and template texts remain separate follow-up topics. |
| Runtime concurrency/locking | yes | issue-specific first, canonical later | `ADR` or `KEP-Lite` plus area page | available | `work/jira/J01-16/`, `work/jira/J01-21/`, then `areas/http-runtime/` or `decisions/adr-xxxx/` | `J01-16`, `J01-21` | Keep operations and architecture separate; ADR only for real direction decisions. |
| Automation layer (helper) | no | no current target | none; `KEP-Lite` only if reactivated | available, but not needed | no target path for now | none directly mapped | Not represented as an active Jira issue right now; revisit only if reprioritized. |
| Test strategy/test matrix | yes | issue-specific first, canonical later | `Testmatrix` | available; no separate acceptance-check type needed | `work/jira/J01-13/`, then `quality/testmatrix/` | `J01-13` | Fine-grained evidence stays inside the test matrix or issue-specific work docs. |
| Repo hygiene | yes | issue-specific first, canonical later | policy plus optional `Runbook` | available | `work/jira/J01-25/`, then `policies/programmierleitlinien/` and optionally `operations/<slug>/` | `J01-25` | Long-lived rules and concrete procedures remain separate. |

## Heutiger Umsetzungsabgleich

Die folgende Tabelle bewertet den heutigen öffentlichen Stand. Sie sagt nicht
nur, was `J01-91` festgezogen hat, sondern auch, was davon bereits wirklich
sichtbar umgesetzt ist.

| Thema | Übernahmeentscheidung | Umsetzungsstand | Wie heute öffentlich abgebildet | Nachweis / Ort | Offene Restarbeit / Folgearbeit |
| --- | --- | --- | --- | --- | --- |
| Pipeline/Phase-Terminologie | soll übernommen werden | teilweise umgesetzt | Modell und Begriffe sind im Bereich CLI/Build sichtbar, aber noch nicht als vollständiger Besucherpfad ausformuliert | [CLI / Build]({{ "/en/areas/cli-build/" | relative_url }}) | Weiterer Abgleich über `J01-58` und `J01-34` |
| Typisierung/Validierung | soll übernommen werden | nicht begonnen | In `J01-91` nur als Zielort und Quellthema geführt | Diese Seite + Zielorte in der Arbeitsliste | Fachliche Übernahme bleibt Folgearbeit über `J01-52`, `J01-37`, `J01-28` |
| Fehlerkonzept | soll übernommen werden | nicht begonnen | In `J01-91` nur als geplanter Themenstrang benannt | Diese Seite + Zielort `J01-54` | Öffentliche Fachübernahme steht noch aus |
| Preview/Deployment-Readiness | soll übernommen werden | teilweise umgesetzt | Sprintrelevanter Ausschnitt ist öffentlich gefüllt; das Gesamtbild aus `J01-91` bleibt unvollständig | [J01-98]({{ "/en/work/jira/J01-98/" | relative_url }}), [Runbook: preview GitHub Pages locally]({{ "/en/operations/ghpages-preview/" | relative_url }}), [Testmatrix]({{ "/en/quality/testmatrix/" | relative_url }}) | Vollständigerer Zielabgleich jetzt in [J01-103]({{ "/en/work/jira/J01-103/" | relative_url }}) |
| CLI-UX | soll übernommen werden | teilweise umgesetzt | Pipeline-/Phase-Modell und Preview-Pfad sind sichtbar, der vollständige UX-Abgleich fehlt | [CLI / Build]({{ "/en/areas/cli-build/" | relative_url }}) | Folgearbeit über `J01-34` |
| Config-Policy (Sources/Validation) | soll übernommen werden | teilweise umgesetzt | Manifest- und Source-Grundzüge sind öffentlich erklärt, aber noch nicht als vollständiger Übernahmestatus aus den Altquellen ausgewiesen | [CLI / Build]({{ "/en/areas/cli-build/" | relative_url }}), [J01-31]({{ "/en/work/jira/J01-31/" | relative_url }}) | Weiterer Vollabgleich jetzt in [J01-103]({{ "/en/work/jira/J01-103/" | relative_url }}) |
| i18n | soll übernommen werden | nicht begonnen | In `J01-91` nur als Folgethema und Zielort benannt | Diese Seite + Zielorte `J01-46`, `J01-49`, `J01-6` | Öffentliche Übernahme steht noch aus |
| Runtime-Concurrency/Locking | soll übernommen werden | teilweise umgesetzt | Die Preview-relevante Runtime-Härtung ist öffentlich beschrieben, aber nicht als vollständige Übernahme aus `J01-91` abgeschlossen | [HTTP-Runtime]({{ "/en/areas/http-runtime/" | relative_url }}), [J01-16]({{ "/en/work/jira/J01-16/" | relative_url }}), [J01-21]({{ "/en/work/jira/J01-21/" | relative_url }}) | Weiterer Architektur-/Betriebsabgleich bleibt Folgearbeit |
| Automations-Layer (Helper) | derzeit kein Übernahmeziel | entfällt | Kein aktiver öffentlicher Zielort festgezogen | Diese Seite | Nur bei neuer Priorisierung wieder aufnehmen |
| Teststrategie/Testmatrix | soll übernommen werden | teilweise umgesetzt | Die Testmatrix ist öffentlich vorhanden, aber nicht als vollständiger Übernahmestatus aller Altquellen ausgewiesen | [Testmatrix]({{ "/en/quality/testmatrix/" | relative_url }}), [J01-13]({{ "/en/work/jira/J01-13/" | relative_url }}) | Offene Zielerfüllung läuft jetzt in [J01-103]({{ "/en/work/jira/J01-103/" | relative_url }}) |
| Repo-Hygiene | soll übernommen werden | teilweise umgesetzt | Projekt-Skill und Repo-Regeln tragen Teile des Zielbilds, aber nicht als vollständige öffentliche Zielerfüllung von `J01-91` | Projekt-Skill + `AGENTS.md` + `J01-91` | Weitere Nachschärfung bleibt getrennte Folgearbeit |

## Operations and workflow rules from `docs/agile` (residual review)

| Residual rule | Source in `docs/agile` | Still valid today? | Target | Status / next step | Note |
| --- | --- | --- | --- | --- | --- |
| Branch flow for preview work | `issues/ISS-004-dev-branch-foundation-and-repo-hygiene.md`, `issues/ISS-005-preview-workflow-reenable-from-dev.md`, `issues/README.md` | yes | project skill + repo `AGENTS.md` | in progress | The canonical flow remains `feature/*` -> `dev` -> `preview`. |
| Repo-local docs/README work without a feature scope runs on a dedicated branch from `dev` | derived from `ISS-004`, `ISS-005`; became concrete at the README change `docs: README auf GitHub Pages umstellen (J01-91)` | yes | project skill + repo `AGENTS.md` | done | The README state was moved out of `feature/iss-005-preview` and is now carried via `dev`. |
| Update `docs/agile` first, then start technical implementation on feature branches | `docs/agile/README.md` | no | none; mark as legacy or clean up later as archive context | open | This no longer fits the current SSOT split between GitHub Pages and Jira. |
| Maintain `docs/agile` only through a dedicated worktree on `dev` | `docs/agile/README.md`, former repo `AGENTS.md` | no | none; remove from active repo rules | done | At most this remains relevant as archive context for older sources. |

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
- Sie ist noch **keine** Aussage darüber, ob etwas bereits wirklich
  übernommen wurde oder heute nur als Zielort/Folgearbeit sichtbar ist.

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

`work/jira/J01-<KEY>/` remains the target when scope, evidence and open
decisions belong to a single issue.

`quality/drift-reports/J01-<KEY>/` stays limited to real drift findings.

Canonical pages under `areas/`, `operations/`, `policies/`, `quality/` and
`decisions/` carry only the stable end state.

None of the topics listed here is primarily a drift report.

## Final outcome of the review

- Each topic now has a fixed split into one or more target docs.
- `KEP-Lite` will use the canonical pattern `decisions/kep-xxxx/`.
- No dedicated glossary type is needed; terms belong on existing area or policy
  pages.
- No dedicated acceptance-check type is needed; evidence belongs in
  `quality/testmatrix/` or issue-specific work docs.
- Internal references stay out of public docs; mappings belong in private
  notes.

## What remains for this page

- Only extend this page when new archive sources reveal new topics or target
  locations.
- Concrete implementation now belongs in the listed follow-up issues or
  canonical pages.
