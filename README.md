# lebenslauf-web-vorlage-docs

Öffentliche Dokumentation als GitHub Pages.
Inhalte wurden aus früheren Quellen migriert und sind hier konsolidiert
(öffentliche Doku + öffentliche Jira-Fläche).

- Öffentliche Site: <https://docs.template.ysdani.com/de/>
- App-Repo: <https://github.com/blaumohn/lebenslauf-web-vorlage>
- Doku-Repo: <https://github.com/blaumohn/lebenslauf-web-vorlage-docs>

Das App-Repo enthält den Quelltext.
Reguläre Projektdoku liegt nicht unter `docs/` im App-Repo, sondern hier.

## Betrieb (lokale Vorschau)

Siehe Runbook: `operations/ghpages-preview/`.

## Betrieb (öffentliche Jira-Fläche aktualisieren)

Normalweg für bekannte Änderungen:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/journal-sync-jira-change.sh --change J01-95:summary
```

Reparaturmodus / Neu-Baselining:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/update-public-jira-pages.sh
```

Für dieses Doku-Repo gilt aktuell kein generischer `dev`-/`preview`-Ablauf;
Änderungen werden nach lokaler Prüfung direkt in `main` integriert.

Kurzfassung:

```bash
docker compose up --build ghpages-preview
```

```bash
docker compose run --rm ghpages-shell
```
