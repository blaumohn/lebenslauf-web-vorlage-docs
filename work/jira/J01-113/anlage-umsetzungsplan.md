---
layout: page
title: "J01-113 Anlage: Umsetzungsplan Regelwerk-Bereinigung"
jira_key: J01-113
permalink: /de/jira/issues/J01-113/anlage-umsetzungsplan/
---

**Stand:** 2026-03-20

Konkreter Umsetzungsplan für die Bereinigung der KI-Agenten-Regelstruktur
gemäß J01-113. Regelkennzeichen beziehen sich auf die
[Regelwerk-Bestandsübersicht]({{ "/de/jira/issues/J01-113/anlage-regelwerk-bestand/" | relative_url }}).

Alle Vorentscheidungen sind getroffen:
- Architektur: Option D (GitHub Pages → Skripte → Skills)
- `ki_karte`-Schema: `shared/` (generisch); Tooling: `lebenslauf-web-vorlage/` (projektgebunden)
- Ziel-Repos definieren keine eigenen Agent-Regeln (IM-SKL-01)

→ Zurück zur [Hauptdoku J01-113]({{ "/de/jira/issues/J01-113/" | relative_url }})

---

## Abhängigkeiten auf einen Blick

```
Phase 1 ──┬──→ Phase 3 ──→ Phase 4
Phase 2 ──┘
Phase 5 (unabhängig, parallel möglich)
Phase 6 (unabhängig, → J01-115)
```

---

## Phase 1 — E2 vervollständigen: `shared/` ergänzen

**Ziel:** `shared/AGENTS.md` und `shared/arbeitsregeln/SKILL.md` tragen alle
fehlenden und bisher impliziten Regeln.

| Schritt | Aufgabe | Betroffene Regeln |
| --- | --- | --- |
| 1.1 | Umlaute-Regel eintragen | WS-KOM-01 |
| 1.2 | Zwei-Codeblöcke-Format der Grammatischen Rückmeldung beschreiben | WS-GRA-01 |
| 1.3 | Roh-Eingabe-Regel eintragen | IM-EIN-01 |
| 1.4 | Scope-Erweiterungs-Freigabe eintragen | WS-ANF-01 |
| 1.5 | Beispiel-Abstraktions-Regel eintragen | WS-EIN-01 |
| 1.6 | `atlassian`-aus-PATH-Regel eintragen | KO-WZG-01 |
| 1.7 | `tools-python`-Regel aus Memory eintragen | MM-WZG-01 |
| 1.8 | `--help`-Regel eintragen | IM-WZG-01 |
| 1.9 | IM-SKL-01 in `shared/entwicklung/SKILL.md` verankern | IM-SKL-01 |

**Abnahme:** Alle M- und I-Regeln für E2 sind in `shared` eingetragen.

---

## Phase 2 — E3 vervollständigen: Projekt-Skills ergänzen

**Ziel:** Alle projektgebundenen und workflow-spezifischen impliziten Regeln
liegen in den richtigen Skills.

| Schritt | Aufgabe | Betroffene Regeln | Zieldatei |
| --- | --- | --- | --- |
| 2.1 | Sprint-Dokumentationsregeln aus WS in Skill verschieben | WS-DOK-01..04 | `koordination/SKILL.md` |
| 2.2 | Lib/App-Branch-Regel verankern | IM-GIT-01 | `koordination/SKILL.md` |
| 2.3 | `blocks`-vs-`relates`-Regel verankern | IM-JRA-01 | `koordination/SKILL.md` |
| 2.4 | Lokaler-Mirror-Regel verankern | IM-JRA-02 | `jira-state-sync/SKILL.md` |
| 2.5 | DE/EN-Sync für Jira-Freitext vervollständigen | DI-I18-03 | `docs-i18n/SKILL.md` |

**Abnahme:** Alle I-Regeln für E3 sind eingetragen; kein WS-DOK-* mehr im Workspace.

---

## Phase 3 — E1 bereinigen: Workspace-`AGENTS.md` auf Bootstrap kürzen

**Voraussetzung:** Phasen 1 und 2 abgeschlossen.

**Ziel:** `AGENTS.md` (WS) enthält nur noch Bootstrap-Verweis auf
`shared/AGENTS.md` und `lebenslauf-web-vorlage/AGENTS.md`.

| Schritt | Aufgabe | Betroffene Regeln |
| --- | --- | --- |
| 3.1 | Alle Regeln entfernen, die in Phase 1 nach `shared` gewandert sind | SA-KOM-01/02, SA-GRA-01, SA-ANF-01/02, SA-PRG-01..07, SA-COM-01..05, SA-DOK-01/02, WS-KOM-01, WS-GRA-01, WS-ANF-01, WS-EIN-01 |
| 3.2 | Alle Regeln entfernen, die in Phase 2 in Projekt-Skills gewandert sind | WS-DOK-01..04 |
| 3.3 | WS auf reinen Bootstrap-Hinweis kürzen | SA-SKL-01 |

**Abnahme:** `AGENTS.md` (WS) enthält keinen Fachinhalt mehr.

---

## Phase 4 — IM-SKL-01 anwenden: Ziel-Repos bereinigen

**Voraussetzung:** Phase 3 abgeschlossen.

**Ziel:** Keine `AGENTS.md` mehr in Produkt- oder Doku-Repos.

| Schritt | Aufgabe | Betroffene Regeln |
| --- | --- | --- |
| 4.1 | Alle Repos außerhalb `.agents/skills/` auf `AGENTS.md` prüfen | IM-SKL-01, SE-SKL-04 |
| 4.2 | Inhalte prüfen: gehören sie in `shared/` oder einen Projekt-Skill? | IM-SKL-01 |
| 4.3 | Inhalte ggf. migrieren, dann `AGENTS.md` aus Ziel-Repos entfernen | IM-SKL-01 |

**Abnahme:** Kein Repo außerhalb `.agents/skills/` trägt noch eine `AGENTS.md`.

---

## Phase 5 — `ki_karte`-Schema definieren

**Voraussetzung:** keine (parallel zu Phasen 1–4 möglich).

**Ziel:** Format für kompilierbare GitHub-Pages-Inhalte ist festgelegt.

| Schritt | Aufgabe | Betroffene Regeln |
| --- | --- | --- |
| 5.1 | Schema-Definition als neuen Skill in `shared/` anlegen | J1-E4P-05, IM-SKL-01 |
| 5.2 | Felder definieren: `ziel_ebene`, `ziel_datei`, `bereich`, `granularitaet`, `format`, `regel_ids` | J1-E4P-05 |
| 5.3 | Frage klären: wie wird `abschnitt`-Granularität adressiert (Anker, Heading-Ebene)? | J1-E4P-05 |
| 5.4 | Bestehende Policy-Seiten prüfen: welche könnten sofort annotiert werden? | J1-E4P-07..11 |

**Abnahme:** Schema-Skill in `shared/` vorhanden; mindestens eine Policy-Seite
als Beispiel annotiert.

---

## Phase 6 — Prüfkategorie und E4-Grundlage (→ J01-115)

**Voraussetzung:** Phasen 1–4 abgeschlossen.

**Ziel:** Übergabe an J01-115 vorbereiten.

| Schritt | Aufgabe | Betroffene Regeln |
| --- | --- | --- |
| 6.1 | Vollständige Prüfkategorie-Tabelle A/B/C/D aus Bestandsübersicht extrahieren | alle Prüfkat.-Spalten |
| 6.2 | Lücken (noch keine Hook/Skript-Abdeckung) als Anforderungen an J01-115 formulieren | J1-E4P-04..06 |
| 6.3 | Autorenkonvention als Policy-Seite in GitHub Pages verfassen | J1-E4P-07..11 |
| 6.4 | Build-Trigger-Entscheidung (CI, Hook, Agent-Konvention) in J01-115 übergeben | J1-E4P-06 |
