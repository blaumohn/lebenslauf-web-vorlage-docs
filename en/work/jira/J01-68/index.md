---
layout: page
title: "J01-68 — Production: Betriebsdoku und Runbook"
permalink: /en/jira/issues/J01-68/
jira_key: J01-68

---
<!-- generated:jira:subtasks_cksum=1788707738 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Links

-

## Description

Goal: document and safeguard production deployment.

- Create operating documentation.
- Outline rollback and emergency paths.

## Current State

Go-live has been achieved, but there is no reliable issue-specific completion
evidence for `J01-68`. Rollback behavior and deploy history are technically
implemented; canonical production operating documentation with an emergency
path remains open.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| Rollback behavior | Deploy and smoke failures enter defined fallback states | DeployMachine and recovery tests | technically present |
| Deploy history | Operating states are recorded traceably | Commit `a6c88e0`, `scripts/sftp-read-deploy-history.py` | technically present |
| Production runbook | Canonical operating and emergency docs are public | `J01-68` | open |
| Jira close | Issue closes only with complete evidence | Jira | open |

## Source Review

The original goal remains valid. It is no longer a go-live blocker; technical
operating mechanisms exist while canonical operating documentation remains
open.

## Subtasks

- **68-1 Betriebsdoku erstellen** — To Do
- **68-2 Rollback/Notfallpfad skizzieren** — To Do
