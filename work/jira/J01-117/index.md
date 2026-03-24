---
layout: page
title: "J01-117: Projekt-Doku: Spec-Landkarte für Projekt, Systeme und Abläufe"
jira_key: J01-117
permalink: /de/jira/issues/J01-117/
---

**Stand:** 2026-03-24

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-117`.
Der Vorgang führt eine neue Spec-Schicht in GitHub Pages ein, damit das
Projekt nicht nur über einzelne Bereichs- oder Vorgangsseiten sichtbar ist,
sondern als zusammenhängende Projekt-, System- und Ablauf-Landkarte.

## Ziel

- neuen Dokutyp `Spec` mit Vorlagen und Richtlinienregel freigeben
- Projekt-Spec als öffentliche Antwort auf „Was ist dieses Projekt?“ anlegen
- erste System- und Ablauf-Specs aus bestehenden Quellen herleiten
- Startseite und Projektkarte so schärfen, dass HR, Product, Tech und Dev
  schnell andocken können

## Aktueller Stand

- Jira-Vorgang angelegt, aktivem Sprint zugeordnet und auf
  `In Bearbeitung` gesetzt
- Quellen aus GitHub Pages, Skills, `tagebuch` und archiviertem `docs/agile`
  gezielt zusammengezogen
- `specs/` als neue kanonische Schicht entschieden
- erste Umsetzung im dedizierten Docs-Arbeitsbaum
  `feature/j01-117-spec-landkarte` gestartet

## Quellenlage

- aktuelle Public-Doku:
  - [Doku-Richtlinie]({{ "/de/policies/doku-richtlinie/" | relative_url }})
  - [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
  - [CLI / Build]({{ "/de/areas/cli-build/" | relative_url }})
  - [HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
- Projekt- und Skill-Quellen:
  - `lebenslauf-web-vorlage/README.md`
  - `pipeline-config-spec-php/README.de.md`
  - `skills/koordination/SKILL.md`
  - `skills/jira-state-sync/SKILL.md`
  - `skills/docs-i18n/SKILL.md`
- Provenienz:
  - `tagebuch/notes/meta/system.md`
  - `tagebuch/notes/index/quellenregister.md`
  - gezielte Austausch-Notizen zu Projektkarte, Skill-Heimat und
    `docs/agile`-Migration
- Archivquellen:
  - `docs/agile`-Export im `tagebuch`
  - [J01-91: Archiv-Auswertung]({{ "/de/jira/issues/J01-91/archive-topics/" | relative_url }})
  - [J01-98: Migrationslandkarte]({{ "/de/jira/issues/J01-98/migration-map/" | relative_url }})

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Dokutyp `Spec` freigegeben | Richtlinie nennt `Spec` als neuen zulässigen Typ | Doku-Richtlinie DE/EN | in Arbeit |
| Vorlagen vorhanden | System- und Ablauf-Spec-Vorlage existieren in DE/EN | `templates/spec-system/`, `templates/spec-ablauf/` | in Arbeit |
| Projekt-Spec sichtbar | Es gibt eine öffentliche Projekt-Spec als Projekteinstieg | `specs/projekt/` | in Arbeit |
| erste Spec-Welle angelegt | Projekt-, System- und Ablauf-Specs sind angelegt | `specs/` und `en/specs/` | in Arbeit |
| Außenwirkung geschärft | Startseite erklärt die Zweirolle als Website-Vorlage und Portfolio-Stück | `/de/`, `/en/` | in Arbeit |
| Quellen sauber hergeleitet | Public-Doku, Skills, `tagebuch` und `docs/agile` sind belegt | diese Seite + Spec-Seiten | in Arbeit |

## Abschlussbild oder offene Punkte

- Die Spec-Schicht soll nach diesem Vorgang ein stabiler Einstieg für Leser und
  Skills sein, nicht nur ein einmaliger Migrationsort.
- Folgearbeit in Skill-Repo oder `tagebuch` bleibt getrennt und nur dort, wo
  echte Verweise oder neue Quellenregister nötig sind.

## Links

- [Specs]({{ "/de/specs/" | relative_url }})
- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
- [J01-102: Projektkarte und Skill-/Doku-Trennung schärfen]({{ "/de/jira/issues/J01-102/" | relative_url }})
- [J01-111: KI-Regelwerk-Kohärenz und Prüfarchitektur]({{ "/de/jira/issues/J01-111/" | relative_url }})
