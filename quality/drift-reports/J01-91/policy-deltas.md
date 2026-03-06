---
layout: page
title: "Policy-Delta-Vorschläge – 2026-03-06"
permalink: /quality/drift-reports/J01-91/policy-deltas/
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
  - `areas/...`, `operations/...`, `decisions/...`, `policies/...`, `quality/...`
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
