---
layout: page
title: "J01-128: GitHub Pages: jira-work-context.html – Fix anchor IDs and backtick residue in TOC"
jira_key: J01-128
jira_parent_key: J01-84
permalink: /en/jira/issues/J01-128/
---

**Status:** 2026-04-14

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Goal

Fix two display errors on the generated page
[J01-105/steps/J01-123]({{ "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }})
that originate in the TOC generation in `_includes/jira-work-context.html` and
in wrongly formatted source headings.

## Problems

### Problem 1: Backtick characters in the TOC

Headings such as `` ## `P_1`: contact/SMTP contract… `` contain backticks that
appear visibly in the generated TOC. Backticks do not belong in section headings
and are removed from the source.

Affected locations in `work/jira/J01-105/steps/J01-123/index.md` (DE + EN):

- `` ## `P_1`: … `` → `## P_1: …`
- `` ## `P_2`: `APP_URL` … `` → `## P_2: APP_URL …`
- `` ## `P_3`: `PYTHON_PATHS` … `` → `## P_3: PYTHON_PATHS …`

### Problem 2: Wrong anchor ID for P_0-Belegmatrix

The source contained:

```markdown
<span id="p-0-belegmatrix"></span>

## P_0-Belegmatrix {#p_0-belegmatrix}
```

Kramdown `auto_ids` replaces non-alphanumeric characters (including `_`) with
`-`, turning `P_0-Belegmatrix` into `p-0-belegmatrix`.
The Kramdown IAL `{#p_0-belegmatrix}` overrides that with an underscore,
producing `id="p_0-belegmatrix"`.
The Liquid template then applies `slugify` to the raw heading text (without the
IAL) and generates `p-0-belegmatrix`, while the actual HTML anchor is
`p_0-belegmatrix`. TOC links therefore point to the wrong ID.

## Solution

**Source files (DE + EN):**
- Remove backticks from P_1/P_2/P_3 headings.
- Remove `<span id="p-0-belegmatrix"></span>` and the IAL `{#p_0-belegmatrix}`;
  Kramdown generates `id="p-0-belegmatrix"` automatically via `auto_ids`.

**Template `_includes/jira-work-context.html`:**
- Align TOC anchor generation with Kramdown:
  use `slugify: "pretty"` and remove disruptive punctuation such as `:` and
  `,`.
- This keeps underscores in headings such as `P_1`, `P_2`, and `P_3` while
  keeping generated links aligned with the Kramdown IDs.

## Verification

| Check | Expectation | Status |
| --- | --- | --- |
| TOC shows P_1/P_2/P_3 without backticks | `P_1:`, `P_2:`, `P_3:` | done |
| TOC link `#p-0-belegmatrix` correct | no `#p-0-belegmatrix-p-0-belegmatrix` | done |
| TOC anchors for `P_1`/`P_2`/`P_3` correct | underscores remain in the IDs | done |
| `config lint` green | no template breaks | done |

## Links

- [J01-128 in the Jira mirror]({{ "/en/jira/issues/J01-128/" | relative_url }})
- [J01-84 in the Jira mirror]({{ "/en/jira/issues/J01-84/" | relative_url }})
- [J01-105/steps/J01-123]({{ "/en/jira/issues/J01-105/steps/J01-123/" | relative_url }})
