---
layout: page
title: "Spec: Repo-übergreifende Änderung"
permalink: /de/specs/ablaeufe/repo-uebergreifende-aenderung/
---

Dieser Ablauf beschreibt Änderungen, die mehr als ein Repo des
Projektverbunds betreffen.

## Zweck

- Mehrrepo-Arbeit sauber koordinieren, ohne Zielorte oder Commits zu mischen

## Auslöser

- eine Änderung berührt Produkt, Doku, Skill oder Config-Lib gemeinsam

## Beteiligte Systeme

- [GitHub- und PR-System]({{ "/de/specs/systeme/github-zusammenarbeit/" | relative_url }})
- [Doku-System]({{ "/de/specs/systeme/doku-system/" | relative_url }})
- [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- [KI-/Skill-Rahmen]({{ "/de/specs/systeme/ki-skill-rahmen/" | relative_url }})

## Ein- und Ausgänge

- Eingänge:
  - fachlicher Änderungsbedarf mit mehreren Repo-Zielen
- Ausgänge:
  - getrennte Repo-Änderungen mit gemeinsamem Jira-Bezug

## Ablauf

1. betroffene Repos und Ziel-Artefakte bestimmen
2. primären Arbeitsträger und Folge-Repos festlegen
3. pro Repo Branch- und Arbeitsbaum-Kontext passend wählen
4. Änderungen getrennt umsetzen und committen
5. Doku und Jira gemeinsam auf konsistenten Stand bringen

## Übergaben

- Mehrrepo-Bedarf -> Repo-Zuordnung
- Repo-Zuordnung -> getrennte Arbeitsbäume
- getrennte Änderungen -> gemeinsamer öffentlicher Kontext

## Grenzen und Nicht-Ziele

- keine Repo-übergreifenden Misch-Commits
- keine Projektregeln in ein einzelnes Produkt-Repo drücken

## Verweise auf operative Doku

- `skills/koordination/SKILL.md`
- [J01-91: Bereiche-Inventar]({{ "/de/jira/issues/J01-91/area-inventory/" | relative_url }})

## Quellen

- `skills/koordination/SKILL.md`
- `skills/koordination/references/repos.md`
- [KI-Projektkarte]({{ "/de/policies/ki-projektkarte/" | relative_url }})
