---
layout: page
title: "Bereich: pipeline-config-spec-php"
permalink: /de/areas/pipeline-config-spec-php/
---

Dieser Bereich dokumentiert die PHP-Umsetzung der Pipeline-Config-Spec.
Die sprachneutrale Spezifikation liegt in
[Spec: Pipeline-Spec-System]({{ "/de/specs/systeme/pipeline-spec/" | relative_url }}).

## Klasse und Namespace

```php
use PipelineConfigSpec\PipelineConfig;

$config = new PipelineConfig($rootPath);
// eigenes Config-Verzeichnis (Default: 'pipeline-config'):
$config = new PipelineConfig($rootPath, 'src/resources/pipeline-config');
```

## Methoden

| Methode | Zweck |
|---|---|
| `values(pipeline, phase, overrides)` | Aufgelöste Werte als Array zurückgeben |
| `compile(pipeline, phase, targetPath, overrides)` | Kompilat nach `var/config/config.php` schreiben, Pfad zurückgeben |
| `validate(pipeline, overrides)` | Alle Phasen der Pipeline prüfen, Exception bei Verstoß |
| `describe(pipeline, phase, overrides)` | Snapshot mit `context`, `files`, `values`, `sources` zurückgeben |
| `cliVarsForPhase(pipeline, phase)` | Variablen zurückgeben, die CLI-Overrides erlauben |

## Datei-Reihenfolge

Zwei Schichten werden je Pipeline zusammengeführt (aufsteigende Priorität):

| Priorität | Datei |
|---|---|
| 1 | `pipeline-config/<pipeline>.yaml` |
| 2 | `.local/<pipeline>.yaml` |

CLI-Overrides kommen nach Schicht 2 und haben höchste Priorität.
Fehlende Dateien werden stillschweigend übersprungen.

## Kompilat-Format

`compile()` schreibt:

```php
return [
    'pipeline_phase' => [
        'pipeline' => 'dev',
        'phase'    => 'runtime',
    ],
    'values' => [
        'APP_URL' => 'https://example.test',
    ],
];
```

`describe()` verwendet den Schlüssel `context` statt `pipeline_phase`.

## Schnittstellen

- Spezifikation: [Spec: Pipeline-Spec-System]({{ "/de/specs/systeme/pipeline-spec/" | relative_url }})
- Einbindung in den Build-Pfad: [CLI / Build]({{ "/de/areas/cli-build/" | relative_url }})
- Repo: [pipeline-config-spec-php](https://github.com/blaumohn/pipeline-config-spec-php)
