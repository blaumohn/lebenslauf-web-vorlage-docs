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

## Abschlussstand

Der Go-live ist fachlich erreicht. Der gemeinsame Deploy-Workflow unterstützt
`preview` und `prod`; Branch, Pipeline und GitHub-Environment werden aus dem
Branch-Kontext abgeleitet. Die Production-Konfiguration verwendet das gültige
öffentliche Profil.

Die am 2026-06-01 ergänzten Go-live-Restschritte sind inzwischen durch die
Commit-Historie belegt:

- `J01-152`: CI lädt die Production-Inhaltsquelle per SFTP.
- `J01-153`: Der Publish-Pfad baut, überträgt und veröffentlicht CV-HTML und
  prüft das Ergebnis per HTTP-Smoke.
- `J01-154`: Production nutzt reale Seitendaten statt des Dev-Profils.

Die Deploy-Contract- und DeployMachine-Linien bleiben als technische
Nacharbeit sichtbar; sie widerlegen den erreichten Go-live nicht.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Branch und Environment | `preview` und `prod` nutzen den gemeinsamen Workflow und branchbasierte Environments | [J01-64]({{ "/de/jira/issues/J01-62/steps/J01-64/" | relative_url }}) | erledigt |
| Deployment-Mail | Der reale Deploy-Pfad sendet Task-Mails | [J01-144]({{ "/de/jira/issues/J01-62/steps/J01-144/" | relative_url }}) | erledigt |
| Production-Inhalt | CI kann die Production-Inhaltsquelle laden | Hauptrepo-Commit `318d77e`, J01-152 | fachlich erledigt; Jira-Nachzug offen |
| Publish-Pfad | CV-HTML wird atomar veröffentlicht und per HTTP geprüft | Hauptrepo-Commits `33768cf`, `5ad711f`, `97a3cdb`, `7341f10` | fachlich erledigt; Jira-Nachzug offen |
| Reales Profil | Production nutzt ein gültiges öffentliches Profil | Hauptrepo-Commit `d5202b6` | fachlich erledigt; Jira-Nachzug offen |
| Go-live | Produktion ist live | Menschliche Bestätigung vom 2026-06-04, Sprint-5-Review | erledigt |

## Quellenprüfung

Alle Abschnitte wurden gegen Tagebuch, Codex-/Claude-Sitzungsregister und
Commit-Historie geprüft. Die frühere reine Zielbeschreibung war spätestens
nach den Umsetzungen vom 2026-06-02 bis 2026-06-04 nicht mehr vollständig und
wurde um den Abschlussstand ergänzt.

## Unteraufgaben

- [**62-1 Mail im Deployment aktivieren**]({{ "/de/jira/issues/J01-62/steps/J01-144/" | relative_url }}) — Erledigt
- **62-2 Branch-Mapping festlegen** — Erledigt
- [**62-3 Environment aktivieren**]({{ "/de/jira/issues/J01-62/steps/J01-64/" | relative_url }}) — Erledigt
- [**62-4 Deploy-Contract: Zustandsmaschine formal dokumentieren (Schritt 1)**]({{ "/de/jira/issues/J01-147/" | relative_url }}) — In Bearbeitung
- [**62-5 DeployPhase-Enum und DeployMachine-Skeleton implementieren**]({{ "/de/jira/issues/J01-148/" | relative_url }}) — Erledigt
- [**62-6 RuleBasedStateMachine-Grundgeruest fuer DeployMachine hinzufuegen**]({{ "/de/jira/issues/J01-149/" | relative_url }}) — In Bearbeitung
- [**62-7 CI-Inhalts-YAML fuer Prod-Build bereitstellen**]({{ "/de/jira/issues/J01-62/steps/J01-152/" | relative_url }}) — fachlich erledigt; Jira-Nachzug offen
- [**62-8 Home- und Index-Inhalt aus Seitendaten ableiten**]({{ "/de/jira/issues/J01-62/steps/J01-154/" | relative_url }}) — fachlich erledigt; Jira-Nachzug offen
- [**62-9 Publish-Pfad und laufende Inhaltsaenderungen bewerten**]({{ "/de/jira/issues/J01-62/steps/J01-153/" | relative_url }}) — fachlich erledigt; Jira-Nachzug offen
