---
layout: page
title: "J01-118: Tagebuch-Kontext für projektfremde Notizen im KI-Agenten-Lauf schärfen"
jira_key: J01-118
jira_parent_key: J01-111
permalink: /de/jira/issues/J01-118/
---

**Stand:** 2026-03-30

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-118`.
Der Vorgang schärft, wie der KI-/Skill-/AGENTS-Kontext das Repo `tagebuch`
liest: Nicht jede dort angelegte Rundenprotokoll-Notiz ist automatisch
Projektarbeit im Lebenslauf-Projekt und nicht jede braucht einen Jira-Bezug.
Der Vorgang hängt von `J01-113` ab, gehört aber nicht zu dessen Zielbild.

## Ziel

- Die Projektbindung des Repos `tagebuch` im KI-Lauf so schärfen, dass
  projektfremde persönliche Notizen zulässig bleiben.
- Verhindern, dass ein KI-Agent jede neue `tagebuch`-Notiz pauschal dem
  Lebenslauf-Projekt und dessen Jira-Pflichten zuordnet.
- Den Ableitungspfad offenlegen:
  - `J01-113` schärft Ebenen, Bootstrap, Skill-Repo-`AGENTS.md` und
    Projektkarte.
  - `J01-118` leitet daraus eine engere Regel für projektfremde
    `tagebuch`-Notizen ab.
- Die Änderung nur dort verankern, wo der Projektkontext für das `tagebuch`
  tatsächlich hergeleitet wird:
  - Projektkarte
  - Skill-Repo-Regeln
  - gegebenenfalls Arbeitsgänge mit `tagebuch`-Bezug

## Aktueller Stand

- `J01-118` als neuer Vorgang unter `J01-111` angelegt.
- Abhängigkeit sichtbar gemacht:
  - `J01-118` ist durch `J01-113` blockiert.
- Ausgangsfall vorhanden:
  - eine persönliche Rundenprotokoll-Notiz im `tagebuch` wurde bewusst ohne
    Jira-Bezug angelegt.
- Aus `J01-113/#ziel` ableitbar:
  - der Vorgang selbst behandelt Ebenentrennung, Skill-Heimat und
    Agenten-/Pages-Grenze
  - die konkrete Ausnahmeschärfung für projektfremde `tagebuch`-Notizen ist
    ein Folge-Thema und kein Teil des dortigen Zieltexts
- Umsetzung in Skills/Projektkarte noch offen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Projektfremde `tagebuch`-Notizen bleiben möglich | Neue persönliche Notizen können ohne Jira-Erwähnung angelegt werden | `tagebuch`, Skill-/AGENTS-Regeln | offen |
| Projektbindung wird nicht mehr pauschal abgeleitet | KI-Lauf unterscheidet zwischen Projektarbeit und persönlichen `tagebuch`-Notizen | Skill-Repo-`AGENTS.md`, Projektkarte, betroffene Skills | offen |
| Ableitung aus `J01-113` bleibt sichtbar | `J01-118` verweist auf `J01-113` als Voraussetzung, nicht als Zielteil | Jira-Link + Arbeitsdoku | erledigt |
| Verankerung nur an den richtigen Orten | Keine unnötige Regelduplikation in Produkt- oder Doku-Repos | `.agents/skills/`, `policies/ki-projektkarte/` | offen |

## Offene Punkte

- Welcher konkrete Wortlaut in Projektkarte und Skill-Repo-Regeln die
  Ausnahme sauber trägt, ist noch nicht entschieden.
- Ob zusätzlich eine Quellenregister- oder System-Notiz im `tagebuch`
  nachgezogen werden soll, ist offen.
- Die offene Branch-Lage in mehreren Repos ist unabhängig davon separat zu
  klären.

## Links

- [J01-111: Epic KI-Regelwerk-Kohärenz und Prüfarchitektur]({{ "/de/jira/issues/J01-111/" | relative_url }})
- [J01-113: Regelwerk-Bereinigung]({{ "/de/jira/issues/J01-113/" | relative_url }})
- [J01-115: KI-Prüfarchitektur]({{ "/de/jira/issues/J01-115/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
