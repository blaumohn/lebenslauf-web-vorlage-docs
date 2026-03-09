---
layout: page
title: "J01-91: Phase-1-Entscheidungen (Abstimmung) – 2026-03-09"
permalink: /work/jira/J01-91/phase-1-entscheidungen/
---

Diese Seite sammelt die Punkte, die *inhaltliche Abstimmung* brauchen.
Solange sie offen sind, bleiben Teile von Phase 1/2 „blockiert“.

## Entscheidungen (offen)

1) **Ablage von Archivmaterial (lokale Exporte)**
- Ziel: Archivmaterial soll lokal verfügbar sein, aber nicht als Public-Doku erscheinen.
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
- Grundlage: `work/jira/J01-91/policy-deltas.md`
- Entscheidung: welche Deltas werden tatsächlich in `policies/doku-richtlinie/` übernommen (und wann).

