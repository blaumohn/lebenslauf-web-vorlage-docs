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

## Auflösungsregeln

### R-01 Dateistruktur

YAML-Config-Dateien sind gruppenbasiert. Die oberste Ebene enthält Gruppen
aus `variable-groups`; darunter stehen die Variablen.

### R-02 Auflösungsreihenfolge

Vier Schichten werden in aufsteigender Priorität zusammengeführt:

| Priorität | Schicht | Quellen-Typ |
|---|---|---|
| 1 (niedrigste) | Manifest-Default | `default` |
| 2 | `pipeline-config/<pipeline>.yaml` | `file` |
| 3 | `.local/<pipeline>.yaml` | `local` |
| 4 (höchste) | CLI-Overrides | `cli` |

### R-03 Merge-Regel

Pro Variable gewinnt der Wert der zuletzt angewendeten Schicht.
Der Quellen-Eintrag (`sources`) wird gemeinsam mit dem Wert übernommen.

### R-04 Fehlende Datei

Fehlt eine Datei, wird sie stillschweigend übersprungen.
Die Auflösung fährt mit den verbleibenden Schichten fort.

### R-05 Quellen-Typ-Erkennung

| Wert | Erkannter Typ |
|---|---|
| `'cli'` | `cli` |
| `'default'` | `default` |
| Pfad mit `/.local/` | `local` |
| sonstiger nicht-leerer Pfad | `file` |
| leer | `unknown` |

## Validierungsregeln

### V-01 Pflicht-Präsenz

Jede Variable, die in einer Phase der Pipeline gefordert ist, muss im
Snapshot vorhanden sein.

### V-02 Kein Leerstring

Ein vorhandener Wert darf nicht der leere String `""` sein.

### V-03 Quellenregel

Ist `sources` für eine Variable gesetzt, muss der erkannte Quellen-Typ
des gelieferten Wertes in der erlaubten Liste stehen.

### V-04 Keine überflüssigen Variablen

Der Snapshot darf keine Variablen enthalten, die nicht im Manifest der
Pipeline definiert sind.

### V-05 Manifest-Default umgeht Quellenregel

Ein Wert, der durch einen Manifest-Default eingesetzt wurde (Quellen-Typ
`default`), ist immer gültig — unabhängig von einer `sources`-Einschränkung.

## Manifest-Regeln

### M-01 Pflichtabschnitte

`manifest.yaml` muss `variable-groups`, `phases` und `pipelines` enthalten.

### M-02 Gruppenstruktur

Jede Variable in einer Gruppe kann die optionalen Felder enthalten:
`sources`, `default`, `meta` (`desc`, `notes`, `example`).

`meta.example` ist die Heimat für Beispielwerte — keine wirksamen Config-Werte.
Validierungsrelevante Abhängigkeiten gehören nicht in `meta.notes`.

### M-03 Phasenregeln und Pipeline-Overrides

- `*` — alle Variablen der Gruppe
- `[VAR1, VAR2]` — Teilauswahl

Pipeline-spezifische Phasenregeln unter `pipelines.<pipeline>.<phase>`
ergänzen `phases.<phase>` additiv. Die Variablenmengen werden vereinigt.

### M-04 Disjunktheit

Dieselbe Variable darf nicht gleichzeitig in `phases.<phase>` und
`pipelines.<pipeline>.<phase>` stehen.

### M-05 Pipeline-Name `common` verboten

`common` ist als interner Bezeichner reserviert und darf nicht als
Pipeline-Name im Manifest verwendet werden.

## Config-Werte

- Aktive Config-Dateien enthalten nur wirksame Betriebswerte.
- Reine Beispielwerte gehören nicht in aktive Config-Dateien.
- Wenn eine Pipeline-Phase einen Wert braucht und keine gültige Quelle ihn
  liefert, muss die Validierung fehlschlagen.

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

- [pipeline-config-spec-php](https://github.com/blaumohn/pipeline-config-spec-php) — Referenzimplementierung
- `lebenslauf-web-vorlage/src/resources/pipeline-config/manifest.yaml`
- [CLI / Build]({{ "/de/areas/cli-build/" | relative_url }})
- [J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }})
