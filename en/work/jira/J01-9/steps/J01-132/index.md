---
layout: page
title: "9-4 — Preview deploy bundle, deploy resolution, and guard rules"
permalink: /en/jira/issues/J01-9/steps/J01-132/
jira_key: J01-132
jira_parent_key: J01-9
---

<!-- generated:jira:step=1 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Goal: tighten the preview deploy path so that workflow order, early contract
check, deploy resolution, and the FTP artifact fit the active sprint goal.

- `composer install` runs before the early config check in the workflow.
- The old `smoke` name is replaced by a clearer deploy check in the CI helper
  path.
- `deploy/` contains the root `.htaccess` and guard files for `src/` and
  `var`.
- `public/` stays unchanged for now, so `index.php` and the bootstrap path
  do not become deployment-specific.
- The workflow uses `vars.PIPELINE` as the pipeline identifier.
- The workflow first materializes the GitHub inputs as phase-specific
  `.local` files for `preview/runtime` and `preview/deploy`.
- The FTP values are resolved right before `FTP deploy` through
  `config get ... --phase deploy` from that resolution; the action reads
  only the resolved step outputs.
- The larger shared Python deploy idea remains only as a deferred idea in the
  journal and is not part of this sprint slice.

Success criterion: the preview workflow builds the FTP artifact from the
existing app tree plus guard files without rewriting the local dev entry
point, and resolves `preview/deploy` only at the consumer for
`FTP deploy`.

## Test Picture

- The full resolution matrix lives in `pipeline-config-spec-php`.
- The app repo covers only app-side integration cases.
- The compact public evidence view is the
  [test matrix for J01-132]({{
  "/en/jira/issues/J01-9/steps/J01-132/testmatrix/" | relative_url }}).

## Links

- [J01-9 in public Jira pages]({{ "/en/jira/issues/J01-9/" | relative_url }})
- [Test matrix for J01-132]({{
  "/en/jira/issues/J01-9/steps/J01-132/testmatrix/" | relative_url }})
- [J01-105 step 105-4]({{
  "/en/jira/issues/J01-105/steps/J01-124/" | relative_url }})
