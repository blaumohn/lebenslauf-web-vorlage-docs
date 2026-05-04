---
layout: page
title: "135-5 — Zero-Downtime-Deploy-Umschaltung als Admin-Betrieb festziehen"
permalink: /de/jira/issues/J01-135/steps/J01-142/
jira_key: J01-142
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Angaben

Ziel: Den Deploy-Umschaltpunkt so planen, dass normale SFTP-Deploys eine
laufende Site nur vorbereiten und die sichtbare Umschaltung später als
PHP-Admin-Betrieb lokal, gelockt und atomar erfolgt.

- `deploy_fresh` bleibt der administrative Neuaufbau ohne geschützten
  aktiven Runtime-Zustand.
- `deploy_swap` lädt App- und Vendor-Slot hoch, migriert Tokens und schreibt
  eine eindeutig benannte Prepared-State-Datei.
- SFTP schreibt bei `deploy_swap` keine Runtime-Dateien:
  `.htaccess`, `index.php` und `.deploy-state.ini` bleiben unangetastet.
- Die Admin-Aufgabe referenziert die Prepared-Datei eindeutig.
- Der spätere PHP-Betrieb schaltet unter Lock über temporäre Dateien und
  `rename()` auf `.deploy-state.ini` sichtbar um.

Erfolgskriterium: Der Schnitt zwischen SFTP-Vorbereitung und
PHP-Runtime-Umschaltung ist so beschrieben, dass jeder Zwischenzustand
lauffähig bleibt und die sichtbare Umschaltung an genau einer atomaren
Dateioperation hängt.

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

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Fresh-Abgrenzung | `deploy_fresh` ist als administrativer Neuaufbau ohne Zero-Downtime-Swap beschrieben | Entwurf oder Implementierung | offen |
| Swap-Vorbereitung | `deploy_swap` schreibt nur Slots, Tokens, Prepared-State und Admin-Aufgabe | Entwurf oder Implementierung | offen |
| Prepared-State | Prepared-Dateien haben eindeutige Namen und werden von Admin-Aufgaben referenziert | Code oder Spec | offen |
| Atomarer PHP-Betrieb | PHP setzt den sichtbaren Umschaltpunkt per Lock und `rename()` auf `.deploy-state.ini` | Codepfad / Test | offen |
| Laufzeit-Sicherheit | Alter Zustand bleibt bis zum State-Wechsel funktionsfähig; neuer Zustand danach ebenfalls | Review / Test | offen |
| Remote-Link | Jira verweist auf die öffentliche Arbeitsdoku | Jira Remote-Link | erledigt |

## Links

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }})
