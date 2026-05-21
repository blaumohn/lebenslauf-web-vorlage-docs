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

## Nachtrag 2026-05-16: Kontakt-Smoke gegen deployte Preview

Der bisherige Kontakt-Smoke startete im Post-Deploy-Check einen lokalen
PHP-Server und verwendete `127.0.0.1`. Damit war der Formularpfad zwar lokal
prüfbar, aber nicht als Nachweis für den deployten Preview-Webcontainer
geeignet.

- `run_contact_smoke` nutzt nun
  `cli python "$PIPELINE" --phase deploy --phase runtime tests/ci/contact_smoke.py`.
- Der Python-Smoke ruft das Kontaktformular über `APP_ROOT_URL` aus der
  Deploy-Phase auf.
- Die Captcha-Lösung wird per `SftpClient` aus dem deployten
  `<aktiver-app-slot>/var/tmp/captcha/<captcha_id>.json` gelesen, nicht aus
  dem lokalen Build-Artefakt.
- Der erwartete Empfänger kommt aus der Runtime-Phase über `PipelineCfg`.
- Der Preview-Webcontainer bindet die CI-Mailpit-CA ein und aktualisiert beim
  Start die CA-Zertifikate, damit der reale App-Mailversand denselben
  StartTLS-Pfad prüfen kann wie der direkte SMTP-Smoke.
- Der Post-Deploy-Check prüft damit Webcontainer, deployten Runtime-State,
  SFTP-Zugriff und Mailpit-Nachweis im selben Preview-Integrationspfad.

## Nachtrag 2026-05-17: HTTP-Smoke protokolliert fehlgeschlagene URL

Beim `test-push-deploy`-Nachweis brach der Post-Deploy-HTTP-Smoke mit einem
`curl`-Fehler 500 ab, ohne im CI-Log die betroffene URL sichtbar zu machen.
Der Shell-Smoke fängt fehlgeschlagene `curl`-Abrufe nun explizit ab und schreibt
die geprüfte URL mit `[smoke] HTTP-Abruf fehlgeschlagen: ...` nach STDERR.
Damit bleibt die ursprüngliche `curl`-Fehlerausgabe erhalten, erhält aber den
für die Fehleranalyse nötigen Zielkontext.

## Nachtrag 2026-05-18: Deploy-Switch und Webroot-Schutz abgesichert

Der nachgelagerte Befund lag nicht im Upload der Testdatei selbst: Der neue
App-Slot enthielt `public/ci-diff-test.html`, aber der sichtbare
Deploy-State blieb auf dem alten Slot stehen. Ursache war der
Deploy-Switch-Vertrag für App-Slot-Marker. App-Marker liegen unter
`app-<slot>/.deploy-run`, Vendor-Marker unter `vendor-<slot>/.deploy-run`.
Der Handler prüft fehlende Marker nun explizit und ohne PHP-Warning.

Zusätzlich sichern Python-Tests die Shared-Hosting-Grenze des neuen Webroots:
Der Webroot-Router liefert statische Dateien nur aus dem aktiven
`app-<slot>/public/` aus. Die nicht öffentlichen App-Slot-Pfade
`app-<slot>/`, `app-<slot>/src/` und `app-<slot>/var/` behalten
`Require all denied`.

## Nachtrag 2026-05-20: SFTP-REPL transparenter gemacht

Die lokale SFTP-REPL ersetzt den separaten lokalen Löschhelfer
`scripts/local/sftp-clear-dir.py` durch einen interaktiven `clear`-Befehl.
`rmdir` folgt nun der SFTP-/POSIX-Bedeutung und entfernt nur leere
Verzeichnisse.

Zusätzlich zeigt die REPL bei nichttrivialen Operationen kurz, welche
SFTP-Operation verwendet wurde:

- `clear <pfad>` leert ein Remote-Verzeichnis rekursiv, ohne es selbst zu
  löschen.
- `rename <alt> <neu>` versucht zuerst `sftp.posix_rename`, danach
  `sftp.rename` und fällt nur für reguläre Dateien auf Lesen/Schreiben/Löschen
  zurück.
- `mkdirp`, `stat`, `df`, `status` und `version` ergänzen die lokale Diagnose
  und Dateiarbeit.
- Nicht unterstützte Server-Erweiterungen wie `statvfs` werden sichtbar
  gemeldet, statt still zu verschwinden.

## Nachtrag 2026-05-21: Vendor-Wiederverwendung formalisiert

Der Vendor-Upload entscheidet nicht mehr über eine Checksumme der generierten
`vendor/composer`-Dateien. Stattdessen ist der Vergleichszustand formal der im
letzten Deploy-State gespeicherte `deploy_commit`; der aktive
`vendor-<slot>/.meta`-Sentinel enthält denselben Commit.

- `composer.lock` wird nicht geparst, sondern per
  `git diff --quiet <deploy_commit> HEAD -- composer.lock` verglichen.
- `composer.json` wird für den alten Stand per
  `git show <deploy_commit>:composer.json` gelesen; verglichen werden nur
  `autoload`, `scripts.install:ci` und `scripts.install:deploy`.
- Wenn `deploy_commit` fehlt, lokal nicht auflösbar ist oder nicht zum
  Vendor-Sentinel passt, wird `vendor/` konservativ neu hochgeladen oder der
  Switch fällt auf den sicheren Pfad zurück.
- `install:ci` und `install:deploy` kapseln die Composer-Installationsargumente;
  irrelevante `composer.json`-Änderungen lösen keinen Vendor-Upload mehr aus.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| CI-Smoke | `composer run ci:preview` läuft mit SFTP-, HTTP-, SMTP- und Kontakt-Smokes durch | App-Repo, PR zu `J01-144` | erledigt |
| SMTP-Auth | Falsches SMTP-Passwort wird im CI-Smoke abgelehnt, richtiges Passwort sendet Testmail | `tests/ci/smtp-smoke.py` | erledigt |
| SFTP-Hostkey | Preview-CI braucht kein dynamisches `ssh-keyscan` mehr | `docker-compose.ci.yml`, `bin/ci` | erledigt |
| CI-Preview-Konfig | `CI_TEST_CASE`, `SMTP_PORT: 1025`, `GITHUB_RUN_ID` und read-only Inline-Konfig sind stabil | App-Repo, Codex-Nachzug | teilweise umgesetzt |
| Python-Testlauf | Python-Unit-Tests laufen über `.venv/bin/python` nur bei explizitem Aufruf mit | `composer.json`, `tests/py` | umgesetzt |
| PHP-Testausgabe | Erwartete Task-Fehlerpfade verschmutzen den erfolgreichen PHPUnit-Lauf nicht mit STDERR-Fehlerzeilen | `tests/php/TaskDeployTest.php`, `composer test:php` | umgesetzt |
| Kontakt-Smoke | Post-Deploy-Kontaktformular läuft über `APP_ROOT_URL` und liest Captcha-State per SFTP aus der deployten Preview | `tests/ci/contact_smoke.py`, `bin/ci`, `tests/py/test_contact_smoke.py` | umgesetzt |
| Admin-Auslöser | SFTP-Deploy stößt nach Task-Upload per GET die registrierte Admin-Route an | `src/cli/py/admin/dispatch.py`, `tests/py/test_admin_dispatch.py` | umgesetzt |
| HTTP-Smoke-Fehlerkontext | `curl`-Fehler nennen im CI-Log die geprüfte URL | `scripts/pipeline_lib.sh`, `tests/py/test_ci_workflows.py` | umgesetzt |
| Deploy-Switch-Marker | `deploy_switch` prüft App- und Vendor-Slot-Marker über die deployten Slot-Verzeichnisse und schreibt `.deploy-state.ini` | `DeploySwitchTaskHandler.php`, `TaskDeployTest.php` | umgesetzt |
| Webroot-Schutz | Nur `app-<slot>/public/` wird über den Router ausgeliefert; `src/` und `var/` bleiben gesperrt | `src/resources/deploy-root/`, `tests/py/test_sftp_deploy_state.py` | umgesetzt |
| SFTP-REPL | Lokale SFTP-Befehle melden verwendete Operationen und ersetzen `sftp-clear-dir.py` | `src/cli/py/deploy/sftp_shell.py`, `tests/py/test_sftp_shell.py` | umgesetzt |
| Vendor-Wiederverwendung | Vendor-Upload prüft `composer.lock` per `git diff` und `composer.json` per `git show` nur für `autoload`, `install:ci` und `install:deploy`; `vendor-<slot>/.meta` enthält denselben `deploy_commit` | `scripts/sftp-deploy.py`, `tests/py/test_sftp_deploy.py` | umgesetzt |
| Preview-Mailtrap | Preview-Deployment versendet über Mailtrap mit echten Environment-Werten | ausstehender manueller Preview-Test | offen |
| Nachkorrektur | Abweichungen aus Mailtrap-Test sind im selben Schritt oder Folge-PR behoben | PR / Nachweisnotiz | offen |

## Links

- [Parent J01-62]({{ "/de/jira/issues/J01-62/" | relative_url }})
