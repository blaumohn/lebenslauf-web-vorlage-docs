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
  s/Jira-Übersicht: Sprint-Board/Jira Mirror: Sprint Board/g;
  s/Jira-Übersicht: Backlog/Jira Mirror: Backlog/g;
  s/Jira-Übersicht: Erledigt/Jira Mirror: Done/g;
  s/Jira-Übersicht/Jira mirror/g;
  s/Jira-Arbeitsdokus/Jira work docs/g;
  s/Statische Jira mirror/Static Jira mirror/g;
  s/Statische Jira mirror \(ohne Jira-Cloud-Links\)\./Static Jira mirror \(without Jira Cloud links\)\./g;
  s/Statische Jira-Übersicht \(ohne Jira-Cloud-Links\)\./Static Jira mirror \(without Jira Cloud links\)\./g;
  s/Sprint-Board als statische Jira-Übersicht \(ohne Jira-Cloud-Links\)\./Sprint board as a static Jira mirror \(without Jira Cloud links\)\./g;
  s/Die Jira-Übersicht zeigt einen statischen Snapshot \(ohne öffentliches Jira\)\./The Jira mirror shows a static snapshot without a public Jira board\./g;
  s/Keine Jira-Cloud-Links, keine E-Mail-Adressen\./No Jira Cloud links, no email addresses\./g;
  s/>Kontext</>Context</g;
  s/>Diese Seite</>This page</g;
  s/>Übergeordnet</>Parent</g;
  s/>Öffentliche Schritte</>Public steps</g;
  s/## Metadaten/## Metadata/g;
  s/## Aufgaben/## Tasks/g;
  s/## Beschreibung/## Description/g;
  s/## Unteraufgaben/## Subtasks/g;
  s/## Angaben/## Details/g;
  s/## Ohne Epic/## Without Epic/g;
  s/Sprint-Ziel/Sprint Goal/g;
  s/Admin \/ Rahmen/Admin \/ Framework/g;
  s/Ungeplant/Unplanned/g;
  s/Unklassifiziert/Unclassified/g;
  s/- \*\*Typ:\*\*/- **Type:**/g;
  s/- \*\*Schritt:\*\*/- **Step:**/g;
  s/- \*\*Sprint:\*\*/- **Sprint:**/g;
  s/- \*\*Aktualisiert:\*\*/- **Updated:**/g;
  s/ Arbeitsdoku/ work doc/g;
  s/ Arbeitsstand/ work status/g;
  s/ im Jira-Mirror/ in the Jira mirror/g;
  s/ als Schritt im Jira-Mirror/ as step in the Jira mirror/g;
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
