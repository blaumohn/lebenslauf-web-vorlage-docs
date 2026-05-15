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

## Nachtrag 2026-05-09: Rest vor Preview-Nachweis

Die nachträglichen Codex-Sitzungen haben die lokale CI-Preview-Linie weiter
präzisiert:

- `SMTP_ENCRYPTION` ist auf `none` oder `tls` begrenzt; `ssl` wird früh
  abgelehnt.
- `SMTP_FROM_EMAIL` bleibt nötig, weil `MailService` den Absender explizit
  setzt; ein nicht verwendeter `SMTP_EMAIL`-Wert kann dagegen entfallen.
- `CI_TEST_CASE` muss beim gezielten Compose-Run in den Container
  weitergegeben werden.
- Für Mailpit muss `SMTP_PORT: 1025` in der CI-Preview-Konfiguration erhalten
  bleiben; sonst versucht der Smoke Port `587`.
- Die Inline-Konfiguration muss mit dem read-only CI-Container vereinbar
  bleiben.

Für Production ist damit noch nicht der Mail-Funktionsnachweis selbst offen,
sondern der reale Preview-Nachweis mit den späteren Environment-Werten.

## Nachtrag 2026-05-13: Deploy-Korrelation

Der Zero-Downtime-Switch benötigt eine eindeutige `GITHUB_RUN_ID`, damit der
SFTP-Deploy vorbereitete Slots und PHP-Admin-Switch demselben Lauf zuordnen
kann.

- Die GitHub-Workflows übergeben die Laufkennung explizit über `env:` aus
  `github.run_id` und `github.run_attempt`.
- Der gemeinsame Preview-CD-Teil liegt in einem wiederverwendbaren GitHub
  Workflow, damit Preview-Deploy und Admin-Reset dieselben Setup-, Konfig- und
  Deploy-Schritte nutzen.
- Die lokale Preview-CI erzeugt pro Testfall eine eigene `GITHUB_RUN_ID` im
  CI-Runner und reicht sie über Docker Compose an den `ci-preview`-Container
  weiter.
- Der SFTP-Swap schreibt Run-Marker für App- und Vendor-Slot, bevor der
  `deploy_switch` ausgelöst wird.
- Der HTTP-Auslöser des Python-Admin-Dispatch nutzt per GET die registrierte
  PHP-Route `/admin/run`.
- `composer test` bleibt der kurze PHPUnit-Einstieg; die Python-Unit-Tests
  laufen explizit über `composer run test:python` oder gemeinsam mit PHPUnit
  über `composer run test:all`.
- Der Python-Unit-Testlauf puffert Ausgaben erfolgreicher Tests, damit
  erwartete Test-Nebenausgaben nicht in den normalen Testbericht laufen.

## Nachtrag 2026-05-15: Task-Testausgabe

Der PHPUnit-Lauf hatte erfolgreiche Task-Fehlerpfadtests, deren erwartete
`error_log()`-Meldungen dennoch in `composer test:php` sichtbar wurden.

- Die betroffenen `TaskRunner`-Tests leiten erwartete Fehlerlogs nun in eine
  temporäre Logdatei im Testverzeichnis um.
- Die Mail-STDOUT-Ausgabe bleibt gezielt erfassbar, damit der Test für die
  Fehlerbenachrichtigung weiter den Mailinhalt prüfen kann.
- `composer test:php` läuft weiterhin durch; die gemeldeten
  `[task] Fehler ...`- und `[task] Mailversand fehlgeschlagen ...`-Zeilen
  erscheinen dabei nicht mehr.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| CI-Smoke | `composer run ci:preview` läuft mit SFTP-, HTTP-, SMTP- und Kontakt-Smokes durch | App-Repo, PR zu `J01-144` | erledigt |
| SMTP-Auth | Falsches SMTP-Passwort wird im CI-Smoke abgelehnt, richtiges Passwort sendet Testmail | `tests/ci/smtp-smoke.py` | erledigt |
| SFTP-Hostkey | Preview-CI braucht kein dynamisches `ssh-keyscan` mehr | `docker-compose.ci.yml`, `bin/ci` | erledigt |
| CI-Preview-Konfig | `CI_TEST_CASE`, `SMTP_PORT: 1025`, `GITHUB_RUN_ID` und read-only Inline-Konfig sind stabil | App-Repo, Codex-Nachzug | teilweise umgesetzt |
| Python-Testlauf | Python-Unit-Tests laufen über `.venv/bin/python` nur bei explizitem Aufruf mit | `composer.json`, `tests/py` | umgesetzt |
| PHP-Testausgabe | Erwartete Task-Fehlerpfade verschmutzen den erfolgreichen PHPUnit-Lauf nicht mit STDERR-Fehlerzeilen | `tests/php/TaskDeployTest.php`, `composer test:php` | umgesetzt |
| Admin-Auslöser | SFTP-Deploy stößt nach Task-Upload per GET die registrierte Admin-Route an | `src/cli/py/admin/dispatch.py`, `tests/py/test_admin_dispatch.py` | umgesetzt |
| Preview-Mailtrap | Preview-Deployment versendet über Mailtrap mit echten Environment-Werten | ausstehender manueller Preview-Test | offen |
| Nachkorrektur | Abweichungen aus Mailtrap-Test sind im selben Schritt oder Folge-PR behoben | PR / Nachweisnotiz | offen |

## Links

- [Parent J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }})
