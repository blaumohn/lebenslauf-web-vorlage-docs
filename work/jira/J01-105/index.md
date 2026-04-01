---
layout: page
title: "J01-105: Pipeline-Spec: Manifest vereinfachen für klaren Parameter-Ablauf"
jira_key: J01-105
permalink: /de/jira/issues/J01-105/
---

**Stand:** 2026-04-01

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für den Jira-Task `J01-105`.
Das Ziel ist, die `required`/`allowed`-Trennung im pipeline-config-Manifest
durch eine direkte Parameter-Liste je Pipeline/Phase zu ersetzen, so dass
Phasengrenzen eindeutig und prüfbar sind.

## Ziel

- `required` und `allowed` fallen zusammen: die Phasenlogik wird als
  Mischung aus `pipelines.global`, `pipelines.common.<phase>` und
  `pipelines.<pipeline>.<phase>` beschrieben und zu konkreten
  Parametersätzen expandiert.
- Code-Defaults (`get('KEY', 'default')`) werden entfernt, damit der
  Parameter-Vektor-Ansatz echte Testergebnisse liefert.
- `variables` bleibt der Parameterkatalog im App-Repo; `context` wird als
  Bereich `pipeline_phase` geführt.
- Die pipeline-spec-lib liest Bereichs- und Teilbereichs-Referenzen, expandiert
  sie und validiert dabei die Disjunktheit zwischen `global`, `common` und
  konkreter Pipeline.
- Tests werden nachgezogen; das Manifest gilt danach als saubere
  Phasengrenzen-Spezifikation.

## Aktueller Stand

- Konzept ausgearbeitet und öffentliche Arbeitsdoku auf den
  beschlossenen Entwurf nachgezogen (2026-03-20).
- Verwandt mit J01-28 (breiter Analyserahmen); kein gegenseitiger Blocker.
- J01-37 bleibt ein angrenzender Folgepunkt, ist aber nicht Teil dieses
  Doku-Nachzugs.
- Manifest, Config-YAMLs und PHP-Nutzung sind im Arbeitsbranch auf das
  Gruppen-Schema und den klaren SMTP-Absenderpfad umgestellt (2026-04-01).

## Geplantes Zielmodell

- Eine Manifest-Datei im App-Repo bleibt bestehen.
- `variables` definiert nur Parameter, Gruppen, `sources` und `meta`.
- Jeder Variablenschlüssel erhält ein `meta`-Objekt.
- `pipelines.global` gilt für alle Pipelines und Phasen.
- `pipelines.common.<phase>` enthält die phasenweite Schnittmenge.
- `pipelines.<pipeline>.<phase>` ergänzt nur die echte Pipeline-Differenz.
- Phasenlisten dürfen ganze Bereiche oder Teilbereiche referenzieren.
- Nach der Expansion darf es keine Schnittmenge zwischen `global`, `common`
  und konkreter Pipeline geben.

## Herleitung des dünnen Manifests

Die Herleitung wird als geglätteter Fachgang im Vorgang selbst festgehalten:

1. Quellanalyse: pro Phase wird aus dem Code abgeleitet, welche Parameter
   tatsächlich gelesen werden.
2. P_0: aus dieser Quellanalyse entsteht eine erste vollständige
   Phasenmenge.
3. Defaults zuerst entfernen: stille Code-Defaults verfälschen sonst die
   spätere Ausdünnung.
4. Tests stabilisieren: fehlende und fremde Parameter müssen sichtbar
   fehlschlagen.
5. Manifest ausdünnen: aus P_0 wird der dünne Zielvertrag der Phase.

Bestätigte Befunde aus der Quellanalyse:

- `setup`: `LEBENSLAUF_PUBLIC_PROFILE` ist nur für
  `--reset-sample-content` relevant.
- `build`: nutzt `LEBENSLAUF_DATEN_PFAD`,
  `LEBENSLAUF_YAML_PFAD`, `LEBENSLAUF_JSON_PFAD`,
  `LEBENSLAUF_PUBLIC_PROFILE`, `LEBENSLAUF_LANG_DEFAULT`,
  `LEBENSLAUF_LANGS` und den Build-seitigen `APP_BASE_PATH`.
- `runtime`: nutzt `APP_BASE_PATH`, `TRUST_PROXY`,
  `CAPTCHA_TTL_SECONDS`, `CAPTCHA_MAX_GET`,
  `CONTACT_MAX_POST`, `CONTACT_TO_EMAIL`,
  `RATE_LIMIT_WINDOW_SECONDS`, `MAIL_STDOUT`, `SMTP_*`,
  `LEBENSLAUF_LANG_DEFAULT` und `LEBENSLAUF_LANGS`.
- `python`: nutzt `PYTHON_CMD` und optional `PYTHON_PATHS`.
- `deploy`: nutzt nur die Deploy-Parameter `FTP_*`.

Daraus folgt der Kernbefund des Vorgangs:
`LEBENSLAUF_PUBLIC_PROFILE` gehört in `setup` und `build`, aber nicht in
`runtime`.

## Nicht-Scope dieses Doku-Nachzugs

- keine Umsetzung der Manifest- oder Lib-Änderungen in den Quell-Repos
- keine Umsetzung von J01-37
- keine technische Testaussage, dass der neue Entwurf bereits produktiv ist

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Herleitung dokumentiert | Quellanalyse, P_0 und Ausdünnungsweg sind im Vorgang nachvollziehbar | Jira-Doku DE/EN | erledigt |
| Zielmodell dokumentiert | `variables`, `pipelines.global`, `common` und Pipeline-Differenz sind beschrieben | Jira-Doku DE/EN | erledigt |
| `pipeline_phase` benannt | früherer Bereich `context` wird als `pipeline_phase` festgehalten | Jira-Doku DE/EN | erledigt |
| Bereichs-Syntax erklärt | ganze Bereiche und Teilbereiche sind als geplante Syntax beschrieben | Jira-Doku DE/EN | erledigt |
| Disjunktheitsregel erklärt | keine Schnittmenge zwischen `global`, `common` und konkreter Pipeline | Jira-Doku DE/EN | erledigt |
| Code-Defaults entfernt | Kein `get('KEY', 'default')` mehr im Quellcode | Quellanalyse Quell-Repos | offen |
| `LEBENSLAUF_PUBLIC_PROFILE` korrigiert | Nur noch in `build`, nicht in `preview.runtime` | config.manifest.yaml | offen |
| Manifest vereinfacht | Zielmodell in den Quell-Repos umgesetzt | config.manifest.yaml | teilweise erledigt |
| SMTP-Absender bereinigt | Absender läuft nur noch über `SMTP_FROM_EMAIL` und `SMTP_FROM_NAME`; `CONTACT_TO_EMAIL` bleibt separat | config.manifest.yaml, MailService.php | erledigt |
| pipeline-spec-lib angepasst | Expander und Validierung des Zielmodells sind umgesetzt | pipeline-config-spec-php | offen |
| Tests grün | Parameter-Vektor-Ansatz P_0 → P_n liefert echte Ergebnisse | Test-Lauf | offen |
| Kein Blocker mehr für J01-9 | J01-105 als erledigt, J01-9 entsperrt | Jira | offen |

## Lib-Repo-Änderungen und lokales Testen

Die Anpassungen an der pipeline-spec-lib erfolgen im Lib-Repo
(`pipeline-config-spec-php`).
Um die lokale Lib-Fassung zusammen mit dem Hauptrepo zu testen, wird das
Skript

```
lebenslauf-web-vorlage/.local/bin/set-config-spec-repo
```

verwendet. Es liest und schreibt eine JSON-Datei, über die der Hauptrepo auf
die lokale Lib-Version zeigt statt auf die installierte Composer-Version.

| Schritt | Befehl / Ort |
| --- | --- |
| Lokale Lib eintragen | `.local/bin/set-config-spec-repo` mit lokalem Pfad |
| Testen | Tests im Hauptrepo laufen gegen lokale Lib |
| Rücksetzen | `.local/bin/set-config-spec-repo` ohne Argument oder auf Published-Version |

## Offene Punkte

- J01-28: verwandter Vorgang (breiter Analyserahmen, kein Blocker).
- Die beschriebene Zielstruktur ist dokumentiert, aber noch nicht in den
  Quell-Repos umgesetzt.
- J01-37 bleibt ein getrennter Folgepunkt für konditionelles required.

## Links

- [J01-9: Preview — Workflow wieder aktivieren]({{ "/de/jira/issues/J01-9/" | relative_url }})
- [J01-28: Analyse: Risikomuster und Befundliste]({{ "/de/jira/issues/J01-28/" | relative_url }})
- [J01-31: Preview Readiness — System-Source-Verarbeitung]({{ "/de/jira/issues/J01-31/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
