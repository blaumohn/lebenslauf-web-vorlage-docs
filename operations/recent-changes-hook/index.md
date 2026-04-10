---
layout: page
title: "Runbook: Pre-Push-Hook für Letzte Änderungen"
permalink: /de/operations/recent-changes-hook/
---

Dieses Runbook beschreibt die einmalige Einrichtung und den laufenden Betrieb
des Pre-Push-Hooks, der `_data/recent_commits.yml` automatisch aktualisiert.

## Überblick

Beim Push des Doku-Repos läuft ein Pre-Push-Hook. Er ruft
`scripts/generate-recent-commits.sh` auf, das die letzten Commits aus den
veröffentlichten Projekt-Repos liest und `_data/recent_commits.yml` schreibt.
Falls sich die Datei geändert hat, wird sie automatisch committed.

## Repo-Liste

Das Skript liest Commits aus folgenden Repos (gleiche Ebene wie dieses Repo):

| Verzeichnis                    | GitHub-Slug                             |
|--------------------------------|-----------------------------------------|
| `lebenslauf-web-vorlage`       | `blaumohn/lebenslauf-web-vorlage`       |
| `lebenslauf-web-vorlage-docs`  | `blaumohn/lebenslauf-web-vorlage-docs`  |
| `pipeline-config-spec-php`     | `blaumohn/pipeline-config-spec-php`     |

Ein fehlendes Repo wird übersprungen (kein Fehler).

## Einmalige Einrichtung

```sh
sh scripts/install-hooks.sh
```

Das Skript legt einen Symlink von `.git/hooks/pre-push` auf
`scripts/hooks/pre-push` an. Der `.git/`-Ordner ist nicht versioniert,
daher muss dieser Schritt nach jedem frischen Clone wiederholt werden.

## Verifikation

```sh
sh scripts/generate-recent-commits.sh
cat _data/recent_commits.yml
```

Die Datei sollte 10 Einträge mit den Feldern `repo`, `sha`, `short_sha`,
`datetime`, `github_url` und `message` enthalten.

## Wichtig

- `_data/recent_commits.yml` ist generiert. Nie manuell bearbeiten.
- Der Hook committed mit der Claude-Sonnet-Agent-Identität.
- Nur gepushte Commits erscheinen (via `git log --remotes`).
