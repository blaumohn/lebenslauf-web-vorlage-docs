---
layout: page
title: "J01-105: Pipeline-Spec: Manifest vereinfachen für klaren Parameter-Ablauf"
jira_key: J01-105
permalink: /de/jira/issues/J01-105/
---

**Stand:** 2026-04-03

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
- `variables` bleibt der Parameterkatalog im App-Repo; `PIPELINE` und
  `PHASE` werden nicht mehr als Manifest-Bereich im App-Repo geführt,
  sondern lib-intern ergänzt.
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
- Der Hauptrepo-Teil wurde auf `feature/j01-9-preview` neu aufgesetzt, weil
  der frühere J01-105-App-Branch auf der falschen Upstream-Basis lag.
- Manifest, Config-YAMLs und PHP-Nutzung sind im Arbeitsbranch auf das
  Gruppen-Schema, direkte Phasenlisten und den klaren SMTP-Absenderpfad
  umgestellt (2026-04-01).
- Das Vorhaben ist jetzt in vier echte Jira-Untervorgänge mit eigener
  öffentlicher Schrittseite geschnitten; temporäre Planungsnotizen unter
  `var/tmp` sind damit ersetzt.
- `PIPELINE` und `PHASE` werden im Zielstand lib-intern behandelt; ein
  App-Bereich `pipeline_phase` gehört nicht mehr zum Manifest.
- Die Lib-README wird im selben Vorgang auf das echte Gruppen-Schema
  nachgezogen; das frühere `required`/`allowed`-Beispiel ist veraltet.

## Vorhaben als Schritte

- [105-1 Setup-Seed-Pfad fachlich bereinigen]({{
  "/de/jira/issues/J01-105/steps/J01-122/" | relative_url }}) bündelt die
  Entkopplung des Sample-Seed-Pfads von `LEBENSLAUF_PUBLIC_PROFILE`.
- [105-2 Vollständige P_0-zu-P_n-Herleitung und Manifest-Ausdünnung]({{
  "/de/jira/issues/J01-105/steps/J01-125/" | relative_url }}) führt den
  eigentlichen Reduktionsgang über alle App-Parameter.
- [105-3 pipeline-spec-lib und README auf Zielmodell nachziehen]({{
  "/de/jira/issues/J01-105/steps/J01-123/" | relative_url }}) hält den
  Lib-Schnitt für Expander, Disjunktheitsprüfung und Doku fest.
- [105-4 Prüfläufe, Entblockung J01-9 und Abschlussbild nachweisen]({{
  "/de/jira/issues/J01-105/steps/J01-124/" | relative_url }}) bündelt die
  Abschlussprüfung über Repo-Grenzen hinweg.

## Geplantes Zielmodell

- Eine Manifest-Datei im App-Repo bleibt bestehen.
- `variables` definiert nur Parametergruppen, `sources` und `meta`.
- Jeder Variablenschlüssel erhält ein `meta`-Objekt.
- `pipelines.common.<phase>` enthält die phasenweite Schnittmenge.
- `pipelines.<pipeline>.<phase>` ergänzt nur die echte Pipeline-Differenz.
- Phasenlisten dürfen ganze Bereiche oder Teilbereiche referenzieren.
- Nach der Expansion darf es keine Schnittmenge zwischen `common`
  und konkreter Pipeline geben.
- `PIPELINE` und `PHASE` werden beim Kompilieren lib-intern ergänzt und
  tauchen deshalb nicht mehr im App-Manifest auf.

## Herleitung des dünnen Manifests

Die Herleitung wird als geglätteter Fachgang im Vorgang selbst festgehalten.
Sie läuft über `P_0 -> P_1 -> ... -> P_n`, wobei jeder Schritt einen kleinen
Parameterentscheid enthält und geprüft wird.

1. `P_0`: voller aktueller Parametersatz des Arbeitsbranches.
2. Modellfehler zuerst korrigieren: stille Defaults oder falsche
   Kopplungen werden vor der Reduktion bereinigt.
3. Pro Schritt `P_i -> P_{i+1}` wird genau ein kleiner Befund bestätigt:
   ein Parameter entfällt, bleibt oder bleibt vorläufig wegen eines
   Alternativfalls.
4. Jeder Schritt braucht Quelltextbeleg plus Prüflauf.
5. `P_n` ist der bestätigte dünne Vertrag, nicht nur eine Vermutung.

Aktuelles `P_0` des App-Manifests:

- `setup`: `LEBENSLAUF_PUBLIC_PROFILE`
- `python`: `PYTHON_CMD`, `PYTHON_PATHS`
- `build`: `APP_BASE_PATH`, `APP_URL`, `LEBENSLAUF_DATEN_PFAD`,
  `LEBENSLAUF_YAML_PFAD`, `LEBENSLAUF_JSON_PFAD`,
  `LEBENSLAUF_PUBLIC_PROFILE`, `LEBENSLAUF_LANG_DEFAULT`,
  `LEBENSLAUF_LANGS`
- `runtime`: `APP_BASE_PATH`, `TRUST_PROXY`,
  `LEBENSLAUF_LANG_DEFAULT`, `LEBENSLAUF_LANGS`,
  `CAPTCHA_TTL_SECONDS`, `CAPTCHA_MAX_GET`,
  `CONTACT_MAX_POST`, `CONTACT_TO_EMAIL`,
  `RATE_LIMIT_WINDOW_SECONDS`, `MAIL_STDOUT`,
  `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`, `SMTP_PASS`,
  `SMTP_ENCRYPTION`, `SMTP_FROM_EMAIL`, `SMTP_FROM_NAME`
- `deploy`: `FTP_SERVER_DIR`, `FTP_PORT`, `FTP_HOST`, `FTP_USER`, `FTP_PASS`

Bestätigte Befunde aus der Quellanalyse:

- `setup`: Der frühere Seed-Pfad war fälschlich an
  `LEBENSLAUF_PUBLIC_PROFILE` gekoppelt. Der Zielstand nutzt
  `--copy-sample-content` mit fester Fixture
  `src/resources/fixtures/lebenslauf/daten-gueltig.yaml`
  und festem Ziel `daten-sample.yaml`. Danach entfällt
  `LEBENSLAUF_PUBLIC_PROFILE` aus `setup`.
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

Die ersten bestätigten Reduktionsschritte sind:

- `P_0 -> P_1`: `LEBENSLAUF_PUBLIC_PROFILE` entfällt aus `setup`.
- `P_1 -> P_2`: `PYTHON_PATHS` wird gegen den optionalen Codepfad geprüft.
- `P_2 -> P_3`: `APP_URL` wird gegen den Build-Pfad geprüft.

Danach wird der Rest von `P_0` vollständig weiter abgearbeitet, bis jeder
Parameter einen Endstatus hat.

Zusätzlicher Architekturentscheid des Zielstands:
Ein eigener Manifest-Bereich `pipeline_phase` wird nicht mehr geführt.
Die früher im App-Manifest mitgedachten Schlüssel `PIPELINE` und `PHASE`
werden jetzt ausschließlich in der Lib ergänzt.

Die allgemeine Bedeutung von `meta.desc`, `meta.example` und `meta.notes`
steht kanonisch in
[Spec: Pipeline-Spec-System]({{ "/de/specs/systeme/pipeline-spec/" | relative_url }}).

## Nicht-Scope dieses Doku-Nachzugs

- keine Umsetzung von J01-37
- keine technische Testaussage, dass der neue Entwurf bereits produktiv ist

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Herleitung dokumentiert | Quellanalyse, `P_0 -> ... -> P_n` und Ausdünnungsweg sind im Vorgang nachvollziehbar | Jira-Doku DE/EN | in Arbeit |
| Zielmodell dokumentiert | `variables`, `pipelines.global`, `common` und Pipeline-Differenz sind beschrieben | Jira-Doku DE/EN | erledigt |
| lib-interne Pipeline-Phase erklärt | App-Manifest führt keinen Bereich `pipeline_phase`; `PIPELINE` und `PHASE` kommen aus der Lib | Jira-Doku DE/EN | erledigt |
| Bereichs-Syntax erklärt | ganze Bereiche und Teilbereiche sind als geplante Syntax beschrieben | Jira-Doku DE/EN | erledigt |
| Disjunktheitsregel erklärt | keine Schnittmenge zwischen `common` und konkreter Pipeline | Jira-Doku DE/EN | erledigt |
| Code-Defaults entfernt | Kein `get('KEY', 'default')` mehr im Quellcode | Quellanalyse Quell-Repos | offen |
| `LEBENSLAUF_PUBLIC_PROFILE` korrigiert | Nicht mehr in `setup` oder `runtime`, nur noch im Build-Pfad | config.manifest.yaml | offen |
| Lib-README korrigiert | Kein altes `required`/`allowed`-Schema mehr in der Lib-Doku | `pipeline-config-spec-php/README*.md` | offen |
| Manifest vereinfacht | Zielmodell im Hauptrepo-Arbeitsbranch umgesetzt | config.manifest.yaml | erledigt im Arbeitsbranch |
| SMTP-Absender bereinigt | Absender läuft nur noch über `SMTP_FROM_EMAIL` und `SMTP_FROM_NAME`; `CONTACT_TO_EMAIL` bleibt separat | config.manifest.yaml, MailService.php | erledigt |
| pipeline-spec-lib angepasst | Expander und Validierung des Zielmodells sind umgesetzt | pipeline-config-spec-php | erledigt im Arbeitsbranch |
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
- Die allgemeine `meta`-Semantik lebt im Pipeline-Spec-System, nicht nur in
  dieser Vorgangsseite.
- Der neue Hauptrepo-Arbeitsbranch muss noch als PR gegen die J01-9-Basis
  eingereicht werden.
- J01-37 bleibt ein getrennter Folgepunkt für konditionelles required.

## Links

- [J01-9: Preview — Workflow wieder aktivieren]({{ "/de/jira/issues/J01-9/" | relative_url }})
- [J01-28: Analyse: Risikomuster und Befundliste]({{ "/de/jira/issues/J01-28/" | relative_url }})
- [J01-31: Preview Readiness — System-Source-Verarbeitung]({{ "/de/jira/issues/J01-31/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
