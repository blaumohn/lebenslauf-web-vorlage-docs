---
layout: page
title: "Spec: Projekt-Gesamtsystem"
permalink: /de/specs/projekt/
---

Dieses Projekt ist zugleich eine wiederverwendbare Lebenslauf-Web-Vorlage und
das Haupt-Portfolio-Stück, an dem Produkt-, Architektur- und Delivery-Arbeit
öffentlich nachvollziehbar werden.

## Was es ist

- ein Produkt- und Referenzsystem rund um eine Lebenslauf-Website auf
  Shared-Hosting
- ein Verbund aus App, Config-Spec, öffentlicher Doku, Arbeitsrahmen und
  wiederkehrenden Projektabläufen
- eine öffentliche Projektfläche, die HR, Product, Tech und Dev zugleich
  Orientierung geben soll

## Was es nicht ist

- kein reines Doku- oder Jira-Projekt
- kein einzelnes Repo
- kein bloßes Showcase ohne echte Delivery-, Betriebs- und Qualitätslogik

## Warum

- die Website-Vorlage soll praktisch nutzbar und wiederverwendbar sein
- das Projekt soll als starkes Portfolio-Stück zeigen, wie Produkt und Technik
  zusammengeführt werden
- die öffentliche Doku soll Systemgrenzen, Abläufe und Entscheidungen
  nachvollziehbar machen

## Aufbau

- App-System: ausführbares Produkt
- Pipeline-Spec-System: Konfigurations- und Phasenlogik
- Doku-System: kanonische öffentliche Projektfläche
- Jira-System: operatives Arbeits- und Statussystem
- GitHub- und PR-System: Code-, Review- und Integrationssystem
- `tagebuch`: Provenienz- und Herleitungssystem
- KI-/Skill-Rahmen: wiederkehrende KI-Arbeitsgänge und Regeln
- `atlassian-tools`: technische Brücke zu Jira und Confluence

## Rollen

- **HR**:
  sieht Nutzen, Reife und öffentliche Professionalität
- **Product**:
  erkennt Scope, Leserführung und Informationsarchitektur
- **Tech**:
  sieht Systemzuschnitt, Qualitätsrahmen und Betriebsmodell
- **Dev**:
  findet Repos, Abläufe, Policies und Nachweise

## Schnittstellen

- öffentliche Site unter GitHub Pages
- App-Code und PRs auf GitHub
- Jira als nicht öffentliche Arbeitsquelle mit öffentlicher Doku-Spur
- `tagebuch` als Rohstoff und Herleitung

## Ist und Zielbild

- Ist:
  - Projektidentität ist über mehrere Seiten und Repos verteilt
  - wichtige Systeme und Abläufe sind nur teilweise erklärt
- Zielbild:
  - klare Projektlandkarte unter `specs/`
  - Projekt, Systeme und Abläufe sind öffentlich sauber einordenbar

## Übergeordnete Systeme

- kein weiteres Projektsystem innerhalb dieser Doku-Schicht

## Untergeordnete Systeme

- [App-System]({{ "/de/specs/systeme/app/" | relative_url }})
- [Pipeline-Spec-System]({{ "/de/specs/systeme/pipeline-spec/" | relative_url }})
- [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- [GitHub- und PR-System]({{ "/de/specs/systeme/github-zusammenarbeit/" | relative_url }})
- [`tagebuch`]({{ "/de/specs/systeme/tagebuch/" | relative_url }})
- [KI-/Skill-Rahmen]({{ "/de/specs/systeme/ki-skill-rahmen/" | relative_url }})
- [`atlassian-tools`]({{ "/de/specs/systeme/atlassian-tools/" | relative_url }})

## Verwandte Systeme

- [Specs]({{ "/de/specs/" | relative_url }})
- [Einstieg / Quickstart]({{ "/de/getting-started/" | relative_url }})

## Quellen

- [Startseite]({{ "/de/" | relative_url }})
- [Einstieg / Quickstart]({{ "/de/getting-started/" | relative_url }})
- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
- `lebenslauf-web-vorlage/README.md`
- `pipeline-config-spec-php/README.de.md`
