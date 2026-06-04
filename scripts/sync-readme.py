#!/usr/bin/env python3
"""Sync docs intro sections into app-repo README files."""

import re
from argparse import ArgumentParser, Namespace
from dataclasses import dataclass
from pathlib import Path

DOCS_BASE = "https://docs.template.ysdani.com"
DOCS_ROOT = Path(__file__).parent.parent
DEFAULT_APP_REPO = DOCS_ROOT.parent / "lebenslauf-web-vorlage"

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


@dataclass
class ReadmePage:
    metadata: dict[str, str | int]
    content: str

    def get(self, key: str, default: str = "") -> str:
        value = self.metadata.get(key, default)
        return str(value)


def main() -> None:
    args = parse_args()
    targets = [
        (
            args.app_repo / "README.md",
            build_readme("de", README_HEADER_DE),
        ),
        (
            args.app_repo / "README.en.md",
            build_readme("en", README_HEADER_EN),
        ),
    ]
    if args.check:
        check_readmes(targets)
        return
    for path, content in targets:
        path.write_text(content, encoding="utf-8")
        print(f"Geschrieben: {path}")


def parse_args() -> Namespace:
    parser = ArgumentParser()
    parser.add_argument(
        "--app-repo",
        type=Path,
        default=DEFAULT_APP_REPO,
        help="Pfad zum App-Repo mit README.md und README.en.md",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="README-Dateien nur prüfen, nicht schreiben",
    )
    return parser.parse_args()


def check_readmes(targets: list[tuple[Path, str]]) -> None:
    stale = [path for path, content in targets if read_text(path) != content]
    if not stale:
        print("README-Dateien sind synchron.")
        return
    for path in stale:
        print(f"README nicht synchron: {path}")
    raise SystemExit(1)


def read_text(path: Path) -> str:
    if not path.exists():
        return ""
    return path.read_text(encoding="utf-8")


def build_readme(lang: str, header: str) -> str:
    posts = [load_page(p) for p in find_readme_pages(lang)]
    index = build_index(posts)
    sections = [build_section(p, lang) for p in posts]
    body = "\n\n".join(sections)
    return f"{header}\n\n{index}\n\n---\n\n{body}\n"


def build_index(posts: list[ReadmePage]) -> str:
    items = [
        f"[{p.get('title', '')}](#{to_anchor(p.get('title', ''))})"
        for p in posts
    ]
    return " · ".join(items)


def build_section(
    post: ReadmePage, lang: str
) -> str:
    intro = resolve_links(extract_intro(post.content))
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
        post = load_page(path)
        order = post.metadata.get("readme_order")
        if isinstance(order, int):
            tagged.append((order, path))
    return [p for _, p in sorted(tagged)]


def load_page(path: Path) -> ReadmePage:
    text = path.read_text(encoding="utf-8")
    metadata, content = split_frontmatter(text)
    return ReadmePage(metadata, content)


def split_frontmatter(text: str) -> tuple[dict[str, str | int], str]:
    if not text.startswith("---\n"):
        return {}, text
    _, raw_metadata, content = text.split("---\n", 2)
    return parse_metadata(raw_metadata), content


def parse_metadata(raw_metadata: str) -> dict[str, str | int]:
    metadata: dict[str, str | int] = {}
    for line in raw_metadata.splitlines():
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        metadata[key.strip()] = parse_value(value.strip())
    return metadata


def parse_value(value: str) -> str | int:
    unquoted = value.strip('"\'')
    if re.fullmatch(r"\d+", unquoted):
        return int(unquoted)
    return unquoted


def extract_intro(body: str) -> str:
    lines = []
    for line in body.splitlines():
        if line.startswith("## "):
            break
        lines.append(line)
    return "\n".join(lines).strip()


def resolve_links(text: str) -> str:
    pattern = r"{{\s*['\"]([^'\"]+)['\"]\s*\|\s*relative_url\s*}}"
    return re.sub(pattern, replace_relative_url, text)


def replace_relative_url(match: re.Match[str]) -> str:
    return DOCS_BASE + match.group(1)


if __name__ == "__main__":
    main()
