---
layout: page
title: "Private Ansicht einrichten"
permalink: /de/getting-started/private-ansicht/
readme_order: 3
---

Die private Ansicht zeigt den vollständigen Lebenslauf per URL-Token — kein Login, kein Account.
Einrichtung nach `composer run dev`:

1. **Token erzeugen** — `php bin/cli token rotate preview`
2. **`.local/preview.yaml` anlegen** — `APP_ROOT_URL` und Deployment-Werte setzen.
   Datei mit `chmod 600` sichern: nur vertrauenswürdige Benutzer dürfen sie lesen.
3. **GitHub Secrets/Vars setzen** — Pflichtfelder aus `src/resources/pipeline-config/manifest.yaml`,
   Abschnitt `pipelines.preview`, im GitHub-Environment `preview`.
4. **CI lokal prüfen** — `composer run ci:preview`
5. **Aufrufen** — `https://domain/cv?token=<token>`

## Sicherheitsmodell

`.local/preview.yaml` enthält Zugangsdaten und Token-Werte.
`chmod 600` stellt sicher, dass KI-Agents und andere Prozesse mit eingeschränktem
Vertrauen die Datei nicht lesen können.
