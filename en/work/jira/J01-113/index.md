---
layout: page
title: "J01-113: Rule cleanup: separate levels 1–2–3 and assign verification categories A/B/C/D"
jira_key: J01-113
jira_parent_key: J01-111
permalink: /en/jira/issues/J01-113/
---

**Stand:** 2026-03-20

{% include jira-state-head.html %}

{% include jira-work-context.html %}

Canonical public work status for `J01-113`.
This issue cleans up the AI agent rule structure in the project: remove
duplications, separate three levels cleanly, assign a formal verification
category to each rule. It also clarifies the boundary between AI agent content
and GitHub Pages documentation, and defines how documentation pages should be
authored to be effective for AI agents.

## Goal

### Levels 1–3 of the AI agent rule structure

- Consolidate identical rules (communication, UTF-8, grammar feedback) that
  are redundantly present in the workspace `AGENTS.md`,
  `lebenslauf-web-vorlage-docs/AGENTS.md`, `atlassian-tools/AGENTS.md`, and
  `tagebuch/AGENTS.md`.
- Separate three levels clearly:
  - Level 1 — Workspace `AGENTS.md` outside Git: bootstrap only, pointing to
    versioned sources
  - Level 2 — versioned skill-repo `AGENTS.md`: compact runtime rules for
    `shared/` and project skill repos
  - Level 3 — Skills: workflows, project-specific
- Stop maintaining repo `AGENTS.md` in product or docs repos; keep them only in
  versioned skill repos under `.agents/skills/`.
- Formally anchor six rules that currently exist only implicitly in session
  context (lib/app branch base, DE/EN sync, `blocks` vs. `relates` typing,
  local mirror, `--help` before unknown commands).
- Assign a verification category to each rule:
  - A — before execution (PreToolUse hook)
  - B — after execution, deterministic (grep/git scripts)
  - C — after execution, semantic (local model)
  - D — cross-file, semantic (API model)

### Boundary between AI agent content and GitHub Pages documentation

Some content exists in both AGENTS.md/Skills and GitHub Pages (e.g. coding
style, runbooks, documentation obligations). This issue establishes the
governing principle:

- **GitHub Pages** = SSOT for policies, guidelines, runbooks — publicly
  versioned, written for humans.
- **AGENTS.md / Skills** = machine-readable directives + references to the
  canonical source in GitHub Pages. No duplication of policies.
- Content that controls agent behaviour exclusively (e.g. "ask before
  implementing") does not belong in GitHub Pages.

#### Open architectural decision: relationship between GitHub Pages and AI agent levels

The loading behaviour distinguishes GitHub Pages from the three agent levels:
levels 1–3 are always active; GitHub Pages becomes effective only when
explicitly referenced — making it a lazy-loaded, potential fourth level.
Since both AGENTS.md and GitHub Pages are written in natural language, the
argument "machine-facing directive vs. human-readable" does not sustain the
separation on its own. This issue decides between four options:

| Option | Mechanism | Consequence |
| --- | --- | --- |
| A | GitHub Pages formally as level 4 (lazy-loaded) | Clear hierarchy; agent must know when to read there |
| B | Symlink GitHub Pages → Skills | SSOT stays in docs; skill auto-includes content — cross-repo boundary problematic |
| C | Symlink Skills → GitHub Pages | Canonical content lives in skill repo; Pages includes it via submodule |
| D | GitHub Pages → helper scripts (J01-115) → Skills | Pages stays pure documentation; scripts are the translation layer; requires machine-readable format |

Option D directly connects J01-113 and J01-115 and requires the authoring
convention (structured pages) as a precondition.

### AI-agent-effective documentation authoring

For GitHub Pages to actually serve as SSOT for agents, pages need an authoring
convention. This issue defines:

- **Structure requirement**: policies have explicit sections (rule, exception,
  verification criterion) so an agent can evaluate them.
- **Normative language**: must/should/may formulations (RFC 2119 style) instead
  of purely narrative prose.
- **Granularity**: one rule — one clear address; no mixing of rules on one page
  without anchors.
- **Linkability**: rules must be individually referenceable by permalink.
- **Currency signal**: every policy page carries a date so an agent can
  determine whether the document is still current.

## Current status

- Issue created, sprint assigned, label `sprint-unplanned`.
- Analysis from round notes 2026-03-20 available.
- Scope extended by two additional dimensions (2026-03-20): boundary between
  AI agent content and GitHub Pages, and AI-agent-effective authoring
  convention.
- Four architectural options A–D for the relationship between GitHub Pages
  and AI agent levels developed (2026-03-20); decision pending.
- Target model extended (2026-03-20): repo `AGENTS.md` only in versioned
  skill repos; workspace `AGENTS.md` outside Git only as a bootstrap pointer.
- Architecture decision made (2026-03-20): Option D — GitHub Pages →
  helper scripts (J01-115) → skills. No script yet; first step is defining
  the `ki_karte` format.
- New rule anchored (2026-03-20): target repos do not define or version
  their own agent rules — exclusively in skill repos (`IM-SKL-01`).
- Home of `ki_karte` schema: skill repo (`lebenslauf-web-vorlage` or
  `shared/`), not `lebenslauf-web-vorlage-docs`.
- Follow-up derivation split out (2026-03-30): the sharpening that
  non-project `tagebuch` notes must not be assigned to the Lebenslauf project
  and Jira by default in the AI flow now runs as separate issue `J01-118`.
- Implementation not yet started.

## Verification plan

| Check | Expectation | Evidence / Location | Status |
| --- | --- | --- | --- |
| No duplicate rules | Communication, UTF-8, grammar rules exist only in versioned skill sources or canonical docs | skill repos, GitHub Pages | open |
| Bootstrap/skill-repo/skill levels clearly separated | WS file only points; skill-repo AGENTS hold runtime rules; skills hold workflows | workspace `AGENTS.md`, skill repos, `SKILL.md` | open |
| Repo `AGENTS.md` only in skill repos | Product and docs repos no longer carry canonical repo AGENTS | `.agents/skills/shared/`, `.agents/skills/<project>/` | open |
| Implicit rules formally anchored | All previously implicit rules have a documented source in bootstrap, skill-repo AGENTS, or skill | rule inventory | open |
| Verification category assigned per rule | Complete table rule → category exists | work doc or skill | open |
| Boundary principle AI agent / GitHub Pages documented | Clear rule: what goes where, what must not be duplicated | this doc | open |
| Authoring convention for AI-effective docs defined | Structure requirement, normative language, granularity, permalink, date defined | policy page or documentation guideline | open |
| Public work docs present | `/de/jira/issues/J01-113/` and `/en/jira/issues/J01-113/` exist | GitHub Pages | done |

## Open points

- Specific category assignment per rule not yet worked out.
- Migration path for existing repo `AGENTS.md` in product and docs repos still
  needs to be scheduled concretely.
- Granularity mixing in WS § documentation obligation (general duties vs.
  sprint details) needs to be resolved.
- Which existing policy pages already meet the authoring convention, which need
  to be updated — inventory missing.
- Architectural decision A/B/C/D → Option D chosen.
- Migration path for existing repo `AGENTS.md` in product and docs repos still
  needs to be scheduled concretely.
- The derived exception for non-project `tagebuch` notes is tracked
  separately in `J01-118`.

## Links

- [J01-111: Epic AI rule coherence and verification architecture]({{ "/en/jira/issues/J01-111/" | relative_url }})
- [J01-115: AI verification architecture]({{ "/en/jira/issues/J01-115/" | relative_url }})
- [J01-118: Sharpen `tagebuch` context for non-project notes in the AI-agent flow]({{ "/en/jira/issues/J01-118/" | relative_url }})
- [J01-92: Shared agent rules and skill versioning]({{ "/en/jira/issues/J01-92/" | relative_url }})
- [Appendix: Rule Inventory]({{ "/en/jira/issues/J01-113/appendix-rule-inventory/" | relative_url }})
- [Appendix: Implementation Plan]({{ "/en/jira/issues/J01-113/appendix-implementation-plan/" | relative_url }})
- [Jira work docs]({{ "/en/jira/" | relative_url }})
