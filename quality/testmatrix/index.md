---
layout: page
title: Testmatrix
permalink: /de/quality/testmatrix/
---

Testmatrix und zugehörige Nachweise.

Zielbild:

- Jira-Issues verlinken auf konkrete Testmatrix-Seiten oder Nachweisabschnitte
  in dieser Doku.
- Der öffentliche Mirror zeigt diese Links als Referenz an (ohne Jira-Cloud-Links).

Leitplanke:

- Es gibt aktuell keinen eigenen Dokutyp `Abnahmecheck`.
- Feingranulare Checks bleiben Teil der Testmatrix oder der vorgangsgenauen
  Arbeitsdoku.

## Sprint-Bezug

Für `J01-98` ist diese Seite der kanonische Zielort für die öffentlich
sichtbaren Nachweise zum Preview-Pfad.
Sie hält nur die Checks, die den Schritt `feature/* -> dev -> preview`
unmittelbar absichern.

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

- [J01-98: öffentlicher Arbeitsstand]({{ "/de/work/jira/J01-98/" | relative_url }})
- [J01-13 im Jira-Mirror]({{ "/de/mirror/issues/J01-13/" | relative_url }})
- [Runbook: GitHub Pages lokal previewen]({{ "/de/operations/ghpages-preview/" | relative_url }})
- [Bereich: HTTP-Runtime]({{ "/de/areas/http-runtime/" | relative_url }})
