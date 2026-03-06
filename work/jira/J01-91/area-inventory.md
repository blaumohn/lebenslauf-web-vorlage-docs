---
layout: page
title: "J01-91: Bereiche-Inventar (Quellenabgleich) – 2026-03-06"
permalink: /work/jira/J01-91/area-inventory/
---

Diese Seite zerlegt die tatsächlich vorhandenen „Bereiche“ in den Quell-Repos
unter `..` und gleicht sie grob gegen die Doku-Bereiche ab.

## Doku-Bereiche (dieses Repo)

- `areas/proj-doku-tooling/`: Jira- und Doku-Tooling (aktiv)
- `areas/cli-build/`: CLI / Build (Platzhalter)
- `areas/http-runtime/`: HTTP-Runtime (Platzhalter)

## Quell-Repos (Basis-Pfad `..`)

### `../atlassian-tools` (Jira/Confluence-Tooling)

Faktisch vorhanden:

- `curl/` → `atlassian-http-client`:
  - Curl-Wrapper mit Allowlist, Token/Config beim Tool-Eigentümer.
- `cli/` → `atlassian`:
  - unprivilegierte CLI, die `atlassian-http-client` via `sudo -Hu` aufruft.
  - Exponierte „Betriebe“ (`jira ext …`): `sprint fill`, `remotelink add`,
    `backfill schritt-nr`.

Mapping in Doku:

- passt zu `areas/proj-doku-tooling/aufbau/`
- `areas/proj-doku-tooling/api-betriebe/` ist konzeptionell passend; Beispiele
  sind auf den CLI-Ist-Stand aktualisiert (Ist vs. geplant getrennt).

### `../lebenslauf-web-vorlage` (App)

Faktisch vorhanden (hoch-level):

- CLI (Pipeline/Phase): `bin/cli`, `src/cli/…`
  - `setup`, `build`, `run`
  - `config …` (get/show/lint/compile), plus Phase-Parameter
- Build-Ressourcen: `src/resources/build/…` (Assets/Schemas/Labels)
- HTTP-App: `src/http/…`
  - u. a. Runtime-Locking (Concurrency) als Teil der Runtime
- Konfigurations-Policy:
  - `.local/…` ist Teil des Systems (lokale Daten/Runtime-Overrides)
  - Runtime-Config wird nach `var/config/config.php` kompiliert

Mapping in Doku:

- sollte primär unter `areas/cli-build/` und `areas/http-runtime/` landen
  (beide sind aktuell Platzhalter).

### `../pipeline-config-spec-php` (Config-Spec / Policy)

Faktisch vorhanden:

- Pipeline/Phase-Spec, YAML-Laden, Manifest/Policy-Checks, Compiler.
- Definierte Config-Reihenfolge inkl. `.local/<pipeline>(-<phase>).yaml`.

Mapping in Doku:

- querschnittlich (Policy/Architektur), aber auch relevant für CLI/Build
  (als Abhängigkeit der App).

### `../composer-tools`

Faktisch vorhanden:

- im Workspace aktuell überwiegend Doku-Struktur; wenig/kein „Tooling-Code“
  erkennbar (Stand 2026-03-06).

Mapping in Doku:

- aktuell kein eigener Bereich nötig, solange keine stabile Funktion/Komponente
  existiert, die in diesem Projekt SSOT ist.

