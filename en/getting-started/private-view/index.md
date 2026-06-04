---
layout: page
title: "Set up private view"
permalink: /en/getting-started/private-view/
readme_order: 3
---

**`private_ansicht_einrichten()`**

```bash
private_ansicht_einrichten() {
  local token
  token="$(cli token dev rotate default)"
  curl --fail --silent --show-error "http://127.0.0.1:8080/cv?token=${token}" \
    | grep -q '</html>'
}
```

Source: `tests/ci/readme-dev-user-flow.sh`.

## Security model

`.local/preview.yaml` contains credentials and token values.
`chmod 600` prevents AI agents and other processes with reduced trust
from reading the file.
