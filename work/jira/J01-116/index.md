---
layout: page
title: "J01-116: Öffentliche Jira-Issue-Seiten konsistent spiegeln"
jira_key: J01-116
jira_parent_key: J01-84
permalink: /de/jira/issues/J01-116/
---

**Stand:** 2026-03-24

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kanonischer öffentlicher Arbeitsstand für `J01-116`.
Der Vorgang schärft die öffentliche Jira-Fläche so, dass eine
Vorgangsseite den Jira-Zustand wieder lesbar spiegelt, ohne die
Arbeitsteilung zwischen Jira und GitHub Pages zu verwischen.

## Quellenbasis

- [Bereich: Jira- und Doku-Tooling]({{ "/de/areas/proj-doku-tooling/" | relative_url }})
  und [Jira-Übersicht]({{ "/de/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }}):
  GitHub Pages bleibt öffentlicher Doku-Ort, Jira bleibt SSOT für Vorgänge
  und Status.
- [J01-91: Zustand/Vorhaben (Snapshot)]({{ "/de/jira/issues/J01-91/" | relative_url }}):
  dieselbe SSOT-Trennung ist dort als öffentliche Arbeitsregel benannt.
- [J01-107: Jira-Metadaten für Migrationsvorgänge aus J01-91 präzisieren]({{ "/de/jira/issues/J01-107/" | relative_url }}):
  Beziehungen sollen nicht nur in Fließtext, sondern sichtbar in Jira-Metadaten
  liegen.
- [J01-108: Öffentliche Jira-Vorgangsseiten ohne Übersichten-Kiste]({{ "/de/jira/issues/J01-108/" | relative_url }}):
  Vorgangsseiten sollen echten Kontext zeigen, keine zweite Navigationskiste.
- [Runbook: öffentliche Jira-Fläche aktualisieren]({{ "/de/operations/runbook/" | relative_url }}):
  Subtasks ohne zusätzliche Angaben bleiben beim Parent und bekommen keine
  eigene Detailseite.

## Ziel

- Parent-Seiten wie `J01-31`, `J01-9` und `J01-13` zeigen keine toten
  Unteraufgaben-Links mehr.
- Öffentliche Vorgangsseiten zeigen die nötigen Jira-Metadaten:
  Bearbeitung, Priorität, aktiven Sprint, Sprint-Rolle und verknüpfte
  Vorgänge.
- Die Jira-Beschreibung wird auf generierten Parent-Seiten sichtbar statt
  als Platzhalter `-`.
- Die Kontextleiste bleibt knapp und zeigt nur echten Vorgangsbezug.

## Aktueller Stand

- Ein neuer Vorgang `J01-116` ist angelegt, dem aktiven Sprint zugeordnet
  und mit `J01-31`, `J01-104` und `J01-107` verknüpft.
- Der öffentliche Generator zieht jetzt `description` und `issuelinks`
  aus Jira in Cache und öffentliche Projektion nach.
- Parent-Seiten verlinken Unteraufgaben nur noch dann, wenn eine echte
  öffentliche Schrittseite vorhanden ist.
- Generierte Übersichten und Vorgangsseiten verweisen bei öffentlichen
  Subtask-Arbeitsdokus auf die tatsächlich vorhandene öffentliche Seite;
  fehlende Detailseiten bleiben lesbarer Text ohne Link.
- Die öffentliche Projektion enthält jetzt zusätzlich aktiven Sprint,
  Sprint-Rolle, Labels und normierte Jira-Verknüpfungen.
- Vorgangsseiten bündeln Jira-Metadaten und Jira-Beziehungen jetzt in einem
  einzigen oberen Zustands- und Beziehungsblock.
- Der separate Kontextblock unterhalb davon zeigt nur noch echte
  Seiten-Navigation wie öffentliche Schritte.
- Die Projektverwaltungs-Skills haben jetzt lokale Docker-Compose-Checks als
  kanonischen Agenten-Prüfweg. `project-admin.sh check` ruft denselben
  Compose-Pfad auf wie die Skill-Pre-Commit-Hooks.
- `project-admin.sh issue-draft --assist --from-note <datei>` erzeugt jetzt
  einen validierten JSON-Vorgangsentwurf über einen `npx codex`-Adapter. Der
  Betrieb nutzt KI nur für Formulierungsvorschläge und schreibt nicht nach
  Jira.
- `project-admin.sh page-draft --assist --issue <KEY>` erzeugt jetzt einen
  validierten JSON-Seitenentwurf für bestehende Jira-Vorgänge. Der Betrieb
  nutzt Jira-Cache oder Jira Cloud als Quelle und schreibt nicht nach Jira
  oder in die öffentliche Doku.
- `project-admin.sh page-apply --draft <datei>` wendet einen geprüften
  Seitenentwurf kontrolliert an: Der Befehl validiert JSON, Zielpfad und
  Permalink, schreibt nur fehlende Zielseiten und startet danach Sync und
  gezielte Verifikation für Vorgang und Parent.
- Einzelne Jira-Cache-Updates übernehmen Fehlerantworten wie `401 Unauthorized`
  nicht mehr als Vorgangsdaten. Eine Einzelantwort muss den angeforderten
  Jira-Key und einen Issue-Typ enthalten, bevor `issues.json` oder
  `subtasks.json` verändert werden.
- `project-admin.sh install-user-bin` kann den Einstieg als `j01-admin` nach
  `~/.local/bin` verlinken; der Einstieg löst Symlinks auf und findet dadurch
  weiterhin das Skill-Repo.
- Regressionen für EN-Sync und gezielte EN-Sprachdrift-Prüfung sind in Docs-
  und Skill-Tests abgesichert.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Tote Subtask-Links entfernt | `J01-31`, `J01-9`, `J01-13` und generierte Übersichten zeigen unverlinkte Subtasks ohne Detailseite | öffentliche Jira-Vorgangsseiten + `tests/public-jira-links.sh` | erledigt |
| Metadaten sichtbar | Bearbeitung, Priorität, aktiver Sprint und Sprint-Rolle sind sichtbar | `_includes/jira-state-head.html` und generierte Vorgangsseiten | offen |
| Verknüpfungen sichtbar | Vorgangsseiten zeigen Jira-Issue-Links im oberen Zustands- und Beziehungsblock | `_data/jira_pages/issues.json`, `_includes/jira-state-head.html`, Vorgangsseiten | offen |
| Beschreibung gespiegelt | Jira-Description erscheint auf generierten Parent-Seiten | öffentliche Jira-Vorgangsseiten | offen |
| DE/EN konsistent | EN-Ableitung übernimmt dieselbe Struktur und Begriffe | `/en/jira/issues/...` | offen |
| Lokale Skill-Erzwingung | KI-Agenten, Hooks und manuelle Checks nutzen denselben Docker-Compose-Prüfweg | `.agents/skills/*/docker-compose.yml`, `scripts/project-admin.sh check` | erledigt |
| KI-Assistenz für Vorgangsentwürfe | Der Assist-Befehl erzeugt nur validierte JSON-Entwürfe und keine Jira-Schreiboperationen | `.agents/skills/lebenslauf-web-vorlage/scripts/project-admin.sh`, `tests/issue-draft.sh` | erledigt |
| KI-Assistenz für Seitenentwürfe | Der Assist-Befehl erzeugt nur validierte JSON-Seitenentwürfe und keine Jira- oder Doku-Schreiboperationen | `.agents/skills/lebenslauf-web-vorlage/scripts/project-admin.sh`, `tests/page-draft.sh` | erledigt |
| Apply-Schritt für Seitenentwürfe | Geprüfte Seitenentwürfe werden nur auf sichere, fehlende Zielpfade geschrieben; Sync und Verifikation laufen anschließend für Vorgang und Parent | `.agents/skills/lebenslauf-web-vorlage/scripts/project-admin.sh`, `tests/page-apply.sh` | erledigt |
| Cache-Fehlerantworten | Jira-Fehlerantworten werden bei Einzel-Updates blockiert und nicht in den lokalen Sync-Cache geschrieben | `.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/update-jira-sync-cache.sh`, `tests/update-jira-sync-cache.sh` | erledigt |

## Links

- [J01-31]({{ "/de/jira/issues/J01-31/" | relative_url }})
- [J01-107]({{ "/de/jira/issues/J01-107/" | relative_url }})
- [J01-108]({{ "/de/jira/issues/J01-108/" | relative_url }})
- [Jira-Arbeitsdokus]({{ "/de/jira/" | relative_url }})
