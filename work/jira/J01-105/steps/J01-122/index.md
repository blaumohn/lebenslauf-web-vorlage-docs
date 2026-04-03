---
layout: page
title: "105-1: Setup-Seed-Pfad fachlich bereinigen"
jira_key: J01-122
jira_parent_key: J01-105
permalink: /de/jira/issues/J01-105/steps/J01-122/
---

**Stand:** 2026-04-03

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[105-1]({{ "/de/jira/issues/J01-105/steps/J01-122/" | relative_url }}) unter
[J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }}).
Diese Seite trennt den fachlichen Seed-Fall bewusst vom restlichen
Manifest-Umbau, weil hier zuerst ein Modellfehler bereinigt werden muss.

## Ziel

- `setup` darf nicht länger von `LEBENSLAUF_PUBLIC_PROFILE` abhängen.
- Sample-Inhalt wird nur noch über eine feste Quelle und ein festes Ziel
  bereitgestellt.
- Bereits vorhandene Nutzdaten dürfen durch den Setup-Pfad nicht
  stillschweigend überschrieben werden.

## Bericht

- Ausgangsbefund: Der frühere Seed-Pfad koppelte Beispielinhalt an das
  Build-Profil und war damit fachlich inkohärent.
- Zielstand laut Vorgangsherleitung:
  `--copy-sample-content` statt `--reset-sample-content`,
  feste Quelle `src/resources/fixtures/lebenslauf/daten-gueltig.yaml`,
  festes Ziel `daten-sample.yaml`,
  Fehler bei bereits vorhandenem Ziel.
- Dieser Schritt hält nur den fachlichen Zuschnitt und den Nachweisplan fest;
  die eigentliche Umsetzung und ihre Prüfläufe folgen im Quell-Repo.

## Aktueller Stand

- Jira-Subtask `J01-122` ist angelegt.
- Der fachliche Zielzustand ist gegen `J01-105` abgegrenzt und öffentlich
  referenzierbar.
- Code- und Testnachweise sind in diesem Schritt noch offen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Setup entkoppelt | `LEBENSLAUF_PUBLIC_PROFILE` taucht im Seed-Pfad nicht mehr auf | App-Repo, Setup-Code | offen |
| Feste Sample-Quelle | Seed liest `daten-gueltig.yaml` als feste Fixture | App-Repo, Setup-Code | offen |
| Fester Zielname | Seed schreibt nach `daten-sample.yaml` | App-Repo, Setup-Code | offen |
| Kein stilles Überschreiben | Bereits vorhandenes Ziel erzeugt einen klaren Fehlerpfad | App-Repo, Prüflauf | offen |

## Offene Punkte

- Abgleichen, wie der neue Seed-Pfad in CLI, README und Tests sichtbar
  gespiegelt werden muss.
- Prüfen, ob bestehende Setup-Tests erweitert oder neu geschnitten werden
  müssen.

## Links

- [105-1 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-122/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})

