---
layout: page
title: "J01-113 Anlage: Regelwerk-Bestandsübersicht"
jira_key: J01-113
permalink: /de/jira/issues/J01-113/anlage-regelwerk-bestand/
---

**Stand:** 2026-03-20

Vollständige Tabelle aller bekannten Regeln, Kandidaten und Lücken —
geordnet nach Fachbereich. Jede Regel trägt eine Nummer, die ihre
Ursprungsdatei kodiert, damit sie bei der Konsolidierung eindeutig
zurückverfolgt werden kann.

→ Zurück zur [Hauptdoku J01-113]({{ "/de/jira/issues/J01-113/" | relative_url }})

---

## Nummerierungsschema

Format: `<Datei>-<Bereich>-<Nr>`

### Datei-Zeichen

| Zeichen | Datei |
| --- | --- |
| `WS` | `AGENTS.md` (Workspace, unversioniert) |
| `SA` | `shared/arbeitsregeln/SKILL.md` |
| `SE` | `shared/entwicklung/SKILL.md` |
| `SH` | `shared/AGENTS.md` |
| `LA` | `lebenslauf-web-vorlage/AGENTS.md` |
| `KO` | `koordination/SKILL.md` |
| `JS` | `jira-state-sync/SKILL.md` |
| `DI` | `docs-i18n/SKILL.md` |
| `J1` | `J01-113/index.md` (Arbeitsdoku) |
| `IM` | nur implizit / Sitzungskontext |
| `MM` | Memory |

### Bereich-Zeichen

| Zeichen | Bereich |
| --- | --- |
| `KOM` | Kommunikation |
| `GRA` | Grammatische Rückmeldung |
| `ANF` | Anforderungs-Treue |
| `EIN` | Eingaben |
| `PRG` | Programmtext-Stil |
| `DOK` | Dokumentationspflicht |
| `COM` | Commit-Praxis |
| `WZG` | Werkzeug-Konventionen |
| `SKL` | Skill-Struktur |
| `GIT` | Git und Branch |
| `JRA` | Jira-Betrieb |
| `I18` | Mehrsprachigkeit DE/EN |
| `KRD` | Koordination |
| `E4P` | Ebene 4 / GitHub Pages |

### Spalten der Tabellen

- **Soll-Ebene**: E1 = Workspace-Bootstrap | E2 = Skill-Repo-AGENTS | E3 = Skill | E4 = GitHub Pages
- **Problem**: R = Redundanz | I = nur implizit | M = fehlt formal | – = ok
- **Prüfkat.**: A = PreToolUse | B = deterministisch post | C = semantisch post | D = semantisch dateiübergreifend

---

## B1 — Kommunikation

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| SA-KOM-01 | Deutsch als Standardsprache für modellgenerierte Texte | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | C |
| SA-KOM-02 | Tool-Ausgaben unverändert weitergeben | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | C |
| WS-KOM-01 | Umlaute korrekt schreiben (kein ae/oe/ue/ss außerhalb technischer Schlüssel) | `AGENTS.md` (WS) | — | E2 | M in `shared` | C |

## B2 — Grammatische Rückmeldung

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| SA-GRA-01 | Nach jeder Antwort einen Abschnitt „Grammatische Rückmeldung" ausgeben | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | C |
| WS-GRA-01 | Zwei Codeblöcke: Zeilenvergleich (Original / Korrektur) und vollständige geglättete Eingabe | `AGENTS.md` (WS) | — | E2 | M in `shared` | C |
| IM-GRA-01 | Roh-Eingabe vor jeder Verarbeitung vollständig und unverändert sichern | Sitzungskontext | — | E2 | I | A |

## B3 — Anforderungs-Treue

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| SA-ANF-01 | Scope und Akzeptanzkriterien der referenzierten Issue verbindlich einhalten | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | A |
| SA-ANF-02 | Bei Unsicherheit: erst fragen, dann ändern | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | A |
| WS-ANF-01 | Scope-Erweiterungen vor Umsetzung explizit freigeben lassen | `AGENTS.md` (WS) | — | E2 | M in `shared` | A |

## B4 — Umgang mit Eingaben

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| IM-EIN-01 | Roh-Eingaben speichern: Original vor Transformation oder Zusammenfassung aufbewahren | Sitzungskontext | — | E2 | I | A |
| WS-EIN-01 | Beispiele nur als Problemillustration behandeln, nicht als Lösungsvorlage | `AGENTS.md` (WS) | — | E2 | M in `shared` | C |

## B5 — Programmtext-Stil

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| SA-PRG-01 | Funktionen meist unter 20–24 Zeilen | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| SA-PRG-02 | Eine Aufgabe pro Funktion, klarer Name | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | C |
| SA-PRG-03 | Frühe Rückgaben bevorzugen | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | C |
| SA-PRG-04 | Verschachtelung maximal 2 Ebenen | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| SA-PRG-05 | Keine tiefe Ausdrucksverschachtelung; Zwischenschritte klar benennen | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| SA-PRG-06 | Keine Inline-Callbacks; benannte Funktionen/Methoden verwenden | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| SA-PRG-07 | Kein Programmfluss im globalen Scope; Einstieg über `main()` | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |

## B6 — Dokumentationspflicht

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| SA-DOK-01 | Jede Änderung braucht einen nachvollziehbaren Jira-Bezug | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| SA-DOK-02 | Passenden Vorgang oder Schritt prüfen; bei Fehlen neu anlegen | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| WS-DOK-01 | Vorgangsdoku unter `lebenslauf-web-vorlage-docs/work/jira/J01-<KEY>/` anlegen oder aktualisieren | `AGENTS.md` (WS) | — | E3 (`koordination`) | R; gehört in Projekt-Skill | B |
| WS-DOK-02 | Rundenprotokoll-Notiz im Repo `tagebuch` ergänzen | `AGENTS.md` (WS) | — | E3 (`koordination`) | R; gehört in Projekt-Skill | B |
| WS-DOK-03 | Sprint-Zuordnung in Jira prüfen und bei Bedarf nachziehen | `AGENTS.md` (WS) | — | E3 (`koordination`) | R; gehört in Projekt-Skill | B |
| WS-DOK-04 | Sprint-Arbeit per Label kennzeichnen (`sprint-goal`, `sprint-support`, `sprint-admin`, `sprint-unplanned`) | `AGENTS.md` (WS) | — | E3 (`koordination`) | R; gehört in Projekt-Skill | B |

## B7 — Commit-Praxis

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| SA-COM-01 | Conventional Commits sind Standard | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS), `SE`, `KO` | E2 | R (4 ×) | B |
| SE-COM-01 | Jira-Key im Commit-Betreff (nicht nur Body oder Footer) | `shared/entwicklung/SKILL.md` | `koordination/SKILL.md` | E2 | R | B |
| SA-COM-02 | Codex-Agenten-Identität: `GPT Codex Agent` / `gpt-codex-agent@gpt.invalid` | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS), `JS` | E2 | R (3 ×) | A |
| SA-COM-03 | `git-as-codex.sh`-Helper für alle Git-Schreibvorgänge von Codex-Agenten | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS), `JS` | E2 | R (3 ×) | A |
| SA-COM-04 | Kleine, fachlich zusammenhängende Commits; pro Repo separat committen | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS), `SE` | E2 | R (3 ×) | B |
| SA-COM-05 | Uncommitted Änderungen nicht liegen lassen | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |

## B8 — Werkzeug-Konventionen

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| KO-WZG-01 | `atlassian` aus dem PATH verwenden (kein absoluter Pfad) | `koordination/SKILL.md` | Memory | E2 | M in `shared` | A |
| MM-WZG-01 | `tools-python` statt `python3` / `python`, auch für `-c`-Aufrufe | Memory | — | E2 | M in `shared` | A |
| IM-WZG-01 | `--help` vor unbekannten Befehlen ausführen | Sitzungskontext | — | E2 | I | A |

## B9 — Skill-Struktur und Versionierung

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| SE-SKL-01 | Dauerregeln in versionierten `AGENTS.md` der Skill-Repos | `shared/entwicklung/SKILL.md` | `shared/AGENTS.md` | E2 | – | D |
| SE-SKL-02 | Wiederkehrende Arbeitsgänge in Skills (`SKILL.md`) | `shared/entwicklung/SKILL.md` | — | E3 | – | D |
| SE-SKL-03 | Shared-Regeln ohne Projektbindung ausschließlich in `shared/` | `shared/entwicklung/SKILL.md` | — | E2 | – | D |
| LA-SKL-01 | Projektbindungen (Repo-Namen, Keys, Pfade, Labels) in Projekt-Skill-Repo | `lebenslauf-web-vorlage/AGENTS.md` | `SE` | E2 | – | D |
| SE-SKL-04 | Repo-`AGENTS.md` nur in Skill-Repos; Produkt- und Doku-Repos tragen keine | `shared/entwicklung/SKILL.md` | — | E2 | M (Migration offen) | D |
| SA-SKL-01 | Workspace-`AGENTS.md` (E1) ist nur Bootstrap-Verweis, kein Fachinhalt | `shared/arbeitsregeln/SKILL.md` | `SE` | E1 | R (WS enthält noch Fachinhalt) | D |
| IM-SKL-01 | Alle agent-bezogenen Artefakte (AGENTS.md, Skill-Konfigurationen, Karten-Schemata, Build-Manifeste) werden nicht in Ziel-Repos (Produkt-Repos, Doku-Repos) versioniert — ausschließlich in Skill-Repos | Sitzungskontext | — | E2 | I | D |

## B10 — Git und Branch

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| KO-GIT-01 | Branch-Kontext vor Git-Arbeit prüfen: passt Branch fachlich zur Änderung? | `koordination/SKILL.md` | — | E3 | – | A |
| IM-GIT-01 | Lib/App-Branch-Basis: Lib-Repos nicht auf App-Branch basieren und umgekehrt | Sitzungskontext | — | E3 (`koordination`) | I | A |
| KO-GIT-02 | Doku-/Betriebs-Repos direkt in `main` integrieren (kein feature-/dev-Fluss) | `koordination/SKILL.md` | — | E3 | – | A |
| KO-GIT-03 | Quell-Repos behalten ihren repo-spezifischen Entwicklungs- und Upstream-Fluss | `koordination/SKILL.md` | — | E3 | – | D |

## B11 — Jira-Betrieb

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| JS-JRA-01 | Cache-Regel: `cache-recipes/` vor wiederkehrenden Jira-Befehlen prüfen | `jira-state-sync/SKILL.md` | — | E3 | – | A |
| JS-JRA-02 | Remote-Link-Regel: ein kanonischer Remote-Link pro Vorgang in Jira | `jira-state-sync/SKILL.md` | — | E3 | – | B |
| KO-JRA-01 | Jira-Schreibpfad: `atlassian jira http …` (oder `jira ext …`) | `koordination/SKILL.md` | — | E3 | – | A |
| IM-JRA-01 | `blocks` vs. `relates`: Jira-Link-Typen korrekt und bewusst wählen | Sitzungskontext | — | E3 (`koordination`) | I | C |
| IM-JRA-02 | Lokaler Mirror: Zustand prüfen bevor Sync ausgelöst wird | Sitzungskontext | — | E3 (`jira-state-sync`) | I | A |
| JS-JRA-03 | Jira-State-Sync-Ablauf: Journal anlegen, Cache initialisieren, Keys gezielt verarbeiten | `jira-state-sync/SKILL.md` | — | E3 | – | B |

## B12 — Mehrsprachigkeit DE/EN

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| DI-I18-01 | DE/EN-Parität: öffentliche Pages-Seiten immer in DE und EN anlegen | `docs-i18n/SKILL.md` | — | E3 | – | B |
| DI-I18-02 | Deutsch ist redaktionelle Quelle; Englisch ist Pflicht-Übersetzung | `docs-i18n/SKILL.md` | — | E3 | – | C |
| DI-I18-03 | DE/EN-Sync: Jira-Freitext auf öffentlichen Seiten immer übersetzen | `docs-i18n/SKILL.md` (unvollständig) | — | E3 | I | B |
| DI-I18-04 | Sprachknopf immer mit deterministischem Gegen-Ziel pflegen | `docs-i18n/SKILL.md` | — | E3 | – | B |

## B13 — Koordination (multi-repo)

| Nr. | Regel | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| KO-KRD-01 | Betroffene Repos und Ziel-Artefakte vor Beginn bestimmen | `koordination/SKILL.md` | — | E3 | – | A |
| KO-KRD-02 | Repo-übergreifende Regeln nicht in ein einzelnes Repo quetschen | `koordination/SKILL.md` | — | E3 | – | D |
| KO-KRD-03 | Repo-Rollen des Projektverbunds kennen | `koordination/SKILL.md` + `references/repos.md` | — | E3 | – | D |
| KO-KRD-04 | Jira-Änderungen und öffentliche Doku gemeinsam abschließen (kein halbfertiger Zustand) | `koordination/SKILL.md` | — | E3 | – | B |

## B14 — Ebene 4 / GitHub Pages (Grenzprinzip, Autorenkonvention, Build)

| Nr. | Regel / Anforderung | Ursprung | Weitere Orte | Soll-Ebene | Problem | Prüfkat. |
| --- | --- | --- | --- | --- | --- | --- |
| J1-E4P-01 | Grenzprinzip: GitHub Pages = SSOT Policies; AGENTS/Skills = Direktiven + Verweis | `J01-113/index.md` | — | E4 | Entscheidung offen | D |
| J1-E4P-02 | Grenzprinzip: keine Duplizierung von Policies zwischen AGENTS.md und Pages | `J01-113/index.md` | — | E2/E3 | fehlt formal | D |
| J1-E4P-03 | Grenzprinzip: agentenspezifische Direktiven gehören nicht in Pages | `J01-113/index.md` | — | E4 | Entscheidung offen | D |
| J1-E4P-04 | Architekturentscheidung A–D: Verhältnis GitHub Pages ↔ KI-Agent-Ebenen | `J01-113/index.md` | — | — | offen | D |
| J1-E4P-05 | Kompilierbare Pages-Inhalte brauchen Manifest-Metadaten (Ziel-Ebene, Ziel-Datei, Granularität, Format) | `J01-113/index.md` (Diskussion) | — | E4 | fehlt | D |
| J1-E4P-06 | Build-Trigger für Kompilation definieren (CI-Pipeline, Commit-Hook oder Agent-Konvention) | `J01-113/index.md` (Diskussion) | — | — | offen | D |
| J1-E4P-07 | Autorenkonvention: Strukturpflicht — explizite Abschnitte Regel / Ausnahme / Prüfkriterium | `J01-113/index.md` | — | E4 | fehlt | D |
| J1-E4P-08 | Autorenkonvention: normative Sprache (RFC-2119 Muss/Soll/Kann) | `J01-113/index.md` | — | E4 | fehlt | C |
| J1-E4P-09 | Autorenkonvention: Granularität — eine Regel = eine klare Adresse | `J01-113/index.md` | — | E4 | fehlt | D |
| J1-E4P-10 | Autorenkonvention: Verlinkbarkeit — Regeln per Permalink einzeln referenzierbar | `J01-113/index.md` | — | E4 | fehlt | B |
| J1-E4P-11 | Autorenkonvention: Aktualitätssignal — Stand-Datum auf jeder Policy-Seite | `J01-113/index.md` | — | E4 | fehlt | B |
