---
layout: page
title: Jira-Arbeitsdoku-Vorlage
permalink: /de/templates/jira-arbeitsdoku/
---

```text
J01-<KEY>: <Titel>

Stand: YYYY-MM-DD

Kurzkontext
- Kanonischer öffentlicher Arbeitsstand für `J01-<KEY>`.
- 1-2 Sätze: Worum geht es, warum ist der Vorgang hier öffentlich relevant?

## Ziel

- ...

## Aktueller Stand

- ...

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| ... | ... | ... | offen |

## Abschlussbild oder offene Punkte

- ...

## Links

- ...
```

## Variante: öffentliche Schrittseite für einen Subtask

```text
<PARENTNR>-<SCHRITTNR>: <Titel>

Stand: YYYY-MM-DD

Kurzkontext
- Schrittspezifischer öffentlicher Arbeitsstand für
  [<PARENTNR>-<SCHRITTNR>](<Mirror-Schrittseite>) unter
  [J01-<PARENTKEY>](<Eltern-Arbeitsdoku>).
- 1-2 Sätze: Worum geht es, warum braucht genau dieser Subtask eine eigene
  öffentliche Detailseite?

## Ziel

- ...

## Aktueller Stand

- ...

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| ... | ... | ... | offen |

## Abschlussbild oder offene Punkte

- ...

## Links

- <Schritt im Jira-Mirror>
- <Eltern-Arbeitsdoku>
- <Eltern-Issue im Mirror>
- ...
```
