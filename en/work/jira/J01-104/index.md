---
layout: page
title: "J01-104: GitHub Pages: Link-Regel für öffentliche Schrittseiten"
jira_key: J01-104
permalink: /en/jira/issues/J01-104/
jira_parent_key: J01-84
---

**Stand:** 2026-03-19

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for Jira task `J01-104` under epic `J01-84`.
This work status systemically carries over the GitHub Pages rule for short,
visible cross-paths inside `work/jira`; Jira Cloud remains only the issue
frame and not the domain home of the rule.

## Ziel

- Policy, template, verification and skill flow describe the same context
  navigation for issues and public step pages.
- Public step pages under `work/jira/<PARENT>/steps/<SUBTASK_KEY>/` stay
  formalized as one variant of the Jira work doc.
- Normal Jira work docs show short, immediately visible cross-paths to parent
  and child public pages.
- Issue families with multiple public pages also show a contents key.
- If a public step page or public subtask work status exists, parent issue,
  counterpart and detail page remain linked consistently.
- The public Jira area now separates entry, backlog, history, and sprint
  board more clearly; backlog lists keep the status visible on every issue
  line.

## Jetzt umgesetzt

- Jira work docs now use one shared context navigation instead of manual
  one-off bars; normal issue pages, subtask work statuses and step pages follow
  the same pattern.
- Verification now checks Jira remote links and the local `work/jira`
  structure without any competing second source family.
- Policy, template, area page, runbook and skill now name the same rule.
- The public Jira area now uses `Backlog`, `History`, and `Sprint Board` as
  clearer primary views; `erledigt/` only remains as a compatibility path to
  history.
- Backlog lists now show each listed issue's status directly in the same line.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Policy defines the rule | `work/jira` is the only public Jira work-doc source; context block and contents key explain parent/child paths | policy + area page | done |
| Jira work docs no longer depend on manual one-off bars | Normal work docs and step pages use the same shared context navigation | this page + other Jira work docs | done |
| Generator and sync stay consistent | Generated overviews and non-manual Jira pages live under `work/jira` | generator + EN sync | done |
| Verification checks the system rule | Public Jira paths are validated only against `work/jira` | verification script + runbook | done |
| Skill flow keeps the rule alive | Docs and sync operations refer only to `work/jira` as public source | skill docs | done |
| Public Jira area stays easy to scan | The entry point separates backlog, history, and sprint board; `erledigt/` only keeps compatibility context | `jira/`, `backlog/`, `history/`, `erledigt/` | done |
| Backlog shows status per issue line | Every listed backlog issue carries a visible status suffix | `backlog/` | done |

## Abschlussbild oder offene Punkte

- The GitHub Pages carry-over is not only visible in pages now; it is anchored
  as a project rule in policy, template, generator, verification and skill
  flow.
- New or refreshed work docs and generator runs therefore keep using the same
  cross-path rule reproducibly.
- The implementation stays fully outside Jira Cloud.

## Links

- [Doku-Richtlinie]({{ "/en/policies/doku-richtlinie/" | relative_url }})
- [Jira-Arbeitsdoku-Vorlage]({{ "/en/templates/jira-arbeitsdoku/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/en/operations/runbook/" | relative_url }})
- [Jira- und Doku-Tooling: Jira-Übersicht (öffentlich)]({{ "/en/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
- [Jira: History]({{ "/en/jira/history/" | relative_url }})
