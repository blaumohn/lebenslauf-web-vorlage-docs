---
layout: page
title: "J01-98: Migrationslandkarte und öffentliche Herleitung"
permalink: /de/work/jira/J01-98/migration-map/
---

Diese Seite hält die vertiefende öffentliche Arbeitsdoku zu `J01-98` fest.
Sie beschreibt die sprintrelevanten Restthemen aus `J01-91` so, dass die
Herleitung auch ohne Zugriff auf interne Arbeitsnotizen verständlich bleibt.

## Zweck

`J01-98` zieht nur den Teil der früheren `docs/agile`-Migration, der den
aktuellen Preview-Sprint direkt trägt.
Die Seite beantwortet deshalb drei Fragen:

- Welche Themenblöcke aus den früheren Quellen sind für den Sprint noch
  relevant?
- In welche heutigen öffentlichen Zielorte gehören diese Themen?
- Welche Reste gehören ausdrücklich **nicht** mehr zu `J01-98`, sondern nach
  [J01-100]({{ "/de/work/jira/J01-100/" | relative_url }})?

## Öffentliche Herleitung

Aus den archivierten `docs/agile`-Quellen blieb für den Preview-Pfad keine
allgemeine Restmigration übrig, sondern vier klar unterscheidbare Themen:

1. der Preview-Workflow mit Promotion-Pfad, Pflichtchecks und Preview-spezifischen
   Betriebsannahmen
2. die Testmatrix mit Nachweisen für Build, Runtime und Deploy-Smoke
3. die Runtime-Härtung für Locking, atomare Zugriffe und race-nahe Risiken
4. die System-Source- und Config-Policy im Preview-Pfad

Diese Einengung wurde später durch den arbeitsnahen Abgleich aus März 2026
weiter geschärft:

- Die Preview-Migration soll nur den aktiven Sprint-Pfad stützen.
- Alles, was nicht direkt zum Preview-Deployment führt, bleibt außerhalb
  dieses Vorgangs.
- Öffentliche Doku muss die Aussage selbst tragen; interne Notizen dienen nur
  als Provenienz, nicht als öffentlicher Zielort.

Die Herleitung stützt sich inhaltlich auf drei Quellfamilien:

- ältere Archivstände aus dem `docs/agile`-Export vom 2026-02-21
  für die späteren Jira-Zielträger `J01-31`, `J01-9`, `J01-13` und
  `J01-16`
- die Commit-Historie der Branches `preview`, `feature/iss-005-preview` und
  `dev`
- spätere interne Arbeitsstände vom 2026-03-16 und 2026-03-17,
  in denen die Sprint-Grenze gegen `J01-100` ausdrücklich festgezogen wurde

## Themenblöcke und heutige Zielorte

| Themenblock | Öffentliche Aussage für `J01-98` | Heutiger Zielort | Jira-Bezug | Git-Beleg |
| --- | --- | --- | --- |
| Preview-Workflow und Promotion-Pfad | Der Sprint braucht einen klaren Ablauf für `feature/* -> dev -> preview`, Pflichtprüfungen vor Promotion und Preview-spezifische Betriebsregeln. | `operations/<slug>/` | `J01-9` | `4b95d4e`, `9e9c2ff`, `2af9f95` |
| Testmatrix und Nachweise | Der Sprint braucht sichtbare Nachweise für `config lint`, Setup, Build, Tests, Artefakt-Checks und Smoke-Pfad. | `quality/testmatrix/` | `J01-13` | `4b95d4e`, `2af9f95`, `e1daa6d` |
| Runtime-Locking und atomare Zugriffe | Der Preview-Pfad braucht eine öffentlich erklärte Begründung für Locking, Timeout-/Polling-Regeln und atomische Schreibmuster. | `areas/http-runtime/` | `J01-16` | `b015e77`, `49d02fa`, `044e12d`, `cc42f0d`, `3fffdaa` |
| System-Source und Config-Policy | Die Preview-relevante Config-Herleitung muss erklären, wie Quellen, Manifest-Regeln und Pipeline-/Phasenlogik zusammenspielen. | `areas/cli-build/` | `J01-31` | `4b95d4e`, `9b5c891`, `c3cef7a` |

## Commit-Historie als Quellenfamilie

Die Commit-Historie ist für `J01-98` eine eigene belastbare Quelle, weil sie
zeigt, welche Teile des Preview-Pfads tatsächlich in Code, Workflow und
Repo-Doku angekommen sind.

### `preview`

- `4b95d4e`:
  `config lint` sowie CLI-`setup` und CLI-`build` wurden als sichtbarer
  Preview-Pfad verankert.
- Daraus folgt für `J01-98`:
  `J01-9`, `J01-13` und `J01-31` brauchen öffentliche Doku, die genau diesen
  schlanken Preview-Pfad erklärt.

### `feature/iss-005-preview`

- `9e9c2ff`:
  Preview-Workflow und Checks wurden reaktiviert.
- `2af9f95`:
  der Preview-Workflow wurde über `bin/ci` vereinheitlicht.
- `9b5c891`:
  der Begriff `Pipeline-Phase` wurde im aktiven Pfad vereinheitlicht.
- `c3cef7a`:
  Beispielwerte wanderten aus aktiven Config-Dateien in Manifest-Metadaten.
- `e1daa6d`:
  Feature-Tests brauchten zusätzliche Guardrails für `IP_SALT` und Temp-Dir.

Diese Commitgruppe ist die Hauptquelle für den öffentlichen Zusammenhang von
`J01-9`, `J01-13` und `J01-31`.

### `feature/iss-005-preview` mit ISS-011/ISS-012-Ausrollung

- `b015e77`:
  `LockRunner` und `AtomicWriter` wurden eingeführt.
- `49d02fa`:
  Runtime- und CLI-Integration für den `IP_SALT`-Pfad wurden verankert.
- `044e12d`:
  Guardrail-Tests für die Runtime kamen hinzu.
- `cc42f0d`:
  der Concurrency-Rahmen wurde in Services und State-Ports überführt.
- `3fffdaa`:
  die Runtime-Haertung wurde in `docs/ENVIRONMENTS.md` dokumentiert.

Diese Commitgruppe ist die Hauptquelle für den öffentlichen Zusammenhang von
`J01-16` mit dem Preview-Betrieb.

### `dev`

- `03b4c4c`:
  der `preview`-Stand wurde in `dev` aufgenommen.
- `1207510`:
  `docs/agile` wurde aus dem aktiven Repo entfernt.
- spätere `docs(agile)`- und README-Schritte in `dev` zeigen, dass die
  frühere Arbeitsbasis nicht mehr als lebender Doku-Ort vorausgesetzt werden
  kann.

Daraus folgt für `J01-98`:
die öffentliche Herleitung muss Archivquellen, Commit-Historie und spätere
Schärfung zusammenziehen, statt einen noch aktiven `docs/agile`-Baum zu
verlinken.

## Scope-Grenze gegen J01-100

| Themenrest | Bleibt in `J01-98`? | Begründung |
| --- | --- | --- |
| Preview-Workflow im heutigen Jira-Zuschnitt `J01-9` | ja | Trägt den aktiven Sprint unmittelbar. |
| Testmatrix- und Nachweisblock im heutigen Jira-Zuschnitt `J01-13` | ja | Ist notwendiger Sprint-Nachweis für den Preview-Pfad. |
| Runtime-Concurrency- und Locking-Härtung im heutigen Jira-Zuschnitt `J01-16` | ja, soweit sie den Preview-Betrieb öffentlich absichert | Der Sprint braucht die erklärte Stabilitätsbasis, nicht jede spätere Vertiefung. |
| System-Source- und Source-Policy-Herleitung im heutigen Jira-Zuschnitt `J01-31` | ja | Sie erklärt den Preview-Pfad und seine Config-Logik. |
| spätere `docs/agile`-Reste ohne direkten Preview-Bezug | nein | Diese Themen stützen den Sprint nicht unmittelbar und bleiben in `J01-100`. |
| neue Dokutypen oder allgemeine Bereichsausbauarbeit außerhalb des Sprint-Pfads | nein | `J01-98` migriert nur sprintrelevante Inhalte und eröffnet keine neue Doku-Klasse. |

## Quellenlage und Aktualität

Die älteren `docs/agile`-Quellen liefern für `J01-98` weiterhin den
inhaltlichen Rohstoff. Öffentlich führend sind heute aber die Jira-Zielträger
`J01-9`, `J01-13`, `J01-16` und `J01-31`.

- Der Themenblock für `J01-9` übernimmt den früheren Preview-Workflow,
  die Trigger, die Pflichtchecks und die Preview-spezifischen
  Betriebsannahmen.
- Der Themenblock für `J01-13` übernimmt die Testmatrix, die
  Nachweisstruktur und die noch sichtbaren Restlücken für Build, Runtime und
  Deploy-Smoke.
- Der Themenblock für `J01-16` übernimmt die Begründung für Locking,
  atomische Writes und race-nahe Tests in der Runtime.
- Der Themenblock für `J01-31` übernimmt die System-Source-Verarbeitung und
  die Quellregeln, die den Preview-Pfad technisch begründen.

Die Commit-Historie bestätigt diese Themen zusätzlich im umgesetzten
Repo-Zustand:

- `preview` zeigt den schmalen produktiven Einstieg mit `config lint`,
  `setup` und `build`.
- `feature/iss-005-preview` zeigt die eigentliche Integration von Workflow,
  Config-Metadaten, Begriffen und Guardrails.
- `dev` zeigt den späteren Konsolidierungsstand und die Entfernung von
  `docs/agile` aus dem aktiven Repo.

Die späteren Arbeitsstände aus März 2026 überschreiben nicht diese
Sachthemen, sondern schärfen ihren Einsatz im Sprint:

- Aus allgemeiner Phase-2-Migration wurde ein enger Preview-Scope.
- Die Grenze gegen spätere Nacharbeit wurde öffentlich an `J01-100`
  gebunden.
- Öffentliche Doku muss die Herleitung selbst tragen und darf nicht auf
  interne Notizen als Lesepfad angewiesen sein.

## Nächste Migrationsblöcke

1. Den öffentlichen Preview-Workflow für `J01-9` im Runbook weiter nur
   sprintnah ergänzen.
2. Die Sprint-Matrix für `J01-13` mit neuen Nachweisen nur dann erweitern,
   wenn sie den aktiven Preview-Pfad mehrfach absichert.
3. Runtime- und CLI-/Build-Seiten für `J01-16` und `J01-31` nur im Rahmen der
   Preview-Guardrails fortschreiben.
4. Alles, was diesen vier Blöcken nicht direkt dient, bewusst in
   [J01-100]({{ "/de/work/jira/J01-100/" | relative_url }}) lassen.

## Links

- [J01-98: öffentlicher Arbeitsstand]({{ "/de/work/jira/J01-98/" | relative_url }})
- [J01-91: Zustand/Vorhaben (Abschluss-Snapshot)]({{ "/de/work/jira/J01-91/" | relative_url }})
- [J01-100: docs/agile-Reste nach Sprint 1]({{ "/de/work/jira/J01-100/" | relative_url }})
