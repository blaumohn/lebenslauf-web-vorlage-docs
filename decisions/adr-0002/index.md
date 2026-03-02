---
layout: page
title: "ADR-0002 Tooling: atlassian-http-client Sicherheitsmodell"
permalink: /decisions/adr-0002/
---

<p><strong>Status:</strong> Akzeptiert</p><h2>Kontext</h2><p>Automatisierung via CLI braucht API-Tokens. Gleichzeitig soll der Runner keine Secrets besitzen, und Requests sollen auf erlaubte Atlassian-Endpunkte beschr&auml;nkt sein.</p><h2>Entscheidung</h2><p>Wir trennen in: <code>atlassian</code> (unprivilegierte CLI) und <code>atlassian-http-client</code> (l&auml;uft als Tool-Owner via <code>sudo -Hu</code>). Token und Config liegen ausschlie&szlig;lich beim Tool-Owner (<code>$HOME/.config/atlassian/http-client</code> + Token-Datei). Die CLI baut nur URL-Templates mit <code>{CLOUD_ID}</code>/<code>{SITE_SUBDOMAIN}</code>; der http-client l&ouml;st sie aus der Tool-Owner-Config auf. Der http-client setzt eine Allowlist durch.</p><h2>Konsequenzen</h2><ul><li>Runner ben&ouml;tigt keine Secrets; Sicherheitsmodell ist einfach pr&uuml;fbar.</li><li>Transparenz erfolgt &uuml;ber <code>--dry-run</code> (Token maskiert).</li><li>Tool-Owner muss Config pflegen; Setup ist einmalig.</li></ul><h2>Alternativen</h2><ul><li>Token als Env beim Runner (abgelehnt: Secret-Leak-Risiko).</li><li>Generischer curl ohne Allowlist (abgelehnt: zu viel Zugriff).</li></ul><h2>Links</h2><ul><li>Tooling: <code>../atlassian-tools</code></li></ul>
