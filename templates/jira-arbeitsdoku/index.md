---
layout: page
title: Jira-Arbeitsdoku-Vorlage
permalink: /de/templates/jira-arbeitsdoku/
---

```text
J01-<KEY>: <Titel>

Stand: YYYY-MM-DD

{% include jira-state-head.html %}

{% include jira-work-context.html %}

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

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Kurzkontext
- Schrittspezifischer öffentlicher Arbeitsstand für
  [<PARENTNR>-<SCHRITTNR>](<Öffentliche-Schrittseite>) unter
  [J01-<PARENTKEY>](<Öffentliche-Elternseite>).
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

- <Schrittseite>
- <Elternseite>
- ...
```

Optional für normale Vorgangsseiten:

```text
jira_parent_key: J01-<PARENT>
```

Damit bleibt der übergeordnete Vorgang auch dann im Kontextblock sichtbar,
wenn die Seite unter einem Epic oder Parent-Vorgang hängt.
