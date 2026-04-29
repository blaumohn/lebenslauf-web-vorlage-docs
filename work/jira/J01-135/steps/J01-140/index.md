---
layout: page
title: "135-3 — Mail-Rückkanal für Runtime-Admin-Ergebnisse festziehen"
permalink: /de/jira/issues/J01-135/steps/J01-140/
jira_key: J01-140
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Angaben

Ziel: Einen kontrollierten Rückkanal für Runtime-Admin-Ergebnisse festlegen,
damit sensible Ergebnisse wie neue CV-Tokens nicht nur auf stdout oder in
unkontrollierten Logs landen.

- `mail_stdout` bleibt als Dev-Hilfe möglich.
- Preview und produktionsnahe Abläufe sollen SMTP verwenden.
- Ergebnisrückgabe und Fehlerausgabe werden getrennt betrachtet.
- Log-Leaks werden als eigener Prüfpunkt behandelt.

Erfolgskriterium: Runtime-Admin-Ergebnisse haben einen dokumentierten
Rückkanal, der für Preview/Produktion nicht auf unkontrollierte Konsolenausgabe
angewiesen ist.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| SMTP-Pfad | Preview/Produktion nutzen einen Mail-Rückkanal | Konfiguration oder Test | offen |
| Dev-Pfad | `mail_stdout` bleibt klar als Dev-Hilfe abgegrenzt | Runbook oder Config-Doku | offen |
| Log-Schutz | Sensible Ergebnisse erscheinen nicht in unkontrollierten Logs | Test oder Review | offen |

## Links

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }})
