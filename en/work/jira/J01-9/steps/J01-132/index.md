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
- The deploy artifact no longer lives in the repo root; by default it is
  written to `var/deploy/`, and `deploy-check` can override the target
  path through `--dir`.
- `public/` bleibt vorerst unverändert, damit `index.php` und der
  Bootstrap-Pfad nicht deploymentabhängig werden.
- Der Workflow verwendet `vars.PIPELINE` als Pipeline-ID.
- Der Workflow materialisiert die GitHub-Eingaben zuerst als
  phasenspezifische `.local`-Dateien für `preview/runtime` und
  `preview/deploy`.
- `bin/ci resolve-deploy` bündelt die allgemeine Deploy-Auflösung; GitHub
  nutzt dafür nur den Ausgabeadapter `--format github-output`.
- Die FTP-Werte werden direkt vor `FTP deploy` aus dieser Auflösung gelesen;
  die Action liest nur die aufgelösten Step-Outputs.
- The last build blocker in this sprint slice was closed by correcting
  `preview-build.yaml` to the existing fixture path
  `src/resources/fixtures/lebenslauf`.
- Die größere Idee eines gemeinsamen Python-Deploy-Pfads bleibt nur als
  erwägte Folgeidee im Tagebuch und nicht Teil dieses Sprint-Zuschnitts.

Success criterion: the preview workflow builds the FTP artifact under
`var/deploy/` from the existing app tree plus guard files without
rewriting the local dev entry point, and resolves `preview/deploy` only
at the consumer for `FTP deploy`; `build preview` uses an existing preview
data path.

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
