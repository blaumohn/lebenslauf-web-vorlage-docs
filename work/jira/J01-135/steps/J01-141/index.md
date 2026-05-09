---
layout: page
title: "135-4 — Admin-Aktionsliste und Zugriffsschutz begrenzen"
permalink: /de/jira/issues/J01-135/steps/J01-141/
jira_key: J01-141
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Angaben

Ziel: Den Admin-Trigger so begrenzen, dass er keine frei parametrisierbare
Befehlsschnittstelle wird.

- Erlaubt sind nur feste Admin-Aktionen.
- Parameter werden pro Aktion begrenzt und validiert.
- Bestehende HTTP-Security bleibt Teil des Schutzmodells.
- Fehlerpfade und Auditierbarkeit werden dokumentiert.

Erfolgskriterium: Der Runtime-Admin-Trigger kann nur definierte, prüfbare
Aktionen ausführen und erweitert die Angriffsfläche nicht unnötig.

## Offener Härtungsschnitt vor Production

Der aktuelle App-Stand hat bereits feste Handler für `deploy_switch` und
`cv_token_rotation`; die Production-Vorbereitung braucht aber noch die
explizite Härtung dieses Schnitts:

- erlaubte Task-Typen öffentlich dokumentieren und im Code bewusst prüfen
- Parameter je Task begrenzen, insbesondere Profilname und Token-Anzahl bei
  `cv_token_rotation`
- Fehlerfälle so melden, dass keine Tokens oder Secrets in Logs landen
- Zugriffsschutz des `/admin/run`-Endpunkts gegen das bestehende
  HTTP-Security-Modell prüfen
- erfolgreiche und fehlerhafte Läufe auditierbar machen

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Aktionsliste | Erlaubte Admin-Aktionen sind fest benannt | `deploy_switch`, `cv_token_rotation`, Doku/Code-Review | teilweise umgesetzt |
| Parametergrenzen | Jede Aktion validiert ihre Eingaben | Test oder Codepfad | offen |
| Zugriffsschutz | Trigger hängt am bestehenden Schutzmodell | Review / Test | offen |
| Auditierbarkeit | Erfolg und Fehler sind nachvollziehbar, ohne Secrets auszugeben | Runbook / Test | offen |

## Links

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }})
