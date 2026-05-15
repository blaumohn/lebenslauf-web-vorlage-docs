---
layout: page
title: "J01-135 — CI/CD-Tools: CV-Token-Erzeugung und Runtime-Admin-Betrieb"
permalink: /de/jira/issues/J01-135/
jira_key: J01-135
jira_parent_key: J01-5

---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für die Sprint-4-Ziellinie
CI/CD-/Runtime-Admin-Betrieb.

## Ziel

- CV-Token-Erzeugung als reproduzierbaren CI/CD- oder Betriebsablauf
  festziehen.
- Runtime-Admin-Arbeiten so beschreiben, dass sie nicht als private
  Handarbeit neben der Pipeline bleiben.
- Den Ablauf an die bestehenden Qualitäts- und Deployment-Grenzen anbinden.

## Aktueller Stand

- Der Vorgang wurde für `SCRUM Sprint 4` angelegt und als `sprint-goal`
  eingeordnet.
- Die Arbeit ist gestartet; J01-138 und J01-142 sind als zusammenhängender
  Auslöse-/Switch-Unterbau erledigt.
- J01-140 ist erledigt: Der Mail-Rückkanal läuft über den verallgemeinerten
  `MailService`, `MailMessage` trägt Modul/Titel/Text, und `MAIL_TO_EMAIL`
  ist der zentrale Empfänger aus der Pipeline-Config.
- J01-144 bereitet den Preview-Mail-Pfad im CI-Smoke vor; der echte
  Mailtrap-Nachweis mit Preview-Environment-Werten bleibt vor Production
  offen.
- J01-139 hat die CV-Token-Rotation im Runtime-Admin-Gerüst technisch
  erreicht: `cv_token_rotation` läuft über Task-Datei, `/admin/run`,
  Runtime-Locks und Mail-Rückkanal. Offen ist noch der generische lokale
  Preview-Admin-Befehl: `php bin/cli python ...` nimmt Admin-Betrieb plus
  Argumente entgegen, ergänzt per SFTP die Admin-Betrieb-Liste und löst die
  wartenden Betriebe per HTTP-GET aus.
- Als kleine Betriebsstütze gibt es zusätzlich eine lokale SFTP-REPL für den
  bestehenden Deploy-SFTP-Client. Sie dient der kontrollierten Einsicht und
  manuellen Dateiarbeit im konfigurierten `SFTP_SERVER_DIR`; sie ersetzt den
  noch offenen generischen Admin-Befehl nicht.
- J01-141 bleibt der offene Härtungspunkt: feste Aktionsliste,
  Parametergrenzen, Zugriffsschutz und Fehler-/Auditpfade müssen vor
  Production nachvollziehbar geprüft sein.
- Der CI/CD-Ablauf meldet seine Hauptphasen jetzt über ein eigenes
  Shell-Ausgabemodul. `bin/ci`, `bin/cd` und `run_pipeline` zeigen dadurch
  Setup, Build, Tests, Artefaktprüfung, Deploy und Smoke-Checks als klare
  Schritte, ohne die fachliche Reihenfolge im Pipeline-Code zu verdecken.
- Der Architektur-Nachtrag im `tagebuch` wurde in fünf prüfbare
  Untervorgänge zerlegt:
  - [J01-138]({{ "/de/jira/issues/J01-135/steps/J01-138/" | relative_url }})
    — Runtime-Admin-Auslösung über SFTP-Fahne und HTTP-Trigger modellieren
  - [J01-142]({{ "/de/jira/issues/J01-135/steps/J01-142/" | relative_url }})
    — Laufzeit-Admin-Betriebe-Gerüst und Zero-Downtime-Deploy-Switch festziehen
  - [J01-140]({{ "/de/jira/issues/J01-135/steps/J01-140/" | relative_url }})
    — Mail-Rückkanal für Runtime-Admin-Ergebnisse festziehen
  - [J01-141]({{ "/de/jira/issues/J01-135/steps/J01-141/" | relative_url }})
    — Admin-Aktionsliste und Zugriffsschutz begrenzen
  - [J01-139]({{ "/de/jira/issues/J01-135/steps/J01-139/" | relative_url }})
    — CV-Token-Rotation als Runtime-Admin-Aktion umsetzen

## Inhalts-Schlüssel

- [Ziel](#ziel)
- [Aktueller Stand](#aktueller-stand)
- [Untervorgänge](#untervorgaenge)
- [Überprüfungsplan](#ueberpruefungsplan)
- [Abschlussbild oder offene Punkte](#abschlussbild-oder-offene-punkte)
- [Links](#links)
- Öffentliche Schritte:
  [J01-138]({{ "/de/jira/issues/J01-135/steps/J01-138/" | relative_url }}),
  [J01-142]({{ "/de/jira/issues/J01-135/steps/J01-142/" | relative_url }}),
  [J01-140]({{ "/de/jira/issues/J01-135/steps/J01-140/" | relative_url }}),
  [J01-141]({{ "/de/jira/issues/J01-135/steps/J01-141/" | relative_url }}),
  [J01-139]({{ "/de/jira/issues/J01-135/steps/J01-139/" | relative_url }})

## Untervorgänge

| Vorgang | Teilpaket | Status |
| --- | --- | --- |
| [J01-138]({{ "/de/jira/issues/J01-135/steps/J01-138/" | relative_url }}) | Runtime-Admin-Auslösung über SFTP-Fahne und HTTP-Trigger | erledigt |
| [J01-142]({{ "/de/jira/issues/J01-135/steps/J01-142/" | relative_url }}) | Laufzeit-Admin-Betriebe-Gerüst und Zero-Downtime-Deploy-Switch | erledigt |
| [J01-140]({{ "/de/jira/issues/J01-135/steps/J01-140/" | relative_url }}) | Mail-Rückkanal für Admin-Ergebnisse | erledigt |
| [J01-141]({{ "/de/jira/issues/J01-135/steps/J01-141/" | relative_url }}) | Feste Admin-Aktionsliste und Zugriffsschutz | offen |
| [J01-139]({{ "/de/jira/issues/J01-135/steps/J01-139/" | relative_url }}) | CV-Token-Rotation als Runtime-Admin-Aktion | in Bearbeitung |

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Auslösung | Wartende Admin-Betriebe werden über einen begrenzten Auslöseweg erkannt | [J01-138]({{ "/de/jira/issues/J01-135/steps/J01-138/" | relative_url }}) und [J01-142]({{ "/de/jira/issues/J01-135/steps/J01-142/" | relative_url }}) | erledigt |
| Admin-Gerüst | Runtime-Admin-Betriebe haben Task-Datei, Handler-Schnittstelle, Runner und Runtime-Kontext | [J01-142]({{ "/de/jira/issues/J01-135/steps/J01-142/" | relative_url }}) | erledigt |
| Rückkanal | Admin-Ergebnisse werden kontrolliert zurückgemeldet | [J01-140]({{ "/de/jira/issues/J01-135/steps/J01-140/" | relative_url }}) | erledigt |
| Begrenzung | Admin-Trigger führt nur feste, prüfbare Aktionen aus | [J01-141]({{ "/de/jira/issues/J01-135/steps/J01-141/" | relative_url }}) | offen |
| CV-Token-Erzeugung | Token-Rotation läuft als Runtime-Admin-Task und ist lokal reproduzierbar auslösbar | [J01-139]({{ "/de/jira/issues/J01-135/steps/J01-139/" | relative_url }}) | teilweise umgesetzt |
| Preview-Mail | Preview versendet mit echten SMTP-/Mailtrap-Werten und ohne stdout-Rückfall | [J01-144]({{ "/de/jira/issues/J01-62/steps/J01-144/" | relative_url }}) | offen |
| SFTP-Bedienbarkeit | Deploy-SFTP kann lokal interaktiv inspiziert werden, ohne den Deploy-Root zu verlassen | `scripts/local/sftp-repl.py`, `src/cli/py/deploy/sftp_shell.py` | umgesetzt |
| CI/CD-Ausgabe | Pipeline-Hauptschritte sind in Log und GitHub-Step-Summary sichtbar, ohne Secrets auszugeben | `scripts/pipeline_output.sh`, `scripts/pipeline_lib.sh`, `bin/ci`, `bin/cd` | umgesetzt |
| Sprint-Zuordnung | Vorgang liegt in `SCRUM Sprint 4` mit `sprint-goal` | Jira Sprint Board | erledigt |

## Abschlussbild oder offene Punkte

Die letzte Vorbereitung vor Production besteht aus vier konkreten Punkten:

- Preview-Mail mit echten Mailtrap-/Environment-Werten ausführen und
  Abweichungen in `J01-144` nachziehen.
- Generischen lokalen Admin-Befehl ergänzen: `php bin/cli python ...` nimmt
  Betrieb plus Argumente entgegen, SFTP schreibt die Admin-Betrieb-Liste,
  danach triggert ein HTTP-GET `/admin/run`.
- `J01-141` abschließen: erlaubte Admin-Aktionen benennen,
  Parameter validieren und Zugriffsschutz/Auditierbarkeit prüfen.
- CI-Preview-Konfiguration für Mail in
  [J01-144]({{ "/de/jira/issues/J01-62/steps/J01-144/" | relative_url }})
  stabilisieren.

## Links

- [SCRUM Sprint 4]({{ "/de/work/sprints/scrum-sprint-4/" | relative_url }})
- [J01-5]({{ "/de/jira/issues/J01-5/" | relative_url }})
