---
layout: page
title: "J01-93: make GitHub Pages and the Jira mirror bilingual"
permalink: /en/work/jira/J01-93/
---

**Status date:** 2026-03-14

<div class="jira-context-bar">
  <span class="jira-context-bar__label">Context</span>
  <a class="jira-context-bar__link" href="{{ "/en/mirror/issues/J01-93/" | relative_url }}">J01-93 in the Jira mirror</a>
</div>

Canonical public work status for `J01-93`.
This task introduces the public docs and Jira mirror as a neutral bilingual
GitHub Pages site.

## Goal

The GitHub Pages docs and the static Jira mirror are managed fully under
`/de/...` and `/en/...`, with a neutral language chooser on `/` and direct
language switching on corresponding pages.

## Scope

- Language chooser on `/`
- Language switcher on content pages as `Deutsch | English`
- clear visual separation between site title, content navigation, and
  language selector in the header
- DE/EN structure for public pages
- DE/EN structure for `mirror/`
- Required EN follow-up whenever mirror content changes
- Jira remote links to GitHub Pages are verified in the mirror as relative site
  links and follow the language context of the target page

## Current status

- GitHub Pages and the mirror run under `/de/...` and `/en/...`.
- Jira remote links are converted to site-relative paths in the mirror.
- Language-bound GitHub Pages targets are shown as `/de/...` in the DE mirror
  and `/en/...` in the EN mirror.
- A local verification step checks imported GitHub Pages targets directly
  against this repo.
- The issue is now set to `Done` in Jira; the public status and mirror were
  pulled forward accordingly.

## Completion

- The bilingual GitHub Pages structure for docs and mirror is in place.
- Link normalization and local target verification for imported Jira links are
  part of the current workflow.
- Any remaining work now belongs to later follow-up steps, not to `J01-93`.

## Acceptance

- `/` stays neutral without JavaScript.
- The language selector shows the current language as text and the other
  language as a link.
- The header keeps the home link, content navigation, and language selector
  clearly separated.
- The multiline site title still reads as one single link without oversized
  vertical spacing between wrapped lines.
- Mirror changes without EN follow-up are visibly blocked.
- Imported Jira links no longer show the absolute docs domain in the mirror.
- Imported Jira links are verified locally against the available GitHub Pages
  targets.

## Links

- [Mirror: J01-93]({{ "/en/mirror/issues/J01-93/" | relative_url }})
- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
