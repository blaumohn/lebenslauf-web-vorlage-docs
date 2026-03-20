---
layout: page
title: "J01-91: Zustand/Vorhaben (Snapshot)"
jira_key: J01-91
jira_parent_key: J01-72
permalink: /de/jira/issues/J01-91/
---

**Stand:** 2026-03-18

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer Ort für den öffentlichen Zustand/das Vorhaben zu `J01-91` (Snapshot).
Die öffentliche Doku ist SSOT in GitHub Pages; öffentliche Jira-Seiten kommen
kanonisch aus `work/jira/`.
Der lebende Vorgangsstatus bleibt in Jira (nicht öffentlich).

## Ziel

Die Doku-Struktur konsolidieren und die öffentlich nutzbare Doku in GitHub Pages
so aufbauen, dass HR/Dev-Besucher sich schnell orientieren können.

## Zielteile und heutiger Befund

Die folgende Übersicht bewertet nicht nur Strukturarbeit, sondern das
formulierte Zielbild von `J01-91`.

| Zielteil | Bewertungsmaßstab | Heutiger Befund | Nachweis / Ort |
| --- | --- | --- | --- |
| Orientierungsziel | HR und Dev finden klare Einstiege, Zielorte und Lesepfade in der Public-Doku | offen | GitHub-Pages-Einstiege und `J01-91` benennen Struktur, zerlegen den Besucherpfad aber nicht belastbar |
| Migrationsziel | Relevante Altinhalte aus `docs/agile` sind fachlich in GitHub Pages angekommen | teilweise | `J01-98` füllt einen sprintrelevanten Ausschnitt; weitere Restarbeit bleibt offen |
| Transparenzziel | Je größerem Alt-Thema ist sichtbar, was entschieden, umgesetzt, nur vorbereitet oder noch offen ist | teilweise | [Archiv-Themen]({{ "/de/jira/issues/J01-91/archive-topics/" | relative_url }}) trennt jetzt Entscheidung und Ausführung; der Vollabgleich bleibt Folgearbeit |
| Strukturziel | Haupt-Orte, Dokutypen und Zielpfade sind klar und stabil benannt | erfüllt | [Archiv-Themen]({{ "/de/jira/issues/J01-91/archive-topics/" | relative_url }}), [Bereiche-Inventar]({{ "/de/jira/issues/J01-91/area-inventory/" | relative_url }}) und [Policy-Deltas]({{ "/de/jira/issues/J01-91/policy-deltas/" | relative_url }}) |
| Nachweisziel | Die behauptete Erledigung ist öffentlich nachvollziehbar belegt | offen | Die bisherige Abschlussdarstellung war stärker als die belegte Zielerfüllung; Folgearbeit läuft jetzt über [J01-103]({{ "/de/jira/issues/J01-103/" | relative_url }}) |

## Delta 2026-03-14

- App-README und EN-README verweisen jetzt branch-neutral auf GitHub Pages und
  das passende GitHub-Repo.
- Die GitHub-Pages-Einstiegsseiten `/de/` und `/en/` verlinken jetzt sichtbar
  auf App-Repo und Doku-Repo.
- Der öffentliche Einstieg stellt klar:
  reguläre Projektdoku liegt nicht unter `docs/` im App-Repo.
- `#start` bleibt als bewusster Seitenanker erhalten; doppelte
  Quickstart-Befehle werden dort vermieden.
- Jira-Remote-Links werden für sprachgebundene Doku-Ziele sprachstabil auf
  die kanonischen GitHub-Pages-Ziele normalisiert.

## Delta 2026-03-16

- Der README-Stand `docs: README auf GitHub Pages umstellen (J01-91)` wurde
  aus `feature/iss-005-preview` herausgelöst und auf einen eigenen
  `dev`-basierten Branch gelegt; `dev` trägt diesen Stand jetzt direkt.
- Die Archiv-Auswertung führt jetzt betriebs- und ablaufbezogene Reste aus
  `docs/agile` in einer eigenen Tabelle, statt nur implizit über Themenlisten.
- Projekt-Skill und Repo-Regeln werden auf denselben Ablauf nachgeschärft:
  Branch-Kontext zuerst prüfen, repo-nahe Doku-/Regelarbeit ohne
  Feature-Bezug über `dev` führen.
- `J01-91` wechselt in Jira auf `Erledigt`.
- Die sprintrelevante Preview-Migration aus Phase 2 läuft ab jetzt über
  [J01-98]({{ "/de/jira/issues/J01-98/" | relative_url }}).
- Die nicht sprintrelevanten `docs/agile`-Reste aus Phase 2 liegen jetzt im
  Backlog unter [J01-100]({{ "/de/jira/issues/J01-100/" | relative_url }}).
- Die Bereinigung alter Confluence-Remote-Links und der neue Audit-Guardrail
  laufen ab jetzt über [J01-99]({{ "/de/jira/issues/J01-99/" | relative_url }}).

## Delta 2026-03-18

- `J01-91` trennt jetzt ausdrücklich zwischen erreichtem Strukturteil und
  offener Zielerfüllung des ursprünglichen öffentlichen Zielbilds.
- [J01-103]({{ "/de/jira/issues/J01-103/" | relative_url }}) ist als neue
  Folgearbeit angelegt, damit die offene Zielerfüllung nicht implizit in
  `J01-100` oder `J01-98` verschwindet.
- [Archiv-Themen]({{ "/de/jira/issues/J01-91/archive-topics/" | relative_url }})
  macht jetzt getrennt sichtbar, was übernommen werden soll und was heute
  bereits öffentlich umgesetzt ist.

## Arbeitsprinzip (kurz)

- GitHub Pages ist SSOT für Doku (öffentlich, inkl. Seiten für Jira-Links).
- Jira ist SSOT für Vorgänge und Status (nicht öffentlich).
- Diese Seite ist ein **öffentlicher Snapshot**: „Was ist der Stand, was ist als Nächstes zu tun?“
- Detail-Artefakte hängen unter `jira/issues/J01-91/` (öffentlich) oder
  bleiben privat.

## Abschluss und Folgearbeit

`J01-91` bleibt als Struktur- und Entscheidungs-Vorgang abgeschlossen.
Nicht abgeschlossen ist dagegen die vollständige Zielerfüllung des
ursprünglichen öffentlichen Zielbilds. Diese Restarbeit wird jetzt offen als
Folgearbeit geführt:

1. [J01-98]({{ "/de/jira/issues/J01-98/" | relative_url }}) zieht nur die
   sprintrelevante Preview-Migration für `J01-9`, `J01-13`, `J01-16` und
   `J01-31` in den aktiven Sprint-Scope.
2. [J01-103]({{ "/de/jira/issues/J01-103/" | relative_url }}) zieht die offene
   Zielerfüllung aus `J01-91` nach: Orientierung, Transparenz über
   Übernahmestatus und vollständigerer Nachweis der Public-Migration.
3. [J01-100]({{ "/de/jira/issues/J01-100/" | relative_url }}) hält die übrigen
   `docs/agile`-Migrationen als getrennten Backlog-Kandidaten für einen
   späteren Sprint; `J01-100` ersetzt nicht `J01-103`.
4. [J01-99]({{ "/de/jira/issues/J01-99/" | relative_url }}) bereinigt alte
   Confluence-Remote-Links in Jira und verankert den Audit-Guardrail.
5. [Archiv-Themen]({{ "/de/jira/issues/J01-91/archive-topics/" | relative_url }})
   bleibt öffentlicher Prüf- und Übergabeort dafür, was entschieden und was
   davon bereits umgesetzt ist.
6. Weitere strukturelle Doku-Änderungen bleiben an die geschärfte
   `doku-richtlinie` und den Drift-Pfad gebunden.

## Phase 1: Status des Strukturteils (DoD, Snapshot)

Diese DoD-Tabelle bewertet nur den erreichten Strukturteil von `J01-91`.
Sie ist kein Beleg dafür, dass das vollständige öffentliche Zielbild bereits
eingelöst ist.

Statuswerte:

- **erledigt**: erfüllt und belegt
- **teilweise**: im Wesentlichen erfüllt, aber es bleibt ein klarer Rest
- **offen**: noch nicht erfüllt
- **blockiert**: hängt an einer Entscheidung/externem Input

| Punkt (DoD) | Status | Beleg / Ort |
| --- | --- | --- |
| Drift-Report + Abdeckung der kanonischen Public-Doku | erledigt | [Drift-Report]({{ "/de/quality/drift-reports/J01-91/" | relative_url }}) und [Abdeckung]({{ "/de/quality/drift-reports/J01-91/coverage/" | relative_url }}) |
| Öffentliche Jira-Fläche konsistent nachgezogen | erledigt | [Runbook]({{ "/de/operations/runbook/" | relative_url }}) und `shared-tooling/jira-pages/update-public-jira-pages.sh` |
| Bereiche-Inventar konsistent | erledigt | [Bereiche-Inventar]({{ "/de/jira/issues/J01-91/area-inventory/" | relative_url }}) |
| Archiv-Auswertung liegt vor (Themen, ohne IDs) | erledigt | [Archiv-Themen]({{ "/de/jira/issues/J01-91/archive-topics/" | relative_url }}) (Übernahme-Entscheidungen und Zielorte festgezogen) |
| Policy-Delta-Vorschläge formuliert | erledigt | [Policy-Deltas]({{ "/de/jira/issues/J01-91/policy-deltas/" | relative_url }}) |
| Klare Phase-2-Liste existiert | erledigt | Diese Seite + [J01-103]({{ "/de/jira/issues/J01-103/" | relative_url }}) + [J01-100]({{ "/de/jira/issues/J01-100/" | relative_url }}) |
| Public-Doku: Sprach-/Nennungsregeln eingehalten | erledigt | Stichprobe + aktuelle Seiten (keine Jira-Cloud-Links, keine personenbezogenen Daten) |

## Phase 1: Definition of Done (ausformuliert)

<details markdown="1">
<summary>Aufklappen: Checkliste / DoD</summary>

Phase 1 ist „fertig“, wenn die folgenden Punkte erfüllt sind:

- Drift-Report deckt alle menschen-geschriebenen Seiten und kanonischen
  öffentlichen Jira-Arbeitsdokus ab:
  - pro Seite sind die relevanten „Ist“-Claims geprüft oder als „unklar/geplant“
    markiert.
- Öffentliche Jira-Fläche ist konsistent nachgezogen:
  - keine konkurrierenden öffentlichen Quellfamilien für dieselbe Jira-Seite.
  - Schritt-Seiten nutzen stabile URLs: `/jira/issues/<PARENT>/steps/<SUBTASK_KEY>/`.
  - Remote Links werden als site-relative Links gerendert (nicht als
    absolute Doku-Domain).
- Bereiche-Inventar existiert und ist konsistent:
  - Doku-Bereiche ↔ Quell-Repos sind grob gemappt.
  - Platzhalter-Bereiche sind bewusst (entweder „füllen“ oder „entfernen“ als
    klarer Phase-2-Task).
- Archiv-Auswertung liegt vor:
  - Themen sind abstrahiert (ohne Export-IDs) und als Kandidaten zur Übernahme
    einsortiert (Bereich/Querschnitt).
  - Pro Thema ist mindestens klar:
    - Übernehmen ja/nein/offen (offen ist zulässig, aber muss explizit markiert sein).
    - Dokutyp/Vorlage und Zielpfad sind entweder benannt oder als „offen“ markiert.
  - Offene Frage „nur interne Referenzen?“ ist entweder beantwortet oder als
    offene Arbeit mit klarer Ablage (private Mapping-Notiz) festgehalten.
- Policy-Delta-Vorschläge sind formuliert:
  - Ist/Geplant-Markierung
  - Export-/Umwandlungsregeln inkl. Ausnahme
  - Jira-Link-Policy (Remote Links) + Mirror-Übernahme (optional)
- Eine klare Phase-2-Liste existiert (umsetzbar, priorisiert, mit Risiko/Impact).
- Public-Doku erfüllt die aktuellen Sprach-/Nennungsregeln:
  - keine Nennung früherer interner Arbeitsorte/Ordnernamen in öffentlichen Seiten.

</details>

## Entscheidungen (Abstimmung, Snapshot)

| Thema | Status | Bezug / Ort |
| --- | --- | --- |
| Ablage von Archivmaterial (lokale Exporte, nicht veröffentlichen) | entschieden | `.local/` im Doku-Repo; lokal, nicht versioniert, nicht veröffentlicht |
| Interne Referenzen aus Archivquellen: Mapping privat vs. öffentlich abstrakt | entschieden | Mapping nur privat; Public-Doku bleibt abstrahiert |
| Neue Doku-Typen: Glossar / Abnahmechecks wirklich nötig? | entschieden | nein; bestehende Bereichsseiten und `quality/testmatrix/` genügen |
| Policy-Änderungen anwenden | entschieden | in `policies/doku-richtlinie/` übernommen; keine separate neue Richtlinie nötig |

### Details (für schnelle Abstimmung)

1) **Ablage von Archivmaterial (lokale Exporte)**
- Ziel: lokal verfügbar, aber nicht als Public-Doku.
- Entscheidung: im Doku-Repo unter `.local/` halten.
- Konkret: repo-nah, per `.gitignore` unversioniert und per Jekyll-`exclude`
  nicht veröffentlicht.

2) **Interne Referenzen aus Archivquellen**
- Frage: Sind Archivquellen überwiegend interne Referenzen (IDs), und wurden sie bereits in J01-Vorgänge überführt?
- Public-Regel: keine internen IDs in Public-Doku.
- Entscheidung: Zuordnung/Mapping nur im privaten Notizrepo pflegen;
  Public-Doku bleibt abstrahiert.

3) **Neue Doku-Typen wirklich nötig?**
- Kandidaten aus der Archiv-Auswertung:
  - kleines Glossar (Begriffe)
  - Abnahmecheck-Seiten (feingranulare Checks, wenn Jira darauf linken soll)
- Entscheidung: nein.
- Begründung: Begriffe werden auf Bereichs- und Richtlinienseiten geführt;
  feingranulare Nachweise bleiben Teil von `quality/testmatrix/` oder der
  vorgangsgenauen Arbeitsdoku.

4) **Policy-Änderungen anwenden**
- Grundlage: [Policy-Deltas]({{ "/de/jira/issues/J01-91/policy-deltas/" | relative_url }})
- Entscheidung: die freigegebenen Deltas werden direkt in
  `policies/doku-richtlinie/` übernommen.
- Zerlegung: Präzisierungen bleiben in der bestehenden Richtlinie; es wird keine
  zusätzliche neue Richtlinie für `J01-91` eröffnet.

## Phase 2 (ausgelagert)

- Status-/Vorhaben-Darstellung bleibt als One-Pager erhalten.
- Die sprintrelevanten Preview-Themen werden in [J01-98]({{ "/de/jira/issues/J01-98/" | relative_url }})
  umgesetzt.
- Die offene Zielerfüllung aus `J01-91` wird in [J01-103]({{ "/de/jira/issues/J01-103/" | relative_url }})
  als eigener nächster Sprint-Kandidat geführt.
- Die übrigen `docs/agile`-Reste bleiben in [J01-100]({{ "/de/jira/issues/J01-100/" | relative_url }})
  bewusst im Backlog.
- Die Doku-Richtlinie bleibt Gate für weitere Strukturänderungen.
- Es werden weiterhin keine neuen Dokutypen aus `J01-91` abgeleitet.

## Links (Sichtbarkeit)

- Jira-Metadaten verlinken `J01-91` jetzt explizit mit `J01-98`, `J01-100`
  und `J01-103`.
- [Jira: J01-91]({{ "/de/jira/issues/J01-91/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [Drift-Report (Qualität)]({{ "/de/quality/drift-reports/J01-91/" | relative_url }})
- [J01-98: sprintrelevante Preview-Migration]({{ "/de/jira/issues/J01-98/" | relative_url }})
- [J01-103: offene Zielerfüllung aus J01-91 nachziehen]({{ "/de/jira/issues/J01-103/" | relative_url }})
- [J01-100: docs/agile-Reste nach Sprint 1]({{ "/de/jira/issues/J01-100/" | relative_url }})
- [J01-99: Alte Confluence-Remote-Links bereinigen]({{ "/de/jira/issues/J01-99/" | relative_url }})
