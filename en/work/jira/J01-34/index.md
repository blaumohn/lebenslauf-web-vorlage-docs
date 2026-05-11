---
layout: page
title: "J01-34 — CLI-UX: Missing-Config und Pipeline-Phase"
permalink: /en/jira/issues/J01-34/
jira_key: J01-34

---
<!-- generated:jira:subtasks_cksum=1344318037 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Links

-

## Description

Goal: consistent pipeline-phase syntax and missing-config output.

- Define the pipeline-phase syntax.
- Specify the missing-config command.

## Current Status

Status 2026-05-12:

- Pipeline-bound CLI commands are being aligned in the app repo to the common
  shape `cli <command> <pipeline> ...`.
- `BasePipelineCommand` is the shared place for the `pipeline` argument.
- `config` changes from `config <action> <pipeline> ...` to
  `config <pipeline> <action> ...`.
- `setup --skip-python` is removed from the normal setup path.
- Python linting no longer runs through `cli python`; it runs directly through
  `.venv/bin/python tools/lint-python.py`.
- `PythonRunner` no longer falls back to `python3`; pipeline-bound Python
  commands require an existing `.venv`.

## Verification Plan

| Checkpoint | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| CLI signature | Pipeline commands show `<pipeline>` directly after the command | `php bin/cli help config`, `help token`, `help python`, `help setup` | done |
| Config calls | `config dev lint --phase build` works | Local CLI call | done |
| Python runner | Without `.venv/bin/python`, there is no `python3` fallback | `tests/php/PythonRunnerTest.php` | done |
| Setup option | `setup` no longer offers `--skip-python` | `php bin/cli help setup` | done |
| PHP tests | App test suite is green with a writable temp directory | `php -d sys_temp_dir=/private/tmp vendor/bin/phpunit` | done |
| Python lint | New direct `.venv` call is wired; existing lint findings remain separate cleanup work | `composer --working-dir=lebenslauf-web-vorlage run lint:python` | open |

## Subtasks

- **34-1 Pipeline-Phase-Syntax festlegen** — To Do
- **34-2 Missing-Config-Befehl definieren** — To Do
- [**34-3 CLI: Help-Text für bin/cli config ergänzen**]({{ "/en/jira/issues/J01-34/steps/J01-127/" | relative_url }}) — To Do
