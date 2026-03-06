# lebenslauf-web-vorlage-docs

Öffentliche Dokumentation als GitHub Pages.
Inhalte wurden aus früheren Quellen migriert und sind hier konsolidiert
(öffentliche Doku + statische Jira-Übersicht).

## Betrieb (lokale Vorschau)

Siehe Runbook: `operations/ghpages-preview/`.

## Betrieb (Jira-Übersicht aktualisieren)

```bash
sh scripts/update-jira-mirror.sh
```

Kurzfassung:

```bash
docker compose up --build ghpages-preview
```

```bash
docker compose run --rm ghpages-shell
```
