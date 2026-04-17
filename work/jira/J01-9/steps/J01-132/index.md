---
layout: page
title: "9-4 — Preview-Deploy-Bundle, Deploy-Auflösung und Schutzregeln"
permalink: /de/jira/issues/J01-9/steps/J01-132/
jira_key: J01-132
jira_parent_key: J01-9
---

<!-- generated:jira:step=1 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Angaben

Ziel: Den Preview-Deploy-Pfad so nachziehen, dass Workflow-Reihenfolge,
früher Vertragscheck, Deploy-Auflösung und FTP-Artefakt zum aktiven
Sprint-Ziel passen.

- `composer install` läuft vor der frühen Config-Prüfung im Workflow.
- Der bisherige Name `smoke` wird im CI-Hilfspfad durch einen sprechenden
  Deploy-Prüfschritt ersetzt.
- Das Deploy-Artefakt liegt nicht mehr im Repo-Root, sondern standardmäßig
  unter `var/deploy/`; `deploy-check` kann den Zielpfad per `--dir`
  überschreiben.
- `public/` bleibt vorerst unverändert, damit `index.php` und der
  Bootstrap-Pfad nicht deploymentabhängig werden.
- Der Workflow verwendet `vars.PIPELINE` als Pipeline-ID.
- Der Workflow materialisiert die GitHub-Eingaben zuerst als
  phasenspezifische `.local`-Dateien für `preview/runtime` und
  `preview/deploy`.
- Die PHP-Basis von App, Config-Lib und Preview-Workflow wurde auf
  `>=8.2` bzw. `8.2` als CI-Standardlauf nachgezogen, weil die
  gelockten Symfony-7.4-Pakete bereits `php >=8.2` verlangen.
- `bin/ci resolve-deploy` bündelt die allgemeine Deploy-Auflösung; GitHub
  nutzt dafür nur den Ausgabeadapter `--format github-output`.
- Die FTP-Werte werden direkt vor `FTP deploy` aus dieser Auflösung gelesen;
  die Action liest nur die aufgelösten Step-Outputs.
- Der letzte Build-Blocker wurde im Sprint-Zuschnitt durch die Korrektur
  von `preview-build.yaml` auf den tatsächlich vorhandenen Fixture-Pfad
  `src/resources/fixtures/lebenslauf` geschlossen.
- Die größere Idee eines gemeinsamen Python-Deploy-Pfads bleibt nur als
  erwägte Folgeidee im Tagebuch und nicht Teil dieses Sprint-Zuschnitts.

Erfolgskriterium: Der Preview-Workflow baut das FTP-Artefakt unter
`var/deploy/` aus dem bestehenden App-Baum plus Schutzdateien, ohne den
lokalen Dev-Einstiegspunkt umzuschneiden, und löst `preview/deploy` erst
am Verbraucher spec-treu für `FTP deploy` auf; `build preview` nutzt dafür
einen vorhandenen Preview-Datenpfad; `composer install` ist mit der
deklarierten PHP-Basis wieder konsistent.

## Testbild

- Die volle Auflösungsmatrix liegt in `pipeline-config-spec-php`.
- Das App-Repo deckt nur die app-seitigen Integrationsfälle ab.
- Die kompakte öffentliche Nachweisform liegt in der
  [Testmatrix zu J01-132]({{
  "/de/jira/issues/J01-9/steps/J01-132/testmatrix/" | relative_url }}).

## Links

- [J01-9 im Jira-Mirror]({{ "/de/jira/issues/J01-9/" | relative_url }})
- [Testmatrix zu J01-132]({{
  "/de/jira/issues/J01-9/steps/J01-132/testmatrix/" | relative_url }})
- [J01-105 Schritt 105-4]({{
  "/de/jira/issues/J01-105/steps/J01-124/" | relative_url }})
