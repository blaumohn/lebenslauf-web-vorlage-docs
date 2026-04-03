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
  `--copy-sample-content` statt `--create-demo-content`,
  feste Quelle `src/resources/fixtures/lebenslauf/daten-gueltig.yaml`,
  festes Ziel `daten-sample.yaml`,
  Fehler bei bereits vorhandenem Ziel.
- Umgesetzt im App-Worktree `feature/j01-105-simplify-manifest`:
  `SetupCommand` delegiert den Seed-Lauf an `SampleContentCopier`, der
  ausschließlich mit der festen Fixture und dem festen Ziel arbeitet.
- Nachweis ergänzt: PHPUnit deckt den erfolgreichen Kopierfall und den
  Fehlerpfad bei vorhandenem Ziel ab; der Smoke-Test nutzt
  `setup --copy-sample-content`.

## Aktueller Stand

- Jira-Subtask `J01-122` ist angelegt.
- Der fachliche Zielzustand ist gegen `J01-105` abgegrenzt und öffentlich
  referenzierbar.
- Code- und Testnachweise sind im App-Worktree nachgezogen.
- Öffentliche Repo-Doku spiegelt den neuen Seed-Pfad in README und
  Umgebungsdoku.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Setup entkoppelt | `LEBENSLAUF_PUBLIC_PROFILE` taucht im Seed-Pfad nicht mehr auf | `src/cli/php/Command/SetupCommand.php`, `src/cli/php/Setup/SampleContentCopier.php` | erledigt |
| Feste Sample-Quelle | Seed liest `daten-gueltig.yaml` als feste Fixture | `src/cli/php/Setup/SampleContentCopier.php` | erledigt |
| Fester Zielname | Seed schreibt nach `daten-sample.yaml` | `src/cli/php/Setup/SampleContentCopier.php` | erledigt |
| Kein stilles Überschreiben | Bereits vorhandenes Ziel erzeugt einen klaren Fehlerpfad | `tests/php/SampleContentCopierTest.php` | erledigt |
| CLI- und Doku-Spiegel | Schalter und Seed-Pfad sind in README, Umgebungsdoku und Smoke-Test konsistent | `README.md`, `README.en.md`, `docs/ENVIRONMENTS.md`, `tests/py/smoke.py` | erledigt |

## Offene Punkte

- Keine schrittspezifischen offenen Punkte mehr.
- Restarbeit zu `J01-105` liegt in den Geschwister-Schritten.

## Links

- [105-1 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-122/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})
