---
layout: page
title: "J01-91: Zustand/Vorhaben (Snapshot)"
permalink: /en/work/jira/J01-91/
---

**Stand:** 2026-03-16

Kanonischer Ort für den öffentlichen Zustand/das Vorhaben zu `J01-91` (Snapshot).
Die öffentliche Doku ist SSOT in GitHub Pages; `mirror/` ist abgeleitet.
Der lebende Vorgangsstatus bleibt in Jira (nicht öffentlich).

## Ziel

Die Doku-Struktur konsolidieren und die öffentlich nutzbare Doku in GitHub Pages
so aufbauen, dass HR/Dev-Besucher sich schnell orientieren können.

## Delta 2026-03-14

- The app README and EN README now link to GitHub Pages and the matching
  GitHub repositories without pinning a branch URL.
- The GitHub Pages entry pages `/de/` and `/en/` now link visibly to the app
  repo and the docs repo.
- The public entry path now states clearly:
  regular project docs do not live under `docs/` inside the app repo.
- `#start` remains an intentional page anchor; duplicate quickstart commands
  are avoided there.
- Mirror links derived from Jira remote links are normalized to stable
  language-specific public docs targets.

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
- Phase 2 execution now continues in [J01-98]({{ "/en/work/jira/J01-98/" | relative_url }}).
- Legacy Confluence remote-link cleanup and the new audit guardrail now continue
  in [J01-99]({{ "/en/work/jira/J01-99/" | relative_url }}).

## Arbeitsprinzip (kurz)

- GitHub Pages ist SSOT für Doku (öffentlich, inkl. Seiten für Jira-Links).
- Jira ist SSOT für Vorgänge und Status (nicht öffentlich).
- Diese Seite ist ein **öffentlicher Snapshot**: „Was ist der Stand, was ist als Nächstes zu tun?“
- Detail-Artefakte hängen unter `work/jira/J01-91/` (öffentlich) oder bleiben privat.

## Closure and follow-up work

`J01-91` is closed as the structure and decision issue.
The remaining work is now split deliberately:

1. [J01-98]({{ "/en/work/jira/J01-98/" | relative_url }}) executes the fixed
   phase-2 targets on canonical pages and in matching work docs.
2. [J01-99]({{ "/en/work/jira/J01-99/" | relative_url }}) cleans up legacy
   Confluence remote links in Jira and anchors the audit guardrail.
3. `archive-topics.md` remains maintained guidance, not an open review board.
4. Future structural docs changes stay bound to the tightened docs policy and
   the drift path.

## Phase 1: Status (DoD, Snapshot)

Statuswerte:

- **erledigt**: erfüllt und belegt
- **teilweise**: im Wesentlichen erfüllt, aber es bleibt ein klarer Rest
- **offen**: noch nicht erfüllt
- **blockiert**: hängt an einer Entscheidung/externem Input

| Punkt (DoD) | Status | Beleg / Ort |
| --- | --- | --- |
| Drift-Report + Abdeckung (ohne `mirror/`) | erledigt | [Drift-Report]({{ "/en/quality/drift-reports/J01-91/" | relative_url }}) und [Abdeckung]({{ "/en/quality/drift-reports/J01-91/coverage/" | relative_url }}) |
| Jira-Übersicht „sauber voll gespiegelt“ | erledigt | [Runbook]({{ "/en/operations/runbook/" | relative_url }}) und `shared-tooling/jira-pages/update-jira-mirror.sh` |
| Bereiche-Inventar konsistent | erledigt | [Bereiche-Inventar]({{ "/en/work/jira/J01-91/area-inventory/" | relative_url }}) |
| Archiv-Auswertung liegt vor (Themen, ohne IDs) | erledigt | [Archiv-Themen]({{ "/en/work/jira/J01-91/archive-topics/" | relative_url }}) (take-over decisions and target locations fixed) |
| Policy-Delta-Vorschläge formuliert | erledigt | [Policy-Deltas]({{ "/en/work/jira/J01-91/policy-deltas/" | relative_url }}) |
| Klare Phase-2-Liste existiert | erledigt | This page ("Next steps") + fixed targets in [Archiv-Themen]({{ "/en/work/jira/J01-91/archive-topics/" | relative_url }}) |
| Public-Doku: Sprach-/Nennungsregeln eingehalten | erledigt | Stichprobe + aktuelle Seiten (keine Jira-Cloud-Links, keine personenbezogenen Daten) |

## Phase 1: Definition of Done (ausformuliert)

<details markdown="1">
<summary>Aufklappen: Checkliste / DoD</summary>

Phase 1 ist „fertig“, wenn die folgenden Punkte erfüllt sind:

- Drift-Report deckt alle menschen-geschriebenen Seiten außerhalb `mirror/` ab:
  - pro Seite sind die relevanten „Ist“-Claims geprüft oder als „unklar/geplant“
    markiert.
- Jira-Übersicht ist „sauber voll gespiegelt“:
  - keine veralteten `mirror/issues/J01-*`-Ordner (gelöschte Jira-Vorgänge sind entfernt).
  - Schritt-Seiten nutzen stabile URLs: `/mirror/issues/<PARENT>/steps/<SUBTASK_KEY>/`.
  - Remote Links werden im Mirror als site-relative Links gerendert (nicht als absolute Doku-Domain).
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
- Grundlage: [Policy-Deltas]({{ "/en/work/jira/J01-91/policy-deltas/" | relative_url }})
- Decision: apply the approved deltas directly to
  `policies/doku-richtlinie/`.
- Split: clarifications stay in the existing policy; `J01-91` does not create a
  separate new policy.

## Phase 2 (moved out)

- Keep the status/plan view as a one-pager.
- Execute the fixed targets in [J01-98]({{ "/en/work/jira/J01-98/" | relative_url }})
  on canonical pages or in matching work docs.
- Use the docs policy as the gate for future structural docs changes.
- Do not derive new doc types from `J01-91`.

## Links (Sichtbarkeit)

- [Mirror: J01-72 / Schritt J01-91]({{ "/en/mirror/issues/J01-72/steps/J01-91/" | relative_url }}) (abgeleitet)
- [Runbook: Jira-Übersicht aktualisieren]({{ "/en/operations/runbook/" | relative_url }})
- [Drift-Report (Qualität)]({{ "/en/quality/drift-reports/J01-91/" | relative_url }})
- [J01-98: execute phase 2]({{ "/en/work/jira/J01-98/" | relative_url }})
- [J01-99: clean up legacy Confluence remote links]({{ "/en/work/jira/J01-99/" | relative_url }})
