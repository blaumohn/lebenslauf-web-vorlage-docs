---
layout: page
title: "9-4 — Preview-Deploy-Bundle und Schutzregeln nachziehen"
permalink: /en/jira/issues/J01-9/steps/J01-132/
jira_key: J01-132
jira_parent_key: J01-9
---

<!-- generated:jira:step=1 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Ziel: Den Preview-Deploy-Pfad so nachziehen, dass Workflow-Reihenfolge, Deploy-Pruefung und FTP-Artefakt zum aktiven Sprint Goal passen.

- composer install laeuft vor der fruehen Config-Pruefung im Workflow.
- Der bisherige Name smoke wird im CI-Hilfspfad durch einen sprechenden Deploy-Pruefschritt ersetzt.
- deploy/ enthaelt die Root-.htaccess sowie Schutzdateien fuer src/ und var.
- public/ bleibt vorerst unveraendert, damit index.php und der Bootstrap-Pfad nicht deploymentabhaengig werden.
- Die groessere Idee eines gemeinsamen Python-Deploy-Pfads bleibt nur als erwaegte Folgeidee im Tagebuch und nicht Teil dieses Sprint-Zuschnitts.

Erfolgskriterium: Der Preview-Workflow baut das FTP-Artefakt aus dem bestehenden App-Baum plus Schutzdateien, ohne den lokalen Dev-Einstiegspunkt umzuschneiden.

## Links

-
