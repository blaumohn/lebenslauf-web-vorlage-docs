---
layout: page
title: "Spec: Pipeline-Spec-System"
permalink: /de/specs/systeme/pipeline-spec/
---

Das Pipeline-Spec-System beschreibt, lädt, prüft und kompiliert
Konfigurationszustände entlang von Pipelines und Phasen.

## Was es ist

- die Bibliothek `pipeline-config-spec-php`
- ein Regel- und Ausführungssystem für YAML-Laden, Manifest-Validierung und
  Config-Kompilation
- die Schicht, die Phasen- und Quellenlogik ausdrücklich macht

## Was es nicht ist

- nicht das öffentliche Produkt selbst
- nicht die Arbeitsdoku
- nicht nur eine Dateiablage für Defaults

## Warum

- App- und Deployment-Pfade brauchen prüfbare Config-Grenzen
- das Projekt soll Pipeline- und Phasenlogik nicht implizit im Code verstecken

## Aufbau

- YAML-Loader
- Manifest-Logik
- Quellen- und Policy-Prüfung
- Compiler für Config-Snapshots

## Manifest-Meta

- `meta.desc` beschreibt einen einzelnen Parameter fachlich kurz.
- `meta.example` zeigt einen Beispielwert.
- `meta.notes` trägt kurze lokale Hinweise zum Parameter.
- Validierungsrelevante Parameter-Abhängigkeiten bleiben kein Freitext in
  `meta.notes`, sondern gehören in einen eigenen Regelpfad wie `J01-37`.

## Rollen

- Bibliotheks- und App-Entwickler
- Betreiber von Build-, Runtime- und Deploy-Pfaden

## Schnittstellen

- liefert Regeln an das [App-System]({{ "/de/specs/systeme/app/" | relative_url }})
- wird öffentlich erklärt durch [CLI / Build]({{ "/de/areas/cli-build/" | relative_url }})
- wird fachlich geschärft über [J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }})

## Ist und Zielbild

- Ist:
  - Config-Reihenfolge und Manifest-Grundregeln sind beschrieben
- Zielbild:
  - Projektweit klare, schlanke und prüfbare Phasengrenzen

## Übergeordnete Systeme

- [Projekt-Gesamtsystem]({{ "/de/specs/projekt/" | relative_url }})

## Untergeordnete Systeme

- Manifest-Modell
- Quellen- und Compiler-Logik

## Verwandte Systeme

- [App-System]({{ "/de/specs/systeme/app/" | relative_url }})
- [GitHub- und PR-System]({{ "/de/specs/systeme/github-zusammenarbeit/" | relative_url }})

## Quellen

- `pipeline-config-spec-php/README.de.md`
- `pipeline-config-spec-php/README.md`
- `lebenslauf-web-vorlage/src/resources/config/config.manifest.yaml`
- [CLI / Build]({{ "/de/areas/cli-build/" | relative_url }})
- [J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }})
