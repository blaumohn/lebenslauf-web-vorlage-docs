---
layout: page
title: "Spec: Jira-System"
permalink: /de/specs/systeme/jira-system/
---

Das Jira-System ist das operative Arbeits-, Status- und Sprint-System des
Projekts.

## Was es ist

- der nicht öffentliche SSOT für Vorgänge, Status, Sprint-Zuordnung und Labels
- der Ort für operative Arbeitssteuerung
- die Quelle, aus der die öffentliche Jira-Fläche abgeleitet wird

## Was es nicht ist

- nicht die öffentliche kanonische Doku
- nicht das Code- oder PR-System
- nicht die Rohnotiz- oder Provenienzschicht

## Warum

- Arbeit, Priorität und Status brauchen ein operatives System
- öffentliche GitHub-Pages-Seiten sollen keine Jira-Cloud-Links oder interne
  Rohsicht erzwingen

## Aufbau

- Vorgänge und Schritte
- Sprint-Zustand und Sprint-Labels
- Links zwischen Vorgängen
- Remote-Links zu öffentlicher Doku

## Rollen

- Produkt- und Projektsteuerung
- operative Arbeitskoordination
- Quelle für öffentliche Jira-Arbeitsdokus

## Schnittstellen

- wird technisch bedient über [`atlassian-tools`]({{ "/de/specs/systeme/atlassian-tools/" | relative_url }})
- wird öffentlich gespiegelt im [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- hängt in Delivery-Fragen mit dem [GitHub- und PR-System]({{ "/de/specs/systeme/github-zusammenarbeit/" | relative_url }}) zusammen

## Ist und Zielbild

- Ist:
  - Jira ist operativer SSOT für Status und Sprint
- Zielbild:
  - öffentliche Doku und Jira bleiben sauber getrennt, aber klar verbunden

## Übergeordnete Systeme

- [Projekt-Gesamtsystem]({{ "/de/specs/projekt/" | relative_url }})

## Untergeordnete Systeme

- Sprint- und Label-Logik
- Vorgänge und Schritte
- Remote-Link-Pflege

## Verwandte Systeme

- [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- [`atlassian-tools`]({{ "/de/specs/systeme/atlassian-tools/" | relative_url }})

## Quellen

- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [J01-106]({{ "/de/jira/issues/J01-106/" | relative_url }})
- `skills/jira-state-sync/SKILL.md`
