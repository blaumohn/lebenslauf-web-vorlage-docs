---
layout: page
title: Testmatrix
permalink: /de/quality/testmatrix/
---

Testabdeckung und Qualitätsnachweise des Projekts.

Jira-Issues verlinken auf konkrete Testmatrix-Abschnitte oder Nachweisseiten;
der öffentliche Mirror zeigt diese Links als Referenz (ohne Jira-Cloud-Links).

Leitplanke: Feingranulare Checks bleiben Teil der Testmatrix oder der
vorgangsgenauen Arbeitsdoku. Es gibt keinen eigenen Dokutyp `Abnahmecheck`.

## Preview-Pfad (Sprint 1, Stand 2026-03)

Kanonischer Zielort für die Nachweise zum Sprint-1-Preview-Pfad (`J01-98`).
Hält die Checks für den Schritt `feature/* → dev → preview`.

## Sprintmatrix für den Preview-Pfad

| Block | Erwarteter Nachweis | Öffentliche Quelle |
| --- | --- | --- |
| Config-Policy | `config lint` läuft gegen den aktiven Preview-Pfad. | [Bereich: CLI / Build]({{ "/de/areas/cli-build/" | relative_url }}) |
| Setup | `php bin/cli setup preview` ist Teil des öffentlichen Preview-Ablaufs. | [Runbook: GitHub Pages lokal previewen]({{ "/de/operations/ghpages-preview/" | relative_url }}) |
| Build | `php bin/cli build preview` erzeugt den sichtbaren Preview-Stand. | [Bereich: CLI / Build]({{ "/de/areas/cli-build/" | relative_url }}) |
| Runtime | Feature-Tests decken Kontaktformular, CAPTCHA und die benötigte Runtime-Config ab. | [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }}) |
| Deploy-Smoke | Lokale Pages-Vorschau prüft Seiten, Navigation und Links vor Promotion. | [Runbook: GitHub Pages lokal previewen]({{ "/de/operations/ghpages-preview/" | relative_url }}) |

## Entscheidungsregel

- Ein Check bleibt in der Testmatrix, wenn er als wiederholbarer Sprint- oder
  Preview-Nachweis gebraucht wird.
- Ein Check bleibt in der Vorgangsdoku, wenn er nur einen einzelnen Jira-Fall
  erklärt.
- `J01-98` zieht hier nur die Nachweise, die mehrere der Zielorte gemeinsam
  absichern.

## Derzeit sichtbare Nachweise

- `config lint`, `setup` und `build` bilden den schmalen technischen
  Einstieg in den Preview-Pfad.
- Die Feature-Tests prüfen den öffentlichen Runtime-Pfad für
  Kontaktformular und CAPTCHA.
- Die lokale Pages-Vorschau prüft den statischen Auslieferungspfad vor der
  Promotion nach `preview`.

## Links

- [J01-98: öffentlicher Arbeitsstand]({{ "/de/jira/issues/J01-98/" | relative_url }})
- [J01-13 im Jira-Mirror]({{ "/de/jira/issues/J01-13/" | relative_url }})
- [Runbook: GitHub Pages lokal previewen]({{ "/de/operations/ghpages-preview/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
