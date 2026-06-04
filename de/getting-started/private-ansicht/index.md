---
layout: page
title: "Private Ansicht einrichten"
permalink: /de/getting-started/private-ansicht/
readme_order: 3
---

<small>*[tests/ci/readme-dev-user-flow.sh](https://github.com/blaumohn/lebenslauf-web-vorlage/blob/dev/tests/ci/readme-dev-user-flow.sh#L44-L49)*</small>

```bash
local token
token="$(cli token dev rotate default)"
curl --fail --silent --show-error "http://127.0.0.1:8080/cv?token=${token}" \
  | grep -q '</html>'
```

## Sicherheitsmodell

`.local/preview.yaml` enthält Zugangsdaten und Token-Werte.
`chmod 600` stellt sicher, dass KI-Agents und andere Prozesse mit eingeschränktem
Vertrauen die Datei nicht lesen können.
