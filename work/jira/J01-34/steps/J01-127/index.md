---
layout: page
title: "34-3: CLI: Help-Text für bin/cli config ergänzen"
jira_key: J01-127
jira_parent_key: J01-34
permalink: /de/jira/issues/J01-34/steps/J01-127/
---

**Stand:** 2026-04-13

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[34-3]({{ "/de/jira/issues/J01-34/steps/J01-127/" | relative_url }}) unter
[J01-34]({{ "/de/jira/issues/J01-34/" | relative_url }}).

## Ziel

- `bin/cli config --help` zeigt einen strukturierten Aktionen-Abschnitt mit
  Erklärungen zu `get`, `show`, `lint` und `compile` sowie je einem Beispiel.
- Bei unbekannter Aktion nennt die Fehlermeldung die gültigen Werte und
  verweist auf `--help`.
- Bestehende Fehlerpfade (z. B. fehlendes KEY bei `get`) bleiben unverändert.

## Scope

Einzige betroffene Datei:
`lebenslauf-web-vorlage/src/cli/php/Command/ConfigCommand.php`

Änderungen:
- `setHelp()` in `configure()` ergänzt (nach dem letzten `addOption()`-Aufruf)
- Fehlermeldung bei unbekannter Aktion verbessert (zwei Zeilen statt einer)

## Abhängigkeit

Der Commit im Hauptrepo wartet auf die Merge-Kette:
**J01-105-Branch → J01-9 → dev**

Die Änderung ist im Arbeitsbaum vorhanden (unstaged) und wird nach Auflösung
der Kette committet.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis/Ort | Status |
| --- | --- | --- | --- |
| `bin/cli config --help` | Aktionen-Abschnitt mit get/show/lint/compile und je einem Beispiel sichtbar | Terminal | offen |
| Unbekannte Aktion | Fehlermeldung nennt gültige Werte; zweite Zeile verweist auf `--help` | Terminal | offen |
| `bin/cli config get mypipe` ohne KEY | Bestehende Fehlermeldung unverändert | Terminal | offen |
