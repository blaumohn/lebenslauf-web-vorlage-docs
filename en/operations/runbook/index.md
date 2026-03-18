---
layout: page
title: "Runbook: update the public Jira area"
permalink: /en/operations/runbook/
---

## Purpose

Update the public Jira area in this repo:

- DE: `/de/jira/`, `/de/jira/sprint/`, `/de/jira/backlog/`,
  `/de/jira/erledigt/`, `/de/jira/issues/J01-*/`
- EN: `/en/jira/`, `/en/jira/sprint/`, `/en/jira/backlog/`,
  `/en/jira/erledigt/`, `/en/jira/issues/J01-*/`
- Step pages only for subtasks with public details:
  `/de/jira/issues/<PARENT>/steps/<SUBTASK_KEY>/` and
  `/en/jira/issues/<PARENT>/steps/<SUBTASK_KEY>/`
- Filtered Jira remote links are shown as relative links in the public Jira area.

## Requirements

- Access to the `atlassian` CLI (tool owner configured locally) and `jq`
- Write access in the repo
- Public policy: no Jira Cloud links, no email addresses

## Steps

1) Update issues and statuses in Jira (SSOT for issue state).
   - For sprint work, also verify the active sprint, set sprint labels, and
     update the public sprint docs.

2) Generate the public Jira area:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/update-public-jira-pages.sh
```

Optional (full refresh):

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/update-public-jira-pages.sh --full
```

Optional (journaled normal mode for known changes):

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/journal-sync-jira-change.sh --change J01-95:summary
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/journal-sync-pages-change.sh HEAD~1
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/skills/jira-state-sync/scripts/resume-open-syncs.sh
```

3) Verify GitHub Pages targets from Jira locally:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/verify-public-jira-pages.sh
```

Optional: audit legacy Confluence targets directly:

```bash
DOCS_REPO=$PWD sh ../.agents/skills/lebenslauf-web-vorlage/shared-tooling/jira-pages/verify-public-jira-pages.sh --legacy-confluence-audit
```

The URL conversion from Jira follows these rules:

- `https://docs.template.ysdani.com/...` becomes a site-relative URI
- neutral pages remain only `/` or `/index.html`
- language-bound pages are verified as `/de/...` in DE context and `/en/...`
  in EN context
- verification runs against this local GitHub Pages repo
- the legacy audit reports old `atlassian.net/wiki` targets as
  `LEGACY_CONFLUENCE<TAB>KEY<TAB>LINK_ID<TAB>URL<TAB>TITLE`

4) Spot check:
   - Issue and step pages under `jira/` expose short, visible cross-paths to
     overviews, parent pages, and public steps.
   - Subtasks without public details do **not** get their own page.
   - The base record of a subtask is step number, title, and status.
   - Pure step-page metadata such as parent, step number, status, key, or
     updated timestamp do **not** count as additional details.
   - Subtasks with additional public details do get a step page.
   - Additional public details are the subtask's own domain content or
     canonical links beyond the base record and metadata.
   - This includes, in particular, a public work doc under
     `work/jira/J01-<KEY>/`, a canonical Jira remote link to that doc, the
     subtask's own evidence, its own closure statement, or other canonical
     target pages.
   - If a public step page under `jira/issues/<PARENT>/steps/<SUBTASK_KEY>/`
     is used instead of a public issue page, the same expectation applies to
     canonical linking and carry-over.
   - When new step pages are introduced for existing subtasks, existing public
     mentions are updated where they directly touch that step page or its
     parent issue.
   - If a public issue or step page exists, verification checks it against
     Jira remote links, legacy paths, and duplicate detail URLs.

5) Hygiene:
  - No `atlassian.net` links in the output
  - No email addresses in the output
  - Remote links are rendered as relative site links
  - Remote links follow the language context of the page
    (`/de/...` on DE pages, `/en/...` on EN pages)
  - The sprint board groups current sprint work by category labels
    (`sprint-goal`, `sprint-support`, `sprint-admin`, `sprint-unplanned`)
  - The sprint board only shows the same top-level issues as the Jira board;
    steps stay visible on parent and step pages.
  - The EN Jira tree is synchronized after the DE render

## Rollback

- Revert the affected files and generate the public Jira area again.

## Monitoring

- Sprint board, backlog, and done match Jira status categories.
- The sprint board has dedicated row groups for sprint categories.
- Issue and step pages carry an `Updated` timestamp from Jira.
- `git` remains the reliable history: diffs only appear when content changes.
- `shared-tooling/jira-pages/verify-public-jira-pages.sh` verifies imported
  GitHub Pages targets locally for both DE and EN.
- `shared-tooling/jira-pages/verify-public-jira-pages.sh` also verifies the
  absence of public legacy paths and duplicate detail URLs.
- `shared-tooling/jira-pages/verify-public-jira-pages.sh --legacy-confluence-audit`
  reports remaining legacy Confluence remote links with Jira key and link ID.
- `.local/jira-sync-cache/` and `.local/jira-sync-journal/` keep the local
  snapshot and resume state for the journaled normal mode.
