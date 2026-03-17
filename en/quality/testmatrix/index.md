---
layout: page
title: Testmatrix
permalink: /en/quality/testmatrix/
---

Test matrix and related evidence.

Target state:

- Jira issues link to concrete test-matrix pages or evidence sections in this
  documentation.
- The public mirror shows these links as reference targets without Jira Cloud
  links.

Guardrail:

- There is currently no separate `Abnahmecheck` doc type.
- Fine-grained checks remain part of the test matrix or issue-specific work
  docs.

## Sprint Scope

For `J01-98`, this page is the canonical target for the publicly visible
evidence around the preview path.
It keeps only the checks that directly secure the step
`feature/* -> dev -> preview`.

## Sprint Matrix for the Preview Path

| Block | Expected evidence | Public source |
| --- | --- | --- |
| Config policy | `config lint` runs against the active preview path. | [Area: CLI / Build]({{ "/en/areas/cli-build/" | relative_url }}) |
| Setup | `php bin/cli setup preview` is part of the public preview flow. | [Runbook: preview GitHub Pages locally]({{ "/en/operations/ghpages-preview/" | relative_url }}) |
| Build | `php bin/cli build preview` produces the visible preview state. | [Area: CLI / Build]({{ "/en/areas/cli-build/" | relative_url }}) |
| Runtime | Feature tests cover the contact form, CAPTCHA, and the required runtime config. | [Area: HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }}) |
| Deploy smoke | The local Pages preview checks pages, navigation, and links before promotion. | [Runbook: preview GitHub Pages locally]({{ "/en/operations/ghpages-preview/" | relative_url }}) |

## Decision Rule

- A check belongs in the test matrix if it is needed as a repeatable sprint or
  preview proof.
- A check stays in the issue doc if it explains one single Jira case only.
- `J01-98` migrates only the evidence that secures multiple target locations
  together.

## Currently Visible Evidence

- `config lint`, `setup`, and `build` form the lean technical entry into the
  preview path.
- Feature tests cover the public runtime path for the contact form and CAPTCHA.
- The local Pages preview checks the static delivery path before promotion to
  `preview`.

## Links

- [J01-98: public work status]({{ "/en/work/jira/J01-98/" | relative_url }})
- [J01-13 in the Jira mirror]({{ "/en/mirror/issues/J01-13/" | relative_url }})
- [Runbook: preview GitHub Pages locally]({{ "/en/operations/ghpages-preview/" | relative_url }})
- [Area: HTTP runtime]({{ "/en/areas/http-runtime/" | relative_url }})
