---
layout: page
title: "105-2: Vollständige P_0-zu-P_n-Herleitung und Manifest-Ausdünnung"
jira_key: J01-125
jira_parent_key: J01-105
permalink: /de/jira/issues/J01-105/steps/J01-125/
---

**Stand:** 2026-04-03

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[105-2]({{ "/de/jira/issues/J01-105/steps/J01-125/" | relative_url }}) unter
[J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }}).
Diese Seite bündelt den eigentlichen Reduktionsgang des App-Manifests und
trennt ihn vom Seed-Sonderfall und vom Lib-Schnitt.

## Ziel

- Jeder Parameter aus `P_0` erhält einen Endstatus:
  bleibt, entfällt oder bleibt vorläufig wegen eines klar benannten
  Alternativfalls.
- Das App-Manifest beschreibt nur noch den bestätigten dünnen Vertrag.
- Die Herleitung bleibt mit Quelltextbeleg und Prüflauf nachvollziehbar.

## Bericht

- `P_0` umfasst die Phasen `setup`, `python`, `build`, `runtime` und
  `deploy`.
- Pro Übergang `P_i -> P_{i+1}` wird genau ein kleiner Befund bestätigt;
  damit bleibt die Reduktion überprüfbar statt nur redaktionell behauptet.
- Dieser Schritt ist der Hauptpfad des Vorgangs und trägt deshalb die
  vollständige Parameterarbeit im App-Repo.

## Aktueller Stand

- Jira-Subtask `J01-125` ist angelegt.
- Die öffentliche J01-105-Seite enthält bereits `P_0` und die ersten
  bestätigten Schritte.
- Die vollständige Abarbeitung aller Parameter und ihre Prüfnachweise sind
  noch offen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| `P_0` vollständig | Alle aktuellen Parameter sind im Ausgangssatz erfasst | J01-105, App-Repo | offen |
| Jeder Übergang belegt | Jeder Schritt `P_i -> P_{i+1}` hat Quelltextbeleg und Prüflauf | App-Repo, Arbeitsdoku | offen |
| Dünner Vertrag erreicht | Manifest enthält nur noch bestätigte Zielparameter | `config.manifest.yaml` | offen |
| Phase-Grenzen klar | `global`, `common` und Pipeline-Differenz sind im App-Vertrag sauber getrennt | App-Repo, J01-105 | offen |

## Offene Punkte

- Den Rest von `P_0` nach denselben kleinen Schritten wie `P_1` bis `P_3`
  weiterführen.
- Prüfen, ob einzelne Parameter in eine kanonische Bereichsdoku statt in den
  Vorgang gehören, sobald der Zustand stabil ist.

## Links

- [105-2 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-125/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})

