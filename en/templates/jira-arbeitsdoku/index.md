---
layout: page
title: Jira work doc template
permalink: /en/templates/jira-arbeitsdoku/
---

```text
J01-<KEY>: <Title>

Stand: YYYY-MM-DD

{% include jira-work-context.html %}

Short context
- Canonical public work status for `J01-<KEY>`.
- 1-2 sentences: what is this issue about, and why is it publicly relevant here?
- If the page has at least two `##` sections, the contents key appears below
  automatically with the outline of that page.
- If the same issue has additional public subpages or step pages, the same
  contents key adds those related links.

## Goal

- ...

## Current state

- ...

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| ... | ... | ... | open |

## Closure picture or open points

- ...

## Links

- ...
```

## Variante: öffentliche Schrittseite für einen Subtask

```text
<PARENTNR>-<SCHRITTNR>: <Titel>

Stand: YYYY-MM-DD

{% include jira-work-context.html %}

Short context
- Schrittspezifischer öffentlicher Arbeitsstand für
  [<PARENTNR>-<SCHRITTNR>](<Öffentliche-Schrittseite>) unter
  [J01-<PARENTKEY>](<Eltern-Arbeitsdoku>).
- 1-2 Sätze: Worum geht es, warum braucht genau dieser Subtask eine eigene
  öffentliche Detailseite?
- If the page has at least two `##` sections, the contents key appears below
  automatically with the outline of that page.
- If the parent issue has additional public subpages or step pages, the same
  contents key adds those related links.

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

- <Öffentliche-Schrittseite>
- <Eltern-Arbeitsdoku>
- <weitere Teilseite oder kanonischer Zielort>
- ...
```

Optional for normal issue pages:

```text
jira_parent_key: J01-<PARENT>
```

This keeps the parent issue visible in the context block even if the page's
own canonical work-doc target is not present locally yet.
