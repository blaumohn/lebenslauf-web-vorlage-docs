---
layout: page
title: "J01-105: Pipeline-Spec: Manifest vereinfachen für klaren Parameter-Ablauf"
jira_key: J01-105
permalink: /de/jira/issues/J01-105/
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für den Jira-Task `J01-105`.
Das Ziel ist, die `required`/`allowed`-Trennung im pipeline-config-Manifest
durch eine direkte Parameter-Liste je Pipeline/Phase zu ersetzen, so dass
Phasengrenzen eindeutig und prüfbar sind.

## Ziel

- `required` und `allowed` fallen zusammen: eine flache Liste je Pipeline/Phase
  benennt genau die Parameter, die vorhanden sein müssen und die erlaubt sind.
- Code-Defaults (`get('KEY', 'default')`) werden entfernt, damit der
  Parameter-Vektor-Ansatz echte Testergebnisse liefert (Voraussetzung: ISS-003).
- Die pipeline-spec-lib liest `$pipeline[$phase]` als direkte Liste statt
  `['required']`/`['allowed']`.
- Tests werden nachgezogen; das Manifest gilt danach als saubere
  Phasengrenzen-Spezifikation.

## Aktueller Stand

- Konzept ausgearbeitet und Jira-Task angelegt (2026-03-19).
- Voraussetzung ISS-003 (Code-Defaults entfernen) noch offen.
- Voraussetzung ISS-007 (konditionelles required, Mail-Abhängigkeit) zu klären.
- Implementierung noch nicht begonnen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Code-Defaults entfernt | Kein `get('KEY', 'default')` mehr im Quellcode | Quellanalyse pipeline-config-spec-php | offen |
| `LEBENSLAUF_PUBLIC_PROFILE` korrigiert | Nur noch in `build`, nicht in `preview.runtime` | config.manifest.yaml | offen |
| Manifest vereinfacht | Pipeline/Phase als direkte Liste, kein `required`/`allowed` | config.manifest.yaml | offen |
| pipeline-spec-lib angepasst | `$pipeline[$phase]` als direkte Liste | pipeline-config-spec-php | offen |
| Tests grün | Parameter-Vektor-Ansatz P_0 → P_n liefert echte Ergebnisse | Test-Lauf | offen |
| Kein Blocker mehr für J01-9 | J01-105 als erledigt, J01-9 entsperrt | Jira | offen |

## Lib-Repo-Änderungen und lokales Testen

Die Anpassungen an der pipeline-spec-lib erfolgen im Lib-Repo
(`pipeline-config-spec-php`).
Um die lokale Lib-Fassung zusammen mit dem Hauptrepo zu testen, wird das
Skript

```
lebenslauf-web-vorlage/.local/bin/set-config-spec-repo
```

verwendet. Es liest und schreibt eine JSON-Datei, über die der Hauptrepo auf
die lokale Lib-Version zeigt statt auf die installierte Composer-Version.

| Schritt | Befehl / Ort |
| --- | --- |
| Lokale Lib eintragen | `.local/bin/set-config-spec-repo` mit lokalem Pfad |
| Testen | Tests im Hauptrepo laufen gegen lokale Lib |
| Rücksetzen | `.local/bin/set-config-spec-repo` ohne Argument oder auf Published-Version |

## Offene Punkte

- ISS-003: Code-Defaults entfernen (Voraussetzung).
- ISS-007: Konditionelles required für Mail-Parameter klären.
- Entscheidung: vereinfachtes Modell als eigener Schritt oder direkt in J01-105?

## Links

- [J01-9: Preview — Workflow wieder aktivieren]({{ "/de/jira/issues/J01-9/" | relative_url }})
- [J01-31: Preview Readiness — System-Source-Verarbeitung]({{ "/de/jira/issues/J01-31/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
