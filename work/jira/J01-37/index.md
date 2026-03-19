---
layout: page
title: "J01-37: Config: Konditionelle Validierung"
jira_key: J01-37
permalink: /de/jira/issues/J01-37/
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-37`.
Herkunft: `ISS-007-conditional-config-validation` aus `docs/agile` (Stand 2026-02-13).

## Ziel

Konditionelle Required-Keys in der Config-Lib definieren können.
Validierung bleibt deterministisch und dokumentierbar.

Konkretes Beispiel: `SMTP_FROM_NAME` ist required nur wenn `MAIL_STDOUT=0`.

## Scope

- Config-Lib:
  - Manifest-Schema um Bedingungen erweitern
  - Validierungslogik für Conditional-Required
  - Fehlerausgaben klar und konsistent halten
- Doku:
  - Bedingungen im Manifest dokumentieren
  - Beispiel mit `MAIL_STDOUT`

## Offene Entscheidungen

- Syntax für Bedingungen (z. B. `when`, `if`, `depends_on`)
- Ausdrucksraum für Bedingungen (nur Gleichheit? Bool? mehrere Keys?)

## Akzeptanzkriterien

- `SMTP_FROM_NAME` ist required nur wenn `MAIL_STDOUT=0`
- Lint/Missing-Checks erkennen fehlende Werte unter Bedingungen korrekt
- Ohne Bedingungen bleibt das bisherige Verhalten unverändert

## Aktueller Stand

- Vorgang in Jira angelegt, Arbeitsdoku aus ISS-007 übernommen (2026-03-19).
- Inhaltliche Umsetzung noch nicht begonnen.
- Voraussetzung für J01-105 (konditionelles required für Mail-Parameter).

## Links

- [J01-38: 37-1 Schema um Bedingungen erweitern]({{ "/de/jira/issues/J01-38/" | relative_url }})
- [J01-39: 37-2 Validierung + Doku ergänzen]({{ "/de/jira/issues/J01-39/" | relative_url }})
- [J01-105: Pipeline-Spec: Manifest vereinfachen]({{ "/de/jira/issues/J01-105/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
