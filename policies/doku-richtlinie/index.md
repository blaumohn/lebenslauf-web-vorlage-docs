---
layout: page
title: "Doku-Richtlinie: lebenslauf-web-vorlage – Wo gehört welcher Inhalt hin?"
permalink: /policies/doku-richtlinie/
---

## Ziel

- Jede Information hat genau einen **Haupt-Ort**.
- Andere Seiten **verlinken nur** (keine Doppelpflege).
- Ein Besucher (HR / Entwickler) kann Inhalte **sofort einordnen**.

## Grundbegriffe

- **Bereich** = Unterbetrieb/Teilgebiet (z. B. CLI/Build, HTTP-Runtime,
  Atlassian-Tooling).
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
- Bereich: Atlassian-Tooling

2. Querschnitt (repo-weit)
- Richtlinien (Doku, Programmierleitlinien, ggf. Security)
- Architektur (nur wenn wirklich übergreifend)
- Entscheidungen (ADR-Index, KEP-Lite-Index)
- Betrieb (Runbook-Index)
- Qualität (Teststrategie, Testmatrix)
- Planung & Veröffentlichung
  - Jira-Übersichten (intern)
  - Jira-Spiegel (öffentlich, statisch)

3. Vorlagen
- ADR-Vorlage
- KEP-Lite-Vorlage
- Runbook-Vorlage
- Testmatrix-Vorlage
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
