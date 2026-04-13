---
layout: page
title: "105-2: Vollständige P_0-zu-P_n-Herleitung und Manifest-Ausdünnung"
jira_key: J01-123
jira_parent_key: J01-105
permalink: /de/jira/issues/J01-105/steps/J01-123/
---

**Stand:** 2026-04-12

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
- `P_1` ist jetzt weiter geschärft:
  `MAIL_STDOUT` liegt in der Kontakt-Runtime, `SMTP_*` liegt in der Gruppe
  `smtp` nur unter `preview.runtime`, und `LEBENSLAUF_JSON_PFAD` ist ohne
  Legacy-Rest vollständig entfernt.
- `P_2` ist jetzt ebenfalls festgezogen:
  `APP_URL` hatte im ausgewerteten Worktree keinen technischen Leser mehr
  und entfällt deshalb aus Build-Vertrag und Beispiel-Konfigurationen.
- `P_3` wird jetzt als Architektur- und Betriebsnachzug vorbereitet:
  `PYTHON_PATHS` bleibt technisch belegt, `cli python` soll denselben
  Config-Pfad wie die Pipeline-Spec nutzen, und `run` wird als dünne
  Fassade über den Python-Pfad behandelt statt als eigener Fachpfad.

## `P_1`: Kontakt-/SMTP-Vertrag geschärft, JSON-Rest entfernt

Der erste kleine Übergang `P_0 -> P_1` ist jetzt festgezogen:

- `MAIL_STDOUT` gehört fachlich zum Kontaktformular und liegt in der Gruppe
  `contact`.
- `SMTP_*` gehört im aktuellen Zielstand nicht mehr zum gemeinsamen
  Runtime-Vertrag und liegt als Gruppe `smtp` nur noch in `preview.runtime`.
- `CONTACT_TO_EMAIL` ist eine App-Config-Regel: Wenn der Key zur Runtime-Phase
  gehört, darf der Wert nicht leer sein und muss eine gültige E-Mail-Adresse
  sein.
- `LEBENSLAUF_JSON_PFAD` bleibt nicht als Altrest stehen, sondern ist aus
  Manifest, Config und Code vollständig entfernt.

Damit bleibt `P_0` als technischer Vollbefund lesbar, während `P_1` den
ersten starken fachlichen Reduktionsschritt dokumentiert.

## `P_2`: `APP_URL` entfällt als bloßer Formalkandidat

Der nächste kleine Übergang `P_1 -> P_2` ist jetzt ebenfalls entschieden:

- `APP_URL` hatte im aktuellen Hauptrepo keinen technischen Leser mehr.
- Der Key blieb nur noch als formaler Build-Kandidat im Manifest und in den
  Beispiel-Build-Dateien stehen.
- Deshalb entfällt `APP_URL` jetzt vollständig aus dem Build-Vertrag und aus
  `dev-build.yaml` sowie `preview-build.yaml`.
- `config lint` für `dev/build` und `preview/build` bleibt grün; der
  `dev`-Build läuft ohne `APP_URL`, während der `preview`-Build aktuell an
  fehlenden Fixture-Daten statt an `APP_URL` stoppt.
- Für `P_j` gilt damit künftig: `tests:smoke` ist der bevorzugte
  Funktionsnachweis; bei `P_2` blieb dieser Lauf in der aktuellen Umgebung
  noch offen, weil der Smoke-Clone vor dem eigentlichen HTTP-Nachweis im
  Composer-/Umgebungsaufbau hängen blieb.

Damit ist `APP_URL` nicht mehr bloß als offener Kandidat notiert, sondern als
entfernter Rest abgeschlossen.

## `P_3`: `PYTHON_PATHS` bleibt, CLI-Override wird Spec-pflichtig

Der nächste kleine Übergang `P_2 -> P_3` ist als Architektur- und
Betriebsschritt vorbereitet:

- `PYTHON_PATHS` bleibt im Zielstand, weil der Python-Runner den Wert
  technisch liest und daraus `PYTHONPATH` für Python-Skripte aufbaut.
- Die wirksame Python-Config soll künftig nicht mehr parallel aus
  Manifestwert plus separatem `--add-path` entstehen, sondern eindeutig aus
  `pipeline` + Phase `python` + optionalen CLI-Overrides.
- Dafür wird eine neue Schicht `BasePipelineCommand` vorbereitet:
  Sie ergänzt zur allgemeinen `BaseCommand`-Spec-Auflösung nur die echte
  Befehlsphase sowie `pipeline` und `--override`, löst diese Befehls-Config
  früh einmalig auf und gibt den nachgelagerten Pipeline-Befehlen nur noch
  die fertige `ConfigValues`.
- `ConfigCommand` bleibt dabei ein Meta-/Spec-Befehl ohne feste
  Befehlsphase; `pipeline` und `phase` sind dort Anfrage-Parameter.
- `BuildCommand` behält als echte Befehlsphase `build`; der zusätzliche
  Zugriff auf `runtime` bleibt als `compileRuntimeConfig()` ein
  Erzeugungsschritt und wird nicht zur eigenen Befehlsphase.
- `RunCommand` entfällt wieder:
  `dev.py` bleibt ein Python-Skript innerhalb der CLI-Phase `python`, der
  lokale Dev-Start liegt deshalb kohärenter auf der `composer`-Ebene statt
  als scheinbarer Pipeline-Befehl `run`.

Damit wird `P_3` nicht als weiterer Entfernungsfall verstanden, sondern als
Schärfung der Command-/Spec-Grenze und als Nachweis, dass `PYTHON_PATHS`
wirklich im dünnen Vertrag verbleibt.

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

## Frühere formale Kandidaten außerhalb von `P_0`

| Fachphase | Parameter | Grund | Status |
| --- | --- | --- | --- |
| `build` | `APP_URL` | Im aktuellen Hauptrepo kein technischer Leser belegt; der frühere Formalkandidat ist mit `P_2` aus Vertrag und Beispiel-Configs entfernt. | mit `P_2` entfernt |

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
| `P_1` umgesetzt | `MAIL_STDOUT` liegt in `contact`, `SMTP_*` liegt in `smtp` nur noch in `preview.runtime`, `CONTACT_TO_EMAIL` wird validiert, und `LEBENSLAUF_JSON_PFAD` ist vollständig entfernt | App-Repo, diese Schrittseite | erledigt |
| `P_2` umgesetzt | `APP_URL` ist mangels technischem Leser aus Build-Vertrag und Beispiel-Configs entfernt | App-Repo, Build-Prüflauf, diese Schrittseite | erledigt |
| `P_3` vorbereitet | `PYTHON_PATHS` bleibt als technisch belegter Python-Runner-Parameter erhalten; `cli python` soll Overrides nur noch über die Pipeline-Spec auflösen, und `run` wird als Alias über denselben Pfad geführt | App-Repo, diese Schrittseite, Arbeitsdoku | in Arbeit |
| Technische Nutzung sichtbar | Pro Parameter ist der konkrete Programm-Pfad benannt | diese Schrittseite | erledigt |
| Formale Zusatzbelege sichtbar | Pro technisch gefundenem Parameter ist erkennbar, ob die Doku nachgezogen ist | diese Schrittseite | erledigt |
| Jeder Übergang belegt | Jeder Schritt `P_i -> P_{i+1}` hat Quelltextbeleg und bevorzugt `tests:smoke` als Funktionsnachweis; falls der Smoke-Pfad nicht greift, ist ein passender Ersatzlauf zu belegen | App-Repo, Arbeitsdoku | in Arbeit |
| Dünner Vertrag erreicht | Manifest enthält nur noch bestätigte Zielparameter aus `P_n` | `config.manifest.yaml` | in Arbeit |
| Phase-Grenzen klar | `common` und Pipeline-Differenz sind im App-Vertrag sauber getrennt | App-Repo, J01-105 | in Arbeit |

## Offene Punkte

- Den früh notierten Prüfpfad zu `PYTHON_PATHS` gegen das neue, streng
  technische `P_0` fortschreiben und dabei die künftige
  `BasePipelineCommand`-/`BaseCommand`-Trennung im CLI verankern.
- Den Smoke-Pfad selbst als Arbeitsvoraussetzung stabilisieren, damit
  spätere `P_j`-Schritte nicht am Clone-/Composer-Aufbau hängen bleiben.
- Prüfen, ob `cli config` als Meta-/Spec-Befehl später aus dem Haupt-Repo in
  Spec-Tooling ausgelagert werden soll, ohne `P_3` unnötig aufzublähen.

## Links

- [105-2 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-123/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})
