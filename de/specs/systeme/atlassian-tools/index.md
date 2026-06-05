---
layout: page
title: "Spec: atlassian-tools"
permalink: /de/specs/systeme/atlassian-tools/
---

`atlassian-tools` ist die technische Brücke zwischen dem Projekt und den
Atlassian-Systemen.

## Was es ist

- ein Tooling-System für Jira- und Confluence-nahe API-Aufrufe
- die Kombination aus `atlassian`-CLI und `atlassian-http-client`
- ein Sicherheits- und Betriebsrahmen für kontrollierte Requests

## Was es nicht ist

- nicht Jira selbst
- nicht die öffentliche Doku
- nicht das allgemeine Skill- oder Notizsystem

## Warum

- Jira-Schreib- und Leseoperationen sollen wiederholbar und sicher laufen
- Tokens und technische Request-Logik sollen nicht im Aufrufer liegen

## Aufbau

- `atlassian-http-client`
- `atlassian`-CLI
- `jira ext ...`-Betriebe

## Rollen

- Tool-Eigentümer hält Secrets und Config
- Aufrufer nutzen nur die CLI
- Projektabläufe nutzen die sicheren Kurzbefehle oder HTTP-Pfade

## Schnittstellen

- bedient das [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- wird in Skills und Runbooks benutzt
- liefert technische Basis für den Jira-State-Sync

## Ist und Zielbild

- Ist:
  - Systemüberblick und API-Betriebe sind bereits öffentlich beschrieben
- Zielbild:
  - `atlassian-tools` ist als eigenes Subsystem klar im Projekt verankert

## Übergeordnete Systeme

- [Projekt-Gesamtsystem]({{ "/de/specs/projekt/" | relative_url }})

## Untergeordnete Systeme

- HTTP-Client
- CLI
- Ext-Betriebe

## Verwandte Systeme

- [Jira-System]({{ "/de/specs/systeme/jira-system/" | relative_url }})
- [KI-/Skill-Rahmen]({{ "/de/specs/systeme/ki-skill-rahmen/" | relative_url }})

## Quellen

- [Jira- und Doku-Tooling: Systemüberblick]({{ "/de/areas/proj-doku-tooling/aufbau/" | relative_url }})
- [API-Betriebe]({{ "/de/areas/proj-doku-tooling/api-betriebe/" | relative_url }})
- [J01-91: Bereiche-Inventar]({{ "/de/jira/issues/J01-91/area-inventory/" | relative_url }})
