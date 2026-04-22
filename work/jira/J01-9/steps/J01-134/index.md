---
layout: page
title: "9-6 — Preview-CI am Pipeline-Modell ausrichten"
permalink: /de/jira/issues/J01-9/steps/J01-134/
jira_key: J01-134
jira_parent_key: J01-9
---

<!-- generated:jira:step=1 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Ziel

Den lokalen CI- und den GitHub-Preview-Ablauf so auf das führende
Projektmodell `pipeline + phase` ausrichten, dass Preview-Fehler lokal
schnell reproduzierbar werden, Preview-spezifische Outputs lokal prüfbar
sind und der Workflow nur noch dünner Verbraucher von `bin/ci` bleibt.

## Aktueller Stand

- `J01-134` ist jetzt im SSOT Jira als Schritt unter `J01-9` angelegt,
  steht auf `In Bearbeitung` und trägt den kanonischen Remote-Link auf
  diese Arbeitsdoku.
- `bin/ci` trägt jetzt den wiederverwendbaren Kern für den Preview-Pfad:
  `composer install`, Konfigurationsvorbereitung, Vertragsprüfung, Setup,
  Build, Deploy-Prüfung und die Ausgabe im `github-output`-Format.
- `bin/ci` liest die Pipeline jetzt aus `APP_PIPELINE` statt aus
  `CI_PIPELINE`.
- `bin/cd` arbeitet jetzt argumentlos und liest `APP_PIPELINE` sowie
  `DEPLOY_DIR` aus der Prozessumgebung.
- Der Preview-Fixture-Pfad in `bin/ci` setzt feste Testwerte jetzt nur
  noch als lokale Shell-Variablen statt als exportierte Prozessumgebung.
  Dadurch bleibt der Secret- und Deploy-Pfad im CI konsistent im
  `--overrides`-Kanal.
- `scripts/pipeline_lib.sh` baut die CI-Overrides jetzt mit einer
  gemeinsamen Shell-Funktion verschachtelt pro `pipeline`, `phase` und
  Variablengruppe auf. `cli build` erhält nur den Runtime-SMTP-Pfad;
  `cli config` erhält nur den Deploy-FTP-Pfad.
- Wiederholte Prüfblöcke für Deploy-Outputs sind im Shell-Code auf
  Schleifen verdichtet, damit der CI-Pfad kürzer und konsistenter bleibt.
- `pipeline-config-spec-php/src/Internal/ConfigLoader.php` trennt den
  Ladepfad jetzt klar in Orchestrierung, Dateiladen und Merge-Schritt auf.
  Die Methode `load()` bleibt dadurch kürzer und folgt dem Stilziel
  "eine Aufgabe pro Funktion" besser.
- Das Dateimodell des Loaders folgt jetzt der Spec ohne `common.yaml` und
  ohne reine Pipeline-Datei. Stattdessen gilt die Reihenfolge
  `config/<phase>.yaml`, `.local/<phase>.yaml`,
  `config/<pipeline>-<phase>.yaml`, `.local/<pipeline>-<phase>.yaml`.
- Die neue `--overrides`-Spec läuft parallel in anderer Hand und ist fast
  fertig. Diese Schrittseite hält deshalb nur den bestätigten Stand zu
  `J01-134` fest und greift nicht in die laufende Quellarbeit ein.
- `tests/ci/run.sh` enthält nur noch den Git-Clone-Einstieg und ruft
  danach eine Pipeline-Matrix aus `bin/ci` auf.
- Die lokale Matrix deckt `dev` und `preview` in derselben
  `docker-compose.ci.yml` ab, mit gemeinsamem Basisanker für Build und
  Prozessumgebung.
- Der Preview-Workflow ruft `bin/cd` ohne Positionsargumente auf und
  setzt `APP_PIPELINE` sowie `DEPLOY_DIR` direkt im Schritt.
- `composer tests:ci` ersetzt den früheren Namen `tests:smoke`.
- Das App-Repo hat einen versionierten `pre-push`-Hook, der genau diesen
  CI-Lauf ausführt.
- Der GitHub-Workflow `preview-deploy.yml` enthält die frühere
  Fachlogik von `Prepare config inputs` bis `Resolve deploy outputs`
  nicht mehr als einzelne YAML-Schritte, sondern ruft den zentralen
  Preview-Pfad über `bin/ci pipeline-check` auf.
- `ConfigCommandTest` schreibt den Preview-Runtime-Pfad für
  `SMTP_PASS` jetzt mit einem temporären Manifest selbst auf
  `preview/runtime/smtp` um, damit der CLI-Override ohne echte
  Pipeline-Datei geprüft werden kann.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| SSOT-Schritt vorhanden | `J01-134` existiert in Jira unter `J01-9` | Jira | erledigt |
| SSOT-Status stimmt | `J01-134` steht auf `In Bearbeitung` | Jira | erledigt |
| Remote-Link ist kanonisch | Jira zeigt auf diese öffentliche Arbeitsdoku | Jira + diese Seite | erledigt |
| Pipeline-Modell bleibt führend | `bin/ci` arbeitet entlang von `pipeline + phase`; kein zweites fachliches CI-Modell entsteht | `lebenslauf-web-vorlage/bin/ci` | erledigt |
| CI/CD laufen über Umgebungsvariablen | `bin/ci` und `bin/cd` lesen `APP_PIPELINE`; `bin/cd` verlangt zusätzlich `DEPLOY_DIR` | `lebenslauf-web-vorlage/bin/ci`, `lebenslauf-web-vorlage/bin/cd`, `lebenslauf-web-vorlage/.github/workflows/preview-deploy.yml` | in Arbeit |
| Lokale Preview-Reproduktion | Die Docker-Matrix deckt `preview` lokal ab und prüft den kompletten Preview-Pfad | `lebenslauf-web-vorlage/tests/ci/run.sh`, `lebenslauf-web-vorlage/docker-compose.ci.yml` | erledigt |
| Preview-Outputs lokal prüfbar | `ftp_host`, `ftp_user`, `ftp_pass`, `ftp_port`, `ftp_server_dir` werden lokal verifiziert | `lebenslauf-web-vorlage/bin/ci`, `lebenslauf-web-vorlage/tests/php/CiCommandTest.php` | erledigt |
| CI-Overrides passen zur aktuellen Spec | `bin/ci` und `pipeline_lib.sh` liefern verschachtelte Overrides statt flacher Punkt-Schlüssel | `lebenslauf-web-vorlage/bin/ci`, `lebenslauf-web-vorlage/scripts/pipeline_lib.sh`, `lebenslauf-web-vorlage/tests/php/ConfigCommandTest.php` | erledigt |
| Loader-Stil am Modell ausgerichtet | `ConfigLoader::load()` bleibt schmal und delegiert Laden sowie Merge an Hilfsfunktionen | `pipeline-config-spec-php/src/Internal/ConfigLoader.php` | erledigt |
| Loader-Dateimodell folgt der Spec | Kein `common.yaml`, keine reine Pipeline-Datei; Phase vor Pipeline-Phase | `pipeline-config-spec-php/src/Internal/ConfigLoader.php`, `pipeline-config-spec-php/tests/ConfigLoaderTest.php`, `pipeline-config-spec-php/README.de.md`, `pipeline-config-spec-php/README.md` | erledigt |
| `--overrides`-Spec bleibt getrennt | Die parallele fast fertige Spec wird hier nicht als abgeschlossen behauptet | Arbeitskontext dieser Runde | in Arbeit |
| Workflow nur Verbraucher | Die früheren YAML-Fachschritte entfallen; der Workflow ruft den zentralen Preview-Pfad auf | `lebenslauf-web-vorlage/.github/workflows/preview-deploy.yml` | erledigt |
| Hook und lokaler Einstieg aktuell | `composer tests:ci` ist kanonischer Einstieg; `pre-push` ruft ihn auf | `lebenslauf-web-vorlage/composer.json`, `lebenslauf-web-vorlage/scripts/hooks/pre-push`, `lebenslauf-web-vorlage/README.md` | erledigt |

## Links

- [J01-9 im Jira-Mirror]({{ "/de/jira/issues/J01-9/" | relative_url }})
- [J01-9 Schritt 9-4]({{ "/de/jira/issues/J01-9/steps/J01-132/" | relative_url }})
- [J01-9 Schritt 9-5]({{ "/de/jira/issues/J01-9/steps/J01-133/" | relative_url }})
