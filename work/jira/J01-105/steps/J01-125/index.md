---
layout: page
title: "105-3: pipeline-spec-lib und README auf Zielmodell nachziehen"
jira_key: J01-125
jira_parent_key: J01-105
permalink: /de/jira/issues/J01-105/steps/J01-125/
---

**Stand:** 2026-04-08

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[105-3]({{ "/de/jira/issues/J01-105/steps/J01-125/" | relative_url }}) unter
[J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }}).
Diese Seite isoliert den Lib-Schnitt, damit App-Manifest und
Bibliotheksvertrag nicht wieder vermischt werden.

## Ziel

- Die pipeline-spec-lib expandiert das Zielmodell mit
  `variable-groups` als Mapping, `phases.<phase>` und
  `pipelines.<pipeline>.<phase>`.
- Die Lib validiert die Disjunktheit zwischen gemeinsamen und
  pipelinespezifischen Parametern.
- Die Lib validiert Pipeline- und Phasennamen gegen das Manifest; leere
  bekannte Phasen bleiben erlaubt.
- Die README beschreibt nur noch das echte Gruppen- und Phasenmodell.

## Bericht

- Der frühere sichtbare Schemafehler lag nicht nur im App-Manifest,
  sondern auch in der veralteten Lib-README mit `required`/`allowed`.
- Dieser Schritt bündelt deshalb den Lib-Codepfad und die Lib-Doku in einem
  eigenen Untervorgang.
- `PIPELINE` und `PHASE` bleiben im Zielzustand lib-intern; ein
  App-Bereich `pipeline_phase` gehört nicht mehr zum Vertrag.
- Das Kompilat ist jetzt eine Datei mit zwei Bereichen:
  `pipeline_phase` und `values`. So bleibt die Pipeline-Phase im Kompilat
  selbst von den Konfig-Variablen getrennt.
- Die Pipeline-Phase selbst bleibt trotzdem ein eigener
  Validierungsgegenstand: `pipeline` muss in `pipelines`, `phase` in
  `phases` stehen, bevor die fachlichen Konfig-Variablen dieser
  Pipeline-Phase geprüft werden.
- Die zwischenzeitlich erwogenen Ausbauten mit `policy`, Objektlisten für
  Gruppenreferenzen und `pipelines.common.<phase>` werden verworfen.
- Der bestätigte Zielstand ist phase-zentriert: Gemeinsame Variablen stehen
  direkt unter `phases.<phase>`; echte Pipelines und ihre Ergänzungen stehen
  unter `pipelines`.
- Eine vorhandene, fachlich leere Phase wie `dev/setup` braucht keinen
  künstlichen Manifest-Platzhalter `setup: []`. Tippfehler in Pipeline oder
  Phase bleiben trotzdem Fehler.

## Aktueller Stand

- Jira-Subtask `J01-125` ist angelegt.
- Der Lib-Schnitt ist öffentlich von der App-seitigen Reduktion getrennt.
- Lib-Code, README und die lib-internen Phasenschlüssel sind in der
  Lib-Historie nachgezogen.
- `compile()` schreibt keine flachen `PIPELINE`-/`PHASE`-Keys mehr; der
  Verbraucherpfad liest `pipeline_phase` direkt aus dem strukturierten
  Kompilat ohne Legacy-Fallback.
- Leere bekannte Phasen ohne Gruppenreferenzen werden akzeptiert; der
  Verbraucherpfad `config lint dev --phase setup` läuft ohne
  App-Workaround.
- Die endgültige Schema-Lesart ist festgezogen: kein Pseudo-`common`, keine
  `group-key`-Objektlisten und keine `policy`-Semantik.
- Die deutsche Lib-README ist auf dieselbe Schema-Lesart nachgezogen und
  beschreibt keine `group-key`-/`select`-Objektlisten mehr.
- Offener Rest ist vor allem der repo-übergreifende Abschlussnachweis.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Expander liest Zielmodell | Lib expandiert `variable-groups.<gruppe>`, `phases.<phase>`, `pipelines.<pipeline>.<phase>`, `gruppe: "*"` und `gruppe: [KEY]` korrekt | `pipeline-config-spec-php` | erledigt |
| Disjunktheit validiert | Überschneidungen zwischen Phase und Pipeline-Ergänzung werden abgewiesen | `pipeline-config-spec-php`, Tests | erledigt |
| README korrigiert | Kein `required`/`allowed`-, `policy`-, `group-key`- oder `common`-Schema mehr in der Lib-Doku | `pipeline-config-spec-php/README.md`, `pipeline-config-spec-php/README.de.md` | erledigt |
| Lib-interne Phasenschlüssel erklärt | `PIPELINE` und `PHASE` werden nicht mehr als App-Manifest-Bereich beschrieben | Lib-Doku, J01-105 | erledigt |
| Kompilat trennt Pipeline-Phase und Variablen | `compile()` schreibt ein Kompilat mit `pipeline_phase` und `values` | Lib-Tests, Hauptrepo-Runtime | erledigt |
| Leere Phasen bleiben gültig | Bekannte leere Phasen sind gültig; `dev/setup` braucht keinen Platzhalter `setup: []`; unbekannte Namen scheitern | Lib-Tests, Hauptrepo-Lints | erledigt |

## Offene Punkte

- Prüfen, wie die allgemeine `meta`-Semantik kanonisch bleibt, während
  konkrete Abhängigkeiten in `meta.notes` an den Variablen sichtbar
  wiederhergestellt werden.
- Abgleichen, welche Testfälle in der Lib und welche im Hauptrepo geführt
  werden sollen.

## Links

- [105-3 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-125/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})
- [J01-9: Preview — Workflow wieder aktivieren]({{ "/de/jira/issues/J01-9/" | relative_url }})
