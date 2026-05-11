---
layout: page
title: "J01-34 — CLI-UX: Missing-Config und Pipeline-Phase"
permalink: /de/jira/issues/J01-34/
jira_key: J01-34

---
<!-- generated:jira:subtasks_cksum=1344318037 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Links

-

## Beschreibung

Ziel: Konsistente Pipeline-Phase-Syntax und Missing-Config-Ausgabe.

- Pipeline-Phase-Syntax definieren
- Missing-Config-Befehl spezifizieren

## Aktueller Stand

Stand 2026-05-12:

- Pipeline-gebundene CLI-Befehle werden im App-Repo auf die gemeinsame Form
  `cli <befehl> <pipeline> ...` gebracht.
- `BasePipelineCommand` ist dafür der gemeinsame Ort für das
  `pipeline`-Argument.
- `config` wechselt von `config <action> <pipeline> ...` auf
  `config <pipeline> <action> ...`.
- `setup --skip-python` wird aus dem normalen Setup-Pfad entfernt.
- Python-Linting läuft nicht mehr über `cli python`, sondern direkt über
  `.venv/bin/python tools/lint-python.py`.
- `PythonRunner` fällt nicht mehr auf `python3` zurück; pipeline-gebundene
  Python-Befehle setzen eine vorhandene `.venv` voraus.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| CLI-Signatur | Pipeline-Befehle zeigen `<pipeline>` direkt nach dem Befehl | `php bin/cli help config`, `help token`, `help python`, `help setup` | erledigt |
| Config-Aufrufe | `config dev lint --phase build` funktioniert | Lokaler CLI-Aufruf | erledigt |
| Python-Runner | Ohne `.venv/bin/python` gibt es keinen `python3`-Fallback | `tests/php/PythonRunnerTest.php` | erledigt |
| Setup-Option | `setup` bietet kein `--skip-python` mehr an | `php bin/cli help setup` | erledigt |
| PHP-Tests | App-Test-Suite läuft mit beschreibbarem Temp-Verzeichnis grün | `php -d sys_temp_dir=/private/tmp vendor/bin/phpunit` | erledigt |
| Python-Lint | Neuer direkte `.venv`-Aufruf ist verdrahtet; vorhandene Lint-Befunde sind separat zu bereinigen | `composer --working-dir=lebenslauf-web-vorlage run lint:python` | offen |

## Unteraufgaben

- **34-1 Pipeline-Phase-Syntax festlegen** — Zu erledigen
- **34-2 Missing-Config-Befehl definieren** — Zu erledigen
- [**34-3 CLI: Help-Text für bin/cli config ergänzen**]({{ "/de/jira/issues/J01-34/steps/J01-127/" | relative_url }}) — Zu erledigen
