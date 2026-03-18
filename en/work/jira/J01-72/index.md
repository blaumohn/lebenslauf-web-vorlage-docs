---
layout: page
title: "J01-72: Closure of the implementation steps"
permalink: /en/work/jira/J01-72/
---

**Stand:** 2026-03-17

<div class="jira-context-bar">
  <span class="jira-context-bar__label">Context</span>
  <a class="jira-context-bar__link" href="{{ "/en/mirror/issues/J01-72/" | relative_url }}">J01-72 in the Jira mirror</a>
</div>

Canonical public work status for `J01-72`.
This issue groups the implementation steps for the Jira-SSOT track and records
the public closure state of the parent issue.

## Goal

Close the implementation steps under `J01-72` so that Jira, public work docs,
and the mirror all carry the same end state and no hidden subtasks remain open.

## Closure picture

- The historical implementation steps under `J01-72` are either done or closed
  as explicit public review/decision work.
- `J01-83` delivers the first actively used cache V1 together with its public
  work doc.
- `J01-73` no longer lingers as a silent leftover; it is publicly closed
  through `ADR-0003` and the related operations path.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Subtasks no longer hide an open leftover | All subtasks under `J01-72` are done or publicly documented as replaced review/decision work | Jira subtask list for `J01-72` and [J01-73]({{ "/en/work/jira/J01-73/" | relative_url }}) | done |
| Cache track is publicly closable | `J01-83` has a work doc, verification plan, and canonical Jira link | [J01-83]({{ "/en/work/jira/J01-83/" | relative_url }}) | done |
| Parent can be traced from Jira to public docs directly | Jira holds a remote link to `work/jira/J01-72/` | Jira remote links for `J01-72` | done |
| Mirror shows the same closure state | `mirror/issues/J01-72/` no longer lists open subtasks and carries the done status | [Mirror: J01-72]({{ "/en/mirror/issues/J01-72/" | relative_url }}) | done |

## Closure

`J01-73` and `J01-83` are both `Done` in Jira, and the mirror reflects the
same state.
That also closes `J01-72` as the parent issue.

## Links

- [J01-73: Verify subtask ordering against the export path]({{ "/en/work/jira/J01-73/" | relative_url }})
- [J01-83: Prepare the first cache V1 and separate policy work]({{ "/en/work/jira/J01-83/" | relative_url }})
- [Mirror: J01-72]({{ "/en/mirror/issues/J01-72/" | relative_url }})
