---
layout: page
title: "J01-102: Projektkarte und Skill-/Doku-Trennung schärfen"
jira_key: J01-102
permalink: /de/jira/issues/J01-102/
---

**Stand:** 2026-03-17

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-102`.
Der Vorgang schärft die Trennung zwischen öffentlicher Projektdoku, `tagebuch`
und projektbezogenen KI-Skills, damit Skills Projektanforderungen primär aus
kanonischen Quellen finden.

## Ziel

Eine kleine Projektkarte für KI-Skills festziehen, die klar trennt zwischen
Always-on-Regeln, kanonischer Projektdoku, Provenienz im `tagebuch` und
skillinternen Hilfen.

## Aktueller Stand

- `AGENTS.md`, öffentliche Doku, `tagebuch` und Skills haben bereits
  Teilregeln, aber noch keinen einzigen kompakten Projekteinstieg für Skills.
- Die neue Richtlinienseite
  [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
  bündelt jetzt den kanonischen Einstieg.
- Projekt-Skills sollen von dort aus auf die passenden Fachquellen verweisen,
  statt Projektanforderungen auszuschreiben.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Kanonischer Projekteinstieg für Skills ist vorhanden | Die Projektkarte erklärt die Zuständigkeiten von `AGENTS.md`, öffentlicher Doku, `tagebuch` und Skills | [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }}) | erledigt |
| Projekt-Skills verweisen auf kanonische Quellen | Betroffene Skills nennen die Projektkarte statt Projektregeln zu duplizieren | Projekt-Skill-Repo unter `skills/` | erledigt |
| Öffentliche Arbeitsdoku ist direkt aus Jira erreichbar | Jira hält einen kanonischen Remote-Link auf `/de/jira/issues/J01-102/` | Jira-Remote-Links für `J01-102` | erledigt |

## Abschlussbild oder offene Punkte

- Die Projektkarte ist als kanonischer Einstieg vorhanden.
- Weitere Nachschärfungen an einzelnen Skills oder Richtlinien laufen nur noch
  als gezielte Folgearbeit innerhalb dieses Vorgangs.

## Links

- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
- [J01-92: Shared-Agent-Regeln und Skill-Versionierung]({{ "/de/jira/issues/J01-92/" | relative_url }})
- [J01-96: Quellenregister und rohe Chat-Eingaben verankern]({{ "/de/jira/issues/J01-96/" | relative_url }})
