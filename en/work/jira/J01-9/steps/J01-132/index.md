---
layout: page
title: "9-4 — Preview-Deploy-Bundle, Deploy-Auflösung und Schutzregeln"
permalink: /en/jira/issues/J01-9/steps/J01-132/
jira_key: J01-132
jira_parent_key: J01-9
---

<!-- generated:jira:step=1 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Ziel: Den Preview-Deploy-Pfad so nachziehen, dass Workflow-Reihenfolge,
früher Vertragscheck, Deploy-Auflösung und FTP-Artefakt zum aktiven
Sprint Goal passen.

- `composer install` läuft vor der frühen Config-Prüfung im Workflow.
- Der bisherige Name `smoke` wird im CI-Hilfspfad durch einen sprechenden
  Deploy-Prüfschritt ersetzt.
- `deploy/` enthält die Root-`.htaccess` sowie Schutzdateien für `src/`
  und `var`.
- `public/` bleibt vorerst unverändert, damit `index.php` und der
  Bootstrap-Pfad nicht deploymentabhängig werden.
- Der Workflow verwendet `vars.PIPELINE` als Pipeline-ID.
- Der Workflow materialisiert die GitHub-Eingaben zuerst als
  phasenspezifische `.local`-Dateien für `preview/runtime` und
  `preview/deploy`.
- `bin/ci resolve-deploy` now owns the general deploy resolution; GitHub
  uses only the `--format github-output` output adapter.
- The FTP values are read right before `FTP deploy` from that resolution;
  the action reads only the resolved step outputs.
- Die größere Idee eines gemeinsamen Python-Deploy-Pfads bleibt nur als
  erwägte Folgeidee im Tagebuch und nicht Teil dieses Sprint-Zuschnitts.

Erfolgskriterium: Der Preview-Workflow baut das FTP-Artefakt aus dem
bestehenden App-Baum plus Schutzdateien, ohne den lokalen
Dev-Einstiegspunkt umzuschneiden, und löst `preview/deploy` erst am
Verbraucher spec-treu für `FTP deploy` auf.

## Testbild

- Die volle Auflösungsmatrix liegt in `pipeline-config-spec-php`.
- Das App-Repo deckt nur die app-seitigen Integrationsfälle ab.
- Die kompakte öffentliche Nachweisform liegt in der
  [Testmatrix zu J01-132]({{
  "/de/jira/issues/J01-9/steps/J01-132/testmatrix/" | relative_url }}).

## Links

- [J01-9 im Jira-Mirror]({{ "/en/jira/issues/J01-9/" | relative_url }})
- [Testmatrix zu J01-132]({{
  "/de/jira/issues/J01-9/steps/J01-132/testmatrix/" | relative_url }})
- [J01-105 Schritt 105-4]({{
  "/de/jira/issues/J01-105/steps/J01-124/" | relative_url }})
