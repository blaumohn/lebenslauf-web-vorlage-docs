---
layout: page
title: "105-2: Vollständige P_0-zu-P_n-Herleitung und Manifest-Ausdünnung"
jira_key: J01-123
jira_parent_key: J01-105
permalink: /de/jira/issues/J01-105/steps/J01-123/
---

**Stand:** 2026-04-03

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

## P_0-Belegmatrix

Nur Parameter mit technischem Fund werden in `P_0` aufgenommen.
`Technische Nutzung` meint den konkreten Programm-Pfad:
PHP-Code, CLI-Pfad, Python-Runner, Shell-Skript oder GitHub-Workflow.

| Fachphase | Parameter | Pipeline/Phase | Technischer Fund | Technische Nutzung | Technische Quelle | Formal belegt | Formale Quelle | `P_0`-Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `python` | `PYTHON_CMD` | `dev/python`, `preview/python` | ja | Python-Runner | `src/cli/php/PythonResolver.php` | ja | `src/resources/config/dev-python.yaml`, `README.md`, `docs/ENVIRONMENTS.md` | aufgenommen |
| `python` | `PYTHON_PATHS` | `dev/python`, `preview/python` | ja | Python-Runner | `src/cli/php/util/PythonRunner.php` | ja | `src/resources/config/dev-python.yaml`, `README.md`, `docs/ENVIRONMENTS.md` | aufgenommen |
| `build` | `APP_BASE_PATH` | `dev/build`, `preview/build` | ja | CV-Build und Render-Pfad | `src/cli/php/Cv/CvUploadService.php`, `src/cli/php/ConfigValues.php` | ja | `src/resources/config/dev-build.yaml`, `J01-105` | aufgenommen |
| `build` | `LEBENSLAUF_DATEN_PFAD` | `dev/build`, `preview/build` | ja | Content-Quelle für CV-Build | `src/cli/php/Cv/ContentSourceResolver.php` | ja | `README.md`, `README.en.md` | aufgenommen |
| `build` | `LEBENSLAUF_YAML_PFAD` | `dev/build`, `preview/build` | ja | Content-Quelle und Dev-Watcher | `src/cli/php/Cv/ContentSourceResolver.php`, `src/cli/py/dev/dev.py` | nein | - | aufgenommen |
| `build` | `LEBENSLAUF_JSON_PFAD` | `dev/build`, `preview/build` | ja | JSON-Zielpfad für CV-Build | `src/cli/php/Cv/ContentSourceResolver.php` | nein | - | aufgenommen |
| `build` | `LEBENSLAUF_PUBLIC_PROFILE` | `dev/build`, `preview/build` | ja | CV-Build, Upload und Preview-Config-Check | `src/cli/php/Cv/CvBuildService.php`, `src/cli/php/Cv/CvUploadService.php`, `bin/ci` | ja | `README.md`, `J01-105` | aufgenommen |
| `build` | `LEBENSLAUF_LANG_DEFAULT` | `dev/build`, `preview/build` | ja | Upload- und Render-Pfad | `src/cli/php/Cv/CvUploadService.php` | ja | `src/resources/config/dev-build.yaml`, `J01-105` | aufgenommen |
| `build` | `LEBENSLAUF_LANGS` | `dev/build`, `preview/build` | ja | Upload- und Render-Pfad | `src/cli/php/Cv/CvUploadService.php` | ja | `src/resources/config/dev-build.yaml`, `J01-105` | aufgenommen |
| `runtime` | `APP_BASE_PATH` | `dev/runtime`, `preview/runtime` | ja | HTTP-Runtime | `src/Http/ConfigCompiled.php`, `src/Http/AppBuilder.php` | ja | `src/resources/config/dev-runtime.yaml`, `README.en.md` | aufgenommen |
| `runtime` | `TRUST_PROXY` | `dev/runtime`, `preview/runtime` | ja | HTTP-Runtime | `src/Http/Actions/ContactFormAction.php`, `src/Http/Actions/ContactSubmitAction.php` | nein | - | aufgenommen |
| `runtime` | `LEBENSLAUF_LANG_DEFAULT` | `dev/runtime`, `preview/runtime` | ja | HTTP-Runtime | `src/Http/Actions/CvAction.php` | ja | `README.md`, `README.en.md` | aufgenommen |
| `runtime` | `LEBENSLAUF_LANGS` | `dev/runtime`, `preview/runtime` | ja | HTTP-Runtime | `src/Http/Actions/CvAction.php` | ja | `README.md`, `README.en.md` | aufgenommen |
| `runtime` | `CAPTCHA_TTL_SECONDS` | `dev/runtime`, `preview/runtime` | ja | HTTP-Runtime und Captcha-CLI | `src/Http/AppContext.php`, `src/cli/php/Command/CaptchaCommand.php` | nein | - | aufgenommen |
| `runtime` | `CAPTCHA_MAX_GET` | `dev/runtime`, `preview/runtime` | ja | HTTP-Runtime | `src/Http/Actions/ContactFormAction.php` | nein | - | aufgenommen |
| `runtime` | `CONTACT_MAX_POST` | `dev/runtime`, `preview/runtime` | ja | HTTP-Runtime | `src/Http/Actions/ContactSubmitAction.php` | nein | - | aufgenommen |
| `runtime` | `CONTACT_TO_EMAIL` | `dev/runtime`, `preview/runtime` | ja | Mail-Service | `src/Http/Contact/MailService.php` | ja | `README.md`, `README.en.md` | aufgenommen |
| `runtime` | `RATE_LIMIT_WINDOW_SECONDS` | `dev/runtime`, `preview/runtime` | ja | HTTP-Runtime | `src/Http/Actions/ContactFormAction.php`, `src/Http/Actions/ContactSubmitAction.php` | nein | - | aufgenommen |
| `runtime` | `MAIL_STDOUT` | `dev/runtime`, `preview/runtime` | ja | Mail-Service und Preview-Config-Check | `src/Http/Contact/MailService.php`, `bin/ci` | nein | - | aufgenommen |
| `runtime` | `SMTP_HOST` | `dev/runtime`, `preview/runtime` | ja | Mail-Service | `src/Http/Contact/MailService.php` | nein | - | aufgenommen |
| `runtime` | `SMTP_PORT` | `dev/runtime`, `preview/runtime` | ja | Mail-Service | `src/Http/Contact/MailService.php` | nein | - | aufgenommen |
| `runtime` | `SMTP_USER` | `dev/runtime`, `preview/runtime` | ja | Mail-Service | `src/Http/Contact/MailService.php` | nein | - | aufgenommen |
| `runtime` | `SMTP_PASS` | `dev/runtime`, `preview/runtime` | ja | Mail-Service | `src/Http/Contact/MailService.php` | ja | `config.manifest.yaml` | aufgenommen |
| `runtime` | `SMTP_ENCRYPTION` | `dev/runtime`, `preview/runtime` | ja | Mail-Service | `src/Http/Contact/MailService.php` | nein | - | aufgenommen |
| `runtime` | `SMTP_FROM_EMAIL` | `dev/runtime`, `preview/runtime` | ja | Mail-Service | `src/Http/Contact/MailService.php` | ja | `README.md`, `README.en.md` | aufgenommen |
| `runtime` | `SMTP_FROM_NAME` | `dev/runtime`, `preview/runtime` | ja | Mail-Service | `src/Http/Contact/MailService.php` | ja | `README.md`, `README.en.md` | aufgenommen |
| `deploy` | `FTP_SERVER_DIR` | `preview/deploy` | ja | GitHub-Workflow `preview-deploy` | `.github/workflows/preview-deploy.yml` | ja | `src/resources/config/preview-deploy.yaml`, `README.en.md`, `J01-105` | aufgenommen |
| `deploy` | `FTP_PORT` | `preview/deploy` | ja | GitHub-Workflow `preview-deploy` | `.github/workflows/preview-deploy.yml` | ja | `src/resources/config/preview-deploy.yaml`, `J01-105` | aufgenommen |
| `deploy` | `FTP_HOST` | `preview/deploy` | ja | GitHub-Workflow `preview-deploy` | `.github/workflows/preview-deploy.yml` | ja | `config.manifest.yaml`, `J01-105` | aufgenommen |
| `deploy` | `FTP_USER` | `preview/deploy` | ja | GitHub-Workflow `preview-deploy` | `.github/workflows/preview-deploy.yml` | ja | `config.manifest.yaml`, `J01-105` | aufgenommen |
| `deploy` | `FTP_PASS` | `preview/deploy` | ja | GitHub-Workflow `preview-deploy` | `.github/workflows/preview-deploy.yml` | ja | `config.manifest.yaml`, `J01-105` | aufgenommen |

## Formale Kandidaten außerhalb von `P_0`

| Fachphase | Parameter | Grund | Formale Quelle |
| --- | --- | --- | --- |
| `build` | `APP_URL` | Aktuell kein technischer Leser im ausgewerteten Worktree gefunden; bleibt deshalb außerhalb von `P_0`, bis ein Programm-Pfad belegt ist. | `src/resources/config/dev-build.yaml`, `src/resources/config/preview-build.yaml`, `J01-105` |

## Ausgeschlossene frühere Kandidaten

| Phase | Parameter | Grund | Status |
| --- | --- | --- | --- |
| `setup` | `LEBENSLAUF_PUBLIC_PROFILE` | Nach `J01-122` nutzt `setup` nur noch `--copy-sample-content` mit fester Fixture; `SetupCommand` liest keinen fachlichen Setup-Parameter mehr. | nicht in `P_0` aufgenommen |
| `runtime` | `LEBENSLAUF_PUBLIC_PROFILE` | Im aktuellen Quellstand kein positiver HTTP-Runtime-Beleg; der Parameter bleibt build-seitig belegt. | nicht in `P_0` aufgenommen |

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
- Prüfen, ob einzelne Parametererklärungen später in kanonische Bereichs-
  oder Systemdoku wandern sollen, sobald `P_n` stabil ist.

## Links

- [105-2 im Jira-Mirror]({{ "/de/jira/issues/J01-105/steps/J01-123/" | relative_url }})
- [J01-105 im Jira-Mirror]({{ "/de/jira/issues/J01-105/" | relative_url }})
