#!/usr/bin/env python3
"""Sync docs intro sections into app-repo README files."""

import re
from pathlib import Path

import frontmatter
from liquid import Environment

DOCS_BASE = "https://docs.template.ysdani.com"
DOCS_ROOT = Path(__file__).parent.parent
APP_REPO = DOCS_ROOT.parent / "lebenslauf-web-vorlage"

README_HEADER_DE = (
    "# Lebenslauf-Web-Vorlage (PHP)\n\n"
    "Deutsch | [English](README.en.md)"
)
README_HEADER_EN = (
    "# CV Web Template (PHP)\n\n"
    "[Deutsch](README.md) | English"
)

DOCS_LINK = {
    "de": "Vollständiger Abschnitt",
    "en": "Full section",
}


def main() -> None:
    env = make_liquid_env()
    targets = [
        (
            APP_REPO / "README.md",
            build_readme("de", README_HEADER_DE, env),
        ),
        (
            APP_REPO / "README.en.md",
            build_readme("en", README_HEADER_EN, env),
        ),
    ]
    for path, content in targets:
        path.write_text(content, encoding="utf-8")
        print(f"Geschrieben: {path}")


def build_readme(lang: str, header: str, env: Environment) -> str:
    posts = [frontmatter.load(p) for p in find_readme_pages(lang)]
    index = build_index(posts)
    sections = [build_section(p, lang, env) for p in posts]
    body = "\n\n".join(sections)
    return f"{header}\n\n{index}\n\n---\n\n{body}\n"


def build_index(posts: list[frontmatter.Post]) -> str:
    items = [
        f"[{p.get('title', '')}](#{to_anchor(p.get('title', ''))})"
        for p in posts
    ]
    return " · ".join(items)


def build_section(
    post: frontmatter.Post, lang: str, env: Environment
) -> str:
    intro = resolve_links(extract_intro(post.content), env)
    title = post.get("title", "")
    permalink = post.get("permalink", "")
    label = DOCS_LINK[lang]
    attribution = (
        f"<small>*{label}: [{title}]({DOCS_BASE}{permalink})*</small>"
    )
    return f"## {title}\n{attribution}\n\n{as_blockquote(intro)}\n\n---"


def to_anchor(title: str) -> str:
    anchor = title.lower()
    anchor = re.sub(r"[^\w\s-]", "", anchor)
    return re.sub(r"\s+", "-", anchor.strip())


def as_blockquote(text: str) -> str:
    lines = text.splitlines()
    return "\n".join(f"> {line}" if line else ">" for line in lines)


def find_readme_pages(lang: str) -> list[Path]:
    tagged = []
    for path in (DOCS_ROOT / lang).rglob("index.md"):
        post = frontmatter.load(path)
        if "readme_order" in post.metadata:
            tagged.append((post["readme_order"], path))
    return [p for _, p in sorted(tagged)]


def extract_intro(body: str) -> str:
    lines = []
    for line in body.splitlines():
        if line.startswith("## "):
            break
        lines.append(line)
    return "\n".join(lines).strip()


def resolve_links(text: str, env: Environment) -> str:
    return env.from_string(text).render()


def make_liquid_env() -> Environment:
    env = Environment()
    env.filters["relative_url"] = lambda val: DOCS_BASE + val
    return env


if __name__ == "__main__":
    main()
