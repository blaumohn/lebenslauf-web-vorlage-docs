---
layout: page
title: "Projekt einschätzen"
permalink: /de/getting-started/projektprofil/
readme_order: 0
readme_intro: true
---

PHP-Seitenstarter für persönliche Websites auf Shared Hosting —
entwickelt und betrieben als eigenes Projekt.
Öffentliche Ansicht mit geschwärzten Kontaktdaten,
token-gesicherte private Vollansicht ohne Login,
fertige Dev- und CI/CD-Pipeline.

**Demo:** [preview.ysdani.com](https://preview.ysdani.com)

Das Projekt entstand als konkreter Liefernachweis: von der Anforderung
über Architekturentscheidungen bis zum produktiven Deployment.
Die öffentliche Dokumentation macht Entscheidungen, Abläufe und
Qualitätsnachweise transparent nachvollziehbar.

## Was das Projekt zeigt

- Öffentliche Ansicht mit geschwärzten Kontaktdaten; token-gesicherte private Vollansicht ohne Login
- Lebenslauf-Daten in YAML, zweisprachig (DE/EN), durch Build-Pipeline validiert
- SFTP-Deployment auf Shared Hosting ohne Blue-Green-Infrastruktur (Zwei-Baum-Deploy)
- Sicherheitsschicht für das Kontaktformular: Rate-Limit, CAPTCHA, IP-Salt-Rotation

## Nachweise

- [Sprint-Historie]({{ "/de/work/sprints/" | relative_url }}) — öffentliche Liefernachweise je Sprint
- [Entscheidungen (ADRs)]({{ "/de/decisions/" | relative_url }}) — Architekturentscheidungen mit Kontext
- [Testmatrix]({{ "/de/quality/testmatrix/" | relative_url }}) — Testabdeckung und Qualitätsstand

## Einstiegspunkte

- [Projektüberblick]({{ "/de/getting-started/ueberblick/" | relative_url }})
- [Technische Besonderheiten]({{ "/de/getting-started/technische-besonderheiten/" | relative_url }})
- [Vollständige Dokumentation]({{ "/de/" | relative_url }})
