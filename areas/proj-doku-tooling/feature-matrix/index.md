---
layout: page
title: "Feature-Matrix: Jira- und Doku-Tooling"
permalink: /de/areas/proj-doku-tooling/feature-matrix/
---

## Zweck

Diese Matrix dokumentiert den aktuellen Zustand der Tooling-Features im Bereich
Jira- und Doku-Tooling.
Die Zeilen beschreiben Betriebe bzw. Unter-Features, nicht einzelne Dateien.

## Instanz-Regeln

- Thema: Jira-, Doku- und Agenten-Tooling im Projektverbund
- Pflichtspalten bleiben unverändert
- Zusatzspalten dieser Instanz:
  - `Zielort-Kandidat`
  - `direkte Abhängigkeit`
- Zulässige Werte für `Zustand in der Tooling-Folge`:
  - `Skill-Anweisungen`
  - `Skill-Skript`
  - `Skript außerhalb Skills`

## Matrix

| Feature / Betrieb | Ober-Feature | Zweck | Zustand in der Tooling-Folge | aktuelle Heimat | Implementierungsorte | Ist-Begründung | Kandidat für spätere Reifung | Wechsel nur nach | Zielort-Kandidat | direkte Abhängigkeit | Notiz |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Site vorbereiten | lokale GitHub-Pages-Vorschau | vor der lokalen Vorschau den Doku-Baum vorbereiten | Skript außerhalb Skills | `lebenslauf-web-vorlage-docs/scripts` | `scripts/prepare-site.sh`, `scripts/sync-en-mirror.sh` | wird direkt vom Preview-Container aufgerufen und bleibt deshalb im Repo-Betrieb | ja | separater Architekturentscheid | Doku-Repo oder Tooling-Repo | `ghpages-container.sh`, Docker-Preview | nur Container-/Build-Vorläufe bleiben im Doku-Repo |
| Mirror-Seiten rendern | Jira-Mirror aktualisieren | den statischen Jira-Spiegel erzeugen und inkrementell nachziehen | Skill-Skript | Projekt-Skill-Repo | `shared-tooling/jira-pages/update-jira-mirror.sh`, `shared-tooling/jira-pages/jira-adf-to-text.jq` | wurde als agentennahe Hilfslogik aufgebaut und ist noch nicht auf dauerhafte Heimat abgestimmt | ja | Zerlegung und Architektur-Abstimmung | Doku-Repo oder Tooling-Repo | Jira-Daten, `mirror/`, EN-Ableitung | Ober-Feature selbst wird nicht als eigene Zeile bewertet |
| Jira-Snapshot-Cache aktualisieren | Jira-/Pages-Sync journalisieren | lokale Jira-Snapshots für bekannte Änderungen nachziehen | Skill-Skript | Projekt-Skill-Repo | `shared-tooling/jira-pages/update-jira-sync-cache.sh` | skillnaher Journal-Baustein ohne freigegebene dauerhafte Repo-Heimat | ja | Zerlegung und Architektur-Abstimmung | Tooling-Repo | Jira-API, `.local/jira-sync-cache/` | Kandidat für spätere Entkopplung |
| GitHub-Pages-Änderungen erkennen | Jira-/Pages-Sync journalisieren | geänderte GitHub-Pages-Ziele aus einem Git-Diff ableiten | Skill-Skript | Projekt-Skill-Repo | `shared-tooling/jira-pages/detect-ghpages-link-changes.sh` | Hilfsskript für Agenten-Läufe, kein eigenständiger Repo-Betrieb | ja | Zerlegung und Architektur-Abstimmung | Tooling-Repo | Git-Historie, Front-Matter | dateiunabhängig als Unter-Feature geführt |
| Betroffene Jira-Keys aus Pages-Änderungen ableiten | Jira-/Pages-Sync journalisieren | aus geänderten Pages-Zielen die betroffenen Jira-Keys rückwärts finden | Skill-Skript | Projekt-Skill-Repo | `shared-tooling/jira-pages/find-jira-keys-for-ghpages-changes.sh` | gehört fachlich zum journalisierten Sync und nicht zum normalen Doku-Repo-Betrieb | ja | Zerlegung und Architektur-Abstimmung | Tooling-Repo | `mirror/`, Pages-URLs | nur als Folge-Kandidat markiert |
| GitHub-Pages-Ziele gegen Jira prüfen | Jira-/Pages-Sync journalisieren | aus Jira importierte Doku-Ziele lokal bestätigen | Skill-Skript | Projekt-Skill-Repo | `shared-tooling/jira-pages/verify-jira-ghpages-links.sh` | skillnaher Prüfbaustein, bisher ohne abgestimmte dauerhafte Heimat | ja | Zerlegung und Architektur-Abstimmung | Tooling-Repo | Jira-Remote-Links, lokale Permalinks | nicht als kanonischer Repo-Betrieb behandeln |

## Auswertung

- Das Doku-Repo behält in diesem Themenblock nur die heute nötigen
  Container-/Build-Vorläufe.
- Die übrigen Helfer liegen zunächst im Projekt-Skill-Repo.
- Spätere Übergänge in Ziel- oder Tooling-Repos bleiben bewusst offene
  Kandidaten und sind nicht Teil von `J01-92`.
