---
layout: page
title: "Spec: Jira-State-Sync und öffentliche Fläche"
permalink: /de/specs/ablaeufe/jira-state-sync-und-oeffentliche-flaeche/
---

Dieser Ablauf beschreibt den gezielten Nachzug zwischen Jira-Änderungen und
der öffentlichen Jira-Fläche in GitHub Pages.

## Zweck

- öffentliche Jira-Sicht gezielt, nachvollziehbar und ohne Voll-Sync pflegen

## Auslöser

- bekannte Jira- oder Pages-Änderung an einem Vorgang

## Beteiligte Systeme

- [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- [`atlassian-tools`]({{ "/de/specs/systeme/atlassian-tools/" | relative_url }})
- [KI-/Skill-Rahmen]({{ "/de/specs/systeme/ki-skill-rahmen/" | relative_url }})

## Ein- und Ausgänge

- Eingänge:
  - Jira-Diff oder bekannte Pages-Änderung
- Ausgänge:
  - aktualisierte öffentliche Jira-Fläche und kanonische Remote-Links

## Ablauf

1. Journal-Lauf anlegen oder fortsetzen
2. lokalen Jira-Cache initialisieren oder gezielt aktualisieren
3. betroffene Keys bestimmen
4. öffentliche Jira-Fläche nur für diese Keys nachziehen
5. Remote-Links und Ergebnis verifizieren

## Übergaben

- Jira-Änderung -> lokaler Cache
- lokaler Cache -> gezielter Pages-Nachzug
- Pages-Nachzug -> Remote-Link-Verifikation

## Grenzen und Nicht-Ziele

- kein unnötiger Voll-Sync
- keine zweite parallele Skill-Variante für denselben Ablauf

## Verweise auf operative Doku

- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [J01-106]({{ "/de/jira/issues/J01-106/" | relative_url }})

## Quellen

- `skills/jira-state-sync/SKILL.md`
- [Jira]({{ "/de/jira/" | relative_url }})
- [Jira- und Doku-Tooling: Jira-Übersicht]({{ "/de/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})
