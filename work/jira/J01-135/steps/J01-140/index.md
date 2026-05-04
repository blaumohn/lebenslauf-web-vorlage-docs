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
- `sftp_deploy_state.py` enthält `SlotState`, `DeployStateFile`,
  `RouterState` und `DeploymentPlan`.
- `sftp_deploy_templates.py` rendert die Deploy-Dateien aus Ressourcen.
- `sftp-deploy.py` trennt den Befehlsrand von der Ablaufklasse `SftpDeploy`;
  `main()` liest Config und `SFTP_INCLUDE_VENDOR`, die Klasse führt den
  Deploy-Ablauf aus.
- Die SFTP-Ressourcen liegen unter `src/resources/deploy/sftp/`.
- Der Inline-Deploy-State in `index.php` bleibt vorerst bestehen und wird in
  einem eigenen Folgeschritt fachlich neu bewertet.

## Überprüfungsplan

| Prüfpunkt | Erwartung | Nachweis / Ort | Status |
| --- | --- | --- | --- |
| SMTP-Pfad | Preview/Produktion nutzen einen Mail-Rückkanal | Konfiguration oder Test | offen |
| Dev-Pfad | `mail_stdout` bleibt klar als Dev-Hilfe abgegrenzt | Runbook oder Config-Doku | offen |
| Log-Schutz | Sensible Ergebnisse erscheinen nicht in unkontrollierten Logs | Test oder Review | offen |
| SFTP-Deploy-Zustand | Slot- und Router-Zustand liegen außerhalb der SFTP-Transportbibliothek | `scripts/sftp_deploy_state.py`, `scripts/sftp_lib.py` | umgesetzt |
| SFTP-Deploy-Ablauf | Befehlsrand und Deploy-Ablauf sind getrennt | `scripts/sftp-deploy.py` (`main()`, `SftpDeploy`) | umgesetzt |
| SFTP-Deploy-Ressourcen | Router- und `.htaccess`-Inhalte werden aus Ressourcen gerendert | `src/resources/deploy/sftp/`, `scripts/sftp_deploy_templates.py` | umgesetzt |
| Deploy-State-Folgeentscheidung | Nutzen des inline `// deploy-state:` wird gesondert bewertet | Folgeprüfung im J01-140-Kontext | offen |

## Links

- [J01-135]({{ "/de/jira/issues/J01-135/" | relative_url }})
