#!/usr/bin/env python3
"""Sync docs intro sections into app-repo README files."""

import re
from argparse import ArgumentParser, Namespace
from dataclasses import dataclass
from pathlib import Path

DOCS_BASE = "https://docs.template.ysdani.com"
DOCS_ROOT = Path(__file__).parent.parent
DEFAULT_APP_REPO = DOCS_ROOT.parent / "lebenslauf-web-vorlage"
FLOW_SCRIPT = "tests/ci/readme-dev-user-flow.sh"
CLONE_URL = "https://github.com/blaumohn/lebenslauf-web-vorlage"

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

SECTION_PAGE = {
    "schnellstart": {
        "de": DOCS_ROOT / "de/getting-started/schnellstart/index.md",
        "en": DOCS_ROOT / "en/getting-started/quickstart/index.md",
    },
    "private_ansicht_einrichten": {
        "de": DOCS_ROOT / "de/getting-started/private-ansicht/index.md",
        "en": DOCS_ROOT / "en/getting-started/private-view/index.md",
    },
}

SECTION_TITLE = {
    "schnellstart": {
        "de": "`schnellstart()`",
        "en": "`schnellstart()`",
    },
    "private_ansicht_einrichten": {
        "de": "`private_ansicht_einrichten()`",
        "en": "`private_ansicht_einrichten()`",
    },
}

SECTION_NOTE = {
    "schnellstart": {
        "de": (
            "Quelle: `tests/ci/readme-dev-user-flow.sh`. Der Clone-Befehl "
            "nutzt hier die öffentliche GitHub-URL."
        ),
        "en": (
            "Source: `tests/ci/readme-dev-user-flow.sh`. The clone command "
            "uses the public GitHub URL here."
        ),
    },
    "private_ansicht_einrichten": {
        "de": (
            "Quelle: `tests/ci/readme-dev-user-flow.sh`."
        ),
        "en": (
            "Source: `tests/ci/readme-dev-user-flow.sh`."
        ),
    },
}


@dataclass
class ReadmePage:
    metadata: dict[str, str | int]
    content: str
    frontmatter: str

    def get(self, key: str, default: str = "") -> str:
        value = self.metadata.get(key, default)
        return str(value)


def main() -> None:
    args = parse_args()
    section_commands = read_section_commands(args.flow_script)
    docs_targets = build_section_docs(section_commands)
    if args.check:
        check_readmes(docs_targets)
        check_readmes(refresh_readme_targets(args.app_repo))
        return
    write_targets(docs_targets)
    write_targets(refresh_readme_targets(args.app_repo))


def refresh_readme_targets(app_repo: Path) -> list[tuple[Path, str]]:
    return [
        (app_repo / "README.md", build_readme("de", README_HEADER_DE)),
        (app_repo / "README.en.md", build_readme("en", README_HEADER_EN)),
    ]


def write_targets(targets: list[tuple[Path, str]]) -> None:
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
    parser.add_argument(
        "--flow-script",
        type=Path,
        help="Quelle für den README-Schnellstart",
    )
    args = parser.parse_args()
    if args.flow_script is None:
        args.flow_script = args.app_repo / FLOW_SCRIPT
    return args


def read_section_commands(flow_script: Path) -> dict[str, list[str]]:
    return {
        name: read_function_commands(flow_script, name)
        for name in SECTION_PAGE
    }


def read_function_commands(flow_script: Path, name: str) -> list[str]:
    lines = extract_function_block(flow_script, name)
    return [replace_clone_command(line) for line in lines]


def extract_function_block(path: Path, name: str) -> list[str]:
    lines = path.read_text(encoding="utf-8").splitlines()
    start = f"{name}() {{"
    for index, line in enumerate(lines):
        if line.strip() == start:
            return collect_function_block(lines[index:])
    raise SystemExit(f"Funktion nicht gefunden: {name} in {path}")


def collect_function_block(lines: list[str]) -> list[str]:
    block = []
    for line in lines:
        block.append(line)
        if line.strip() == "}":
            return block
    raise SystemExit("Funktionsende nicht gefunden")


def replace_clone_command(line: str) -> str:
    command = line.strip()
    if not command.startswith("git clone "):
        return line
    indent = line[: len(line) - len(line.lstrip())]
    return f"{indent}git clone {CLONE_URL} lebenslauf-web-vorlage"


def build_section_docs(
    section_commands: dict[str, list[str]]
) -> list[tuple[Path, str]]:
    targets = []
    for name, pages in SECTION_PAGE.items():
        for lang, path in pages.items():
            content = build_section_page(path, name, lang, section_commands)
            targets.append((path, content))
    return targets


def build_section_page(
    path: Path,
    name: str,
    lang: str,
    section_commands: dict[str, list[str]],
) -> str:
    post = load_page(path)
    intro = build_generated_intro(name, lang, section_commands[name])
    tail = extract_tail(post.content)
    return f"{post.frontmatter}\n\n{intro}\n\n{tail}\n"


def build_generated_intro(
    name: str, lang: str, commands: list[str]
) -> str:
    block = "\n".join(commands)
    return (
        f"**{SECTION_TITLE[name][lang]}**\n\n"
        f"```bash\n{block}\n```\n\n"
        f"{SECTION_NOTE[name][lang]}"
    )


def extract_tail(body: str) -> str:
    lines = body.splitlines()
    for index, line in enumerate(lines):
        if line.startswith("## "):
            return "\n".join(lines[index:]).strip()
    return ""


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
    metadata, content, frontmatter = split_frontmatter(text)
    return ReadmePage(metadata, content, frontmatter)


def split_frontmatter(text: str) -> tuple[dict[str, str | int], str, str]:
    if not text.startswith("---\n"):
        return {}, text, ""
    _, raw_metadata, content = text.split("---\n", 2)
    frontmatter = f"---\n{raw_metadata}---"
    return parse_metadata(raw_metadata), content, frontmatter


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
