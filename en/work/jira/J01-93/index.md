---
layout: page
title: "J01-93: make GitHub Pages and the Jira mirror bilingual"
permalink: /en/work/jira/J01-93/
---

**Status date:** 2026-03-12

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

## Next steps

1. Move the Jekyll structure to DE/EN URLs.
2. Make the header and navigation language-aware.
3. Extend the mirror generator to produce DE/EN output.
4. Adjust preview so both language trees are available in one run.

## Acceptance

- `/` stays neutral without JavaScript.
- The language selector shows the current language as text and the other
  language as a link.
- The header keeps the home link, content navigation, and language selector
  clearly separated.
- Mirror changes without EN follow-up are visibly blocked.

## Links

- [Mirror: J01-93]({{ "/en/mirror/issues/J01-93/" | relative_url }})
- [Jira work docs]({{ "/en/work/jira/" | relative_url }})
