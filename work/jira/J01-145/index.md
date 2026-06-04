---
layout: page
title: "J01-145 — Laufende Doku-Wartung Sprint 4"
permalink: /de/jira/issues/J01-145/
jira_key: J01-145
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für laufende Doku-Wartung im aktuellen
Sprint-Kontext.

## Ziel

- Kleine Doku-Korrekturen und Policy-Schärfungen werden in einem laufenden
  Sprint-Vorgang gesammelt, wenn kein spezifischer fachlicher Vorgang passt.
- Jede zugehörige Änderung trägt `J01-145` im Commit-Titel, damit die
  spätere Zuordnung automatisierbar bleibt.
- Die Vorgangsseite hält eine einfache Änderungsliste als nachvollziehbares
  Wartungsprotokoll.

## Aktueller Stand

- `J01-145` ist als laufender Doku-Wartungsvorgang angelegt.
- Jira-Metadaten:
  - Status: `In Bearbeitung`
  - Sprints: `SCRUM Sprint 4` (geschlossen), `SCRUM Sprint 5` (aktiv)
  - Labels: `docs`, `policy`, `sprint-admin`, `sprint-unplanned`
- Die erste Änderung schärft die Programmierleitlinien unter
  `policies/programmierleitlinien/#fachliche-stilregeln`.
- `J01-113` bleibt der allgemeine Regelwerks- und Architekturkontext; diese
  konkrete laufende Doku-Wartung wird hier geführt.

## Commit-Liste

| Datum | Commit-Spur | Betroffene Vorgänge | Bereich | Änderung |
| --- | --- | --- | --- | --- |
| 2026-05-11 | `docs: laufende doku-wartung verankern (J01-145)` | `J01-145`, `J01-113` | Programmierleitlinien | Fachliche Stilregeln erklären den von oben nach unten lesbaren Hauptfluss von Programmdateien ohne starre Sortierpflicht; `J01-113` verweist nur auf diesen laufenden Wartungsvorgang. |
| 2026-05-11 | `docs: doku-commits im recent-feed trennen (J01-145)` | `J01-145` | Letzte Änderungen | Doku-Commits werden auf `/recent/` in einer eigenen Tabelle angezeigt. |
| 2026-05-11 | `docs: recent-feed mit inhaltsliste erweitern (J01-145)` | `J01-145` | Letzte Änderungen | `/recent/` zeigt eine Inhaltsliste und bis zu 10 Projekt-/Konfigurationscommits plus 10 Doku-Commits. |
| 2026-05-11 | `fix: recent-ui-texte im include aufloesen (J01-145)` | `J01-145` | Letzte Änderungen | Das Include löst die Sprache vor dem Zugriff auf `_data/ui.yml` auf, damit Inhaltslinks und Abschnittstitel nicht leer bleiben. |
| 2026-05-12 | offen | `J01-145` | Programmierleitlinien | Fachliche Stilregeln sind in prüfbare Unterbereiche gegliedert; Fallbacks werden als eigene Programmpfad-Zweige beschrieben, die Fehler nicht verdecken dürfen. |
| 2026-05-12 | offen | `J01-145`, `J01-34` | Jira-Seiten-Sync | Der EN-Sync überschreibt manuell gepflegte englische Jira-Seiten nicht mehr mit generierten DE-Seiten; `J01-34` bleibt nach `prepare-site.sh` englisch. |
| 2026-05-28 | offen | `J01-145` | Skills / Doku-Hygiene | Lokale Skills werden inventarisiert; Skill-Markdown verweist knapper auf kanonische Quellen und automatisierte Prüfungen; Pre-Commit-Hooks prüfen Skill-Links, Skriptverweise, `tools-python` und Shared-/Projekt-Trennung. |
| 2026-05-28 | offen | `J01-145` | Skill-Tooling / Linting | Shellcheck ist im Skill-Repo verpflichtender Hook-Bestandteil; aktive Shell-Skripte wurden lintkonform aktualisiert, statt Befunde auszublenden. |
| 2026-05-28 | offen | `J01-145` | Skills / Markdown-Reduktion | Die zweite Kürzungsrunde entfernt Hook-prüfbare Detailchecklisten aus Shared- und Projekt-Skills; die Skills behalten Geltung, kanonische Abläufe, maßgebliche Quellen und nicht automatisierbare Entscheidungen. |
| 2026-06-04 | offen | `J01-145` | README-/Doku-Sync | Das Doku-Repo richtet im Hauptrepo einen `pre-commit`-Hook ein, der `README.md` und `README.en.md` gegen die markierten Public-Doku-Abschnitte prüft. |
| 2026-06-04 | offen | `J01-145` | README-UX-Quelle | Schnellstart und private Ansicht in README und Public-Doku werden aus `tests/ci/readme-dev-user-flow.sh` übernommen; fehlende Quellfunktionen blockieren den Generator. |
| 2026-06-04 | offen | `J01-145` | README-/Doku-Einstieg | `getting-started/` ist als sichtbarer Hub nachgezogen; README-Abschnitte verweisen auf Doku und belegende Quell-/Fachseiten, inklusive berechneter Zeilenanker für getestete Abläufe. |

## Überprüfung

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Laufender Vorgang | Doku-Wartung läuft nicht über einen allgemeinen Altvorgang | `J01-145` | erledigt |
| DE/EN-Policy | Deutsche und englische Programmierleitlinie sind inhaltlich gleichwertig | `policies/programmierleitlinien/`, `en/policies/programmierleitlinien/` | erledigt |
| Keine starre Sortierpflicht | Die Regel beschreibt Lesbarkeit und fachlichen Hauptfluss statt mechanischer Umordnung | Abschnitt `Fachliche Stilregeln` | erledigt |
| Fallback-Regel | Fallbacks sind nur als gültige, benannte und getestete Programmpfad-Zweige zulässig | Abschnitt `Fallbacks verdecken keine Fehler` | erledigt |
| EN-Sync schützt manuelle Seiten | Manuell gepflegte EN-Jira-Seiten behalten ihre Übersetzung nach `prepare-site.sh` | `scripts/sync-en-jira-pages.sh`, `en/work/jira/J01-34/index.md` | erledigt |
| Remote-Link | Jira verweist auf die kanonische öffentliche Arbeitsdoku | Jira-Remote-Link auf `/de/jira/issues/J01-145/` | erledigt |
| Skill-Inventar | Lokale Skills sind maschinenlesbar inventarisiert und reproduzierbar erzeugbar | `.agents/skills/lebenslauf-web-vorlage/skills/README.md`, `scripts/verify-skills.sh --check-index` | erledigt |
| Pre-Commit-Hook | Hook-Template ist versioniert und per Installationsskript einrichtbar | `.agents/skills/lebenslauf-web-vorlage/scripts/hooks/pre-commit`, `scripts/install-hooks.sh` | erledigt |
| Skill-Hygiene | Frontmatter, eindeutige Namen, Links, Skriptverweise, `tools-python` und projektfreie Shared-Regeln werden automatisiert geprüft | `.agents/skills/lebenslauf-web-vorlage/scripts/verify-skills.sh` | erledigt |
| Shellcheck | Aktive Shell-Skripte bestehen Shellcheck und der Hook blockiert neue Befunde | `.agents/skills/lebenslauf-web-vorlage/scripts/hooks/pre-commit` | erledigt |
| Skill-Markdown-Reduktion | Hook-prüfbare Detailregeln stehen nicht mehr als operative Checklisten in den betroffenen Skills | `.agents/skills/shared/`, `.agents/skills/lebenslauf-web-vorlage/skills/`, `scripts/verify-skills.sh --check-index` | erledigt |
| README-Sync-Hook | Hauptrepo-READMEs werden vor dem Commit gegen die Public-Doku geprüft | `scripts/hooks/project-pre-commit`, `scripts/sync-readme.py --check`, `tests/project-pre-commit-hook.sh` | erledigt |
| README-UX-Quelle | Die README-Programmpfade kommen aus dem ausführbaren README-UX-Test | `tests/ci/readme-dev-user-flow.sh`, `scripts/sync-readme.py`, `tests/project-pre-commit-hook.sh` | erledigt |
| README-/Doku-Hub | `getting-started/` verlinkt die README-nahen Einstiegsperspektiven direkt | `getting-started/index.md`, `en/getting-started/index.md` | erledigt |
| Beleglinks | Überblick und technische Besonderheiten stützen zentrale Aussagen mit Links auf Specs, Bereiche oder Arbeitsdoku | `de/getting-started/*`, `en/getting-started/*`, `README.md`, `README.en.md` | erledigt |
| Zeilenanker | Quellverweise für getestete README-Abläufe enthalten berechnete GitHub- bzw. lokale Zeilenbereiche | `scripts/sync-readme.py`, `tests/ci/readme-dev-user-flow.sh` | erledigt |

## Offene Punkte

- Der Vorgang bleibt offen, solange kleinere zusammengehörige
  Doku-Wartungen im Sprint keinen eigenen spezifischen Vorgang brauchen.
- Größere fachliche Änderungen bekommen weiterhin einen eigenen Vorgang.

## Links

- [Programmierleitlinien]({{ "/de/policies/programmierleitlinien/" | relative_url }})
- [J01-113 — Regelwerk-Bereinigung]({{ "/de/jira/issues/J01-113/" | relative_url }})
- [SCRUM Sprint 4]({{ "/de/work/sprints/scrum-sprint-4/" | relative_url }})
- [SCRUM Sprint 5]({{ "/de/work/sprints/scrum-sprint-5/" | relative_url }})
