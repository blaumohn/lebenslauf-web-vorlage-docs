---
layout: page
title: "J01-113 Appendix: Implementation Plan"
jira_key: J01-113
permalink: /en/jira/issues/J01-113/appendix-implementation-plan/
---

**As of:** 2026-03-20

Concrete implementation plan for the AI agent rule structure clean-up per
J01-113. Rule identifiers refer to the
[Rule Inventory]({{ "/en/jira/issues/J01-113/appendix-rule-inventory/" | relative_url }}).

All prerequisite decisions have been made:
- Architecture: Option D (GitHub Pages → scripts → skills)
- `ki_karte` schema: `shared/` (generic); tooling: `lebenslauf-web-vorlage/` (project-bound)
- Target repos do not define their own agent rules (IM-SKL-01)

→ Back to [J01-113 main page]({{ "/en/jira/issues/J01-113/" | relative_url }})

---

## Dependency overview

```
Phase 1 ──┬──→ Phase 3 ──→ Phase 4
Phase 2 ──┘
Phase 5 (independent, can run in parallel)
Phase 6 (independent, → J01-115)
```

---

## Phase 1 — Complete E2: fill gaps in `shared/`

**Goal:** `shared/AGENTS.md` and `shared/arbeitsregeln/SKILL.md` carry all
missing and previously implicit rules.

| Step | Task | Rules |
| --- | --- | --- |
| 1.1 | Add umlaut rule | WS-KOM-01 |
| 1.2 | Describe two-code-block format for grammar feedback | WS-GRA-01 |
| 1.3 | Add raw-input retention rule | IM-EIN-01 |
| 1.4 | Add scope-extension approval rule | WS-ANF-01 |
| 1.5 | Add example-abstraction rule | WS-EIN-01 |
| 1.6 | Add `atlassian`-from-PATH rule | KO-WZG-01 |
| 1.7 | Move `tools-python` rule from Memory into `shared` | MM-WZG-01 |
| 1.8 | Add `--help` rule | IM-WZG-01 |
| 1.9 | Anchor IM-SKL-01 in `shared/entwicklung/SKILL.md` | IM-SKL-01 |

**Done when:** All M- and I-rules for E2 are recorded in `shared`.

---

## Phase 2 — Complete E3: extend project skills

**Goal:** All project-bound and workflow-specific implicit rules are in the
correct skills.

| Step | Task | Rules | Target file |
| --- | --- | --- | --- |
| 2.1 | Move sprint documentation rules from WS into skill | WS-DOK-01..04 | `koordination/SKILL.md` |
| 2.2 | Anchor lib/app branch rule | IM-GIT-01 | `koordination/SKILL.md` |
| 2.3 | Anchor `blocks`-vs-`relates` rule | IM-JRA-01 | `koordination/SKILL.md` |
| 2.4 | Anchor local-mirror rule | IM-JRA-02 | `jira-state-sync/SKILL.md` |
| 2.5 | Complete DE/EN sync for Jira free text | DI-I18-03 | `docs-i18n/SKILL.md` |

**Done when:** All I-rules for E3 are recorded; no WS-DOK-* remain in workspace.

---

## Phase 3 — Clean up E1: reduce workspace `AGENTS.md` to bootstrap

**Prerequisite:** Phases 1 and 2 complete.

**Goal:** `AGENTS.md` (WS) contains only a bootstrap pointer to
`shared/AGENTS.md` and `lebenslauf-web-vorlage/AGENTS.md`.

| Step | Task | Rules |
| --- | --- | --- |
| 3.1 | Remove all rules migrated to `shared` in Phase 1 | SA-KOM-01/02, SA-GRA-01, SA-ANF-01/02, SA-PRG-01..07, SA-COM-01..05, SA-DOK-01/02, WS-KOM-01, WS-GRA-01, WS-ANF-01, WS-EIN-01 |
| 3.2 | Remove all rules migrated to project skills in Phase 2 | WS-DOK-01..04 |
| 3.3 | Reduce WS to pure bootstrap pointer | SA-SKL-01 |

**Done when:** `AGENTS.md` (WS) contains no domain content.

---

## Phase 4 — Apply IM-SKL-01: clean up target repos

**Prerequisite:** Phase 3 complete.

**Goal:** No `AGENTS.md` remains in any product or doc repo.

| Step | Task | Rules |
| --- | --- | --- |
| 4.1 | Check all repos outside `.agents/skills/` for `AGENTS.md` | IM-SKL-01, SE-SKL-04 |
| 4.2 | Review content: does it belong in `shared/` or a project skill? | IM-SKL-01 |
| 4.3 | Migrate content if needed, then remove `AGENTS.md` from target repos | IM-SKL-01 |

**Done when:** No repo outside `.agents/skills/` carries an `AGENTS.md`.

---

## Phase 5 — Define `ki_karte` schema

**Prerequisite:** none (can run in parallel with Phases 1–4).

**Goal:** Format for compilable GitHub Pages content is specified.

| Step | Task | Rules |
| --- | --- | --- |
| 5.1 | Create schema definition as new skill in `shared/` | J1-E4P-05, IM-SKL-01 |
| 5.2 | Define fields: `ziel_ebene`, `ziel_datei`, `bereich`, `granularitaet`, `format`, `regel_ids` | J1-E4P-05 |
| 5.3 | Clarify: how is `abschnitt` granularity addressed (anchor, heading level)? | J1-E4P-05 |
| 5.4 | Review existing policy pages: which could be annotated immediately? | J1-E4P-07..11 |

**Done when:** Schema skill exists in `shared/`; at least one policy page annotated as example.

---

## Phase 6 — Verification categories and E4 foundation (→ J01-115)

**Prerequisite:** Phases 1–4 complete.

**Goal:** Hand-off to J01-115 prepared.

| Step | Task | Rules |
| --- | --- | --- |
| 6.1 | Extract complete A/B/C/D verification table from rule inventory | all Check-cat. columns |
| 6.2 | Formulate gaps (no hook/script coverage yet) as requirements for J01-115 | J1-E4P-04..06 |
| 6.3 | Write authoring convention as policy page in GitHub Pages | J1-E4P-07..11 |
| 6.4 | Pass build-trigger decision (CI, hook, agent convention) to J01-115 | J1-E4P-06 |
