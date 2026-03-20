---
layout: page
title: "J01-111: AI Rule Coherence and Verification Architecture"
jira_key: J01-111
permalink: /en/jira/issues/J01-111/
---

**Stand:** 2026-03-20

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for epic `J01-111`.
This epic groups two closely related but separately implemented work streams
around the AI agent rule structure in the `lebenslauf-web-vorlage` project.

## Goal

- Clean up the rule set: remove duplications, separate three levels clearly,
  assign a formal verification category to each rule.
- Build the verification architecture: a four-category system of hook, script,
  local model, and API model that checks the cleaned-up rule set automatically.

## Contained issues

- [J01-113: Rule cleanup]({{ "/en/jira/issues/J01-113/" | relative_url }}) —
  prerequisite
- [J01-115: AI verification architecture]({{ "/en/jira/issues/J01-115/" | relative_url }}) —
  builds on J01-113

## Current status

- Epic created, both tasks assigned to the epic.
- J01-113 blocks J01-115.
- Both issues in the active sprint, label `sprint-unplanned`.

## Links

- [J01-92: Shared agent rules and skill versioning]({{ "/en/jira/issues/J01-92/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
