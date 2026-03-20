---
layout: page
title: "J01-113: Regelwerk-Bereinigung: Ebenen 1–2–3 trennen und Prüfkategorie-Zuordnung A/B/C/D"
jira_key: J01-113
jira_parent_key: J01-111
permalink: /de/jira/issues/J01-113/
---

**Stand:** 2026-03-20

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-113`.
Der Vorgang bereinigt die KI-Agenten-Regelstruktur im Projektverbund:
Verdoppelungen entfernen, drei Ebenen sauber trennen, je Regel eine formale
Prüfkategorie zuordnen. Zusätzlich klärt der Vorgang die Grenze zwischen
KI-Agenten-Inhalt und GitHub-Pages-Doku und legt fest, wie Doku-Seiten
KI-Agent-wirksam verfasst werden sollen.

## Ziel

### Ebene 1–3 der KI-Agenten-Regelstruktur

- Identische Regeln (Kommunikation, UTF-8, Grammatische Rückmeldung), die
  redundant in Workspace-`AGENTS.md`, `lebenslauf-web-vorlage-docs/AGENTS.md`,
  `atlassian-tools/AGENTS.md` und `tagebuch/AGENTS.md` stehen, auf die
  richtige Ebene konsolidieren.
- Drei Ebenen klar trennen:
  - Ebene 1 — Workspace-`AGENTS.md` außerhalb von Git: nur Bootstrap und
    Verweis auf versionierte Quellen
  - Ebene 2 — versionierte Skill-Repo-`AGENTS.md`: kompakte Laufzeitregeln
    für `shared/` und projektbezogene Skill-Repos
  - Ebene 3 — Skills: Arbeitsabläufe, projektgebunden
- Repo-`AGENTS.md` nicht mehr in Produkt- oder Doku-Repos pflegen, sondern
  ausschließlich in den versionierten Skill-Repos unter `.agents/skills/`.
- Sechs Regeln, die bisher nur implizit im Sitzungskontext existieren, formal
  verankern (u. a. Lib/App-Branch-Basis, DE/EN-Sync, `blocks`-vs-`relates`-
  Typisierung, lokaler Mirror, `--help` vor unbekannten Befehlen).
- Je Regel eine Prüfkategorie zuordnen:
  - A — vor Ausführung (PreToolUse-Hook)
  - B — nach Ausführung, deterministisch (grep/git-Skripte)
  - C — nach Ausführung, semantisch (lokales Modell)
  - D — dateiübergreifend, semantisch (API-Modell)

### Grenze zwischen KI-Agenten-Inhalt und GitHub-Pages-Doku

Manche Inhalte existieren sowohl in AGENTS.md/Skills als auch in GitHub Pages
(z. B. Programmierstil, Runbooks, Dokumentationspflicht). Der Vorgang klärt,
welches Prinzip die Zuordnung regelt:

- **GitHub Pages** = SSOT für Policies, Leitlinien, Runbooks — öffentlich
  versioniert, für Menschen geschrieben.
- **AGENTS.md / Skills** = maschinenlesbare Handlungsanweisungen + Verweise
  auf die kanonische Quelle in GitHub Pages. Kein Duplizieren von Richtlinien.
- Inhalte, die ausschließlich das Agentenverhalten steuern (z. B. „zuerst
  fragen, dann implementieren"), gehören nicht in GitHub Pages.

#### Offene Architekturentscheidung: Verhältnis GitHub Pages ↔ KI-Agent-Ebenen

Das Ladeverhalten unterscheidet GitHub Pages von den drei Agenten-Ebenen:
Ebenen 1–3 sind immer aktiv; GitHub Pages wird nur auf expliziten Verweis hin
wirksam — es ist damit eine lazy-geladene, potenzielle vierte Ebene.
Da beide Seiten (AGENTS.md wie GitHub Pages) in natürlicher Sprache verfasst
sind, trägt das Argument „maschinennahe Direktive vs. menschenlesbar" die
Trennung nicht allein. Der Vorgang entscheidet zwischen vier Optionen:

| Option | Mechanismus | Konsequenz |
| --- | --- | --- |
| A | GitHub Pages formal als Ebene 4 (lazy-geladen) | Klare Hierarchie; Agent muss wissen, wann er dort liest |
| B | Symlink GitHub Pages → Skills | SSOT bleibt in Docs; Skill lädt automatisch mit — Repo-Grenzen problematisch |
| C | Symlink Skills → GitHub Pages | Kanonischer Inhalt liegt im Skill-Repo; Pages bindet per Submodul ein |
| D | GitHub Pages → Hilfsskripte (J01-115) → Skills | Pages bleibt reine Doku; Skripte sind Übersetzungsschicht; setzt maschinenlesbares Format voraus |

Option D verbindet J01-113 und J01-115 direkt und setzt die
Autorenkonvention (strukturierte Seiten) als Voraussetzung voraus.

### KI-Agent-wirksame Doku-Autorenschaft

Damit GitHub-Pages-Seiten tatsächlich als SSOT für Agenten funktionieren,
brauchen sie eine Autorenkonvention. Der Vorgang legt fest:

- **Strukturpflicht**: Policies haben explizite Abschnitte (Regel, Ausnahme,
  Prüfkriterium), damit ein Agent sie auswertbar findet.
- **Normative Sprache**: Muss/Soll/Kann-Formulierungen (RFC-2119-Stil) statt
  rein narrativer Beschreibung.
- **Granularität**: Eine Regel — eine klare Adresse; keine Regelmischung auf
  einer Seite ohne Anker.
- **Verlinkbarkeit**: Regeln müssen per Permalink einzeln referenzierbar sein.
- **Aktualitätssignal**: Jede Policy-Seite führt ein Stand-Datum, damit ein
  Agent erkennen kann, ob die Doku noch gültig ist.

## Aktueller Stand

- Vorgang angelegt, Sprint zugeordnet, Label `sprint-unplanned`.
- Analyse aus Rundenprotokoll 2026-03-20 liegt vor.
- Scope um zwei weitere Dimensionen erweitert (2026-03-20): Grenzziehung
  KI-Agent / GitHub-Pages-Doku und KI-Agent-wirksame Autorenkonvention.
- Vier Architekturoptionen A–D für das Verhältnis GitHub Pages ↔ KI-Agent-Ebenen
  erarbeitet (2026-03-20); Entscheidung offen.
- Zielbild ergänzt (2026-03-20): Repo-`AGENTS.md` nur noch in versionierten
  Skill-Repos; Workspace-`AGENTS.md` außerhalb von Git nur noch als
  Bootstrap-Verweis.
- Architekturentscheidung getroffen (2026-03-20): Option D — GitHub Pages →
  Hilfsskripte (J01-115) → Skills. Noch ohne echtes Skript; erster Schritt ist
  die Definition des `ki_karte`-Formats.
- Neue Regel verankert (2026-03-20): Alle agent-bezogenen Artefakte
  (Schemata, Karten-Definitionen, Build-Manifeste) werden nicht in Ziel-Repos
  versioniert — ausschließlich in Skill-Repos (`IM-SKL-01`).
- Heimatort `ki_karte`-Schema: Skill-Repo (`lebenslauf-web-vorlage` oder
  `shared/`), nicht `lebenslauf-web-vorlage-docs`.
- Umsetzung noch nicht begonnen.

## Regelwerk-Bestandsübersicht

Vollständige Tabelle aller aktuellen Skills, Regeln und Hinweise, geordnet nach
den Anforderungsgruppen von J01-113, steht in der Anlage:

→ [Anlage: Regelwerk-Bestandsübersicht]({{ "/de/jira/issues/J01-113/anlage-regelwerk-bestand/" | relative_url }})

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Keine doppelten Regeln mehr | Kommunikation, UTF-8, Grammatik stehen nur noch in versionierten Skill-Quellen oder kanonischer Doku | Skill-Repos, GitHub Pages | offen |
| Ebenen Bootstrap/Skill-Repo/Skill klar getrennt | WS-Datei verweist nur; Skill-Repo-AGENTS tragen Laufzeitregeln; Skills die Abläufe | Workspace-`AGENTS.md`, Skill-Repos, `SKILL.md` | offen |
| Repo-`AGENTS.md` nur in Skill-Repos | Produkt- und Doku-Repos tragen keine kanonischen Repo-AGENTS mehr | `.agents/skills/shared/`, `.agents/skills/<projekt>/` | offen |
| Sechs implizite Regeln formal verankert | Jede Regel hat eine dokumentierte Quelle in Bootstrap, Skill-Repo-AGENTS oder Skill | Regelwerk-Bestandsdoku | offen |
| Je Regel Kategorie A/B/C/D zugeordnet | Vollständige Tabelle Regel → Kategorie liegt vor | Arbeitsdoku oder Skill | offen |
| Grenzprinzip KI-Agent / GitHub-Pages dokumentiert | Klare Regel: was gehört wohin, was darf nicht dupliziert werden | diese Doku | offen |
| Autorenkonvention für KI-wirksame Doku festgelegt | Strukturpflicht, normative Sprache, Granularität, Permalink, Stand-Datum definiert | Policy-Seite oder Doku-Richtlinie | offen |
| Öffentliche Arbeitsdoku vorhanden | `/de/jira/issues/J01-113/` und `/en/jira/issues/J01-113/` vorhanden | GitHub-Pages-Doku | erledigt |

## Offene Punkte

- Konkrete Zuordnung je Regel ist noch nicht ausgearbeitet.
- Migrationspfad für bestehende Repo-`AGENTS.md` in Produkt- und Doku-Repos
  muss noch konkret terminiert werden.
- Granularitäts-Vermischung in WS § Dokumentationspflicht
  (allgemeine Pflichten vs. Sprint-Details) muss aufgelöst werden.
- Welche bestehenden Policy-Seiten erfüllen die Autorenkonvention bereits,
  welche müssen nachgezogen werden — Bestandsaufnahme fehlt.
- Architekturentscheidung A/B/C/D noch nicht getroffen.

## Links

- [J01-111: Epic KI-Regelwerk-Kohärenz und Prüfarchitektur]({{ "/de/jira/issues/J01-111/" | relative_url }})
- [J01-115: KI-Prüfarchitektur]({{ "/de/jira/issues/J01-115/" | relative_url }})
- [J01-92: Shared-Agent-Regeln und Skill-Versionierung]({{ "/de/jira/issues/J01-92/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
