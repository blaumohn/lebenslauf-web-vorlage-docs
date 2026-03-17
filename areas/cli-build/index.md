---
layout: page
title: "Bereich: CLI / Build"
permalink: /de/areas/cli-build/
---

Dieser Bereich hält für `J01-98` die preview-relevante Source- und
Manifest-Herleitung fest.
Er beschreibt nur den schmalen Pfad, den `SCRUM Sprint 1` für die
öffentliche Preview-Migration braucht.

## Pipeline- und Phasenmodell

- Die CLI führt Phasen direkt aus: `cli <phase> <pipeline> [args]`.
- Für den Preview-Pfad sind vor allem `setup`, `build`, `runtime` und
  `deploy` relevant.
- Die Config-Ladereihenfolge führt von versionierten Defaults zu lokalen
  Overrides und anschließend in die kompilierte Laufzeitdatei
  `var/config/config.php`.

## Manifest-Regeln

- `src/resources/config/config.manifest.yaml` definiert Variablengruppen,
  erlaubte Bereiche und Pflichtwerte pro Pipeline/Phase.
- `IP_SALT` ist auf `system`, `local` und `file` begrenzt und darf damit nicht
  beliebig aus anderen Quellen kommen.
- Deploy-Werte wie `FTP_HOST`, `FTP_USER` und `FTP_PASS` sind auf sichere
  Quelltypen eingeschränkt.
- `APP_BASE_PATH` und `FTP_SERVER_DIR` erklären den sichtbaren Preview-Zielort
  ohne versteckte Sonderlogik im Doku-Pfad.

## Öffentlicher Preview-Pfad

Der schmale Preview-Pfad für `J01-98` lautet:

1. `php bin/cli config lint <pipeline>` prüft, ob Manifest und Quellenlogik
   zusammenpassen.
2. `php bin/cli setup preview` bereitet den Preview-Lauf vor.
3. `php bin/cli build preview` erzeugt den auslieferbaren Stand.
4. Die Runtime nutzt nur die kompilierte Config und keine direkten
   `getenv()`-Abfragen.

## Abgrenzung

- Diese Seite erklärt den technischen Zuschnitt für `J01-31`.
- Ausführliche Betriebsregeln für die lokale Pages-Vorschau bleiben im
  [Preview-Runbook]({{ "/de/operations/ghpages-preview/" | relative_url }}).
- Laufzeitnahe Stabilitätsaspekte bleiben im
  [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }}).
- Alles, was über den aktiven Preview-Sprint hinausgeht, bleibt außerhalb
  von `J01-98`.

## Links

- [J01-98: öffentlicher Arbeitsstand]({{ "/de/work/jira/J01-98/" | relative_url }})
- [J01-31 im Jira-Mirror]({{ "/de/mirror/issues/J01-31/" | relative_url }})
- [Testmatrix]({{ "/de/quality/testmatrix/" | relative_url }})
