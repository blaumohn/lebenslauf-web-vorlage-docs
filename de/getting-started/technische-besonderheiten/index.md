---
layout: page
title: "Technische Besonderheiten"
permalink: /de/getting-started/technische-besonderheiten/
readme_order: 4
---

- **Zwei-Baum-Deploy** — atomares Deployment ohne Ausfallzeit auf Shared Hosting,
  ohne Blue-Green-Infrastruktur (vendor-a/b + app-a/b)
- **Pipeline-Spec** — sprachenneutrale Konfiguration über PHP-, Python- und Shell-Grenzen,
  Einweg-Datenfluss, maschinenlesbare YAML-Spezifikation
- **Pipeline-Phasen-Modell** — App kennt ihren eigenen Laufzeitzustand (setup, build, runtime, deploy);
  trennt CLI- von HTTP-Laufzeit-Komplexität

## Entscheidungen

Technische Hintergründe und Alternativen in den
[ADRs]({{ "/de/decisions/" | relative_url }}).
