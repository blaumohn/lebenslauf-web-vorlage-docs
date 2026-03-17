---
layout: page
title: "Area: HTTP runtime"
permalink: /en/areas/http-runtime/
---

This area records only the preview-relevant runtime guardrails for `J01-98`.
It does not replace a full operations guide; it documents the stability basis
that the current sprint needs as public evidence.

## Preview-Relevant Runtime Building Blocks

- `var/config/config.php` is the compiled runtime config and stays the only
  runtime source for the HTTP path.
- `var/tmp/captcha` carries short-lived CAPTCHA challenges.
- `var/tmp/ratelimit` carries the rate-limit state for the contact path.
- `var/state/tokens` keeps the more durable state for token lists.

## Guardrails for the Contact Path

- `IP_SALT` is a required runtime-config value and stabilizes the hashing used
  for rate limits and CAPTCHA.
- The GET path of the contact form limits CAPTCHA fetches via
  `CAPTCHA_MAX_GET` and `RATE_LIMIT_WINDOW_SECONDS`.
- The POST path limits form attempts via `CONTACT_MAX_POST` in the same time
  window.
- Failed CAPTCHA or mail runs return controlled error pages or retry paths
  instead of leaving silent state behind.

## Atomic Write Patterns

- Runtime state is kept in files.
- Writes go through temporary files followed by `rename()`.
- This keeps either the old or the new state visible; half-written files should
  not become publicly effective in the active path.

## Public Evidence in the Sprint

- The feature tests cover the contact form, CAPTCHA image output, and the
  required runtime context with compiled config.
- The config rationale for `IP_SALT`, `APP_BASE_PATH`, and other runtime values
  lives in [Area: CLI / Build]({{ "/en/areas/cli-build/" | relative_url }}).
- `J01-98` pulls in only the runtime aspects that directly secure preview
  operations.

## Links

- [J01-98: public work status]({{ "/en/work/jira/J01-98/" | relative_url }})
- [J01-16 in the Jira mirror]({{ "/en/mirror/issues/J01-16/" | relative_url }})
- [Test matrix]({{ "/en/quality/testmatrix/" | relative_url }})
