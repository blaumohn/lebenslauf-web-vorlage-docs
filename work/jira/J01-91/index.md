---
layout: page
title: "J01-91: Zustand/Vorhaben (Snapshot)"
permalink: /de/work/jira/J01-91/
---

**Stand:** 2026-03-09

Kanonischer Ort für den öffentlichen Zustand/das Vorhaben zu `J01-91` (Snapshot).
Die öffentliche Doku ist SSOT in GitHub Pages; `mirror/` ist abgeleitet.
Der lebende Vorgangsstatus bleibt in Jira (nicht öffentlich).

## Ziel

Die Doku-Struktur konsolidieren und die öffentlich nutzbare Doku in GitHub Pages
so aufbauen, dass HR/Dev-Besucher sich schnell orientieren können.

## Arbeitsprinzip (kurz)

- GitHub Pages ist SSOT für Doku (öffentlich, inkl. Seiten für Jira-Links).
- Jira ist SSOT für Vorgänge und Status (nicht öffentlich).
- Diese Seite ist ein **öffentlicher Snapshot**: „Was ist der Stand, was ist als Nächstes zu tun?“
- Detail-Artefakte hängen unter `work/jira/J01-91/` (öffentlich) oder bleiben privat.

## Jetzt als Nächstes (konkret)

1. Entscheidungen schließen (siehe „Entscheidungen (Abstimmung)“).
2. Archiv-Themen finalisieren: pro Thema „übernehmen ja/nein/offen“ + Zielpfad.
3. Policy-Deltas (nach Abstimmung) in `policies/doku-richtlinie/` übernehmen.
4. Daraus ableiten: Phase 2 priorisieren und in Jira als konkrete Arbeitspakete führen.

## Phase 1: Status (DoD, Snapshot)

Statuswerte:

- **erledigt**: erfüllt und belegt
- **teilweise**: im Wesentlichen erfüllt, aber es bleibt ein klarer Rest
- **offen**: noch nicht erfüllt
- **blockiert**: hängt an einer Entscheidung/externem Input

| Punkt (DoD) | Status | Beleg / Ort |
| --- | --- | --- |
| Drift-Report + Abdeckung (ohne `mirror/`) | erledigt | [Drift-Report]({{ "/de/quality/drift-reports/J01-91/" | relative_url }}) und [Abdeckung]({{ "/de/quality/drift-reports/J01-91/coverage/" | relative_url }}) |
| Jira-Übersicht „sauber voll gespiegelt“ | erledigt | [Runbook]({{ "/de/operations/runbook/" | relative_url }}) und `scripts/update-jira-mirror.sh` |
| Bereiche-Inventar konsistent | erledigt | [Bereiche-Inventar]({{ "/de/work/jira/J01-91/area-inventory/" | relative_url }}) |
| Archiv-Auswertung liegt vor (Themen, ohne IDs) | teilweise | [Archiv-Themen]({{ "/de/work/jira/J01-91/archive-topics/" | relative_url }}) (Übernahme-Entscheidungen sind noch „offen“) |
| Policy-Delta-Vorschläge formuliert | erledigt | [Policy-Deltas]({{ "/de/work/jira/J01-91/policy-deltas/" | relative_url }}) |
| Klare Phase-2-Liste existiert | teilweise | Diese Seite („Phase 2“) + Drift-Report („Vorschlag: Nächste Schritte“). |
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
| Ablage von Archivmaterial (lokale Exporte, nicht veröffentlichen) | offen | (Entscheidung) |
| Interne Referenzen aus Archivquellen: Mapping privat vs. öffentlich abstrakt | offen | [Archiv-Themen]({{ "/de/work/jira/J01-91/archive-topics/" | relative_url }}) |
| Neue Doku-Typen: Glossar / Abnahmechecks wirklich nötig? | offen | [Archiv-Themen]({{ "/de/work/jira/J01-91/archive-topics/" | relative_url }}) |
| Policy-Änderungen anwenden | offen | [Policy-Deltas]({{ "/de/work/jira/J01-91/policy-deltas/" | relative_url }}) |

### Details (für schnelle Abstimmung)

1) **Ablage von Archivmaterial (lokale Exporte)**
- Ziel: lokal verfügbar, aber nicht als Public-Doku.
- Vorschlag: im Doku-Repo unter `.local/` halten und technisch sicherstellen, dass es nicht veröffentlicht wird.

2) **Interne Referenzen aus Archivquellen**
- Frage: Sind Archivquellen überwiegend interne Referenzen (IDs), und wurden sie bereits in J01-Vorgänge überführt?
- Public-Regel: keine internen IDs in Public-Doku.
- Vorschlag: Zuordnung/Mapping nur im privaten Notizrepo pflegen; Public-Doku bleibt abstrakt.

3) **Neue Doku-Typen wirklich nötig?**
- Kandidaten aus der Archiv-Auswertung:
  - kleines Glossar (Begriffe)
  - Abnahmecheck-Seiten (feingranulare Checks, wenn Jira darauf linken soll)
- Entscheidung: einführen ja/nein; falls ja, dann Vorlagen + Policy-Anpassung.

4) **Policy-Änderungen anwenden**
- Grundlage: [Policy-Deltas]({{ "/de/work/jira/J01-91/policy-deltas/" | relative_url }})
- Entscheidung: welche Deltas werden tatsächlich in `policies/doku-richtlinie/` übernommen (und wann).

## Phase 2 (nach Abstimmung)

- Status-/Vorhaben-Darstellung finalisieren (diese Seite bleibt „one pager“).
- Archiv-Auswertung präzisieren: Übernahmeentscheidungen pro Thema finalisieren.
- Policy-Deltas in `policies/doku-richtlinie/` übernehmen.
- Optional: neue Vorlagen/Seiten (Glossar, Abnahmechecks) nur wenn wirklich nötig.

## Links (Sichtbarkeit)

- [Mirror: J01-72 / Schritt J01-91]({{ "/de/mirror/issues/J01-72/steps/J01-91/" | relative_url }}) (abgeleitet)
- [Runbook: Jira-Übersicht aktualisieren]({{ "/de/operations/runbook/" | relative_url }})
- [Drift-Report (Qualität)]({{ "/de/quality/drift-reports/J01-91/" | relative_url }})
