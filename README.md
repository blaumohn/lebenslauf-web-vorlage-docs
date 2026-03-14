# lebenslauf-web-vorlage-docs

Öffentliche Dokumentation als GitHub Pages.
Inhalte wurden aus früheren Quellen migriert und sind hier konsolidiert
(öffentliche Doku + statische Jira-Übersicht).

- Öffentliche Site: <https://docs.template.ysdani.com/de/>
- App-Repo: <https://github.com/blaumohn/lebenslauf-web-vorlage>
- Doku-Repo: <https://github.com/blaumohn/lebenslauf-web-vorlage-docs>

Das App-Repo enthält den Quelltext.
Reguläre Projektdoku liegt nicht unter `docs/` im App-Repo, sondern hier.

## Betrieb (lokale Vorschau)

Siehe Runbook: `operations/ghpages-preview/`.

## Betrieb (Jira-Übersicht aktualisieren)

```bash
sh scripts/update-jira-mirror.sh
```

Gezielter Normalmodus für bekannte Änderungen:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/journal-sync-jira-change.sh --change J01-95:summary
```

Kurzfassung:

```bash
docker compose up --build ghpages-preview
```

```bash
docker compose run --rm ghpages-shell
```
