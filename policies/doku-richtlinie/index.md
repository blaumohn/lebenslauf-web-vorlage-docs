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
- **Ist** = belegbarer aktueller Stand mit Quelle
  (Datei, Befehl, Nachweis, Build-Artefakt).
- **Geplant** = Zielzustand mit Vorgangs-, ADR- oder KEP-Bezug.

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

5a) Ist es die stabile Definition eines Systems, Subsystems oder
    projektweiten Ablaufs?
   - Spec.

4a) Ist es eine gleichförmige Feature- oder Zustandsübersicht mit
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
     Planning, Review, Retro, Carry-over, Scope-Änderungen.

8) Ist der Inhalt ein Drift-Befund?
   - Ja: nach `quality/drift-reports/J01-<KEY>/`.
   - Nur für Behauptung ↔ Quelle ↔ Status ↔ Fix, nicht für allgemeine
     Fachbeschreibung.

9) Gilt der Inhalt über einen einzelnen Vorgang hinaus stabil?
   - Ja: auf die kanonische Fachseite unter `areas/`, `operations/`,
     `policies/`, `decisions/`, `specs/` oder `quality/`.
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
- Specs
  - Projekt
  - Systeme
  - Abläufe
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

C1) **Spec vs. Bereich sauber trennen**
- `Spec` erklärt stabile System- oder Ablaufgrenzen.
- `areas/` erklärt fachliche Bereiche und ihre operative Sicht.
- Eine `Spec` ersetzt weder Bereichsseite noch Runbook.

D) **Leitlinie vs. Katalog vs. Runbook strikt trennen**
- Leitlinie: Regeln/Prinzipien/Policy.
- Katalog/Referenz: Liste der Befehle/Teile mit kurzen Angaben.
- Runbook: Schrittfolge mit Prüfpunkten und Rückfallplan.

D1) **Ist und Geplant sichtbar trennen**
- Seiten mit System-, Betriebs- oder Strukturbehauptungen markieren
  Zielzustand und aktuellen Stand ausdrücklich.
- `Ist` braucht einen belegbaren Nachweis.
- `Geplant` braucht einen Vorgangs-, ADR- oder KEP-Bezug.

E) **KEP führt oft zu ADR**
- KEP: Vorschlag + Abnahmekriterien.
- ADR: Entscheidung + Begründung + Folgen.

F) **`work/jira/` ist vorgang-genau**
- Dorthin gehören öffentliche Arbeitsstände, Nachweise und offene Entscheidungen
  zu genau einem Jira-Vorgang.
- Jede Seite unter `work/jira/J01-<KEY>/` nutzt dieselbe Grundstruktur:
  Ziel, aktueller Stand oder Abschlussbild, Überprüfungsplan, Links.
- Öffentliche Schrittseiten unter
  `work/jira/<PARENT>/steps/<SUBTASK_KEY>/` sind eine Variante derselben
  Jira-Arbeitsdoku für Subtasks mit eigener öffentlicher Detailaussage.
- Der Abschnitt `## Überprüfungsplan` ist Pflicht.
- Der Überprüfungsplan enthält mindestens die Tabellenspalten:
  `Prüfpunkt`, `Erwartung`, `Nachweis / Ort`, `Status`.
- Die Tabelle dient als knapper Review- und Abschlussplan in
  `In Überprüfung`; sie ersetzt keine breite `quality/testmatrix/`.
- Für normale Jira-Arbeitsdokus gilt zusätzlich:
  - direkt unter `Stand` steht ein kurzer Kontextblock
  - wenn ein übergeordneter Vorgang öffentlich sichtbar ist, zeigt der Block
    zusätzlich die Parent-Arbeitsdoku
  - wenn öffentliche Schrittseiten unter dem Vorgang existieren, zeigt der
    Block kurze Direktpfade zu diesen Schrittseiten
  - wenn die aktuelle Seite mindestens zwei `##`-Abschnitte hat oder der
    Vorgang weitere öffentliche Teilseiten oder Schrittseiten besitzt, folgt
    darunter ein eigener Abschnitt `## Inhalts-Schlüssel`
  - der Inhalts-Schlüssel zeigt zuerst die `##`-Gliederung der aktuellen Seite
    und ergänzt danach weitere Teilseiten und öffentliche Schritte des
    Vorgangs
- Für Schrittseiten gilt zusätzlich:
  - direkt unter `Stand` steht derselbe kurze Kontextblock
  - der Block zeigt die Eltern-Arbeitsdoku
  - der Eltern-Key im Einleitungssatz linkt auf die Eltern-Arbeitsdoku
  - wenn für eine bestehende Unteraufgabe neu eine öffentliche Schrittseite
    entsteht, werden vorhandene Nennungen in der Public-Doku auf passende
    Links nachgezogen, soweit diese Schrittseite oder ihren Elternvorgang
    betreffen

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
  `Richtlinie/Überblick`, `Spec`, `Sprint-Dossier`, `Testmatrix`,
  `Feature-Matrix`, `Drift-Report`, `Postmortem`, `Jira-Arbeitsdoku`.

J) **Neue Dokutypen brauchen Policy + URI-Muster**
- Ein neuer Typ (z. B. Glossar, Abnahmecheck) ist erst freigegeben, wenn
  Vorlage, Vorlagenindex, Policy-Regel und kanonisches URI-/Pfadmuster
  festgezogen sind.

K) **Temporäre lokale Artefakte bleiben privat**
- `.local/` ist repo-nahe private Ablage für Exporte, Arbeitskopien und
  nicht veröffentlichte Archivmaterialien.
- `.local/` ist weder kanonische Public-Doku noch versionierter Normalfall.
- Public-Doku nennt oder verlinkt keine temporären Exportpfade, Timestamps oder
  lokalen Arbeitskopien.

K1) **Deutsche Fließtexte nutzen echte Umlaute**
- Deutsche Fließtexte in öffentlichen Seiten, Jira-Arbeitsdokus und READMEs
  nutzen `ä`, `ö`, `ü` und `ß` statt Umschriften wie `ae`, `oe`, `ue`, `ss`.
- Diese Regel gilt für normale Doku-Sätze, Überschriften, Listen und
  beschreibende Tabellenspalten.
- Ausgenommen sind technische Schlüssel:
  Variablennamen, Klassen, Funktionen, Dateinamen, Slugs, Permalinks, URLs,
  Pfade, Commit-IDs, Befehle, Codebeispiele und andere Programmschlüssel.

L) **Interne IDs bleiben aus Public-Doku heraus**
- Interne Export-Bezeichner, frühere Arbeits-IDs und private Mapping-Tabellen
  gehören nicht in öffentliche Seiten.
- Falls eine Zuordnung für Nachvollziehbarkeit nötig ist, bleibt sie in privaten
  Notizen oder Arbeitsmaterialien außerhalb der Public-Doku.

M) **Jira verlinkt nur auf kanonische Doku-Ziele**
- Jira-Remote-Links zeigen auf kanonische Seiten unter `areas/`, `operations/`,
  `decisions/`, `policies/`, `specs/`, `quality/` oder `work/`.
- Öffentliche Jira-Arbeitsdokus entstehen nur unter `work/jira/` und dessen
  öffentlichen `/de/...`-/`/en/...`-Permalinks.

N) **Drift ist ein leichtgewichtiges Qualitäts-Gate**
- Bei strukturellen Änderungen an SSOT, Link-Policy oder Betriebsablauf wird ein
  Drift-Report erstellt oder aktualisiert.
- Drift-Reports dokumentieren Behauptung, Quelle, Status und Fix, nicht
  allgemeine Fachbeschreibung.

O) **Repo-Namen sind Fakten, Bereichs-IDs sind stabil**
- Bereichs-IDs und Slugs bleiben stabil.
- Repo-Namen werden nur als aktuelle Fakten oder neutrale Rollen beschrieben.

P) **Kanonische URI-Muster sind Teil des Dokutyps**
- `ADR`: `decisions/adr-xxxx/`
- `KEP-Lite`: `decisions/kep-xxxx/`
- `Runbook`: `operations/<slug>/`
- `Richtlinie/Überblick`: `policies/<slug>/`
- `Testmatrix`: `quality/testmatrix/` oder `quality/testmatrix/<slug>/`
- `Feature-Matrix`: `quality/feature-matrix/` oder
  `quality/feature-matrix/<slug>/`
- `Spec`: `specs/<slug>/`, `specs/systeme/<slug>/` oder
  `specs/ablaeufe/<slug>/`
- `Drift-Report`: `quality/drift-reports/J01-<KEY>/`
- `Sprint-Dossier`: `work/sprints/<sprint-slug>/`
- `Jira-Arbeitsdoku`: `work/jira/J01-<KEY>/`
- `Jira-Arbeitsdoku` (Schritt-Variante):
  `work/jira/<PARENT>/steps/<SUBTASK_KEY>/`
- `Postmortem`: `quality/postmortems/<slug>/`

Q) **Kein eigener Glossar- oder Abnahmecheck-Typ ohne belegten Bedarf**
- Begriffe werden auf Bereichs-, Richtlinien- oder Überblicksseiten gepflegt.
- Feingranulare Abnahme- und Prüfnachweise bleiben Teil von `quality/testmatrix/`
  oder vorgangsgenauer Arbeitsdoku.
