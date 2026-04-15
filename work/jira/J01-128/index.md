---
layout: page
title: "J01-128: GitHub Pages: jira-work-context.html – Anker-IDs und Backtick-Reste im TOC korrigieren"
jira_key: J01-128
jira_parent_key: J01-84
permalink: /de/jira/issues/J01-128/
---

**Stand:** 2026-04-14

{% include jira-state-head.html %}

{% include jira-work-context.html %}

## Ziel

Zwei Darstellungsfehler in der generierten Seite
[J01-105/steps/J01-123]({{ "/de/jira/issues/J01-105/steps/J01-123/" | relative_url }})
beheben, die aus der TOC-Generierung in `_includes/jira-work-context.html` und
aus falsch formatierten Quellüberschriften entstehen.

## Probleme

### Problem 1: Backtick-Zeichen im TOC

Überschriften wie `` ## `P_1`: Kontakt-/SMTP-Vertrag… `` enthalten Backticks,
die im generierten TOC sichtbar erscheinen. Die Backticks gehören nicht in
Abschnittsüberschriften und werden aus der Quelle entfernt.

Betroffene Stellen in `work/jira/J01-105/steps/J01-123/index.md` (DE + EN):

- `## \`P_1\`: …` → `## P_1: …`
- `## \`P_2\`: \`APP_URL\` …` → `## P_2: APP_URL …`
- `## \`P_3\`: \`PYTHON_PATHS\` …` → `## P_3: PYTHON_PATHS …`

### Problem 2: Falsche Anker-ID für `P_0-Belegmatrix`

Die Quelle enthielt:

```markdown
<span id="p-0-belegmatrix"></span>

## P_0-Belegmatrix {#p_0-belegmatrix}
```

Kramdown `auto_ids` ersetzt Nicht-Alphanumerisches (einschließlich `_`) durch
`-`, erzeugt also aus `P_0-Belegmatrix` die ID `p-0-belegmatrix`.
Das Kramdown-IAL `{#p_0-belegmatrix}` überschreibt das mit einem Unterstrich –
was zu `id="p_0-belegmatrix"` führt.
Die Liquid-Vorlage wendet danach `slugify` auf den Rohtextanteil des Headers
(ohne IAL) an und erzeugt `p-0-belegmatrix`, während der echte HTML-Anker
`p_0-belegmatrix` lautet. Die Links im TOC zeigen deshalb auf die falsche ID.

## Lösung

**Quelldateien (DE + EN):**
- Backticks aus P_1/P_2/P_3-Überschriften entfernen.
- `<span id="p-0-belegmatrix"></span>` und das IAL `{#p_0-belegmatrix}`
  entfernen; Kramdown erzeugt `id="p-0-belegmatrix"` automatisch per
  `auto_ids`.

**Vorlage `_includes/jira-work-context.html`:**
- Die TOC-Ankerbildung an Kramdown angleichen:
  `slugify: "pretty"` verwenden und störende Satzzeichen wie `:` und `,`
  entfernen.
- Damit bleiben Unterstriche in Überschriften wie `P_1`, `P_2` und `P_3`
  erhalten, während die generierten Links zu den Kramdown-IDs passen.

## Prüfpunkte

| Punkt | Erwartung | Status |
| --- | --- | --- |
| TOC zeigt P_1/P_2/P_3 ohne Backticks | `P_1:`, `P_2:`, `P_3:` | erledigt |
| TOC-Link `#p-0-belegmatrix` korrekt | kein `#p-0-belegmatrix-p-0-belegmatrix` | erledigt |
| TOC-Anker für `P_1`/`P_2`/`P_3` korrekt | Unterstriche bleiben in den IDs erhalten | erledigt |
| `config lint` grün | keine Vorlage bricht | erledigt |

## Links

- [J01-128 im Jira-Mirror]({{ "/de/jira/issues/J01-128/" | relative_url }})
- [J01-84 im Jira-Mirror]({{ "/de/jira/issues/J01-84/" | relative_url }})
- [J01-105/steps/J01-123]({{ "/de/jira/issues/J01-105/steps/J01-123/" | relative_url }})
