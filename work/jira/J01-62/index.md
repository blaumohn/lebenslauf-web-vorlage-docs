---
layout: page
title: "J01-62 — Production: Branch- und Environment-Regeln aktivieren"
permalink: /de/jira/issues/J01-62/
jira_key: J01-62

---
<!-- generated:jira:subtasks_cksum=337646038 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Links

-

## Beschreibung

Ziel: Production-Branch und Environment-Regeln verbindlich setzen.

- Branch->Environment-Mapping festlegen
- Environment-Aktivierung vorbereiten

## Aktueller Stand

Der Go-live-Stand wurde am 2026-06-01 gegen Hauptrepo, Jira und die
Agent-Sitzungen seit der Sitzungstabelle vom 30.05. neu bewertet.

Abgeschlossen sind inzwischen:

- Deployment-Mail im Preview-/Deploy-Pfad (`J01-144`): Task-Mails mit
  Preview-Absender und `deploy_switch`-Kontext kommen real an.
- Branch-Mapping (`J01-63`): `deploy.yml` triggert auf `preview` und `prod`;
  `PIPELINE` und GitHub-Environment leiten sich aus `github.ref_name` ab.
- Environment-Aktivierung (`J01-64`): `origin/preview` und `origin/prod`
  zeigen auf den aktivierten Deploy-Stand mit generischem Deploy-Workflow.

Offen bleiben nicht mehr die ursprünglichen Branch-/Environment-Grundlagen,
sondern drei konkrete Go-live-Restpunkte:

- CI-Inhalts-YAML für den Prod-Build bereitstellen (`J01-152`).
- Home- und Index-Inhalt aus echten Seitendaten ableiten (`J01-154`).
- Publish-Pfad und laufende Inhaltsänderungen bewerten (`J01-153`).

Smoke- und Runbook-Fragen werden in den bestehenden Production-Linien
`J01-65` und `J01-68` geführt.

## Unteraufgaben

- [**62-1 Mail im Deployment aktivieren**]({{ "/de/jira/issues/J01-62/steps/J01-144/" | relative_url }}) — Erledigt
- **62-2 Branch-Mapping festlegen** — Erledigt
- **62-3 Environment aktivieren** — Erledigt
- [**62-4 Deploy-Contract: Zustandsmaschine formal dokumentieren (Schritt 1)**]({{ "/de/jira/issues/J01-147/" | relative_url }}) — In Bearbeitung
- [**62-5 DeployPhase-Enum und DeployMachine-Skeleton implementieren**]({{ "/de/jira/issues/J01-148/" | relative_url }}) — Erledigt
- [**62-6 RuleBasedStateMachine-Grundgeruest fuer DeployMachine hinzufuegen**]({{ "/de/jira/issues/J01-149/" | relative_url }}) — In Bearbeitung
- **62-7 CI-Inhalts-YAML fuer Prod-Build bereitstellen** — Zu erledigen
- **62-8 Home- und Index-Inhalt aus Seitendaten ableiten** — Zu erledigen
- **62-9 Publish-Pfad und laufende Inhaltsaenderungen bewerten** — Zu erledigen

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Mail im Deploy-Pfad | Preview-Deploy sendet Task-Mail mit Preview-Absender und Deploy-Kontext | Empfangene Task-Mail zu `deploy_switch`, `J01-144` | erledigt |
| Branch-Mapping | `preview` und `prod` lösen denselben Deploy-Workflow mit branchbasiertem Environment aus | `.github/workflows/deploy.yml`, `origin/preview`, `origin/prod` | erledigt |
| Environment-Aktivierung | GitHub-Environment und `PIPELINE` kommen aus `github.ref_name`; Prod-/Preview-Branches sind remote vorhanden | `.github/workflows/deploy.yml`, Git-Remote-Branches | erledigt |
| CI-Inhalts-YAML | Prod-Build bekommt nicht versionierte Inhalts-YAML kontrolliert in den CI-Driver | `J01-152` | offen |
| Home-/Index-Inhalt | Startseite zeigt echte Seitendaten statt nur Minimalplatzhalter | `J01-154` | offen |
| Publish-/Inhaltsänderungen | Laufende Inhaltsänderungen sind bewertet; Bedienpfad ist geklärt | `J01-153` | offen |
| Smoke-/Runbook-Abgrenzung | Production-Smoke und Betriebsabläufe sind außerhalb von `J01-62` sauber verlinkt | `J01-65`, `J01-68` | offen |
