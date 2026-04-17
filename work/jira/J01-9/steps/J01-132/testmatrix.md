---
layout: page
title: "9-4 Testmatrix — Preview-Deploy-Auflösung"
permalink: /de/jira/issues/J01-9/steps/J01-132/testmatrix/
jira_key: J01-132
jira_parent_key: J01-9
---

Testmatrix: Preview-Deploy-Auflösung

Ziel
- Den Preview-Workflow so absichern, dass die Auflösung von
  `preview/runtime` und `preview/deploy` entlang der Verantwortlichkeiten
  nachweisbar bleibt.

Scope
- `pipeline-config-spec-php`: Auflösungsmatrix und Quellenregeln
- `lebenslauf-web-vorlage`: CLI-Integration und Workflow-Verbrauch
- GitHub-Workflow: phasenspezifische `.local`-Materialisierung plus späte
  Deploy-Auflösung direkt vor `FTP deploy`

Matrix
- `preview/runtime` -> Unit/Compile -> `PreviewResolveMatrixTest` kompiliert
  `runtime` mit `SMTP_PASS` aus `system` und behält `pipeline_phase` ->
  `pipeline-config-spec-php/tests/PreviewResolveMatrixTest.php`
- `preview/deploy` mit Datei- und Local-Quelle -> Unit/Describe ->
  `PreviewResolveMatrixTest` belegt `FTP_PORT` aus Datei und
  `FTP_HOST`/`FTP_USER`/`FTP_PASS` aus `.local` ->
  `pipeline-config-spec-php/tests/PreviewResolveMatrixTest.php`
- `preview/deploy` mit System-Vorrang -> Unit/Describe ->
  `PreviewResolveMatrixTest` belegt `system` vor `.local` ->
  `pipeline-config-spec-php/tests/PreviewResolveMatrixTest.php`
- `preview/deploy` Fehlpfade -> Unit/Validation ->
  `PreviewResolveMatrixTest` deckt fehlende Pflichtwerte und unzulässige
  Quellen ab -> `pipeline-config-spec-php/tests/PreviewResolveMatrixTest.php`
- `config get preview --phase deploy` -> App-Integration ->
  `ConfigCommandTest` liest `FTP_PORT` aus dem Deploy-Pfad ->
  `lebenslauf-web-vorlage/tests/php/ConfigCommandTest.php`
- `config get preview --phase runtime` -> App-Integration ->
  `ConfigCommandTest` liest `SMTP_PASS` aus dem Runtime-Pfad ->
  `lebenslauf-web-vorlage/tests/php/ConfigCommandTest.php`
- `config lint preview --phase deploy` -> App-Integration ->
  `ConfigCommandTest` bestätigt den Deploy-Phasenlauf ->
  `lebenslauf-web-vorlage/tests/php/ConfigCommandTest.php`
- Workflow-Eingaben -> Workflow/Integration ->
  `preview-deploy.yml` erzeugt erst `.local/preview-runtime.yaml` und
  `.local/preview-deploy.yaml` über `bin/ci prepare-config` ->
  `lebenslauf-web-vorlage/.github/workflows/preview-deploy.yml`,
  `lebenslauf-web-vorlage/bin/ci`
- `resolve-deploy` -> CI-Integration ->
  `CiCommandTest` bestätigt die neutrale Ausgabe und den Adapter
  `--format github-output` ->
  `lebenslauf-web-vorlage/tests/php/CiCommandTest.php`
- `deploy-check --dir` -> CI-Integration ->
  `CiCommandTest` bestätigt die akzeptierte Zielpfad-Syntax für temporäre
  Artefakte außerhalb des Repo-Root ->
  `lebenslauf-web-vorlage/tests/php/CiCommandTest.php`
- `FTP deploy` -> Workflow/Integration ->
  `preview-deploy.yml` ruft
  `bin/ci resolve-deploy ... --format github-output` auf und übergibt nur
  Step-Outputs an die Action; das Upload-Artefakt liegt unter
  `var/deploy/` ->
  `lebenslauf-web-vorlage/.github/workflows/preview-deploy.yml`

Nachweise
- [Schrittseite J01-132]({{ "/de/jira/issues/J01-9/steps/J01-132/" | relative_url }})
- [J01-105 Schritt 105-4]({{ "/de/jira/issues/J01-105/steps/J01-124/" | relative_url }})
