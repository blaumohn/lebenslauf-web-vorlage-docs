---
layout: page
title: "ADR-0001 SSOT: Jira, docs/agile entfernt"
permalink: /decisions/adr-0001/
---

<p><strong>Status:</strong> Akzeptiert</p><h2>Kontext</h2><p>Es gab bisher eine zweite Arbeitsquelle (<code>docs/agile</code>) neben Jira. Das f&uuml;hrte zu Drift und erschwerte die Synchronisation &uuml;ber Jira-IDs in Commits/PRs.</p><h2>Entscheidung</h2><p>Jira ist die einzige Quelle der Wahrheit f&uuml;r Planung, Status und Arbeitspakete. <code>docs/agile/</code> wird aus dem App-Repo entfernt. Formale Dokumente liegen in Confluence (Space <code>J01</code>); interne Denkarbeit und Arbeitslog bleiben im privaten Notizrepo.</p><h2>Konsequenzen</h2><ul><li>Planung und Status nur in Jira; Commits/PRs referenzieren Jira-IDs.</li><li>Keine agile Prozessdoku im App-Repo; weniger Drift.</li><li>Abh&auml;ngigkeit von Jira und Confluence.</li></ul><h2>Alternativen</h2><ul><li><code>docs/agile</code> im Repo behalten (abgelehnt: Drift-Risiko).</li><li>GitHub Projects als SSOT (abgelehnt).</li></ul><h2>Links</h2><ul><li>Jira: Epic &quot;Jira-System vorbereiten (SSOT)&quot; (Key folgt)</li></ul>
