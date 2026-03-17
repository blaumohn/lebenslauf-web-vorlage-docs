---
layout: page
title: "Runbook: GitHub Pages lokal previewen"
permalink: /de/operations/ghpages-preview/
---

## Zweck

Die GitHub-Pages-Seite lokal als Jekyll-Server starten, um Inhalte/Links zu prüfen,
ohne GitHub Pages abzuwarten.

Diese Seite ist für `J01-98` der kanonische Zielort für den
preview-relevanten Branch- und Promotionspfad aus `docs/agile`.

## Voraussetzungen

- Docker (inkl. `docker compose`)
- `compose.yaml` ist vorhanden

## Schritte

Preview-Server starten (Port 4000):

```bash
docker compose up --build ghpages-preview
```

Shell im Container (Debugging):

```bash
docker compose run --rm ghpages-shell
```

## Sprint-Pfad

Für `SCRUM Sprint 1` zählt nur der schmale Promotionspfad:

1. Auf `feature/*` arbeiten und den betroffenen Doku- oder Mirror-Inhalt lokal
   fertigstellen.
2. Den Stand nach `dev` übernehmen, sobald der Sprint-Pfad in sich stimmig ist.
3. Nach `preview` erst dann weiterziehen, wenn die Pflichtchecks für den
   öffentlichen Preview-Stand grün sind.

`J01-98` migriert hier bewusst nur den Pfad `feature/* -> dev -> preview`.
Allgemeine Branch-Regeln außerhalb des Preview-Sprints gehören nicht auf
diese Seite.

## Pflichtchecks vor Promotion

- Sprachbäume in `de/` und `en/` gemeinsam pflegen.
- Interne Links mit `relative_url` prüfen.
- Lokale Pages-Vorschau starten und die betroffenen Zielseiten direkt
  anklicken.
- Sicherstellen, dass neue oder geänderte Jira-Arbeitsdoku in die passende
  öffentliche Seite verlinkt.
- Erst danach den Stand in den sichtbaren Preview-Pfad übernehmen.

## Hinweise

- Der Preview-Server läuft auf `http://localhost:4000/`.
- Vor dem Start wird der abgeleitete EN-Mirror aus dem DE-Mirror synchronisiert.
- Interne Links sollen mit `relative_url` gebaut werden, damit `baseurl` korrekt greift (bei dieser Site leer).
- Die lokale Vorschau prüft Inhalt, Navigation und Linkpfade.
  Sie ersetzt nicht die fachlichen Nachweise in der
  [Testmatrix]({{ "/de/quality/testmatrix/" | relative_url }}).
- Sprintrelevante Preview-Arbeit aus `J01-98` bleibt an diese Seite,
  die [Testmatrix]({{ "/de/quality/testmatrix/" | relative_url }})
  und die betroffenen Bereichsseiten gekoppelt.

## Troubleshooting

- Port belegt: in `compose.yaml` ein anderes Port-Mapping setzen (z. B. `4001:4000`).
- Wenn Links lokal stimmen, aber der EN-Spiegel fehlt:
  zuerst die abgeleiteten EN-Seiten im Repo nachziehen und dann den
  Preview-Server neu starten.

## Links

- [J01-98: öffentlicher Arbeitsstand]({{ "/de/work/jira/J01-98/" | relative_url }})
- [J01-9 im Jira-Mirror]({{ "/de/mirror/issues/J01-9/" | relative_url }})
- [Testmatrix]({{ "/de/quality/testmatrix/" | relative_url }})
