---
layout: page
title: "SCRUM Sprint 2: Review, Retro und Carry-over"
permalink: /de/work/sprints/scrum-sprint-2/
---

**Zeitraum:** 2026-04-01 bis 2026-04-15  
**Abschluss:** 2026-04-15

## Beteiligte

- Dani Y.
- Codex-Agent

## Sprint-Ziel

Preview-Deployment fertig machen.

## Geplant

- Sprint-Ziel:
  [J01-9]({{ "/de/jira/issues/J01-9/" | relative_url }}),
  [J01-13]({{ "/de/jira/issues/J01-13/" | relative_url }}),
  [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }})
- Support:
  [J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }})
- Admin / Rahmen:
  [J01-119]({{ "/de/jira/issues/J01-119/" | relative_url }}),
  [J01-120]({{ "/de/jira/issues/J01-120/" | relative_url }}) und
  [J01-121]({{ "/de/jira/issues/J01-121/" | relative_url }})
- Ungeplant:
  [J01-126]({{ "/de/jira/issues/J01-126/" | relative_url }})

## Tatsächlich gemacht

- Support geliefert:
  [J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }}) wurde
  fachlich abgeschlossen, die Konfig-Spec- und Variablenpfade wurden geprüft,
  und der Blocker zu `J01-9` wurde entfernt.
- Admin-/Rahmenarbeit geliefert:
  [J01-119]({{ "/de/jira/issues/J01-119/" | relative_url }}),
  [J01-120]({{ "/de/jira/issues/J01-120/" | relative_url }}) und
  [J01-121]({{ "/de/jira/issues/J01-121/" | relative_url }}) wurden
  abgeschlossen.
- Ungeplante Zusatzarbeit geliefert:
  [J01-126]({{ "/de/jira/issues/J01-126/" | relative_url }}) wurde
  abgeschlossen.
- Insgesamt lagen 8 Top-Level-Vorgänge im Sprint; 5 davon wurden erledigt,
  3 Zielvorgänge bleiben offen.

## Nicht fertig / Carry-over

- [J01-9]({{ "/de/jira/issues/J01-9/" | relative_url }})
- [J01-13]({{ "/de/jira/issues/J01-13/" | relative_url }})
- [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }})

## Review

- Das Sprint-Ziel „Preview-Deployment fertig machen“ blieb fachlich richtig,
  wurde aber erneut nicht vollständig erreicht.
- Der wichtigste Fortschritt war die Entblockung von `J01-9` durch den
  Abschluss von `J01-105`.
- Die eigentliche Preview-Betriebsarbeit ist jetzt schmaler: Der PR ist in
  `dev` gemergt, und offen bleibt vor allem der Preview-Lauf mit
  Ergebnisnachweis.
- Der öffentliche Jira-/Doku-Betrieb wurde stabiler, besonders durch
  Sync-Guardrails, Sprint-Historie und Recent-Feed.

## Retro

- Gut:
  - Der technische Blocker `J01-105` ist erledigt statt weiter als unklarer
    Support-Rest mitzuwandern.
  - Sprint- und Mirror-Arbeit ist nachvollziehbarer als am Sprintanfang.
- Fehlte:
  - Das eigentliche Preview-Deployment wurde noch nicht ausgeführt.
  - `J01-13` und `J01-31` bleiben weiterhin offene Vorarbeiten.
- Konsequenz:
  - Sprint 3 übernimmt nur die verbleibenden Preview-Zielvorgänge und einen
    kleinen Admin-Vorgang für den Sprintwechsel.
  - Neue Nebenarbeit muss wieder klar als `sprint-support`,
    `sprint-admin` oder `sprint-unplanned` markiert werden.

## Scope-Änderungen

- [J01-126]({{ "/de/jira/issues/J01-126/" | relative_url }}) kam als
  ungeplante Feed-/Navbar-Arbeit in den Sprint.
- Die zuvor nicht übernommenen Backlog-Reste aus Sprint 1 bleiben weiter
  außerhalb des aktiven Sprint-Ziels.

## Risiken

- Preview-Arbeit kann weiterhin von notwendiger Jira-/Doku-Verwaltung
  verdrängt werden.
- `J01-9` ist zwar entblockt, aber noch nicht betrieblich abgeschlossen.
- `J01-13` und `J01-31` dürfen im neuen Sprint nicht nur passiv mitlaufen.
