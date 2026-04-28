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
- Die Arbeit ist gestartet; konkrete Umsetzung und Nachweise stehen noch aus.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| CV-Token-Erzeugung | Ablauf ist reproduzierbar und dokumentiert | CI/CD- oder Runbook-Nachweis | offen |
| Runtime-Admin-Betrieb | Admin-Schritte sind begrenzt und prüfbar | Betriebsdoku oder Skriptpfad | offen |
| Sprint-Zuordnung | Vorgang liegt in `SCRUM Sprint 4` mit `sprint-goal` | Jira Sprint Board | erledigt |

## Abschlussbild oder offene Punkte

- Offen ist, ob die Token-Erzeugung direkt in CI/CD läuft oder als
  kontrollierter Admin-Betrieb mit klaren Prüfpunkten bleibt.

## Links

- [SCRUM Sprint 4]({{ "/de/work/sprints/scrum-sprint-4/" | relative_url }})
- [J01-5]({{ "/de/jira/issues/J01-5/" | relative_url }})
