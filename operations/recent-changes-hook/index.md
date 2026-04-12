---
layout: page
title: "Runbook: Pre-Commit-Hook für Letzte Änderungen"
permalink: /de/operations/recent-changes-hook/
---

Dieses Runbook beschreibt die einmalige Einrichtung und den laufenden Betrieb
des pre-commit-Hooks, der `_data/recent_commits.yml` automatisch aktualisiert.

## Überblick

Beim Commit im Doku-Repo läuft ein pre-commit-Hook. Er ruft
`scripts/generate-recent-commits.sh` auf, das die neuesten Remote-Commits aus
den veröffentlichten Projekt-Repos liest und `_data/recent_commits.yml` schreibt.
Anschließend wird die Datei gestagert und fährt automatisch im laufenden Commit
mit. Ein zweiter Push ist nicht nötig.

## Ablauf

```
git commit (im Doku-Repo)
 └─ pre-commit-Hook
     └─ git fetch origin (je Quell-Repo)
     └─ generate-recent-commits.sh → _data/recent_commits.yml
     └─ git add _data/recent_commits.yml
 └─ recent_commits.yml fährt im Commit mit
git push → alles in einem Schritt veröffentlicht
```

## Repo-Liste

Das Skript liest Commits aus folgenden Repos (gleiche Ebene wie dieses Repo):

| Verzeichnis                    | GitHub-Slug                             |
|--------------------------------|-----------------------------------------|
| `lebenslauf-web-vorlage`       | `blaumohn/lebenslauf-web-vorlage`       |
| `lebenslauf-web-vorlage-docs`  | `blaumohn/lebenslauf-web-vorlage-docs`  |
| `pipeline-config-spec-php`     | `blaumohn/pipeline-config-spec-php`     |

Ein fehlendes Repo wird übersprungen (kein Fehler).
Ein nicht erreichbares Remote wird ebenfalls übersprungen; das Skript
fällt auf den lokalen Cache zurück.

## Einmalige Einrichtung

```sh
sh scripts/install-hooks.sh
```

Das Skript legt einen Symlink von `.git/hooks/pre-commit` auf
`scripts/hooks/pre-commit` an. Der `.git/`-Ordner ist nicht versioniert,
daher muss dieser Schritt nach jedem frischen Clone wiederholt werden.

## Verifikation

```sh
sh scripts/generate-recent-commits.sh
cat _data/recent_commits.yml
```

Die Datei sollte bis zu 10 Einträge mit den Feldern `repo`, `sha`,
`short_sha`, `datetime`, `github_url` und `message` enthalten.

## Tests

```sh
sh tests/generate-recent-commits.sh
sh tests/pre-commit-hook.sh
```

## Wichtig

- `_data/recent_commits.yml` ist generiert. Nie manuell bearbeiten.
- Commits, die ausschließlich `_data/recent_commits.yml` ändern,
  werden durch einen Pathspec-Filter aus dem Feed ausgeschlossen.
- Nur bereits gepushte Commits erscheinen (via `git log --remotes`).
