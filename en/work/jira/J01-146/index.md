---
layout: page
title: "J01-146 — src/cli/py kohärent ordnen und Python-CLI-Aliasse prüfen"
permalink: /en/jira/issues/J01-146/
jira_key: J01-146

---
<!-- generated:jira:subtasks_cksum=4294967295 -->

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Links

-

## Description

Backlog-Idee: Die Ordnerstruktur unter src/cli/py soll kohärent geprüft und bei Bedarf neu geordnet werden.

- Beziehung und Ähnlichkeit zu src/cli/php prüfen, ohne das PHP-Muster unreflektiert zu kopieren.
- Prüfen, ob Skripte, die ausschließlich in Containern oder getrennten Git-Worktrees laufen, strukturell getrennt werden sollen, zum Beispiel für Abläufe bin/ci > run_pipeline > ...
- Prüfen, ob der Python-Command ein Register der Skripte erhalten soll: neben oder statt cli python ... könnten Py-Skripte als cli <alias> [...args] aufrufbar sein.
- Ziel ist bessere UX durch vorab definierte Pipeline-/Phasen-Aliasse und eine gleichmäßige, nachvollziehbare Ordnerstruktur.

## Subtasks

No subtasks.
