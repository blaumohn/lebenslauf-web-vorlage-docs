---
layout: page
title: "135-3 — Mail-Rückkanal für Runtime-Admin-Ergebnisse festziehen"
permalink: /de/jira/issues/J01-135/steps/J01-140/
jira_key: J01-140
jira_parent_key: J01-135
---

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Angaben

Ziel: Einen kontrollierten Rückkanal für Runtime-Admin-Ergebnisse festlegen,
damit sensible Ergebnisse wie neue CV-Tokens nicht nur auf stdout oder in
unkontrollierten Logs landen.

- `mail_stdout` bleibt als Dev-Hilfe möglich.
- Preview und produktionsnahe Abläufe sollen SMTP verwenden.
- Ergebnisrückgabe und Fehlerausgabe werden getrennt betrachtet.
- Log-Leaks werden als eigener Prüfpunkt behandelt.

Erfolgskriterium: Runtime-Admin-Ergebnisse haben einen dokumentierten
Rückkanal, der für Preview/Produktion nicht auf unkontrollierte Konsolenausgabe
angewiesen ist.

## Nachtrag 2026-05-04: SFTP-Deploy-Kohärenz

Im Preview-Deployment wurde ein gewachsener Mischbereich nachgeschärft:
Transport, Slot-Zustand, Router-Zustand, Template-Erzeugung und
Tree-Operationen werden nicht mehr in `sftp_lib.py` gebündelt. Der sichtbare
Aufrufpfad bleibt unverändert; die bestehenden Einstiegsskripte bleiben
`scripts/sftp-deploy.py` und `scripts/sftp-read-vendor-build-id.py`.

Aktueller Umsetzungsstand:

- `sftp_lib.py` enthält nur noch SFTP-Transport und Konfigurationslesung.
- `sftp_deploy_state.py` enthält `SlotState`, `DeployState` und
  `DeploymentPlan`.
- `sftp_deploy_templates.py` rendert die Deploy-Dateien aus Ressourcen.
- `sftp-deploy.py` trennt den Befehlsrand von der Ablaufklasse `SftpDeploy`;
  `main()` liest Config und `SFTP_INCLUDE_VENDOR`, die Klasse führt den
  Deploy-Ablauf aus.
- Die Root-HTTP-Ressourcen liegen zielortnah unter `src/resources/http/`.
- Die Slot-Root-Ressource heißt `src/resources/http/app-slot/.htaccess`; der
  irreführende Name `root` und die nicht mehr referenzierte Legacy-Ressource
  `entry` wurden entfernt.
- `.deploy-state.json` ist die alleinige Skript-Zustandsquelle; der
  inline `// deploy-state:` im generierten `index.php` wurde entfernt.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| SMTP-Pfad | Preview/Produktion nutzen einen Mail-Rückkanal | Konfiguration oder Test | offen |
| Dev-Pfad | `mail_stdout` bleibt klar als Dev-Hilfe abgegrenzt | Runbook oder Config-Doku | offen |
| Log-Schutz | Sensible Ergebnisse erscheinen nicht in unkontrollierten Logs | Test oder Review | offen |
| SFTP-Deploy-Zustand | `.deploy-state.json` ist SSOT für Deploy-Skript-Zustand | `scripts/sftp_deploy_state.py`, `scripts/sftp-deploy.py`, `scripts/sftp-read-vendor-build-id.py` | umgesetzt |
| SFTP-Deploy-Ablauf | Befehlsrand und Deploy-Ablauf sind getrennt | `scripts/sftp-deploy.py` (`main()`, `SftpDeploy`) | umgesetzt |
| SFTP-Deploy-Ressourcen | Router- und `.htaccess`-Inhalte werden aus HTTP-Ressourcen gerendert | `src/resources/http/`, `scripts/sftp_deploy_templates.py` | umgesetzt |
| Slot-Root-Ressource | App-Slot-`.htaccess` ist nicht mehr als HTTP-Root benannt | `src/resources/http/app-slot/.htaccess`, `scripts/pipeline_lib.sh` | umgesetzt |
| Inline-Router-State | Generierter Router enthält keinen `// deploy-state:` mehr | `src/resources/http/index.php.tpl` | umgesetzt |

## Links

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }})
