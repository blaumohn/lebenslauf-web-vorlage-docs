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
| [J01-140]({{ "/de/jira/issues/J01-135/steps/J01-140/" | relative_url }}) | Mail-Rückkanal für Admin-Ergebnisse | offen |
| [J01-141]({{ "/de/jira/issues/J01-135/steps/J01-141/" | relative_url }}) | Feste Admin-Aktionsliste und Zugriffsschutz | offen |
| [J01-139]({{ "/de/jira/issues/J01-135/steps/J01-139/" | relative_url }}) | CV-Token-Rotation als Runtime-Admin-Aktion | offen |

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Auslösung | Wartende Admin-Betriebe werden über einen begrenzten Auslöseweg erkannt | [J01-138]({{ "/de/jira/issues/J01-135/steps/J01-138/" | relative_url }}) und [J01-142]({{ "/de/jira/issues/J01-135/steps/J01-142/" | relative_url }}) | erledigt |
| Admin-Gerüst | Runtime-Admin-Betriebe haben Task-Datei, Handler-Schnittstelle, Runner und Runtime-Kontext | [J01-142]({{ "/de/jira/issues/J01-135/steps/J01-142/" | relative_url }}) | erledigt |
| Rückkanal | Admin-Ergebnisse werden kontrolliert zurückgemeldet | [J01-140]({{ "/de/jira/issues/J01-135/steps/J01-140/" | relative_url }}) | offen |
| Begrenzung | Admin-Trigger führt nur feste, prüfbare Aktionen aus | [J01-141]({{ "/de/jira/issues/J01-135/steps/J01-141/" | relative_url }}) | offen |
| CV-Token-Erzeugung | Ablauf ist reproduzierbar, profilgebunden und dokumentiert | [J01-139]({{ "/de/jira/issues/J01-135/steps/J01-139/" | relative_url }}) | offen |
| Sprint-Zuordnung | Vorgang liegt in `SCRUM Sprint 4` mit `sprint-goal` | Jira Sprint Board | erledigt |

## Abschlussbild oder offene Punkte

- Offen ist, ob die Token-Erzeugung direkt in CI/CD läuft oder als
  kontrollierter Admin-Betrieb mit klaren Prüfpunkten bleibt.

## Links

- [SCRUM Sprint 4]({{ "/de/work/sprints/scrum-sprint-4/" | relative_url }})
- [J01-5]({{ "/de/jira/issues/J01-5/" | relative_url }})
