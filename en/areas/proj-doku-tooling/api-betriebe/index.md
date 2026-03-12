---
layout: page
title: "Jira- und Doku-Tooling: API-Betriebe (Wrapper)"
permalink: /en/areas/proj-doku-tooling/api-betriebe/
---

Ziel: Häufige Betriebsabläufe als eigene Befehle („Betriebe“) kapseln, damit
Mensch/KI nicht jedes Mal Pfade, JQL und JSON manuell zusammensetzen muss.

## Leitlinien

- `atlassian … http …` bleibt ein Escape-Hatch, nicht der Normalweg.
- Jeder Betrieb ist klein, eindeutig und hat klare Eingaben/Outputs.
- Output bevorzugt maschinenlesbar (JSON/TSV) und stabil.
- Security-Policy bleibt unverändert (Allowlist, Tool-Owner, keine Secrets beim Aufrufer).

## Ist (exponierte Betriebe im CLI)

Die CLI ist im Repo `atlassian-tools` definiert. Verfügbare `jira ext`-Betriebe
(Stand heute):

- `atlassian jira ext sprint fill …`:
  - Issues in einen Sprint setzen (optional mit `--dry-run`).
- `atlassian jira ext remotelink add …`:
  - Jira Remote Link setzen (Doku-URL + Titel; optional `--dry-run`).
- `atlassian jira ext backfill schritt-nr …`:
  - Subtasks: Schritt-Nr aus Rank ableiten + Summary-Prefix setzen (optional `--dry-run`).

Beispiele (Ist):

```bash
atlassian jira ext backfill schritt-nr --parent J01-72 --dry-run
atlassian jira ext remotelink add --issue J01-91 --url https://docs.template.ysdani.com/quality/drift-reports/J01-91/ --title "Phase 1: Drift-Report" --dry-run
```

## Geplant (Kandidaten)

Wenn ein Muster mehrfach gebraucht wird (oder Encoding/Pagination/Fehlklasssen eliminiert),
lohnt sich ein neuer `jira ext …` Betrieb, z.B.:

- `jira ext search jql …` (Pagination + definierte Felder)
- `jira ext issue transition …` (Workflow-Übergänge als sichere Abkürzung)
- `jira ext subtasks reorder …` (wenn Rank-Steuerung wirklich nötig wird)

Wichtig: Geplante Kommandos müssen in der Doku klar als „geplant“ markiert werden,
bis sie im CLI existieren.

