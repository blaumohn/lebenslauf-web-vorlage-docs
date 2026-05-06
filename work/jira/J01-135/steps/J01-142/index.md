---
layout: page
title: "135-2 — Laufzeit-Admin-Betriebe-Gerüst und Zero-Downtime-Deploy-Switch festziehen"
permalink: /de/jira/issues/J01-135/steps/J01-142/
jira_key: J01-142
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Angaben

Ziel: Das generische Gerüst für Laufzeit-Admin-Betriebe festziehen und den
Zero-Downtime-Deploy-Switch als erste konkrete Admin-Aufgabe darüber ausführen.

J01-142 liefert zwei Ergebnisse:

- Ein generisches Laufzeit-Admin-Betriebe-Gerüst mit Task-Datei,
  Handler-Schnittstelle, Runner/Dispatch und Runtime-Kontext.
- Den konkreten `deploy_switch` als Admin-Aufgabe, die den vorbereiteten
  Deploy-State lokal, gelockt und atomar sichtbar schaltet.

Der in
[J01-138]({{ "/de/jira/issues/J01-135/steps/J01-138/" | relative_url }})
geplante Auslöseweg ist hier mit umgesetzt. J01-138 beschreibt deshalb nur
noch die fachliche Abschlusszuordnung; die technischen Details und Nachweise
bleiben auf dieser Seite.

- `deploy_fresh` bleibt der administrative Neuaufbau ohne geschützten
  aktiven Runtime-Zustand.
- `deploy_swap` lädt App- und Vendor-Slot hoch, migriert Tokens und schreibt
  eine eindeutig benannte Prepared-State-Datei.
- SFTP schreibt bei `deploy_swap` keine Runtime-Dateien:
  `.htaccess`, `index.php` und `.deploy-state.ini` bleiben unangetastet.
- Die Admin-Aufgabe referenziert die Prepared-Datei eindeutig.
- Der spätere PHP-Betrieb schaltet unter Lock über temporäre Dateien und
  `rename()` auf `.deploy-state.ini` sichtbar um.

Erfolgskriterium: Das Admin-Gerüst ist vom konkreten `deploy_switch` getrennt,
und der Schnitt zwischen SFTP-Vorbereitung und PHP-Runtime-Umschaltung ist so
beschrieben, dass jeder Zwischenzustand lauffähig bleibt und die sichtbare
Umschaltung an genau einer atomaren Dateioperation hängt.

## Geplanter Schnitt

```text
deploy_fresh:
  Neuaufbau. Kein aktiver Runtime-Zustand muss geschützt werden.

deploy_swap:
  Laufende Site bleibt aktiv. SFTP bereitet nur vor; PHP schaltet atomar um.
```

Der normale CI/CD-Pfad entscheidet automatisch anhand des aktiven
Deploy-State, ob `deploy_fresh` oder `deploy_swap` gilt. Der Admin-Workflow
kann `deploy_fresh` weiterhin erzwingen, wenn der Serverzustand bewusst neu
aufgebaut wird.

## Nachtrag 2026-05-06: Umsetzung im App-Repo

Der Schnitt ist im App-Code angelegt. Das Admin-Gerüst nimmt wartende Aufgaben
aus dem Runtime-Bereich auf und dispatcht sie an konkrete Handler.
`deploy_swap` bereitet den neuen Zielzustand vor, ohne die sichtbare
Runtime-Datei direkt zu ersetzen:

- `scripts/sftp-deploy.py` lädt den neuen App-/Vendor-Slot hoch und migriert
  Tokens aus dem aktiven Baum.
- `PreparedDeployStore` schreibt eine vorbereitete INI-Datei unter
  `var/admin/deploy-prepared/`.
- `AdminTaskStore` legt eine `deploy_switch`-Aufgabe unter
  `var/admin/tasks/` an und referenziert diese vorbereitete Datei.
- `AdminTaskRunner` liest wartende Aufgaben serverseitig und gibt sie an den
  passenden Handler weiter.
- `DeploySwitchTaskHandler` lädt `PreparedDeployState` und ruft
  `DeploySwitcher` auf.
- `DeploySwitcher` schreibt `.deploy-state.ini` über `RuntimeAtomicWriter`
  unter `RuntimeLockRunner`.

Nachweise im App-Repo:

- `src/Http/Admin/AdminTaskRunner.php`
- `src/Http/Admin/Deploy/DeploySwitchTaskHandler.php`
- `src/Http/Admin/Deploy/DeploySwitcher.php`
- `src/Http/Admin/Deploy/PreparedDeployState.php`
- `scripts/sftp_deploy_prepared.py`
- `tests/php/AdminDeployTest.php`
- `tests/py/test_sftp_deploy_prepared.py`

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Admin-Gerüst | Task-Datei, Handler-Schnittstelle, Runner/Dispatch und Runtime-Kontext sind getrennt vom konkreten Deploy-Handler angelegt | `AdminTaskStore`, `AdminTaskRunner`, `DeploySwitchTaskHandler` | umgesetzt |
| Fresh-Abgrenzung | `deploy_fresh` ist als administrativer Neuaufbau ohne Zero-Downtime-Swap beschrieben | `scripts/sftp-deploy.py` | umgesetzt |
| Swap-Vorbereitung | `deploy_swap` schreibt nur Slots, Tokens, Prepared-State und Admin-Aufgabe | `scripts/sftp-deploy.py`, `scripts/sftp_deploy_prepared.py` | umgesetzt |
| Prepared-State | Prepared-Dateien haben eindeutige Namen und werden von Admin-Aufgaben referenziert | `PreparedDeployStore`, `AdminTaskStore`, `PreparedDeployState` | umgesetzt |
| Atomarer PHP-Betrieb | PHP setzt den sichtbaren Umschaltpunkt per Lock und `rename()` auf `.deploy-state.ini` | `DeploySwitcher`, `RuntimeAtomicWriter`, `RuntimeLockRunner`, `AdminDeployTest` | umgesetzt |
| Laufzeit-Sicherheit | Alter Zustand bleibt bis zum State-Wechsel funktionsfähig; neuer Zustand danach ebenfalls | SFTP schreibt bei `deploy_swap` keinen Runtime-State; Switch erfolgt erst im Admin-Task | umgesetzt |
| Remote-Link | Jira verweist auf die öffentliche Arbeitsdoku | Jira Remote-Link | erledigt |

## Links

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }})
