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

- `bin/ci` trägt jetzt den wiederverwendbaren Kern für den Preview-Pfad:
  `composer install`, Konfigurationsvorbereitung, Vertragsprüfung, Setup,
  Build, Deploy-Prüfung und die Ausgabe im `github-output`-Format.
- `pipeline-config-spec-php/src/Internal/ConfigLoader.php` trennt den
  Ladepfad jetzt klar in Orchestrierung, Dateiladen und Merge-Schritt auf.
  Die Methode `load()` bleibt dadurch kürzer und folgt dem Stilziel
  "eine Aufgabe pro Funktion" besser.
- `tests/ci/run.sh` enthält nur noch den Git-Clone-Einstieg und ruft
  danach eine Pipeline-Matrix aus `bin/ci` auf.
- Die lokale Matrix deckt `dev` und `preview` in derselben
  `docker-compose.ci.yml` ab.
- `composer tests:ci` ersetzt den früheren Namen `tests:smoke`.
- Das App-Repo hat einen versionierten `pre-push`-Hook, der genau diesen
  CI-Lauf ausführt.
- Der GitHub-Workflow `preview-deploy.yml` enthält die frühere
  Fachlogik von `Prepare config inputs` bis `Resolve deploy outputs`
  nicht mehr als einzelne YAML-Schritte, sondern ruft den zentralen
  Preview-Pfad über `bin/ci pipeline-check` auf.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Pipeline-Modell bleibt führend | `bin/ci` arbeitet entlang von `pipeline + phase`; kein zweites fachliches CI-Modell entsteht | `lebenslauf-web-vorlage/bin/ci` | erledigt |
| Lokale Preview-Reproduktion | Die Docker-Matrix deckt `preview` lokal ab und prüft den kompletten Preview-Pfad | `lebenslauf-web-vorlage/tests/ci/run.sh`, `lebenslauf-web-vorlage/docker-compose.ci.yml` | erledigt |
| Preview-Outputs lokal prüfbar | `ftp_host`, `ftp_user`, `ftp_pass`, `ftp_port`, `ftp_server_dir` werden lokal verifiziert | `lebenslauf-web-vorlage/bin/ci`, `lebenslauf-web-vorlage/tests/php/CiCommandTest.php` | erledigt |
| Loader-Stil am Modell ausgerichtet | `ConfigLoader::load()` bleibt schmal und delegiert Laden sowie Merge an Hilfsfunktionen | `pipeline-config-spec-php/src/Internal/ConfigLoader.php` | erledigt |
| Workflow nur Verbraucher | Die früheren YAML-Fachschritte entfallen; der Workflow ruft den zentralen Preview-Pfad auf | `lebenslauf-web-vorlage/.github/workflows/preview-deploy.yml` | erledigt |
| Hook und lokaler Einstieg aktuell | `composer tests:ci` ist kanonischer Einstieg; `pre-push` ruft ihn auf | `lebenslauf-web-vorlage/composer.json`, `lebenslauf-web-vorlage/scripts/hooks/pre-push`, `lebenslauf-web-vorlage/README.md` | erledigt |

## Links

- [J01-9 im Jira-Mirror]({{ "/de/jira/issues/J01-9/" | relative_url }})
- [J01-9 Schritt 9-4]({{ "/de/jira/issues/J01-9/steps/J01-132/" | relative_url }})
- [J01-9 Schritt 9-5]({{ "/de/jira/issues/J01-9/steps/J01-133/" | relative_url }})
