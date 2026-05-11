---
layout: page
title: Programming guidelines
permalink: /en/policies/programmierleitlinien/
---

These guidelines keep code clear for review, maintenance, and operations.

## Automated Checks

Automatable style and quality rules are maintained in linter configurations,
not duplicated in this guideline.

As a compact example for the kind of style checks used here, see the
[Pylint configuration in `lebenslauf-web-vorlage`](https://github.com/blaumohn/lebenslauf-web-vorlage/blob/main/.pylintrc).

The concrete tools and values are maintained per repository in the respective
linter configurations.

## Domain Style Rules

- Every function has exactly one clearly recognizable task.
- Function names describe the task in concrete domain terms.
- Program files should make the domain flow readable from top to bottom where
  possible: purpose and main flow first, details afterwards.
- Public functions, orchestration, and main paths come before small helper
  functions unless the language or repository convention requires a different
  order.
- Helper functions live where they make the main flow understandable; if they
  hide it, they belong in a separate module.
- This ordering serves readability. Pure reordering without domain value is not
  a standalone refactoring task.

## Tests & Safety

- Relevant linting and test checks must pass before a change counts as done.
- Add tests where failures would be expensive (parsing, I/O, deploy paths).
- Never put secrets into logs or documentation.
- Public documentation contains no Jira Cloud links and no personal data.

## Documentation in Code

- Public explanations belong in GitHub Pages.
- Runbooks cover step-by-step procedures for operations, maintenance, and
  incidents.
- Decisions belong in ADRs; proposals belong in KEP-Lite documents.

## Commits (Jira Link)

- Commit messages contain a Jira key (for example `J01-91`) so Jira can assign
  changes reliably.
- Format: Conventional Commit + Jira key at the end, preferably in
  parentheses. Example: `docs: drift-report strukturieren (J01-91)`
