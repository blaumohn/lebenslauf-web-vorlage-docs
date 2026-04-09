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

- `setup --copy-sample-content` nutzt wieder das Pipeline-Profil
  `LEBENSLAUF_PUBLIC_PROFILE`, aber nur, wenn die konkrete Pipeline diesen Key
  für ihre `setup`-Phase freischaltet.
- Sample-Inhalt wird über eine feste Quelle bereitgestellt und in das
  konfigurierte öffentliche Profil der Pipeline kopiert.
- Bereits vorhandene Nutzdaten dürfen durch den Setup-Pfad nicht
  stillschweigend überschrieben werden.

## Bericht

- Ausgangsbefund: Der frühere Seed-Pfad koppelte Beispielinhalt an das
  Build-Profil und war damit fachlich inkohärent.
- Überholter Zwischenstand laut damaliger Vorgangsherleitung:
  `--copy-sample-content` statt `--create-demo-content`,
  feste Quelle `src/resources/fixtures/lebenslauf/daten-gueltig.yaml`,
  festes Ziel `daten-sample.yaml`,
  Fehler bei bereits vorhandenem Ziel.
- Zunächst umgesetzt im App-Worktree `feature/j01-105-simplify-manifest`:
  `SetupCommand` delegiert den Seed-Lauf an `SampleContentCopier`, der
  ausschließlich mit der festen Fixture und dem festen Ziel arbeitet.
- Nachweis ergänzt: PHPUnit deckt den erfolgreichen Kopierfall und den
  Fehlerpfad bei vorhandenem Ziel ab; der Smoke-Test nutzt
  `setup --copy-sample-content`.
- Korrektur nach Smoke-Test-Befund: Das feste Ziel `daten-sample.yaml`
  erzeugte nur ein privates Profil `sample`; `/cv` blieb 404. Der Seed-Zielname
  wird deshalb aus dem explizit im Pipeline-Spec gesetzten
  `LEBENSLAUF_PUBLIC_PROFILE` abgeleitet.

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
| Setup-Profil explizit | `LEBENSLAUF_PUBLIC_PROFILE` ist nur für konkrete Setup-Pipelines erlaubt und muss im Spec gesetzt sein | `src/resources/config/config.manifest.yaml`, `src/resources/config/dev-setup.yaml` | korrigiert |
| Feste Sample-Quelle | Seed liest `daten-gueltig.yaml` als feste Fixture | `src/cli/php/Setup/SampleContentCopier.php` | erledigt |
| Profilbasierter Zielname | Seed schreibt nach `daten-<LEBENSLAUF_PUBLIC_PROFILE>.yaml` | `src/cli/php/Setup/SampleContentCopier.php` | korrigiert |
| Kein stilles Überschreiben | Bereits vorhandenes Ziel erzeugt einen klaren Fehlerpfad | `tests/php/SampleContentCopierTest.php` | erledigt |
| CLI- und Doku-Spiegel | Schalter und Seed-Pfad sind in README, Umgebungsdoku und Smoke-Test konsistent | `README.md`, `README.en.md`, `docs/ENVIRONMENTS.md`, `tests/py/smoke.py` | erledigt |

## Offene Punkte

- Keine schrittspezifischen offenen Punkte mehr.
- Restarbeit zu `J01-105` liegt in den Geschwister-Schritten.

## Links

- [105-1 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-122/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})
