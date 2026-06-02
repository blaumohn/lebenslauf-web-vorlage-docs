---
layout: page
title: "J01-116: Make public Jira issue pages consistent"
jira_key: J01-116
jira_parent_key: J01-84
permalink: /en/jira/issues/J01-116/
---

**Stand:** 2026-03-24

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-116`.
This issue sharpens the public Jira area so an issue page reflects Jira state
clearly again without blurring the split between Jira and GitHub Pages.

## Source basis

- [Area: Jira and docs tooling]({{ "/en/areas/proj-doku-tooling/" | relative_url }})
  and [Jira overview]({{ "/en/areas/proj-doku-tooling/jira-uebersicht/" | relative_url }}):
  GitHub Pages remains the public documentation place, Jira remains SSOT for
  issues and status.
- [J01-91: status/plan (snapshot)]({{ "/en/jira/issues/J01-91/" | relative_url }}):
  the same SSOT split is stated there as a public work rule.
- [J01-107: refine Jira metadata for migration issues from J01-91]({{ "/en/jira/issues/J01-107/" | relative_url }}):
  relations should be visible in Jira metadata, not only in prose docs.
- [J01-108: public Jira issue pages without overview box]({{ "/en/jira/issues/J01-108/" | relative_url }}):
  issue pages should show real context, not a second navigation box.
- [Runbook: update public Jira area]({{ "/en/operations/runbook/" | relative_url }}):
  subtasks without additional details remain visible on the parent and do not
  get a detail page.

## Goal

- Parent pages like `J01-31`, `J01-9` and `J01-13` no longer show dead
  subtask links.
- Public issue pages show the needed Jira metadata:
  assignee, priority, active sprint, sprint role and linked issues.
- The Jira description becomes visible on generated parent pages instead of
  the placeholder `-`.
- The context bar stays compact and only shows real issue context.

## Current status

- A new issue `J01-116` was created, added to the active sprint and linked
  with `J01-31`, `J01-104` and `J01-107`.
- The public generator now pulls `description` and `issuelinks` from Jira
  into the cache and public projection.
- Parent pages only link subtasks when a real public step page exists.
- Generated overviews and issue pages point public subtask work docs to the
  public page that actually exists; missing detail pages remain readable text
  without a link.
- The public projection now also contains active sprint, sprint role, labels
  and normalized Jira links.
- Issue pages now bundle Jira metadata and Jira relations in a single top
  state and relations block.
- The separate context block below that is now reserved for real page
  navigation such as public steps.
- The project-management skills now use local Docker Compose checks as the
  canonical agent verification path. `project-admin.sh check` runs the same
  Compose path as the skill pre-commit hooks.
- `project-admin.sh issue-draft --assist --from-note <file>` now creates a
  validated JSON issue draft through an `npx codex` adapter. The operation uses
  AI only for wording suggestions and does not write to Jira.
- `project-admin.sh page-draft --assist --issue <KEY>` now creates a validated
  JSON page draft for existing Jira issues. The operation uses the Jira cache
  or Jira Cloud as source and does not write to Jira or public docs.
- `project-admin.sh page-apply --draft <file>` now applies a reviewed page
  draft in a controlled way: it validates JSON, target path and permalink,
  writes only missing target pages, then starts sync and targeted verification
  for the issue and its parent.
- `project-admin.sh install-user-bin` can link the entry point as `j01-admin`
  into `~/.local/bin`; the entry point resolves symlinks and still finds the
  skill repository.
- Regressions for EN sync and targeted EN language-drift verification are now
  covered by docs and skill tests.

## Verification plan

| Check | Expectation | Proof / place | Status |
| --- | --- | --- | --- |
| Dead subtask links removed | `J01-31`, `J01-9`, `J01-13` and generated overviews show unlinked subtasks without a detail page | public Jira issue pages + `tests/public-jira-links.sh` | done |
| Metadata visible | Assignee, priority, active sprint and sprint role are visible | `_includes/jira-state-head.html` and generated issue pages | open |
| Relations visible | Issue pages show Jira issue links in the top state and relations block | `_data/jira_pages/issues.json`, `_includes/jira-state-head.html`, issue pages | open |
| Description mirrored | Jira description appears on generated parent pages | public Jira issue pages | open |
| DE/EN consistent | EN derivation keeps the same structure and terms | `/en/jira/issues/...` | open |
| Local skill enforcement | KI agents, hooks and manual checks use the same Docker Compose verification path | `.agents/skills/*/docker-compose.yml`, `scripts/project-admin.sh check` | done |
| AI assistance for issue drafts | The assist command creates only validated JSON drafts and no Jira write operations | `.agents/skills/lebenslauf-web-vorlage/scripts/project-admin.sh`, `tests/issue-draft.sh` | done |
| AI assistance for page drafts | The assist command creates only validated JSON page drafts and no Jira or docs write operations | `.agents/skills/lebenslauf-web-vorlage/scripts/project-admin.sh`, `tests/page-draft.sh` | done |
| Apply step for page drafts | Reviewed page drafts are written only to safe, missing target paths; sync and verification then run for the issue and parent | `.agents/skills/lebenslauf-web-vorlage/scripts/project-admin.sh`, `tests/page-apply.sh` | done |

## Links

- [J01-31]({{ "/en/jira/issues/J01-31/" | relative_url }})
- [J01-107]({{ "/en/jira/issues/J01-107/" | relative_url }})
- [J01-108]({{ "/en/jira/issues/J01-108/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
