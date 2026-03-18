---
layout: page
title: "J01-101: Prepare CLI-cache policy hardening as separate follow-up work"
permalink: /en/work/jira/J01-101/
---

**Stand:** 2026-03-17

<div class="jira-context-bar">
  <span class="jira-context-bar__label">Context</span>
  <a class="jira-context-bar__link" href="{{ "/en/mirror/issues/J01-101/" | relative_url }}">J01-101 in the Jira mirror</a>
</div>

Canonical public work status for `J01-101`.
This issue carries the policy follow-up work, separated from the cache track,
for the CLI-cache line in `atlassian-tools/curl`.

## Goal

Keep the later policy hardening for the CLI cache as its own backlog candidate
so that `J01-83` can remain small and replaceable.

## Backlog role

- not part of the first cache iteration from `J01-83`
- explicit candidate for a later sprint
- not a hidden remainder inside the cache-V1 scope

## Topics in this issue

- later review of public-only rules and output boundaries
- possible curl/wrapper hardening in `atlassian-tools/curl`
- separate security and policy evaluation instead of carrying it implicitly in
  the cache track

## Boundary to J01-83

- [J01-83]({{ "/en/work/jira/J01-83/" | relative_url }}) stays limited to the
  small cache V1.
- `J01-101` does not pull anything into the first iteration that still needs a
  broader security or policy review.

## Links

- [J01-83: Prepare the first cache V1 and separate policy work]({{
  "/en/work/jira/J01-83/" | relative_url }})
- [ADR-0002: atlassian-http-client security model]({{
  "/en/decisions/adr-0002/" | relative_url }})
- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
