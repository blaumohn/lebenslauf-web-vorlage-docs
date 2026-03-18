#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
cd "$script_dir/.."

rm -rf en/mirror
mkdir -p en
cp -R mirror en/mirror

find en/mirror -name '*.md' -print0 | xargs -0 perl -0pi -e '
  s#permalink: /de/#permalink: /en/#g;
  s#\{\{ "/de/#{{ "/en/#g;
  s/title: "Jira"/title: "Jira"/g;
  s/Jira: Sprint/Jira: Sprint/g;
  s/Jira: Backlog/Jira: Backlog/g;
  s/Jira: Erledigt/Jira: Done/g;
  s/Die öffentliche Jira-Fläche zeigt Überblick, Status und Vorgangsseiten in\neinem gemeinsamen System\./The public Jira area shows overview, status, and issue pages in one shared system\./g;
  s/Öffentliche Jira-Fläche \(ohne Jira-Cloud-Links\)\./Public Jira area \(without Jira Cloud links\)\./g;
  s/Sprint-Sicht der öffentlichen Jira-Fläche \(ohne Jira-Cloud-Links\)\./Sprint view of the public Jira area \(without Jira Cloud links\)\./g;
  s/>Kontext</>Context</g;
  s/>Diese Seite</>This page</g;
  s/>Übergeordnet</>Parent</g;
  s/>Öffentliche Schritte</>Public steps</g;
  s/>Übersichten</>Overviews</g;
  s/Jira-Start/Jira home/g;
  s/## Metadaten/## Metadata/g;
  s/## Aufgaben/## Tasks/g;
  s/## Beschreibung/## Description/g;
  s/## Unteraufgaben/## Subtasks/g;
  s/## Angaben/## Details/g;
  s/## Ohne Epic/## Without Epic/g;
  s/## Erledigt/## Done/g;
  s/Sprint-Ziel/Sprint Goal/g;
  s/Admin \/ Rahmen/Admin \/ Framework/g;
  s/Ungeplant/Unplanned/g;
  s/Unklassifiziert/Unclassified/g;
  s/- \*\*Typ:\*\*/- **Type:**/g;
  s/- \*\*Schritt:\*\*/- **Step:**/g;
  s/- \*\*Sprint:\*\*/- **Sprint:**/g;
  s/- \*\*Aktualisiert:\*\*/- **Updated:**/g;
  s/Vorgangsseiten/Issue pages/g;
  s/Keine Vorgänge\./No issues\./g;
  s/Keine Aufgaben\./No tasks\./g;
  s/Keine Unteraufgaben\./No subtasks\./g;
  s/Erledigte Betriebe/Completed operations/g;
  s/Erledigter/Completed/g;
  s/Erledigte/Completed/g;
  s/Erledigt/Done/g;
  s/Zu erledigen/To Do/g;
  s/In Bearbeitung/In Progress/g;
  s/In Überprüfung/In Review/g;
'
