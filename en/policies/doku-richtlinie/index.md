---
layout: page
title: "Doku-Richtlinie: lebenslauf-web-vorlage – Wo gehört welcher Inhalt hin?"
permalink: /en/policies/doku-richtlinie/
---

## Ziel

- Jede Information hat genau einen **Haupt-Ort**.
- Jede Information hat eine passende **Genauigkeit**:
  vorgang-genau, drift-genau oder kanonisch.
- Andere Seiten **verlinken nur** (keine Doppelpflege).
- Ein Besucher (HR / Entwickler) kann Inhalte **sofort einordnen**.

## Grundbegriffe

- **Bereich** = Unterbetrieb/Teilgebiet (z. B. CLI/Build, HTTP-Runtime,
  Jira- und Doku-Tooling).
- **Querschnitt** = gilt für mehrere Bereiche oder repo-weit.
- **Ist** = verifiable current state with a source
  (file, command, evidence, build artefact).
- **Geplant** = target state with an issue, ADR or KEP reference.

## Entscheidungsregel (5 Fragen)

1) Gilt es nur für einen Bereich?
   - Ja: in die Bereichsseite(n) oder deren Unterseiten.
   - Nein: Querschnittsseite (repo-weit).

2) Ist es eine Entscheidung mit Alternativen + Folgen?
   - ADR.

3) Ist es ein Plan/Änderungsvorschlag mit Ziel + „fertig, wenn“?
   - KEP-Lite.

4) Ist es eine Schrittfolge für Betrieb/Wartung/Störung?
   - Runbook.

5) Ist es „so arbeiten wir“ (Konventionen/Leitlinien)?
   - Richtlinie.

4a) Ist es eine gleichfoermige Feature- oder Zustandsuebersicht mit
    Pflichtspalten?
   - Feature-Matrix.

## Genauigkeit des Zielorts (danach zusätzlich entscheiden)

6) Ist der Inhalt an genau einen Jira-Vorgang gebunden?
   - Ja: nach `work/jira/J01-<KEY>/`.
   - Typische Inhalte:
     Scope, offene Entscheidungen, Nachweise, Mapping, Zwischenstände.
   - Für öffentliche Subtask-Details bleibt der Dokutyp derselbe, aber mit
     Schritt-Variante:
     `work/jira/<PARENT>/steps/<SUBTASK_KEY>/`.

7) Ist der Inhalt sprint-genau und öffentlich als Sprint-Artefakt gedacht?
   - Ja: nach `work/sprints/<sprint-slug>/`.
   - Typische Inhalte:
     Planning, review, retro, carry-over, scope changes.

8) Ist der Inhalt ein Drift-Befund?
   - Ja: nach `quality/drift-reports/J01-<KEY>/`.
   - Nur für Behauptung ↔ Quelle ↔ Status ↔ Fix, nicht für allgemeine
     Fachbeschreibung.

9) Gilt der Inhalt über einen einzelnen Vorgang hinaus stabil?
   - Ja: auf die kanonische Fachseite unter `areas/`, `operations/`,
     `policies/`, `decisions/` oder `quality/`.
   - Vorgangs- oder Drift-Seiten verlinken dorthin, sobald der Inhalt stabil
     genug ist.

10) Gibt es für den Dokutyp eine gepflegte Vorlage?
   - Ja: Typ ist grundsätzlich freigegeben.
   - Nein: erst Policy-Delta + `templates/<typ>/` + kanonisches URI-Muster
     festziehen, dann nutzen.

11) Enthält die Seite temporäre Export-/Umwandlungsartefakte oder interne IDs?
   - Ja: nicht in Public-Doku übernehmen.
   - Ausnahme: explizite Umwandlungs-/Migrationsdoku mit begründetem Bedarf.

---

## Seitenbaum (kanonisch)

```text
Repo: lebenslauf-web-vorlage – Überblick (Startseite)

0. Einstieg
- Zweck / Nutzen
- Links (Repo, CI, Releases, Preview)
- Bereiche (Navigation)

1. Bereiche
- Bereich: CLI / Build
- Bereich: HTTP-Runtime
- Bereich: Jira- und Doku-Tooling

2. Querschnitt (repo-weit)
- Richtlinien (Doku, Programmierleitlinien, ggf. Security)
- Architektur (nur wenn wirklich übergreifend)
- Entscheidungen (ADR-Index, KEP-Lite-Index)
- Betrieb (Runbook-Index)
- Qualität (Teststrategie, Testmatrix)
- Planung & Veröffentlichung
  - Jira-Übersichten (intern)
  - Jira-Übersicht (öffentlich, statisch)
  - Sprint-Historie (öffentlich)

3. Vorlagen
- ADR-Vorlage
- KEP-Lite-Vorlage
- Runbook-Vorlage
- Sprint-Dossier-Vorlage
- Testmatrix-Vorlage
- Feature-Matrix-Vorlage
- Richtlinie/Überblick-Vorlage
```

## Ablage-Regeln (kurz und hart)

A) **Bereich gewinnt**
- Wenn ein Text nur einen Bereich betrifft: er liegt im Bereich, nicht im
  Querschnitt.

B) **Querschnitt nur, wenn wirklich übergreifend**
- Querschnitt nur für Inhalte, die mindestens zwei Bereiche betreffen oder
  repo-weit gelten.

C) **„Ziel & Ist“ ist Architekturüberblick**
- Systemüberblick (Zielbild + Ist) liegt unter Bereich → „Aufbau“.

D) **Leitlinie vs. Katalog vs. Runbook strikt trennen**
- Leitlinie: Regeln/Prinzipien/Policy.
- Katalog/Referenz: Liste der Befehle/Teile mit kurzen Angaben.
- Runbook: Schrittfolge mit Prüfpunkten und Rückfallplan.

D1) **Keep Ist and Geplant explicit**
- Pages that describe system, operations or structural behavior mark the target
  state and the current state explicitly.
- `Ist` needs verifiable evidence.
- `Geplant` needs an issue, ADR or KEP reference.

E) **KEP führt oft zu ADR**
- KEP: Vorschlag + Abnahmekriterien.
- ADR: Entscheidung + Begründung + Folgen.

F) **`work/jira/` ist vorgang-genau**
- Dorthin gehören öffentliche Arbeitsstände, Nachweise und offene Entscheidungen
  zu genau einem Jira-Vorgang.
- Every page under `work/jira/J01-<KEY>/` uses the same base structure:
  goal, current state or closure picture, verification plan, links.
- Öffentliche Schrittseiten unter
  `work/jira/<PARENT>/steps/<SUBTASK_KEY>/` sind eine Variante derselben
  Jira-Arbeitsdoku für Subtasks mit eigener öffentlicher Detailaussage.
- The section `## Verification plan` is mandatory.
- The verification plan contains at least the columns:
  `Check`, `Expectation`, `Evidence / Location`, `Status`.
- The table is the compact review and closure aid for
  `In Überprüfung`; it does not replace a broader `quality/testmatrix/`.
- Normal Jira work docs additionally use:
  - a short context block directly below `Stand`
  - the block shows the counterpart in `mirror`, if that page exists
  - if a public parent issue exists, the block also shows parent work doc and
    parent mirror
  - if public step pages exist below that issue, the block shows short direct
    paths to their mirror pages
- Public step pages additionally use:
  - the same short context block directly below `Stand`
  - the block shows the page's own mirror step page, the parent work doc and
    the parent issue in the mirror, if those targets exist
  - the step identifier in the intro links to the page's own mirror step page,
    if it exists
  - the parent key in the intro links to the parent work doc
  - when a new public step page is introduced for an existing subtask,
    existing public mentions are updated to matching links wherever they touch
    that step page or its parent issue

G) **Drift-Reports sind nur für belegte Abweichungen**
- `quality/drift-reports/` dokumentiert Claim/Quelle/Status/Fix.
- Es ist kein Ersatz für Bereichsdoku, Richtlinie oder Vorgangsnotiz.

H) **`work/sprints/` ist sprint-genau**
- Dorthin gehören öffentliche, geglättete Sprint-Artefakte:
  planning, review, retro, carry-over, scope changes.
- Jira bleibt operativer SSOT für Sprint-Zustand und Labels.
- Das `tagebuch` liefert den feineren Rohstoff für Denk- und Arbeitsverlauf.

I) **Jeder Dokutyp braucht eine Vorlage**
- Standard-Dokutypen in diesem Repo sind nur Typen mit gepflegter Vorlage unter
  `templates/`.
- Bevorzugt werden etablierte Typen wie `ADR`, `KEP-Lite`, `Runbook`,
  `Richtlinie/Überblick`, `Sprint-Dossier`, `Testmatrix`, `Feature-Matrix`,
  `Drift-Report`, `Postmortem`, `Jira work doc`.

J) **Neue Dokutypen brauchen Policy + URI-Muster**
- Ein neuer Typ (z. B. Glossar, Abnahmecheck) ist erst freigegeben, wenn
  Vorlage, Vorlagenindex, Policy-Regel und kanonisches URI-/Pfadmuster
  festgezogen sind.

K) **Temporary local artefacts stay private**
- `.local/` is a repo-local private location for exports, working copies and
  unpublished archive material.
- `.local/` is neither canonical public docs nor the normal versioned path.
- Public docs do not mention or link temporary export paths, timestamps or
  local working copies.

L) **Internal IDs stay out of public docs**
- Internal export identifiers, earlier work IDs and private mapping tables do
  not belong in public pages.
- If a mapping is needed for traceability, it stays in private notes or working
  material outside public docs.

M) **Jira links only to canonical docs targets**
- Jira remote links point to canonical pages under `areas/`, `operations/`,
  `decisions/`, `policies/`, `quality/` or `work/`.
- `mirror/` remains a derived view and is not a primary link target from Jira.

N) **Drift is a lightweight quality gate**
- Structural changes to SSOT, link policy or operational flow require a drift
  report to be created or updated.
- Drift reports document claim, source, status and fix, not general domain
  content.

O) **Repo names are facts, area IDs are stable**
- Area IDs and slugs stay stable.
- Repo names are described only as current facts or neutral roles.

P) **Canonical URI patterns are part of the doc type**
- `ADR`: `decisions/adr-xxxx/`
- `KEP-Lite`: `decisions/kep-xxxx/`
- `Runbook`: `operations/<slug>/`
- `Richtlinie/Überblick`: `policies/<slug>/`
- `Testmatrix`: `quality/testmatrix/` or `quality/testmatrix/<slug>/`
- `Feature-Matrix`: `quality/feature-matrix/` or
  `quality/feature-matrix/<slug>/`
- `Drift-Report`: `quality/drift-reports/J01-<KEY>/`
- `Sprint-Dossier`: `work/sprints/<sprint-slug>/`
- `Jira work doc`: `work/jira/J01-<KEY>/`
- `Jira work doc` (Schritt-Variante):
  `work/jira/<PARENT>/steps/<SUBTASK_KEY>/`
- `Postmortem`: `quality/postmortems/<slug>/`

Q) **No dedicated glossary or acceptance-check type without proven need**
- Terms belong on area, policy or overview pages.
- Fine-grained acceptance and verification evidence stays in
  `quality/testmatrix/` or issue-specific work docs.
