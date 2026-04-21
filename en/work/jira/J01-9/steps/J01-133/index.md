---
layout: page
title: "9-5 — Lokale Composer-CI-Prüfung via Docker"
permalink: /en/jira/issues/J01-9/steps/J01-133/
jira_key: J01-133
jira_parent_key: J01-9
---

<!-- generated:jira:step=1 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Details

Ziel: Composer-Konflikte lokal und früh erkennen, bevor sie erst im
GitHub-Workflow auffallen.

Ausgangslage: Ein Composer-Konflikt wurde im GitHub-Workflow sichtbar.
`smoke.py` hätte ihn früher erkennen sollen, hatte aber zwei Schwächen:
der lokale `git clone --local` konnte den Vendor-Stand aus dem Worktree
erben, und der Test lief mit der lokalen PHP-Version statt mit PHP 8.2.

Lösung: Ein docker-compose-basierter CI-Test spiegelt exakt das
GitHub-Actions-Umfeld (PHP 8.2-alpine, Composer v2). Er läuft lokal mit
einem einzigen Befehl und ersetzt `tests/py/smoke.py` vollständig.

Geänderte und neue Dateien:
- `Dockerfile.ci` — PHP 8.2-alpine + git + Composer v2
- `docker-compose.ci.yml` — Service-Definition mit Volume-Cache
- `tests/ci/run.sh` — Testschritte: install, setup, build, PHPUnit, HTTP-Check
- `composer.json` — `tests:smoke` ruft jetzt `docker compose` auf
- `tests/py/smoke.py` — entfernt

Erfolgskriterium: `docker compose -f docker-compose.ci.yml up --build
--abort-on-container-exit` endet mit Exit-Code 0; PHPUnit grün;
HTTP-Check `/cv` liefert „Lebenslauf".

## Links

- [J01-9 im Jira-Mirror]({{ "/en/jira/issues/J01-9/" | relative_url }})
