---
layout: page
title: "Spec: App-System"
permalink: /de/specs/systeme/app/
---

Das App-System ist der ausführbare Produktkern des Projekts.
Es rendert die Lebenslauf-Website, verarbeitet Build- und Runtime-Pfade und
trägt die sichtbaren Nutzerfunktionen.

## Was es ist

- das Quellcode-System im Repo `lebenslauf-web-vorlage`
- die Kombination aus CLI, Build-Ressourcen, HTTP-Runtime und Templates
- der Ort, an dem Produktverhalten tatsächlich umgesetzt wird

## Was es nicht ist

- nicht die kanonische öffentliche Projektdoku
- nicht die allgemeine Config-Spec-Bibliothek
- nicht das Arbeits- und Statussystem für Vorgänge

## Warum

- hier entsteht die eigentliche Website-Vorlage
- dieses System belegt Produkt-, Architektur- und Delivery-Qualität

## Aufbau

- CLI / Build
- HTTP-Runtime
- Build-Ressourcen unter `src/resources/build/`
- Templates
- lokale Daten und Overrides unter `.local/`

## Rollen

- Entwickler pflegen Code, Build und Runtime
- Betreiber nutzen Setup-, Build- und Runtime-Pfade
- Leser sehen am Ergebnis die Produktqualität

## Schnittstellen

- nutzt das [Pipeline-Spec-System]({{ "/de/specs/systeme/pipeline-spec/" | relative_url }})
- wird öffentlich erklärt durch das [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- liegt im [GitHub- und PR-System]({{ "/de/specs/systeme/github-zusammenarbeit/" | relative_url }})

## Ist und Zielbild

- Ist:
  - App, CLI und Runtime sind öffentlich bereits teilweise beschrieben
- Zielbild:
  - Produktsystem und seine Grenzen sind als Spec klar eingeordnet

## Übergeordnete Systeme

- [Projekt-Gesamtsystem]({{ "/de/specs/projekt/" | relative_url }})

## Untergeordnete Systeme

- [Bereich: CLI / Build]({{ "/de/areas/cli-build/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})

## Verwandte Systeme

- [Pipeline-Spec-System]({{ "/de/specs/systeme/pipeline-spec/" | relative_url }})
- [GitHub- und PR-System]({{ "/de/specs/systeme/github-zusammenarbeit/" | relative_url }})

## Quellen

- `lebenslauf-web-vorlage/README.md`
- `lebenslauf-web-vorlage/docs/ENVIRONMENTS.md`
- [CLI / Build]({{ "/de/areas/cli-build/" | relative_url }})
- [HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
