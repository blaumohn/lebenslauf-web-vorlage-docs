---
layout: page
title: "J01-91: Zustand/Vorhaben (Snapshot)"
permalink: /de/work/jira/J01-91/
---

**Stand:** 2026-03-16

Kanonischer Ort für den öffentlichen Zustand/das Vorhaben zu `J01-91` (Snapshot).
Die öffentliche Doku ist SSOT in GitHub Pages; `mirror/` ist abgeleitet.
Der lebende Vorgangsstatus bleibt in Jira (nicht öffentlich).

## Ziel

Die Doku-Struktur konsolidieren und die öffentlich nutzbare Doku in GitHub Pages
so aufbauen, dass HR/Dev-Besucher sich schnell orientieren können.

## Delta 2026-03-14

- App-README und EN-README verweisen jetzt branch-neutral auf GitHub Pages und
  das passende GitHub-Repo.
- Die GitHub-Pages-Einstiegsseiten `/de/` und `/en/` verlinken jetzt sichtbar
  auf App-Repo und Doku-Repo.
- Der öffentliche Einstieg stellt klar:
  reguläre Projektdoku liegt nicht unter `docs/` im App-Repo.
- `#start` bleibt als bewusster Seitenanker erhalten; doppelte
  Quickstart-Befehle werden dort vermieden.
- Mirror-Links aus Jira-Remote-Links werden für sprachgebundene Doku-Ziele
  sprachstabil normalisiert.

## Delta 2026-03-16

- Der README-Stand `docs: README auf GitHub Pages umstellen (J01-91)` wurde
  aus `feature/iss-005-preview` herausgeloest und auf einen eigenen
  `dev`-basierten Branch gelegt; `dev` traegt diesen Stand jetzt direkt.
- Die Archiv-Auswertung fuehrt jetzt betriebs- und ablaufbezogene Reste aus
  `docs/agile` in einer eigenen Tabelle, statt nur implizit ueber Themenlisten.
- Projekt-Skill und Repo-Regeln werden auf denselben Ablauf nachgeschaerft:
  Branch-Kontext zuerst pruefen, repo-nahe Doku-/Regelarbeit ohne
  Feature-Bezug ueber `dev` fuehren.
- `J01-91` wechselt in Jira auf `Erledigt`.
- Die sprintrelevante Preview-Migration aus Phase 2 laeuft ab jetzt ueber
  [J01-98]({{ "/de/work/jira/J01-98/" | relative_url }}).
- Die nicht sprintrelevanten `docs/agile`-Reste aus Phase 2 liegen jetzt im
  Backlog unter [J01-100]({{ "/de/work/jira/J01-100/" | relative_url }}).
- Die Bereinigung alter Confluence-Remote-Links und der neue Audit-Guardrail
  laufen ab jetzt ueber [J01-99]({{ "/de/work/jira/J01-99/" | relative_url }}).

## Arbeitsprinzip (kurz)

- GitHub Pages ist SSOT für Doku (öffentlich, inkl. Seiten für Jira-Links).
- Jira ist SSOT für Vorgänge und Status (nicht öffentlich).
- Diese Seite ist ein **öffentlicher Snapshot**: „Was ist der Stand, was ist als Nächstes zu tun?“
- Detail-Artefakte hängen unter `work/jira/J01-91/` (öffentlich) oder bleiben privat.

## Abschluss und Folgearbeit

`J01-91` ist als Struktur- und Entscheidungs-Vorgang abgeschlossen.
Die verbleibende Folgearbeit wurde bewusst herausgezogen:

1. [J01-98]({{ "/de/work/jira/J01-98/" | relative_url }}) zieht nur die
   sprintrelevante Preview-Migration fuer `J01-9`, `J01-13`, `J01-16` und
   `J01-31` in den aktiven Sprint-Scope.
2. [J01-100]({{ "/de/work/jira/J01-100/" | relative_url }}) haelt die
   uebrigen `docs/agile`-Migrationen als Backlog-Kandidat fuer einen
   spaeteren Sprint.
3. [J01-99]({{ "/de/work/jira/J01-99/" | relative_url }}) bereinigt alte
   Confluence-Remote-Links in Jira und verankert den Audit-Guardrail.
4. `archive-topics.md` bleibt nur noch fortgeschriebene Arbeitsgrundlage und
   kein offener Pruefstand mehr.
5. Weitere strukturelle Doku-Aenderungen bleiben an die geschaerfte
   `doku-richtlinie` und den Drift-Pfad gebunden.

## Phase 1: Status (DoD, Snapshot)

Statuswerte:

- **erledigt**: erfüllt und belegt
- **teilweise**: im Wesentlichen erfüllt, aber es bleibt ein klarer Rest
- **offen**: noch nicht erfüllt
- **blockiert**: hängt an einer Entscheidung/externem Input

| Punkt (DoD) | Status | Beleg / Ort |
| --- | --- | --- |
| Drift-Report + Abdeckung (ohne `mirror/`) | erledigt | [Drift-Report]({{ "/de/quality/drift-reports/J01-91/" | relative_url }}) und [Abdeckung]({{ "/de/quality/drift-reports/J01-91/coverage/" | relative_url }}) |
| Jira-Übersicht „sauber voll gespiegelt“ | erledigt | [Runbook]({{ "/de/operations/runbook/" | relative_url }}) und `shared-tooling/jira-pages/update-jira-mirror.sh` |
| Bereiche-Inventar konsistent | erledigt | [Bereiche-Inventar]({{ "/de/work/jira/J01-91/area-inventory/" | relative_url }}) |
| Archiv-Auswertung liegt vor (Themen, ohne IDs) | erledigt | [Archiv-Themen]({{ "/de/work/jira/J01-91/archive-topics/" | relative_url }}) (Übernahme-Entscheidungen und Zielorte festgezogen) |
| Policy-Delta-Vorschläge formuliert | erledigt | [Policy-Deltas]({{ "/de/work/jira/J01-91/policy-deltas/" | relative_url }}) |
| Klare Phase-2-Liste existiert | erledigt | Diese Seite („Jetzt als Nächstes“) + festgezogene Zielorte in [Archiv-Themen]({{ "/de/work/jira/J01-91/archive-topics/" | relative_url }}) |
| Public-Doku: Sprach-/Nennungsregeln eingehalten | erledigt | Stichprobe + aktuelle Seiten (keine Jira-Cloud-Links, keine personenbezogenen Daten) |

## Phase 1: Definition of Done (ausformuliert)

<details markdown="1">
<summary>Aufklappen: Checkliste / DoD</summary>

Phase 1 ist „fertig“, wenn die folgenden Punkte erfüllt sind:

- Drift-Report deckt alle menschen-geschriebenen Seiten außerhalb `mirror/` ab:
  - pro Seite sind die relevanten „Ist“-Claims geprüft oder als „unklar/geplant“
    markiert.
- Jira-Übersicht ist „sauber voll gespiegelt“:
  - keine veralteten `mirror/issues/J01-*`-Ordner (gelöschte Jira-Vorgänge sind entfernt).
  - Schritt-Seiten nutzen stabile URLs: `/mirror/issues/<PARENT>/steps/<SUBTASK_KEY>/`.
  - Remote Links werden im Mirror als site-relative Links gerendert (nicht als absolute Doku-Domain).
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
- Grundlage: [Policy-Deltas]({{ "/de/work/jira/J01-91/policy-deltas/" | relative_url }})
- Entscheidung: die freigegebenen Deltas werden direkt in
  `policies/doku-richtlinie/` übernommen.
- Zerlegung: Präzisierungen bleiben in der bestehenden Richtlinie; es wird keine
  zusätzliche neue Richtlinie für `J01-91` eröffnet.

## Phase 2 (ausgelagert)

- Status-/Vorhaben-Darstellung bleibt als One-Pager erhalten.
- Die sprintrelevanten Preview-Themen werden in [J01-98]({{ "/de/work/jira/J01-98/" | relative_url }})
  umgesetzt.
- Die uebrigen `docs/agile`-Reste bleiben in [J01-100]({{ "/de/work/jira/J01-100/" | relative_url }})
  bewusst im Backlog.
- Die Doku-Richtlinie bleibt Gate für weitere Strukturänderungen.
- Es werden weiterhin keine neuen Dokutypen aus `J01-91` abgeleitet.

## Links (Sichtbarkeit)

- [Mirror: J01-72 / Schritt J01-91]({{ "/de/mirror/issues/J01-72/steps/J01-91/" | relative_url }}) (abgeleitet)
- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [Drift-Report (Qualität)]({{ "/de/quality/drift-reports/J01-91/" | relative_url }})
- [J01-98: sprintrelevante Preview-Migration]({{ "/de/work/jira/J01-98/" | relative_url }})
- [J01-100: docs/agile-Reste nach Sprint 1]({{ "/de/work/jira/J01-100/" | relative_url }})
- [J01-99: Alte Confluence-Remote-Links bereinigen]({{ "/de/work/jira/J01-99/" | relative_url }})
