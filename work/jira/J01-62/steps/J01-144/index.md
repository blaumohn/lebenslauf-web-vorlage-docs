---
layout: page
title: "62-1 — Mail im Deployment aktivieren"
permalink: /de/jira/issues/J01-62/steps/J01-144/
jira_key: J01-144
jira_parent_key: J01-62
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Ziel

Mail im Deployment so aktivieren, dass Preview und später Production SMTP
über Pipeline-Konfig und Environment-Werte nutzen können.

Parent: [J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }}).

## Aktueller Stand

Der erste PR bereitet den CI-Pfad vor:

- statische CI-Infrastrukturwerte für SMTP und SFTP liegen in
  `docker-compose.ci.yml`
- der lokale SFTP-Smoke nutzt einen festen CI-Testhostkey und eine feste
  `SSH_KNOWN_HOST_LINE`
- der SMTP-Smoke liest Runtime-Konfig über `pipeline_config runtime`
- der SMTP-Smoke prüft Mailpit direkt mit Auth und TLS, ohne Kopplung an
  `src/Http`

Der echte Preview-Nachweis mit Mailtrap bleibt offen und kann weitere
Korrekturen an Environment- oder Workflow-Werten auslösen.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| CI-Smoke | `composer run ci:preview` läuft mit SFTP-, HTTP-, SMTP- und Kontakt-Smokes durch | App-Repo, PR zu `J01-144` | erledigt |
| SMTP-Auth | Falsches SMTP-Passwort wird im CI-Smoke abgelehnt, richtiges Passwort sendet Testmail | `tests/ci/smtp-smoke.py` | erledigt |
| SFTP-Hostkey | Preview-CI braucht kein dynamisches `ssh-keyscan` mehr | `docker-compose.ci.yml`, `bin/ci` | erledigt |
| Preview-Mailtrap | Preview-Deployment versendet über Mailtrap mit echten Environment-Werten | ausstehender manueller Preview-Test | offen |
| Nachkorrektur | Abweichungen aus Mailtrap-Test sind im selben Schritt oder Folge-PR behoben | PR / Nachweisnotiz | offen |

## Links

- [Parent J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }})
