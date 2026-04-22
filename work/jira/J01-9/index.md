---
layout: page
title: "J01-9 — Preview: Workflow wieder aktivieren"
permalink: /de/jira/issues/J01-9/
jira_key: J01-9

---
<!-- generated:jira:subtasks_cksum=914092716 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Links

- [Betrieb (Runbook)]({{ "/de/operations/" | relative_url }})

## Beschreibung

Ziel: Das Preview-Deployment nach dem bereits in dev gemergten PR betrieblich ausführen und dokumentieren.

Offen ist der Preview-Lauf mit Ergebnisnachweis; die anschließende Deploy-Arbeit bleibt als nachgelagerte Arbeit getrennt.

## Aktueller Stand

- Die CLI-Konfigurationsbefehle verlangen jetzt explizit `--phase`; der frühere `runtime`-Fallback ist entfernt.
- Die Overrides-Hilfe heißt in der Basisklasse jetzt `parseOverrides`, damit die Benennung klarer zum Parsing-Schritt passt.

## Unteraufgaben

- **9-1 CI-Gates finalisieren** — Zu erledigen
- **9-2 Deploy-Checks validieren** — Zu erledigen
- **9-3 Branch-Flow dokumentieren** — Zu erledigen
- [**9-4 Preview-Deploy-Bundle und Schutzregeln nachziehen**]({{ "/de/jira/issues/J01-9/steps/J01-132/" | relative_url }}) — In Bearbeitung
- [**9-6 Preview-CI am Pipeline-Modell ausrichten**]({{ "/de/jira/issues/J01-9/steps/J01-134/" | relative_url }}) — In Bearbeitung
