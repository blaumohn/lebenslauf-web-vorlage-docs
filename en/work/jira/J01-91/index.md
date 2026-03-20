---
layout: page
title: "J01-91: Zustand/Vorhaben (Snapshot)"
jira_key: J01-91
jira_parent_key: J01-72
permalink: /en/jira/issues/J01-91/
---

**Stand:** 2026-03-18

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer Ort für den öffentlichen Zustand/das Vorhaben zu `J01-91` (Snapshot).
Die öffentliche Doku ist SSOT in GitHub Pages; öffentliche Jira-Seiten kommen
kanonisch aus `work/jira/`.
Der lebende Vorgangsstatus bleibt in Jira (nicht öffentlich).

## Ziel

Die Doku-Struktur konsolidieren und die öffentlich nutzbare Doku in GitHub Pages
so aufbauen, dass HR/Dev-Besucher sich schnell orientieren können.

## Zielteile und heutiger Befund

Die folgende Übersicht bewertet nicht nur Strukturarbeit, sondern das
formulierte Zielbild von `J01-91`.

| Zielteil | Bewertungsmaßstab | Heutiger Befund | Nachweis / Ort |
| --- | --- | --- | --- |
| Orientierungsziel | HR und Dev finden klare Einstiege, Zielorte und Lesepfade in der Public-Doku | offen | GitHub-Pages-Einstiege und `J01-91` benennen Struktur, zerlegen den Besucherpfad aber nicht belastbar |
| Migrationsziel | Relevante Altinhalte aus `docs/agile` sind fachlich in GitHub Pages angekommen | teilweise | `J01-98` füllt einen sprintrelevanten Ausschnitt; weitere Restarbeit bleibt offen |
| Transparenzziel | Je größerem Alt-Thema ist sichtbar, was entschieden, umgesetzt, nur vorbereitet oder noch offen ist | teilweise | [Archiv-Themen]({{ "/en/jira/issues/J01-91/archive-topics/" | relative_url }}) trennt jetzt Entscheidung und Ausführung; der Vollabgleich bleibt Folgearbeit |
| Strukturziel | Haupt-Orte, Dokutypen und Zielpfade sind klar und stabil benannt | erfüllt | [Archiv-Themen]({{ "/en/jira/issues/J01-91/archive-topics/" | relative_url }}), [Bereiche-Inventar]({{ "/en/jira/issues/J01-91/area-inventory/" | relative_url }}) und [Policy-Deltas]({{ "/en/jira/issues/J01-91/policy-deltas/" | relative_url }}) |
| Nachweisziel | Die behauptete Erledigung ist öffentlich nachvollziehbar belegt | offen | Die bisherige Abschlussdarstellung war stärker als die belegte Zielerfüllung; Folgearbeit läuft jetzt über [J01-103]({{ "/en/jira/issues/J01-103/" | relative_url }}) |

## Delta 2026-03-14

- The app README and EN README now link to GitHub Pages and the matching
  GitHub repositories without pinning a branch URL.
- The GitHub Pages entry pages `/de/` and `/en/` now link visibly to the app
  repo and the docs repo.
- The public entry path now states clearly:
  regular project docs do not live under `docs/` inside the app repo.
- `#start` remains an intentional page anchor; duplicate quickstart commands
  are avoided there.
- Jira remote links are normalized to stable language-specific canonical
  GitHub Pages targets.

## Delta 2026-03-16

- The README change `docs: README auf GitHub Pages umstellen (J01-91)` was
  moved out of `feature/iss-005-preview` onto a dedicated branch based on
  `dev`; `dev` now carries that state directly.
- The archive analysis now tracks operations- and workflow-related leftovers
  from `docs/agile` in a dedicated table instead of only implying them through
  topic lists.
- The project skill and repo rules are being tightened to the same flow:
  check branch context first, and route repo-local docs/rule work without a
  feature scope through `dev`.
- `J01-91` now moves to `Done` in Jira.
- The sprint-relevant preview migration from phase 2 now continues in
  [J01-98]({{ "/en/jira/issues/J01-98/" | relative_url }}).
- The non-sprint `docs/agile` leftovers from phase 2 now stay in the backlog
  under [J01-100]({{ "/en/jira/issues/J01-100/" | relative_url }}).
- Legacy Confluence remote-link cleanup and the new audit guardrail now continue
  in [J01-99]({{ "/en/jira/issues/J01-99/" | relative_url }}).

## Delta 2026-03-18

- `J01-91` trennt jetzt ausdrücklich zwischen erreichtem Strukturteil und
  offener Zielerfüllung des ursprünglichen öffentlichen Zielbilds.
- [J01-103]({{ "/en/jira/issues/J01-103/" | relative_url }}) ist als neue
  Folgearbeit angelegt, damit die offene Zielerfüllung nicht implizit in
  `J01-100` oder `J01-98` verschwindet.
- [Archiv-Themen]({{ "/en/jira/issues/J01-91/archive-topics/" | relative_url }})
  macht jetzt getrennt sichtbar, was übernommen werden soll und was heute
  bereits öffentlich umgesetzt ist.

## Delta 2026-03-20

- Another repo-local short README pass was again split away from a feature
  branch onto a dedicated docs branch based on `dev`:
  `docs/j01-91-readme-ghpages-followup`.
- The matching app-repo commit is
  `ea86afa` (`docs: README-Kurzstart auf GitHub Pages ausrichten (J01-91)`).
- This keeps the `J01-91` rule intact:
  README work without a feature scope stays separate from product-feature
  branches and flows directly into the `dev` path.

## Arbeitsprinzip (kurz)

- GitHub Pages ist SSOT für Doku (öffentlich, inkl. Seiten für Jira-Links).
- Jira ist SSOT für Vorgänge und Status (nicht öffentlich).
- Diese Seite ist ein **öffentlicher Snapshot**: „Was ist der Stand, was ist als Nächstes zu tun?“
- Detail-Artefakte hängen unter `jira/issues/J01-91/` (öffentlich) oder
  bleiben privat.

## Closure and follow-up work

`J01-91` bleibt als Struktur- und Entscheidungs-Vorgang abgeschlossen.
Nicht abgeschlossen ist dagegen die vollständige Zielerfüllung des
ursprünglichen öffentlichen Zielbilds. Diese Restarbeit wird jetzt offen als
Folgearbeit geführt:

1. [J01-98]({{ "/en/jira/issues/J01-98/" | relative_url }}) covers only the
   sprint-relevant preview migration for `J01-9`, `J01-13`, `J01-16`, and
   `J01-31`.
2. [J01-103]({{ "/en/jira/issues/J01-103/" | relative_url }}) zieht die offene
   Zielerfüllung aus `J01-91` nach: Orientierung, Transparenz über
   Übernahmestatus und vollständigerer Nachweis der Public-Migration.
3. [J01-100]({{ "/en/jira/issues/J01-100/" | relative_url }}) hält die übrigen
   `docs/agile`-Migrationen als getrennten Backlog-Kandidaten für einen
   späteren Sprint; `J01-100` ersetzt nicht `J01-103`.
4. [J01-99]({{ "/en/jira/issues/J01-99/" | relative_url }}) bereinigt alte
   Confluence remote links in Jira and anchors the audit guardrail.
5. [Archiv-Themen]({{ "/en/jira/issues/J01-91/archive-topics/" | relative_url }})
   bleibt öffentlicher Prüf- und Übergabeort dafür, was entschieden und was
   davon bereits umgesetzt ist.
6. Future structural docs changes stay bound to the tightened docs policy and
   the drift path.

## Phase 1: Status des Strukturteils (DoD, Snapshot)

Diese DoD-Tabelle bewertet nur den erreichten Strukturteil von `J01-91`.
Sie ist kein Beleg dafür, dass das vollständige öffentliche Zielbild bereits
eingelöst ist.

Statuswerte:

- **erledigt**: erfüllt und belegt
- **teilweise**: im Wesentlichen erfüllt, aber es bleibt ein klarer Rest
- **offen**: noch nicht erfüllt
- **blockiert**: hängt an einer Entscheidung/externem Input

| Punkt (DoD) | Status | Beleg / Ort |
| --- | --- | --- |
| Drift-Report + coverage of canonical public docs | erledigt | [Drift-Report]({{ "/en/quality/drift-reports/J01-91/" | relative_url }}) und [Abdeckung]({{ "/en/quality/drift-reports/J01-91/coverage/" | relative_url }}) |
| Öffentliche Jira-Fläche konsistent nachgezogen | erledigt | [Runbook]({{ "/en/operations/runbook/" | relative_url }}) und `shared-tooling/jira-pages/update-public-jira-pages.sh` |
| Bereiche-Inventar konsistent | erledigt | [Bereiche-Inventar]({{ "/en/jira/issues/J01-91/area-inventory/" | relative_url }}) |
| Archiv-Auswertung liegt vor (Themen, ohne IDs) | erledigt | [Archiv-Themen]({{ "/en/jira/issues/J01-91/archive-topics/" | relative_url }}) (take-over decisions and target locations fixed) |
| Policy-Delta-Vorschläge formuliert | erledigt | [Policy-Deltas]({{ "/en/jira/issues/J01-91/policy-deltas/" | relative_url }}) |
| Klare Phase-2-Liste existiert | erledigt | Diese Seite + [J01-103]({{ "/en/jira/issues/J01-103/" | relative_url }}) + [J01-100]({{ "/en/jira/issues/J01-100/" | relative_url }}) |
| Public-Doku: Sprach-/Nennungsregeln eingehalten | erledigt | Stichprobe + aktuelle Seiten (keine Jira-Cloud-Links, keine personenbezogenen Daten) |

## Phase 1: Definition of Done (ausformuliert)

<details markdown="1">
<summary>Aufklappen: Checkliste / DoD</summary>

Phase 1 ist „fertig“, wenn die folgenden Punkte erfüllt sind:

- Drift-Report covers all people-written pages and canonical public Jira work
  docs:
  - pro Seite sind die relevanten „Ist“-Claims geprüft oder als „unklar/geplant“
    markiert.
- Öffentliche Jira-Fläche ist konsistent nachgezogen:
  - no competing public source families for the same Jira page.
  - Schritt-Seiten nutzen stabile URLs: `/jira/issues/<PARENT>/steps/<SUBTASK_KEY>/`.
  - Remote Links werden als site-relative Links gerendert (nicht als
    absolute Doku-Domain).
- Bereiche-Inventar existiert und ist konsistent:
  - Doku-Bereiche ↔ Quell-Repos sind grob gemappt.
  - Platzhalter-Bereiche sind bewusst (entweder „füllen“ oder „entfernen“ als
    klarer Phase-2-Task).
- Archiv-Auswertung liegt vor:
  - Themen sind abstrahiert (ohne Export-IDs) und als Kandidaten zur Übernahme
    einsortiert (Bereich/Querschnitt).
  - Pro Thema ist mindestens klar:
    - Übernehmen ja/nein/offen (offen ist zulässig, aber muss explizit markiert sein).
    - Dokutyp/Vorlage und Zielpfad sind entweder benannt oder als „offen“ markiert.
  - Offene Frage „nur interne Referenzen?“ ist entweder beantwortet oder als
    offene Arbeit mit klarer Ablage (private Mapping-Notiz) festgehalten.
- Policy-Delta-Vorschläge sind formuliert:
  - Ist/Geplant-Markierung
  - Export-/Umwandlungsregeln inkl. Ausnahme
  - Jira-Link-Policy (Remote Links) + Mirror-Übernahme (optional)
- Eine klare Phase-2-Liste existiert (umsetzbar, priorisiert, mit Risiko/Impact).
- Public-Doku erfüllt die aktuellen Sprach-/Nennungsregeln:
  - keine Nennung früherer interner Arbeitsorte/Ordnernamen in öffentlichen Seiten.

</details>

## Entscheidungen (Abstimmung, Snapshot)

| Thema | Status | Bezug / Ort |
| --- | --- | --- |
| Ablage von Archivmaterial (lokale Exporte, nicht veröffentlichen) | decided | `.local/` inside the docs repo; local, unversioned, unpublished |
| Interne Referenzen aus Archivquellen: Mapping privat vs. öffentlich abstrakt | decided | keep mapping private only; public docs stay abstract |
| Neue Doku-Typen: Glossar / Abnahmechecks wirklich nötig? | decided | no; existing area pages and `quality/testmatrix/` are enough |
| Policy-Änderungen anwenden | decided | applied in `policies/doku-richtlinie/`; no separate new policy needed |

### Details (für schnelle Abstimmung)

1) **Ablage von Archivmaterial (lokale Exporte)**
- Ziel: lokal verfügbar, aber nicht als Public-Doku.
- Decision: keep it under `.local/` inside the docs repo.
- Concrete rule: repo-local, unversioned via `.gitignore`, and unpublished via
  the Jekyll `exclude` list.

2) **Interne Referenzen aus Archivquellen**
- Frage: Sind Archivquellen überwiegend interne Referenzen (IDs), und wurden sie bereits in J01-Vorgänge überführt?
- Public-Regel: keine internen IDs in Public-Doku.
- Decision: keep the mapping only in the private notes repo; public docs stay
  abstract.

3) **Neue Doku-Typen wirklich nötig?**
- Kandidaten aus der Archiv-Auswertung:
  - kleines Glossar (Begriffe)
  - Abnahmecheck-Seiten (feingranulare Checks, wenn Jira darauf linken soll)
- Decision: no.
- Reason: terminology belongs on area and policy pages; fine-grained evidence
  remains part of `quality/testmatrix/` or issue-specific work pages.

4) **Policy-Änderungen anwenden**
- Grundlage: [Policy-Deltas]({{ "/en/jira/issues/J01-91/policy-deltas/" | relative_url }})
- Decision: apply the approved deltas directly to
  `policies/doku-richtlinie/`.
- Split: clarifications stay in the existing policy; `J01-91` does not create a
  separate new policy.

## Phase 2 (moved out)

- Keep the status/plan view as a one-pager.
- Execute the sprint-relevant preview migration in [J01-98]({{ "/en/jira/issues/J01-98/" | relative_url }}).
- Die offene Zielerfüllung aus `J01-91` wird in [J01-103]({{ "/en/jira/issues/J01-103/" | relative_url }})
  als eigener nächster Sprint-Kandidat geführt.
- Keep the remaining `docs/agile` leftovers in [J01-100]({{ "/en/jira/issues/J01-100/" | relative_url }})
  deliberately out of the current sprint.
- Use the docs policy as the gate for future structural docs changes.
- Do not derive new doc types from `J01-91`.

## Links (Sichtbarkeit)

- Jira metadata now links `J01-91` explicitly with `J01-98`, `J01-100`
  and `J01-103`.
- [Jira: J01-91]({{ "/en/jira/issues/J01-91/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/en/operations/runbook/" | relative_url }})
- [Drift-Report (Qualität)]({{ "/en/quality/drift-reports/J01-91/" | relative_url }})
- [J01-98: sprint-relevant preview migration]({{ "/en/jira/issues/J01-98/" | relative_url }})
- [J01-103: offene Zielerfüllung aus J01-91 nachziehen]({{ "/en/jira/issues/J01-103/" | relative_url }})
- [J01-100: docs/agile leftovers after sprint 1]({{ "/en/jira/issues/J01-100/" | relative_url }})
- [J01-99: clean up legacy Confluence remote links]({{ "/en/jira/issues/J01-99/" | relative_url }})
