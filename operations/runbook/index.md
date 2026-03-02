---
layout: page
title: "Runbook: Jira→Confluence-Spiegel aktualisieren"
permalink: /operations/runbook/
---

<h2>Zweck</h2><p>Statischen Jira&rarr;Confluence-Spiegel aktualisieren (Sprint-Board, Spiegel, Vorg&auml;nge).</p><h2>Voraussetzungen</h2><ul><li>Zugriff auf das atlassian CLI (Tool-Owner usr2) und jq.</li><li>Confluence Space J01, Spiegel-Seiten: Index /mirror/, Board /mirror/sprint-board/, Spiegel /mirror/, Vorg&auml;nge /mirror/vorgaenge/.</li><li>Regeln: keine Jira-Links, keine E-Mail-Adressen; Jira-Keys als Text.</li></ul><h2>Schritte</h2><ol><li>Nach Jira-&Auml;nderungen: Spiegel aktualisieren (Board, Spiegel, Vorg&auml;nge) und Stand setzen.</li><li>Spiegel-Hygiene pr&uuml;fen: keine Issues ohne Sprint in &bdquo;In Bearbeitung&ldquo;.</li><li>Stichprobe: Vorg&auml;nge-Seite enth&auml;lt keine Jira-Links und keine E-Mail-Adressen.</li></ol><h2>Rollback</h2><ol><li>In Confluence: auf die Vorversion der betroffenen Seite zur&uuml;ckgehen (Seitenversionen).</li></ol><h2>Monitoring</h2><ul><li>Board und Spiegel zeigen aktuelle Jira-Keys und Status.</li><li>Keine Jira-Links im Spiegel; Jira bleibt nicht-&ouml;ffentlich.</li></ul>
