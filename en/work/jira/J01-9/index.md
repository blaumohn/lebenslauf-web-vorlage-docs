---
layout: page
title: "J01-9 — Preview: Workflow wieder aktivieren"
permalink: /en/jira/issues/J01-9/
jira_key: J01-9

---
<!-- generated:jira:subtasks_cksum=914092716 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Links

- [Betrieb (Runbook)]({{ "/en/operations/" | relative_url }})

## Description

Ziel: Das Preview-Deployment nach dem bereits in dev gemergten PR betrieblich ausführen und dokumentieren.

Offen ist der Preview-Lauf mit Ergebnisnachweis; die anschließende Deploy-Arbeit bleibt als nachgelagerte Arbeit getrennt.

## Aktueller Stand

- Die CLI-Konfigurationsbefehle verlangen jetzt explizit `--phase`; der frühere `runtime`-Fallback ist entfernt.
- Die Overrides-Hilfe heißt in der Basisklasse jetzt `parseOverrides`, damit die Benennung klarer zum Parsing-Schritt passt.

## Subtasks

- **9-1 CI-Gates finalisieren** — To Do
- **9-2 Deploy-Checks validieren** — To Do
- **9-3 Branch-Flow dokumentieren** — To Do
- [**9-4 Preview-Deploy-Bundle und Schutzregeln nachziehen**]({{ "/en/jira/issues/J01-9/steps/J01-132/" | relative_url }}) — In Progress
- [**9-6 Preview-CI am Pipeline-Modell ausrichten**]({{ "/en/jira/issues/J01-9/steps/J01-134/" | relative_url }}) — In Progress
