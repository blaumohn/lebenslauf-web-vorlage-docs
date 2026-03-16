---
layout: page
title: "Doku-Richtlinie: lebenslauf-web-vorlage – Wo gehört welcher Inhalt hin?"
permalink: /de/policies/doku-richtlinie/
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

4a) Ist es eine gleichförmige Feature- oder Zustandsübersicht mit
    Pflichtspalten?
   - Feature-Matrix.

## Genauigkeit des Zielorts (danach zusätzlich entscheiden)

6) Ist der Inhalt an genau einen Jira-Vorgang gebunden?
   - Ja: nach `work/jira/J01-<KEY>/`.
   - Typische Inhalte:
     Scope, offene Entscheidungen, Nachweise, Mapping, Zwischenstände.

7) Ist der Inhalt sprint-genau und öffentlich als Sprint-Artefakt gedacht?
   - Ja: nach `work/sprints/<sprint-slug>/`.
   - Typische Inhalte:
     Planning, Review, Retro, Carry-over, Scope-Änderungen.

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

E) **KEP führt oft zu ADR**
- KEP: Vorschlag + Abnahmekriterien.
- ADR: Entscheidung + Begründung + Folgen.

F) **`work/jira/` ist vorgang-genau**
- Dorthin gehören öffentliche Arbeitsstände, Nachweise und offene Entscheidungen
  zu genau einem Jira-Vorgang.

G) **Drift-Reports sind nur für belegte Abweichungen**
- `quality/drift-reports/` dokumentiert Claim/Quelle/Status/Fix.
- Es ist kein Ersatz für Bereichsdoku, Richtlinie oder Vorgangsnotiz.

H) **`work/sprints/` ist sprint-genau**
- Dorthin gehören öffentliche, geglättete Sprint-Artefakte:
  Planning, Review, Retro, Carry-over, Scope-Änderungen.
- Jira bleibt operativer SSOT für Sprint-Zustand und Labels.
- Das `tagebuch` liefert den feineren Rohstoff für Denk- und Arbeitsverlauf.

I) **Jeder Dokutyp braucht eine Vorlage**
- Standard-Dokutypen in diesem Repo sind nur Typen mit gepflegter Vorlage unter
  `templates/`.
- Bevorzugt werden etablierte Typen wie `ADR`, `KEP-Lite`, `Runbook`,
  `Richtlinie/Überblick`, `Sprint-Dossier`, `Testmatrix`, `Feature-Matrix`,
  `Drift-Report`, `Postmortem`.

J) **Neue Dokutypen brauchen Policy + URI-Muster**
- Ein neuer Typ (z. B. Glossar, Abnahmecheck) ist erst freigegeben, wenn
  Vorlage, Vorlagenindex, Policy-Regel und kanonisches URI-/Pfadmuster
  festgezogen sind.
