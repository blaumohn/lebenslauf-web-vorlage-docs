---
layout: page
title: "ADR-0002 Tooling: atlassian-http-client Sicherheitsmodell"
permalink: /en/decisions/adr-0002/
---

**Status:** Akzeptiert

## Kontext {#kontext}

Automatisierung via CLI braucht API-Tokens. Gleichzeitig soll der Aufrufer keine Secrets besitzen, und Requests sollen auf erlaubte Atlassian-Endpunkte beschränkt sein.

## Entscheidung {#entscheidung}

Wir trennen in:

- `atlassian` (unprivilegierte CLI)
- `atlassian-http-client` (läuft als Tool-Eigentümer via `sudo -Hu`)

Token und Config liegen ausschließlich beim Tool-Eigentümer (`$HOME/.config/atlassian/http-client` + Token-Datei).

Die CLI baut nur URL-Templates mit `{CLOUD_ID}`/`{SITE_SUBDOMAIN}`; der http-client löst sie aus der Tool-Eigentümer-Config auf. Der http-client setzt eine Allowlist durch.

## Konsequenzen {#konsequenzen}

- Aufrufer benötigt keine Secrets; Sicherheitsmodell ist einfach prüfbar.
- Transparenz erfolgt über `--dry-run` (Token maskiert).
- Tool-Eigentümer muss Config pflegen; Setup ist einmalig.

## Alternativen {#alternativen}

- Token als Env beim Aufrufer: abgelehnt (Secret-Leak-Risiko).
- Generischer curl ohne Allowlist: abgelehnt (zu viel Zugriff).

## Links {#links}

- Tooling: `atlassian-tools` (lokales Repo)
