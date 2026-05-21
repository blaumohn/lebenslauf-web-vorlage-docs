---
layout: page
title: "J01-147 — Deploy-Contract: Zustandsmaschine"
permalink: /de/jira/issues/J01-147/
jira_key: J01-147
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonische Spec der Deploy-Zustandsmaschine für `lebenslauf-web-vorlage`.
Sie ist die gemeinsame Sprache für Doku, Tests und Code.

---

## Ergebnistypen

Jeder Deploy-Lauf endet in genau einem dieser Zustände:

| Zustand | Bedeutung |
|---|---|
| `deploy_success` | Neuer Deploy validiert und aktiv |
| `no_change` | Alter Deploy bleibt aktiv (kein Lauf nötig gewesen) |
| `rollback_success` | Smoke fehlgeschlagen, letzter gültiger Deploy wiederhergestellt |
| `failed_safe` | Lauf abgebrochen, aktiver Deploy unberührt |
| `manual_intervention_required` | Unvereinbarer Zustand erkannt, keine Schreibvorgänge |

---

## Invarianten

| Name | Aussage |
|---|---|
| `active_slots_never_overwritten` | Ein aktiver App- oder Vendor-Slot wird nie beschrieben oder gelöscht |
| `switch_only_to_valid_target` | `.deploy-state.ini` zeigt nur auf Slots, deren Sentinels vollständig sind |
| `failed_run_keeps_previous_live` | Ein fehlgeschlagener Lauf beschädigt den vorherigen aktiven Deploy nicht |
| `partial_target_is_never_valid` | Ein Slot ohne vollständigen Sentinel gilt nicht als deploybar |
| `next_run_can_recover` | Ein Folgelauf kann erlaubte Restzustände bereinigen oder sauber abbrechen |
| `manual_conflicts_are_reported` | Unvereinbare Zustände werden gemeldet, nicht automatisch repariert |
| `post_switch_smoke_required` | Der Deploy gilt erst nach erfolgreichem Smoke als verifiziert |
| `rollback_preserves_last_good` | Der letzte bekannte gültige Deploy bleibt rollbackfähig |

---

## Phasenmodell

```
STARTED
  └─ STATE_LOADED
       └─ TARGET_SELECTED
            └─ TARGET_PREPARED
                 └─ APP_UPLOADED
                      └─ VENDOR_READY
                           └─ TOKENS_MIGRATED
                                └─ SWITCHED
                                     ├─ VERIFIED          (Smoke ok)
                                     └─ ROLLED_BACK       (Smoke fehlgeschlagen)
  ├─ FAILED_SAFE                     (aktiver Slot intakt)
  └─ MANUAL_INTERVENTION_REQUIRED    (Konflikt erkannt)
```

---

## Sentinels und Marker

| Datei | Slot | Bedeutung |
|---|---|---|
| `app-{x}/.deploy-run` | App | Slot vollständig geschrieben; Inhalt = Run-ID |
| `vendor-{x}/.meta` | Vendor | Slot vollständig geschrieben; enthält Composer-Checksum |
| `.deploy-state.ini` | Remote-Root | Aktiver Zustand: App-Slot, Vendor-Slot, Run-ID, Checksum |
| `.deploy-history.log` | Remote-Root | Append-only: ein Eintrag pro terminalem Zustand |

Ein App-Slot gilt als **vollständig**, wenn `.deploy-run` vorhanden ist.
Ein Vendor-Slot gilt als **vollständig**, wenn `.meta` vorhanden ist.
Fehlt der jeweilige Sentinel, ist der Slot **unvollständig** und darf nicht
geswitcht werden.

---

## Rollback-Einheit

Das Rollback-Ziel ist der `SlotState`, der zu Laufbeginn aus
`.deploy-state.ini` gelesen wurde. Er wird im Prozessspeicher gehalten.

Rollback = diesen State zurück in `.deploy-state.ini` schreiben.

**Einschränkung:** Kein prozessübergreifender Rollback-Cursor.
Ein zweiter Lauf kann den Vorzustand des ersten nicht wiederherstellen,
wenn der erste Lauf bereits `.deploy-state.ini` überschrieben hat.

---

## Post-Switch-Smoke

Smoke = HTTP GET auf `APP_ROOT_URL`, Erwartung: HTTP 200.

Der Smoke läuft **innerhalb des Deploy-Laufs**, nach dem Switch.
Schlägt er fehl, wird sofort Rollback eingeleitet.

Die separate `sftp-verify-deploy.py`-Prüfung (Run-ID + Checksum per SFTP)
ist ein **CI-Integritätsschritt** nach dem Deploy — sie ist kein Bestandteil
des Smoke im Sinne dieses Contracts.

---

## History-Log

Format einer Zeile (Append, kein Parsen im normalen Betrieb):

```
<iso8601>  <run_id>  <ergebnis>  app=<slot>  vendor=<slot>
```

Beispiel:

```
2026-05-22T14:03Z  run-101  verified          app=b  vendor=b
2026-05-22T14:11Z  run-102  rolled_back       app=a  vendor=a
2026-05-22T14:20Z  run-103  failed_safe       app=a  vendor=a
2026-05-22T14:25Z  run-104  manual_required   app=?  vendor=?
```

Jeder terminale Zustand (`VERIFIED`, `ROLLED_BACK`, `FAILED_SAFE`,
`MANUAL_INTERVENTION_REQUIRED`) schreibt genau eine Zeile.

---

## Recovery-Szenarien

### Szenario 1: App-Upload schlägt fehl, Folgelauf erholt sich

```yaml
start:
  active_app: app-a
  active_vendor: vendor-a
run_1:
  fail_at: app_upload
expect_after_run_1:
  result: failed_safe
  active_app: app-a
  target_app_sentinel: absent
run_2:
  fail_at: none
expect_after_run_2:
  result: deploy_success
  active_app: app-b
  target_cleaned_before_upload: true
  post_switch_smoke: ok
```

### Szenario 2: Switch erfolgreich, Smoke fehlgeschlagen → Rollback

```yaml
previous_state:
  app: app-a
  vendor: vendor-a
  run_id: run-100
target_state:
  app: app-b
  vendor: vendor-b
  run_id: run-101
run:
  switch: success
  post_switch_smoke: fail
expect:
  result: rollback_success
  active_app: app-a
  active_vendor: vendor-a
  history_entry: rolled_back
```

### Szenario 3: State fehlt, beide Slots vorhanden → manueller Eingriff

```yaml
start:
  deploy_state: absent
  app_a_exists: true
  app_b_exists: true
expect:
  result: manual_intervention_required
  writes_allowed: false
  message:
    reason: ".deploy-state.ini fehlt, aber beide App-Slots vorhanden"
    options:
      - "Webroot-Symlink oder aktiven Slot manuell bestimmen"
      - "State manuell nach .deploy-state.ini schreiben"
      - "Einen Slot löschen und Fresh-Deploy freigeben"
```

---

## Außerhalb Schritt 1

Folgende Punkte sind bewusst ausgeklammert und für spätere Schritte
vorgesehen:

| Thema | Begründung |
|---|---|
| Lock/CAS für parallele Läufe | Kein akutes Risiko im CI-Einzellauf |
| Hypothesis RuleBasedStateMachine | Setzt stabile Tests aus Schritt 3 voraus |
| Persistenter Rollback-Cursor | Prozessübergreifender Rollback-Bedarf nicht belegt |

---

## Überprüfung

| Prüfpunkt | Erwartung | Status |
|---|---|---|
| Alle Invarianten benannt | 8 Invarianten dokumentiert | erledigt |
| Sentinels definiert | `.deploy-run` und `.meta` als Vollständigkeits-Marker | erledigt |
| Rollback-Einheit klar | In-memory SlotState, Einschränkung dokumentiert | erledigt |
| Smoke-Definition klar | HTTP GET `APP_ROOT_URL` = 200 | erledigt |
| History-Log-Format festgelegt | Append-only, eine Zeile pro terminalem Zustand | erledigt |
| Recovery-Szenarien als Testbasis | 3 YAML-Szenarien | erledigt |

---

## Links

- [J01-62 — Production: Branch- und Environment-Regeln]({{ "/de/jira/issues/J01-62/" | relative_url }})
- [J01-7 — Production Deployment Epic]({{ "/de/jira/issues/J01-7/" | relative_url }})
