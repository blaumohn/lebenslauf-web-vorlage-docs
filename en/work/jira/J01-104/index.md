---
layout: page
title: "J01-104: GitHub Pages: Link-Regel für öffentliche Schrittseiten"
jira_key: J01-104
permalink: /en/jira/issues/J01-104/
jira_parent_key: J01-84
---

**Stand:** 2026-03-18

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for Jira task `J01-104` under epic `J01-84`.
This work status systemically carries over the GitHub Pages rule for short,
visible cross-paths between `work/jira` and `mirror`; Jira Cloud remains only
the issue frame and not the domain home of the rule.

## Ziel

- Policy, template, mirror rules, verification and skill flow describe the same
  context navigation for issues and public step pages.
- Public step pages under `work/jira/<PARENT>/steps/<SUBTASK_KEY>/` stay
  formalized as one variant of the Jira work doc.
- Normal Jira work docs and mirror pages show short, immediately visible
  cross-paths to the counterpart and, where available, to parent and child
  public pages.
- If a public step page or public subtask work status exists, parent issue,
  counterpart and detail page remain linked consistently.

## Jetzt umgesetzt

- Jira work docs now use one shared context navigation instead of manual
  one-off bars; normal issue pages, subtask work statuses and step pages follow
  the same pattern.
- The mirror now regenerates the same cross-path logic from local public
  targets and Jira relations, not only from remote-link lists.
- Verification now checks local counterparts between `work/jira` and `mirror`
  in addition to Jira remote links.
- Policy, template, area page, runbook and mirror skill now name the same rule.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| Policy defines the cross-path as a requirement | `work/jira` and `mirror` use a clear context block plus counterpart and parent/child rules for issues and step pages | policy + area page | done |
| Jira work docs no longer depend on manual one-off bars | Normal work docs and step pages use the same shared context navigation | this page + other Jira work docs | done |
| Mirror regenerates the same logic | A mirror refresh renders the short counterpart paths from local structure and Jira relations | mirror pages + generator | done |
| Verification checks the system rule | Missing local counterparts between `work/jira` and `mirror` are reported | verification script + runbook | done |
| Skill flow keeps the rule alive | Mirror operations explicitly include pair and cross-path verification | mirror skill | done |

## Abschlussbild oder offene Punkte

- The GitHub Pages carry-over is not only visible in pages now; it is anchored
  as a project rule in policy, template, generator, verification and skill
  flow.
- New or refreshed work docs and mirror runs therefore keep using the same
  cross-path rule reproducibly.
- The implementation stays fully outside Jira Cloud.

## Links

- [Doku-Richtlinie]({{ "/en/policies/doku-richtlinie/" | relative_url }})
- [Jira-Arbeitsdoku-Vorlage]({{ "/en/templates/jira-arbeitsdoku/" | relative_url }})
- [Runbook: Jira-Übersicht aktualisieren]({{ "/en/operations/runbook/" | relative_url }})
- [Jira- und Doku-Tooling: Jira-Übersicht (öffentlich)]({{ "/en/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
