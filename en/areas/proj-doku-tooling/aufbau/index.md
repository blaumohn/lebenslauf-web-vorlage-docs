---
layout: page
title: "Jira- und Doku-Tooling: Systemüberblick (Ziel & Ist)"
permalink: /en/areas/proj-doku-tooling/aufbau/
---

**Zweck:** Minimal-sichere CLI-Brücke zu Atlassian Cloud (Jira + Confluence) über REST, ohne Secrets beim Aufrufer.

## Komponenten {#komponenten}

- `atlassian-http-client`: System-HTTP-Wrapper (läuft als Tool-Eigentümer).
- `atlassian`: unprivilegierte CLI, baut URLs und ruft den Wrapper via `sudo -Hu` auf.

## Zielbild {#zielbild}

- Secrets liegen ausschließlich beim Tool-Eigentümer.
- HTTP-Ziele sind strikt allowlisted (Jira/Confluence API-Präfixe).
- `http` ist Escape-Hatch; häufige Abläufe werden als eigene Befehle abgebildet (API-Betriebe).

## IST-Zustand {#ist-zustand}

- Config: `$HOME/.config/atlassian/http-client` (Tool-Eigentümer).
- Methoden: GET|POST|PUT|PATCH|DELETE.
- Jira-Allowlist: `/rest/api/3/`, `/rest/agile/1.0/` (via `https://api.atlassian.com/ex/jira/{CLOUD_ID}`).
- Confluence-Allowlist: `/wiki/rest/api/`, `/wiki/api/v2/` (via `https://{SITE_SUBDOMAIN}.atlassian.net`).
- Platzhalter: `{CLOUD_ID}`, `{SITE_SUBDOMAIN}` (Auflösung im `atlassian-http-client`).
- Policy: `--config` nur zusammen mit `--dry-run`.

## Rollenmodell {#rollenmodell}

- **Tool-Eigentümer**: besitzt Config + Token und führt Requests aus.
- **Aufrufer**: nutzt nur die CLI; keine Secrets.
- **Admin**: installiert unter `PREFIX` und pflegt `sudoers`.

## Datenfluss (vereinfacht) {#datenfluss}

1) Aufrufer: `atlassian jira …` oder `atlassian confluence …`
2) CLI baut URL-Template.
3) CLI ruft `sudo -Hu TOOL_OWNER atlassian-http-client …` auf.
4) Wrapper lädt Config/Token, validiert Allowlist, sendet Request (oder `--dry-run`).

## Weiterentwicklung: API-Betriebe (Wrapper) {#api-betriebe}

Wiederkehrende Operationen werden als stabile Befehle modelliert. `http` bleibt als Escape-Hatch erhalten.

- [API-Betriebe]({{ "/en/areas/proj-doku-tooling/api-betriebe/" | relative_url }})

## CLI-Cache (Public-only) {#cli-cache}

Als Zwischenschritt kann ein CLI-Cache Rezepte (Befehlsschablonen) verwalten, damit Mensch/KI ähnliche Befehle schnell bauen kann. Für Output-Caching gilt: Public-only und Einschränkung über Allowlist/Denylist im `atlassian-http-client`; Maskierung ist optional.

## Verweise {#verweise}

- [ADR-0002: Sicherheitsmodell]({{ "/en/decisions/adr-0002/" | relative_url }})
- [Runbook: Backfill Schritt-Nr]({{ "/en/operations/jira-backfill-schritt-nr/" | relative_url }})
- [Programmierstandards]({{ "/en/policies/programmierleitlinien/" | relative_url }})
