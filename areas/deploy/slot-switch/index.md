---
layout: page
title: "Deploy: Slot-Schalter (.htaccess und bootstrap.php)"
permalink: /de/areas/deploy/slot-switch/
---

Der aktive App- und Vendor-Slot wird über zwei Dateien gesteuert, die
der Deploy-Prozess schreibt. Beide haben eine Repo-Seite (Quelle) und
eine Server-Seite (laufendes System). Änderungen auf einer Seite haben
Folgen für die andere.

---

## `.htaccess` — App-Slot-Schalter

**Repo:** `src/Http/Task/Deploy/DeployState.php` → `toHtaccess()`  
**Server:** Webroot-`.htaccess` — Apache leitet alle Anfragen an `app-{a|b}/index.php`  
**Lesen:** `HtaccessSlotFile.read_slot()` in `src/cli/py/deploy/sftp_deploy_state.py`
sucht die Zeile `RewriteRule ^ /app-{a|b}/index.php` per Regex.

Wenn diese Zeile fehlt oder geändert wird, schlägt `DeployState.read()` fehl
und der Deploy erkennt keinen aktiven Slot.

---

## `bootstrap.php` — Vendor-Slot-Injektion

**Repo:** `src/Http/bootstrap.php` enthält die Zeile:

```php
require $vendorDir . '/autoload.php';
```

Diese Zeile wird im Staging durch den Deploy-Prozess ersetzt:

```php
require dirname(__DIR__, 3) . '/vendor-{a|b}/autoload.php';
```

**Inject:** `_inject_vendor_require()` in `scripts/sftp-deploy.py` sucht
die Quellzeile per exaktem String-Vergleich und ersetzt sie.

**Lesen:** `_VENDOR_SLOT_RE` in `src/cli/py/deploy/sftp_deploy_state.py`
liest den Vendor-Slot aus der injizierten Zeile auf dem Server per Regex.

---

## Abhängigkeitstabelle

| Änderung | Folge |
|---|---|
| Quellzeile in `bootstrap.php` ändern | `_inject_vendor_require()` findet sie nicht mehr → RuntimeError |
| Format der injizierten Zeile ändern | `_VENDOR_SLOT_RE` trifft nicht mehr → `DeployState.read()` gibt `None` |
| `toHtaccess()`-Format ändern | `HtaccessSlotFile.read_slot()` trifft nicht mehr → ValueError |

Die Tests in `tests/py/test_sftp_deploy_state.py` (`BootstrapInjectTest`)
sichern diese Abhängigkeiten ab.
