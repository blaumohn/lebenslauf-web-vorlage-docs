---
layout: page
title: "J01-113 Appendix: Rule Inventory"
jira_key: J01-113
permalink: /en/jira/issues/J01-113/appendix-rule-inventory/
---

**As of:** 2026-03-20

Complete table of all known rules, candidates, and gaps — organised by domain.
Each rule carries a number encoding its source file, enabling traceability
during consolidation.

→ Back to [J01-113 main page]({{ "/en/jira/issues/J01-113/" | relative_url }})

---

## Numbering scheme

Format: `<File>-<Domain>-<No>`

### File abbreviations

| Abbr. | File |
| --- | --- |
| `WS` | `AGENTS.md` (workspace, unversioned) |
| `SA` | `shared/arbeitsregeln/SKILL.md` |
| `SE` | `shared/entwicklung/SKILL.md` |
| `SH` | `shared/AGENTS.md` |
| `LA` | `lebenslauf-web-vorlage/AGENTS.md` |
| `KO` | `koordination/SKILL.md` |
| `JS` | `jira-state-sync/SKILL.md` |
| `DI` | `docs-i18n/SKILL.md` |
| `J1` | `J01-113/index.md` (working doc) |
| `IM` | implicit / session context only |
| `MM` | Memory |

### Domain abbreviations

| Abbr. | Domain |
| --- | --- |
| `KOM` | Communication |
| `GRA` | Grammar feedback |
| `ANF` | Requirements compliance |
| `EIN` | Input handling |
| `PRG` | Code style |
| `DOK` | Documentation obligations |
| `COM` | Commit practice |
| `WZG` | Tool conventions |
| `SKL` | Skill structure |
| `GIT` | Git and branching |
| `JRA` | Jira operations |
| `I18` | DE/EN multilingualism |
| `KRD` | Multi-repo coordination |
| `E4P` | Level 4 / GitHub Pages |

### Column definitions

- **Target level**: E1 = workspace bootstrap | E2 = skill-repo AGENTS | E3 = skill | E4 = GitHub Pages
- **Issue**: R = redundancy | I = implicit only | M = missing formal anchor | – = ok
- **Check cat.**: A = pre-execution | B = deterministic post | C = semantic post | D = cross-file semantic

---

## B1 — Communication

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| SA-KOM-01 | Deutsch is the default language for model-generated text | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | C |
| SA-KOM-02 | Pass through tool output unchanged | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | C |
| WS-KOM-01 | Write umlauts correctly (no ae/oe/ue/ss outside technical keys) | `AGENTS.md` (WS) | — | E2 | M in `shared` | C |

## B2 — Grammar feedback

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| SA-GRA-01 | Output a "Grammatische Rückmeldung" section after every response | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | C |
| WS-GRA-01 | Two code blocks: line comparison (original / correction) and complete smoothed input | `AGENTS.md` (WS) | — | E2 | M in `shared` | C |

## B3 — Requirements compliance

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| SA-ANF-01 | Scope and acceptance criteria of the referenced issue are binding | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | A |
| SA-ANF-02 | When uncertain: ask first, then change | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | A |
| WS-ANF-01 | Scope extensions require explicit approval before implementation | `AGENTS.md` (WS) | — | E2 | M in `shared` | A |

## B4 — Input handling

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| IM-EIN-01 | Retain every input as a raw version | session context | — | E2 | I | A |
| WS-EIN-01 | Treat examples only as problem illustrations, not as solution templates | `AGENTS.md` (WS) | — | E2 | M in `shared` | C |

## B5 — Code style

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| SA-PRG-01 | Functions mostly under 20–24 lines | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| SA-PRG-02 | One task per function, clear name | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | C |
| SA-PRG-03 | Prefer early returns | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | C |
| SA-PRG-04 | Maximum 2 levels of nesting | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| SA-PRG-05 | No deep expression nesting; name intermediate steps | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| SA-PRG-06 | No inline callbacks; use named functions/methods | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| SA-PRG-07 | No program flow in global scope; entry point via `main()` | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |

## B6 — Documentation obligations

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| SA-DOK-01 | Every change requires a traceable Jira reference | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| SA-DOK-02 | Check for an existing issue or step; create one if missing | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |
| WS-DOK-01 | Maintain working doc under `lebenslauf-web-vorlage-docs/work/jira/J01-<KEY>/` | `AGENTS.md` (WS) | — | E3 (`koordination`) | R; belongs in project skill | B |
| WS-DOK-02 | Add a round-log note in the `tagebuch` repo | `AGENTS.md` (WS) | — | E3 (`koordination`) | R; belongs in project skill | B |
| WS-DOK-03 | Check sprint assignment in Jira and update if needed | `AGENTS.md` (WS) | — | E3 (`koordination`) | R; belongs in project skill | B |
| WS-DOK-04 | Label sprint work (`sprint-goal`, `sprint-support`, `sprint-admin`, `sprint-unplanned`) | `AGENTS.md` (WS) | — | E3 (`koordination`) | R; belongs in project skill | B |

## B7 — Commit practice

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| SA-COM-01 | Conventional Commits are standard | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS), `SE`, `KO` | E2 | R (4×) | B |
| SE-COM-01 | Jira key in commit subject line (not only body or footer) | `shared/entwicklung/SKILL.md` | `koordination/SKILL.md` | E2 | R | B |
| SA-COM-02 | Codex agent identity: `GPT Codex Agent` / `gpt-codex-agent@gpt.invalid` | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS), `JS` | E2 | R (3×) | A |
| SA-COM-03 | Use `git-as-codex.sh` helper for all Codex agent git writes | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS), `JS` | E2 | R (3×) | A |
| SA-COM-04 | Small, topically coherent commits; one commit per repo | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS), `SE` | E2 | R (3×) | B |
| SA-COM-05 | Do not leave uncommitted changes sitting | `shared/arbeitsregeln/SKILL.md` | `AGENTS.md` (WS) | E2 | R | B |

## B8 — Tool conventions

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| KO-WZG-01 | Use `atlassian` from PATH (no absolute path) | `koordination/SKILL.md` | Memory | E2 | M in `shared` | A |
| MM-WZG-01 | Use `tools-python` instead of `python3` / `python`, including `-c` calls | Memory | — | E2 | M in `shared` | A |
| IM-WZG-01 | Run `--help` before using an unknown command | session context | — | E2 | I | A |

## B9 — Skill structure and versioning

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| SE-SKL-01 | Permanent rules in versioned `AGENTS.md` of skill repos | `shared/entwicklung/SKILL.md` | `shared/AGENTS.md` | E2 | – | D |
| SE-SKL-02 | Recurring workflows in skills (`SKILL.md`) | `shared/entwicklung/SKILL.md` | — | E3 | – | D |
| SE-SKL-03 | Shared rules without project binding exclusively in `shared/` | `shared/entwicklung/SKILL.md` | — | E2 | – | D |
| LA-SKL-01 | Project bindings (repo names, keys, paths, labels) in project skill repo | `lebenslauf-web-vorlage/AGENTS.md` | `SE` | E2 | – | D |
| SE-SKL-04 | Repo `AGENTS.md` only in skill repos; product and doc repos carry none | `shared/entwicklung/SKILL.md` | — | E2 | M (migration open) | D |
| SA-SKL-01 | Workspace `AGENTS.md` (E1) is bootstrap pointer only, no domain content | `shared/arbeitsregeln/SKILL.md` | `SE` | E1 | R (WS still has content) | D |
| IM-SKL-01 | Target repos do not define or version their own agent rules; all rules — including repo-specific ones — are maintained in skill repos and loaded from there | session context | — | E2 | I | D |

## B10 — Git and branching

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| KO-GIT-01 | Check branch context before git work: does the branch match the change? | `koordination/SKILL.md` | — | E3 | – | A |
| IM-GIT-01 | Lib/app branch basis: lib repos must not be based on app branches and vice versa | session context | — | E3 (`koordination`) | I | A |
| KO-GIT-02 | Doc/ops repos integrate directly into `main` (no feature-/dev-flow) | `koordination/SKILL.md` | — | E3 | – | A |
| KO-GIT-03 | Source repos keep their repo-specific development and upstream flow | `koordination/SKILL.md` | — | E3 | – | D |

## B11 — Jira operations

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| JS-JRA-01 | Cache rule: check `cache-recipes/` before recurring Jira commands | `jira-state-sync/SKILL.md` | — | E3 | – | A |
| JS-JRA-02 | Remote-link rule: one canonical remote link per issue in Jira | `jira-state-sync/SKILL.md` | — | E3 | – | B |
| KO-JRA-01 | Jira write path: `atlassian jira http …` (or `jira ext …`) | `koordination/SKILL.md` | — | E3 | – | A |
| IM-JRA-01 | `blocks` vs. `relates`: choose Jira link types correctly and deliberately | session context | — | E3 (`koordination`) | I | C |
| IM-JRA-02 | Local mirror: check state before triggering a sync | session context | — | E3 (`jira-state-sync`) | I | A |
| JS-JRA-03 | Jira state sync workflow: create journal, initialise cache, process keys selectively | `jira-state-sync/SKILL.md` | — | E3 | – | B |

## B12 — DE/EN multilingualism

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| DI-I18-01 | DE/EN parity: public Pages always in both DE and EN | `docs-i18n/SKILL.md` | — | E3 | – | B |
| DI-I18-02 | German is the editorial source; English is mandatory translation | `docs-i18n/SKILL.md` | — | E3 | – | C |
| DI-I18-03 | DE/EN sync: Jira free text on public pages must always be translated | `docs-i18n/SKILL.md` (incomplete) | — | E3 | I | B |
| DI-I18-04 | Language toggle always maintained with a deterministic target | `docs-i18n/SKILL.md` | — | E3 | – | B |

## B13 — Multi-repo coordination

| No. | Rule | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| KO-KRD-01 | Determine affected repos and target artefacts before starting | `koordination/SKILL.md` | — | E3 | – | A |
| KO-KRD-02 | Do not squeeze cross-repo rules into a single repo | `koordination/SKILL.md` | — | E3 | – | D |
| KO-KRD-03 | Know the repo roles in the project cluster | `koordination/SKILL.md` + `references/repos.md` | — | E3 | – | D |
| KO-KRD-04 | Close Jira changes and public docs together (no half-finished state) | `koordination/SKILL.md` | — | E3 | – | B |

## B14 — Level 4 / GitHub Pages (boundary principle, authoring convention, build)

| No. | Rule / Requirement | Origin | Also in | Target | Issue | Check |
| --- | --- | --- | --- | --- | --- | --- |
| J1-E4P-01 | Boundary: GitHub Pages = SSOT for policies; AGENTS/skills = directives + references | `J01-113/index.md` | — | E4 | decision open | D |
| J1-E4P-02 | Boundary: no duplication of policies between AGENTS.md and Pages | `J01-113/index.md` | — | E2/E3 | missing formal | D |
| J1-E4P-03 | Boundary: agent-specific directives do not belong in Pages | `J01-113/index.md` | — | E4 | decision open | D |
| J1-E4P-04 | Architecture decision A–D: relationship GitHub Pages ↔ AI-agent levels → **D chosen** | `J01-113/index.md` | — | — | decided | D |
| J1-E4P-05 | Compilable Pages content requires manifest metadata (target level, target file, domain, granularity, format) | `J01-113/index.md` | — | E4 | missing | D |
| J1-E4P-06 | Define build trigger (CI pipeline, commit hook, or agent convention) | `J01-113/index.md` | — | — | open | D |
| J1-E4P-07 | Authoring convention: structure requirement — explicit sections rule / exception / check criterion | `J01-113/index.md` | — | E4 | missing | D |
| J1-E4P-08 | Authoring convention: normative language (RFC-2119 must/should/may) | `J01-113/index.md` | — | E4 | missing | C |
| J1-E4P-09 | Authoring convention: granularity — one rule = one clear address | `J01-113/index.md` | — | E4 | missing | D |
| J1-E4P-10 | Authoring convention: linkability — rules individually referenceable by permalink | `J01-113/index.md` | — | E4 | missing | B |
| J1-E4P-11 | Authoring convention: currency signal — as-of date on every policy page | `J01-113/index.md` | — | E4 | missing | B |
