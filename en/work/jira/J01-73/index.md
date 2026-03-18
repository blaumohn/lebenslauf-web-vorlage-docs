---
layout: page
title: "J01-73: Verify subtask ordering against the export path"
permalink: /en/work/jira/J01-73/
---

**Stand:** 2026-03-17

<div class="jira-context-bar">
  <span class="jira-context-bar__label">Context</span>
  <a class="jira-context-bar__link" href="{{ "/en/mirror/issues/J01-73/" | relative_url }}">J01-73 in the Jira mirror</a>
</div>

Canonical public work status for `J01-73`.
This issue captured the review of how subtasks should be numbered and rendered
consistently across Jira and the public mirror.

## Goal

Clarify subtask ordering against the current export and mirror path so that
reranking, step numbers, and summary prefixes all carry the same public order.

## Closure picture

- The domain decision now lives in [ADR-0003]({{
  "/en/decisions/adr-0003/" | relative_url }}).
- The operational implementation runs through the backfill and prefix path from
  `J01-75` and `J01-78`.
- `J01-73` therefore does not remain a hidden leftover; it closes as completed
  review and decision work.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Public decision basis exists | `ADR-0003` defines rank, step number, and summary prefix as the target model | [ADR-0003]({{ "/en/decisions/adr-0003/" | relative_url }}) | done |
| Operational implementation path is public | The backfill and prefix path is anchored in the runbook | [Runbook: backfill step number and summary prefix]({{ "/en/operations/jira-backfill-schritt-nr/" | relative_url }}) | done |
| Legacy-link replacement is settled | `J01-99` lists `ADR-0003` as the canonical target for `J01-73` | [J01-99]({{ "/en/work/jira/J01-99/" | relative_url }}) | done |
| Canonical work doc is reachable directly from Jira | Jira also carries a remote link to `work/jira/J01-73/` | Jira remote links for `J01-73` | done |

## Closure

`J01-73` is no longer treated as open implementation work in the closure round
for `J01-72`.
The issue closes as publicly traceable review and decision work and is now
`Done` in Jira.

## Links

- [ADR-0003: Step ordering: rank -> step number, summary prefix]({{
  "/en/decisions/adr-0003/" | relative_url }})
- [J01-99: Clean up legacy Confluence remote links in Jira]({{
  "/en/work/jira/J01-99/" | relative_url }})
- [J01-72: Closure of the implementation steps]({{ "/en/work/jira/J01-72/" | relative_url }})
