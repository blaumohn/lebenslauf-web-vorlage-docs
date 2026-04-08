---
layout: page
title: "105-2: Vollständige P_0-zu-P_n-Herleitung und Manifest-Ausdünnung"
jira_key: J01-123
jira_parent_key: J01-105
permalink: /de/jira/issues/J01-105/steps/J01-123/
---

**Stand:** 2026-04-04

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Schrittspezifischer öffentlicher Arbeitsstand für
[105-2]({{ "/de/jira/issues/J01-105/steps/J01-123/" | relative_url }}) unter
[J01-105]({{ "/de/jira/issues/J01-105/" | relative_url }}).
Diese Seite bündelt den eigentlichen Reduktionsgang des App-Manifests und
trennt ihn vom Seed-Sonderfall und vom Lib-Schnitt.

## Ziel

- `P_0` entsteht nur aus technisch gefundenen Parametern.
- Formale Doku bleibt Zusatzsignal, ist aber kein Eintrittskriterium für
  `P_0`.
- Jeder Parameter aus `P_0` erhält danach einen Endstatus:
  bleibt, entfällt oder bleibt vorläufig wegen eines klar benannten
  Alternativfalls.
- Das App-Manifest beschreibt nur noch den bestätigten dünnen Vertrag.
- Die Herleitung bleibt mit Quelltextbeleg und Prüflauf nachvollziehbar.

## Bericht

- `P_0` wird in diesem Schritt nicht aus einem vermuteten Zielbild, sondern
  aus technisch gefundenen Parametern aufgebaut.
- Pro Parameter zählt zuerst die technische Belegfrage:
  Gibt es einen konkreten Programm-Pfad im bestehenden Worktree?
- Die Matrix zeigt zusätzlich, in welcher Pipeline/Phase der Fund liegt und
  ob derselbe Parameter auch formal dokumentiert ist.
- `P_0` umfasst nach aktuellem Befund die technisch gefundenen Parameter aus `python`,
  `build`, `runtime` und `deploy`.
- Für `setup` bleibt nach `J01-122` aktuell kein technischer Parameter-Fund
  übrig; der frühere Kandidat `LEBENSLAUF_PUBLIC_PROFILE` wird daher
  nicht in `P_0` aufgenommen.
- `LEBENSLAUF_JSON_PFAD` gehört nicht mehr zum Zielstand: Es gibt aktuell
  keinen fachlichen JSON-Datenpfad mehr, daher wird der Parameter mitsamt
  Code- und Config-Rest vollständig entfernt.
- `CAPTCHA_TTL_SECONDS` bleibt im Zielstand ein Runtime-Parameter; der
  technische Befund umfasst zusätzlich den CLI-Cleanup-Pfad, der damit
  nur abgelaufene Captchas entfernt.
- Pro Übergang `P_i -> P_{i+1}` wird genau ein kleiner Befund bestätigt;
  damit bleibt die Reduktion überprüfbar statt nur redaktionell behauptet.
- Dieser Schritt ist der Hauptpfad des Vorgangs und trägt deshalb die
  vollständige Parameterarbeit im App-Repo.

## Aktueller Stand

- Jira-Subtask `J01-123` ist angelegt.
- Die frühere grobe `P_0`-Liste aus `J01-105` wird hier auf eine Matrix der
  technisch gefundenen Parameter nachgezogen.
- Jeder aktuell aufgenommene Parameter hat jetzt einen technischen Fund mit
  Pipeline-/Phasenbezug; die formale Doku wird nur noch zusätzlich markiert.
- Die eigentlichen Reduktionsschritte ab dem formalisierten `P_0` bleiben
  weiter in Arbeit; die Seed-Korrektur aus `J01-122` zählt dabei als
  Vorbefund vor der neuen Zählung.

<span id="p-0-belegmatrix"></span>

## P_0-Belegmatrix {#p_0-belegmatrix}

Nur Parameter mit technischem Fund werden in `P_0` aufgenommen.
Die Darstellung folgt jetzt der Manifest-Leselogik
`Pipeline -> Phase -> Bereich -> Parameter`.
Die technische Quelle bleibt der maßgebliche Programm-Pfad:
PHP-Code, CLI-Pfad, Python-Runner, Shell-Skript oder GitHub-Workflow.

{% include j01-123-p0-matrix.html lang="de" %}

## Vorbefunde vor der Umstrukturierung

Diese Punkte wurden vor dem späteren Schema-Umbau bereits festgehalten und
bleiben für `P_0` maßgeblich:

- `setup` trägt nach `J01-122` keinen technischen Parameter-Fund mehr; der
  frühere Kandidat `LEBENSLAUF_PUBLIC_PROFILE` bleibt deshalb ausdrücklich
  außerhalb von `P_0`.
- `deploy` gehört wegen des technischen Funds im Workflow `preview-deploy`
  in die Matrix; die `FTP_*`-Werte sind also kein bloßer Formalkandidat.
- `APP_URL` bleibt nur ein formaler Kandidat, solange kein technischer Leser
  im ausgewerteten Worktree belegt ist.

## Formale Kandidaten außerhalb von `P_0`

| Fachphase | Parameter | Grund | Formale Quelle |
| --- | --- | --- | --- |
| `build` | `APP_URL` | Aktuell kein technischer Leser im ausgewerteten Worktree gefunden; bleibt deshalb außerhalb von `P_0`, bis ein Programm-Pfad belegt ist. | `src/resources/config/dev-build.yaml`, `src/resources/config/preview-build.yaml`, `J01-105` |

## Ausgeschlossene frühere Kandidaten

| Phase | Parameter | Grund | Status |
| --- | --- | --- | --- |
| `setup` | `LEBENSLAUF_PUBLIC_PROFILE` | Nach `J01-122` nutzt `setup` nur noch `--copy-sample-content` mit fester Fixture; `SetupCommand` liest keinen fachlichen Setup-Parameter mehr. | nicht in `P_0` aufgenommen |
| `runtime` | `LEBENSLAUF_PUBLIC_PROFILE` | Im aktuellen Quellstand kein positiver HTTP-Runtime-Beleg; der Parameter bleibt build-seitig belegt. | nicht in `P_0` aufgenommen |
| `build` | `LEBENSLAUF_JSON_PFAD` | Es gibt keinen aktuellen fachlichen JSON-Datenpfad mehr; der frühere Zwischenpfad wird ohne Legacy-Rest entfernt. | aus Manifest, Config und Code entfernt |

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| `P_0` vollständig | Alle aufgenommenen Parameter tragen einen technischen Fund mit Pipeline-/Phasenbezug; ausgeschlossene Frühkandidaten und formale Kandidaten sind kenntlich gemacht | diese Schrittseite, App-Repo | erledigt |
| Technische Nutzung sichtbar | Pro Parameter ist der konkrete Programm-Pfad benannt | diese Schrittseite | erledigt |
| Formale Zusatzbelege sichtbar | Pro technisch gefundenem Parameter ist erkennbar, ob die Doku nachgezogen ist | diese Schrittseite | erledigt |
| Jeder Übergang belegt | Jeder Schritt `P_i -> P_{i+1}` hat Quelltextbeleg und Prüflauf | App-Repo, Arbeitsdoku | in Arbeit |
| Dünner Vertrag erreicht | Manifest enthält nur noch bestätigte Zielparameter aus `P_n` | `config.manifest.yaml` | in Arbeit |
| Phase-Grenzen klar | `common` und Pipeline-Differenz sind im App-Vertrag sauber getrennt | App-Repo, J01-105 | in Arbeit |

## Offene Punkte

- Die nächsten Übergänge ab diesem formalisierten `P_0` neu nummerieren;
  der Seed-Befund aus `J01-122` bleibt ein Vorbefund vor `P_0`.
- Die früh notierten Prüfpfade zu `PYTHON_PATHS` und `APP_URL` gegen das
  neue, streng technische `P_0` fortschreiben.
- Für `APP_URL` gezielt weiter prüfen, ob außerhalb der formalen Quellen
  doch noch ein technischer Leser existiert.
- Die Rückkehr fachlicher Abhängigkeitshinweise in `meta.notes` als
  Begleitnachweis des dünnen Vertrags dokumentieren.
- Prüfen, ob einzelne Parametererklärungen später in kanonische Bereichs-
  oder Systemdoku wandern sollen, sobald `P_n` stabil ist.

## Links

- [105-2 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-123/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})
