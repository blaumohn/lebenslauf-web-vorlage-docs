---
layout: page
title: "105-3: pipeline-spec-lib und README auf Zielmodell nachziehen"
jira_key: J01-125
jira_parent_key: J01-105
permalink: /de/jira/issues/J01-105/steps/J01-125/
---

**Stand:** 2026-04-03

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[105-3]({{ "/de/jira/issues/J01-105/steps/J01-125/" | relative_url }}) unter
[J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }}).
Diese Seite isoliert den Lib-Schnitt, damit App-Manifest und
Bibliotheksvertrag nicht wieder vermischt werden.

## Ziel

- Die pipeline-spec-lib expandiert das Zielmodell mit
  `pipelines.common.<phase>` und `pipelines.<pipeline>.<phase>`.
- Die Lib validiert die Disjunktheit zwischen gemeinsamen und
  pipelinespezifischen Parametern.
- Die README beschreibt nur noch das echte Gruppen- und Phasenmodell.

## Bericht

- Der frühere sichtbare Schemafehler lag nicht nur im App-Manifest,
  sondern auch in der veralteten Lib-README mit `required`/`allowed`.
- Dieser Schritt bündelt deshalb den Lib-Codepfad und die Lib-Doku in einem
  eigenen Untervorgang.
- `PIPELINE` und `PHASE` bleiben im Zielzustand lib-intern; ein
  App-Bereich `pipeline_phase` gehört nicht mehr zum Vertrag.

## Aktueller Stand

- Jira-Subtask `J01-125` ist angelegt.
- Der Lib-Schnitt ist öffentlich von der App-seitigen Reduktion getrennt.
- Lib-Code, README und die lib-internen Phasenschlüssel sind in der
  Lib-Historie nachgezogen.
- Offener Rest ist vor allem der repo-übergreifende Abschlussnachweis.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Expander liest Zielmodell | Lib expandiert `common.<phase>` und Pipeline-Differenz korrekt | `pipeline-config-spec-php` | erledigt |
| Disjunktheit validiert | Überschneidungen zwischen `common` und Pipeline-Differenz werden abgewiesen | `pipeline-config-spec-php`, Tests | erledigt |
| README korrigiert | Kein `required`/`allowed`-Schema mehr in der Lib-Doku | `pipeline-config-spec-php/README*.md` | erledigt |
| Lib-interne Phasenschlüssel erklärt | `PIPELINE` und `PHASE` werden nicht mehr als App-Manifest-Bereich beschrieben | Lib-Doku, J01-105 | erledigt |

## Offene Punkte

- Prüfen, ob die allgemeine `meta`-Semantik ausschließlich in der
  kanonischen Pipeline-Spec verbleibt.
- Abgleichen, welche Testfälle in der Lib und welche im Hauptrepo geführt
  werden sollen.

## Links

- [105-3 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-125/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})
- [J01-9: Preview — Workflow wieder aktivieren]({{ "/de/jira/issues/J01-9/" | relative_url }})
