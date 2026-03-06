---
layout: page
title: "Phase-1-Checkliste (Definition of Done) – 2026-03-06"
permalink: /quality/drift-reports/J01-91/phase-1-checklist/
---

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
