---
layout: page
title: "Runbook: Git-Hooks für Doku-Sync und Commit-Format"
permalink: /de/operations/recent-changes-hook/
---

Dieses Runbook beschreibt die einmalige Einrichtung und den laufenden Betrieb
der Git-Hooks, die öffentliche Doku-Daten aktualisieren und Commit-Nachrichten
prüfen.

## Überblick

Beim Commit im Doku-Repo läuft ein pre-commit-Hook. Er aktualisiert:

- `_data/recent_commits.yml` für die Startseiten-Sektion „Letzte Änderungen“
- `_data/jira_commits.json` für die Commit-Sektion auf Jira-Vorgangsseiten

Zusätzlich gibt es zwei Hooks für die Projekt-Repos:

- `commit-msg` erzwingt Commit-Nachrichten im Format
  `<typ>(<scope>): <titel> (J01-123)`.
- `post-commit` ergänzt den gerade erzeugten Commit in
  `_data/jira_commits.json`, wenn der Commit-Titel am Ende einen Jira-Key in
  Klammern enthält.
- Im Hauptrepo `lebenslauf-web-vorlage` prüft ein zusätzlicher `pre-commit`-
  Hook, ob `README.md` und `README.en.md` mit den markierten Abschnitten der
  öffentlichen Doku synchron sind.

## Ablauf

```
git commit (im Doku-Repo)
 └─ pre-commit-Hook
     └─ generate-recent-commits.sh → _data/recent_commits.yml
     └─ sync-jira-commits.py full → _data/jira_commits.json
     └─ git add _data/recent_commits.yml _data/jira_commits.json
 └─ generierte Daten fahren im Commit mit
```

```
git commit (in Projekt-Repos)
 └─ pre-commit-Hook (nur lebenslauf-web-vorlage)
     └─ sync-readme.py --check → README.md / README.en.md prüfen
 └─ commit-msg-Hook
     └─ validate-commit-msg.sh
 └─ post-commit-Hook
     └─ sync-jira-commits.py current --commit HEAD
```

## Repo-Liste

Das Skript liest Commits aus folgenden Repos (gleiche Ebene wie dieses Repo):

| Verzeichnis                    | GitHub-Slug                             |
|--------------------------------|-----------------------------------------|
| `lebenslauf-web-vorlage`       | `blaumohn/lebenslauf-web-vorlage`       |
| `lebenslauf-web-vorlage-docs`  | `blaumohn/lebenslauf-web-vorlage-docs`  |
| `pipeline-config-spec-php`     | `blaumohn/pipeline-config-spec-php`     |

Ein fehlendes Repo wird übersprungen (kein Fehler).

## Commit-Sektion auf Vorgangsseiten

`scripts/sync-jira-commits.py full` scannt die gesamte lokale Git-Historie der
Projekt-Repos. Ein Commit wird einem Vorgang zugeordnet, wenn der Betreff mit
`(J01-123)` endet. Die Ausgabe landet in `_data/jira_commits.json`.

Jira-Vorgangsseiten binden die Daten über `_includes/jira-commits.html`
automatisch ein. Dadurch erscheint dieselbe Commit-Sektion auf deutschen und
englischen Vorgangsseiten, ohne die Seiten einzeln zu ändern.

Für einzelne Commits nutzt der `post-commit`-Hook:

```sh
python3 scripts/sync-jira-commits.py current --repo "$PWD" --commit HEAD
```

Der Hook ergänzt nur den aktuellen Commit und behält vorhandene Einträge bei.

## Commit-Nachrichten

Der `commit-msg`-Hook akzeptiert diese Typen:

`feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`,
`chore`, `revert`

Erwartetes Format:

```text
<typ>(<scope>): <titel> (J01-123)
```

Optionale Body-Zeilen müssen leer sein oder als Stichpunkt mit `- ` beginnen.

## Einmalige Einrichtung

```sh
sh scripts/install-hooks.sh
```

Das Skript legt Symlinks aus `.git/hooks/` auf die versionierten Hooks unter
`scripts/hooks/` an. Für das Doku-Repo werden `pre-commit` und `commit-msg`
eingerichtet. Für die Projekt-Repos auf derselben Ebene werden `commit-msg`
und `post-commit` eingerichtet. Im Hauptrepo `lebenslauf-web-vorlage` wird
zusätzlich `pre-commit` aus `project-pre-commit` eingerichtet.

Der `.git/`-Ordner ist nicht versioniert, daher muss dieser Schritt nach jedem
frischen Clone wiederholt werden.

## Verifikation

```sh
sh scripts/generate-recent-commits.sh
python3 scripts/sync-jira-commits.py full
cat _data/recent_commits.yml
cat _data/jira_commits.json
```

Die Commit-Daten sollten Einträge mit den Feldern `repo`, `sha`, `short_sha`,
`datetime`, `github_url` und `subject` enthalten.

## Tests

```sh
sh tests/generate-recent-commits.sh
sh tests/pre-commit-hook.sh
sh tests/project-pre-commit-hook.sh
sh tests/sync-jira-commits.sh
sh tests/validate-commit-msg.sh
```

## Wichtig

- `_data/recent_commits.yml` ist generiert. Nie manuell bearbeiten.
- `_data/jira_commits.json` ist generiert. Nie manuell bearbeiten.
- Commits, die ausschließlich `_data/recent_commits.yml` ändern,
  werden durch einen Pathspec-Filter aus dem Feed ausgeschlossen.
