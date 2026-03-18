---
layout: page
title: Jira work doc template
permalink: /en/templates/jira-arbeitsdoku/
---

```text
J01-<KEY>: <Title>

Stand: YYYY-MM-DD

<div class="jira-context-bar">
  <span class="jira-context-bar__label">Context</span>
  <a class="jira-context-bar__link" href="<Mirror issue page>">
    J01-<KEY> in the Jira mirror
  </a>
</div>

Short context
- Canonical public work status for `J01-<KEY>`.
- 1-2 sentences: what is this issue about, and why is it publicly relevant here?

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
