---
layout: page
title: "Set up private view"
permalink: /en/getting-started/private-view/
readme_order: 3
---

<small>*[tests/ci/readme-dev-user-flow.sh](https://github.com/blaumohn/lebenslauf-web-vorlage/blob/dev/tests/ci/readme-dev-user-flow.sh#L44-L49)*</small>

```bash
local token
token="$(cli token dev rotate default)"
curl --fail --silent --show-error "http://127.0.0.1:8080/cv?token=${token}" \
  | grep -q '</html>'
```

## Security model

`.local/preview.yaml` contains credentials and token values.
`chmod 600` prevents AI agents and other processes with reduced trust
from reading the file.
