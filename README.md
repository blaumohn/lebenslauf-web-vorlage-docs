# lebenslauf-web-vorlage-docs

Öffentliche Dokumentation als GitHub Pages.
Inhalte sind aus Confluence (J01) übernommen und strukturiert.

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
