---
layout: page
title: "J01-91: Policy-Delta-Vorschläge – 2026-03-06"
permalink: /en/work/jira/J01-91/policy-deltas/
---

Diese Seite sammelt Vorschläge zur Anpassung von
`policies/doku-richtlinie/` (und ggf. angrenzenden Policies), ohne die Policy
selbst schon umzuschreiben.

## 1) Ist vs. geplant (Markierungsregel)

Problem:
- Mehrere Seiten beschreiben Zielzustände („soll“), ohne klar zu markieren,
  ob es bereits umgesetzt ist.

Vorschlag:
- Jede Seite, die System-/Betriebsverhalten beschreibt, nutzt explizite Blöcke:
  - **Ist**: belegbarer aktueller Stand (mit Quelle: Datei/Command).
  - **Geplant**: Zielzustand (mit Ticket/KEP-Lite/ADR-Referenz).

## 2) Export-/Umwandlungsartefakte vs. produktive lokale Dateien

Problem:
- „Lokale Dateien“ ist zu unscharf: es gibt produktive lokale Dateien
  (z.B. lokale Runtime-Overrides) und es gibt temporäre Export-/Arbeitsartefakte.

Vorschlag:
- In Public-Doku verboten:
  - Nennung/Verlinkung von temporären Export-/Umwandlungsartefakten
    (Ordnernamen, Timestamps, lokale Arbeitskopien).
  - Interne Export-Bezeichner (z.B. ISS-/STY-IDs) außerhalb expliziter
    Umwandlungsdokus.
- In Public-Doku erlaubt:
  - Produktive lokale Projektdateien, die Teil des Systems sind
    (z.B. lokale Runtime-Konfiguration/Overrides), solange sie keine Secrets
    enthalten und die Policy das zulässt.
- Ausnahme-Regel (Allowlist):
  - Explizite Umwandlungs-/Migrationsseiten dürfen interne Bezeichner nennen,
    wenn es für Reproduzierbarkeit/Nachvollziehbarkeit nötig ist.

## 3) Jira-Link-Policy (Remote Links)

Problem:
- Jira soll auf kanonische GitHub-Pages-Dokuseiten linken; `mirror/` ist eine
  Ableitung und soll nicht das primäre Ziel in Jira sein.

Vorschlag:
- Jira Remote Links dürfen nur auf kanonische Doku-Seiten zeigen:
  - `areas/...`, `operations/...`, `decisions/...`, `policies/...`, `quality/...`, `work/...`
  - keine Links auf `mirror/...` aus Jira.
- `mirror/...` darf die gleichen Remote Links anzeigen, wenn sie aus Jira
  importiert werden (Filter/Allowlist: nur Doku-Domain zulassen).

## 4) Drift als Qualitäts-Gate (leichtgewichtig)

Vorschlag:
- Bei strukturellen Änderungen (Betrieb/SSOT/Link-Policy) muss ein Drift-Report
  erstellt/aktualisiert werden.
- Drift-Report ist kein „Blame“, sondern eine Liste von Behauptungen, Quellen
  und Fixes.

## 5) Namensregeln: Area-ID vs. Repo-Name

Vorschlag:
- Bereichs-IDs (Slugs) sind stabil (z.B. `proj-doku-tooling`).
- Repo-Namen können sich ändern; Doku referenziert Repo-Namen nur als Fakten
  („Repo heißt aktuell …“) oder über neutrale Bezeichner („Tooling-Repo“).

## 6) Ziel-Doku-Genauigkeit: Vorgang vs. Drift vs. kanonische Seite

Problem:
- Der aktuelle Entscheidungsbaum wählt einen Dokutyp, aber noch nicht die
  nötige Genauigkeit des Zielorts.
- Dadurch vermischen sich vorgangsgebundene Arbeitsstände, Drift-Befunde und
  stabile Fachdoku.

Vorschlag:
- `work/jira/J01-<KEY>/`:
  - für öffentliche, vorgang-genaue Arbeitsartefakte:
    Scope, offene Entscheidungen, Mapping, Nachweise, Zwischenstände.
  - Kann auf spätere kanonische Seiten verweisen, ersetzt diese aber nicht.
- `quality/drift-reports/J01-<KEY>/`:
  - nur für Drift-Befunde:
    dokumentierte Abweichung zwischen Behauptung, Quelle und aktuellem Stand.
  - Erwartet Claim/Quelle/Status/Fix statt allgemeiner Fachbeschreibung.
- Kanonische Fachseiten unter `areas/`, `operations/`, `policies/`,
  `decisions/`, `quality/`:
  - nur für Inhalte, die über einen einzelnen Vorgang hinaus stabil gelten
    sollen.
- Übergangsregel:
  - vorgang-genaue oder drift-genaue Vorarbeit wird erst dann in die
    kanonische Doku überführt, wenn Entscheidung bzw. Ist-Stand hinreichend
    stabil ist.

## 7) Jeder Dokutyp braucht eine Vorlage

Problem:
- Für mehrere naheliegende Dokutypen gibt es schon Vorlagen, aber die Policy
  sagt noch nicht ausdrücklich, dass jede veröffentlichte Dokuklasse eine
  Vorlage braucht.
- Neue Typen wie Glossar oder Abnahmecheck würden sonst ad hoc entstehen.

Vorschlag:
- Standard-Dokutypen sind nur solche mit gepflegter Vorlage unter
  `templates/`.
- Bestehende, professionelle Basistypen im Repo:
  - `ADR`
  - `KEP-Lite`
  - `Runbook`
  - `Richtlinie/Überblick`
  - `Testmatrix`
  - `Drift-Report`
  - `Postmortem`
- Jede neue Dokuklasse braucht vor Nutzung:
  - `templates/<typ>/`
  - Eintrag im Vorlagenindex `templates/`
  - Anpassung von `policies/doku-richtlinie/`
  - kanonisches URI-/Pfadmuster

## 8) Kanonische URI-Muster pro Dokutyp explizit festziehen

Problem:
- Für einige Typen ist die Vorlage vorhanden, aber das kanonische Zielmuster im
  Repo ist nicht überall belegt.
- Konkret ist `KEP-Lite` als Vorlage vorhanden, aber unter `decisions/` noch
  kein tatsächlich verwendetes URI-Muster sichtbar.

Vorschlag:
- Für jeden freigegebenen Dokutyp wird in der Doku-Richtlinie auch das
  kanonische URI-/Pfadmuster genannt.
- Solange ein Typ kein festgezogenes URI-Muster hat, darf er in
  `archive-topics/` nur als offener Kandidat erscheinen, nicht als feste
  Zielablage.
