---
layout: page
title: "Technische Besonderheiten"
permalink: /de/getting-started/technische-besonderheiten/
readme_order: 4
---

- **[Zwei-Baum-Deploy]({{ "/de/jira/issues/J01-135/steps/J01-142/" | relative_url }})** —
  atomares Deployment ohne Ausfallzeit auf Shared Hosting, ohne
  Blue-Green-Infrastruktur (vendor-a/b + app-a/b);
  der [Slot-Schalter]({{ "/de/areas/deploy/slot-switch/" | relative_url }})
  hält den sichtbaren Umschaltpunkt nachvollziehbar.
- **[Pipeline-Spec]({{ "/de/specs/systeme/pipeline-spec/" | relative_url }})** —
  sprachenneutrale Konfiguration über PHP-, Python- und Shell-Grenzen,
  Einweg-Datenfluss, maschinenlesbare YAML-Spezifikation.
- **[Pipeline-Phasen-Modell]({{ "/de/areas/cli-build/" | relative_url }})** —
  App kennt ihren eigenen Laufzeitzustand (setup, build, runtime, deploy);
  trennt CLI- von HTTP-Laufzeit-Komplexität.

## Entscheidungen

Technische Hintergründe und Alternativen in den
[ADRs]({{ "/de/decisions/" | relative_url }}).
