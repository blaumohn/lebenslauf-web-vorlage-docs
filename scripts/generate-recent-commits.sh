#!/bin/sh
# Liest git log aus Projekt-Repos und schreibt _data/recent_commits.yml.
# Repos werden im gleichen Oberverzeichnis wie dieses Repo erwartet.
# Aufruf: sh scripts/generate-recent-commits.sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
PARENT_DIR=$(CDPATH= cd -- "$REPO_ROOT/.." && pwd)
OUTPUT="$REPO_ROOT/_data/recent_commits.yml"
RAWFILE="${TMPDIR:-/tmp}/recent_commits.$$.raw"
TOP=10

main() {
    : > "$RAWFILE"
    collect_repo "lebenslauf-web-vorlage"      "blaumohn/lebenslauf-web-vorlage"
    collect_repo "lebenslauf-web-vorlage-docs" "blaumohn/lebenslauf-web-vorlage-docs"
    collect_repo "pipeline-config-spec-php"    "blaumohn/pipeline-config-spec-php"
    write_output
    rm -f "$RAWFILE"
    printf 'Geschrieben: %s\n' "$OUTPUT"
}

collect_repo() {
    name="$1"
    slug="$2"
    path="$PARENT_DIR/$name"
    [ -d "$path/.git" ] || return 0
    git -C "$path" fetch --quiet origin 2>/dev/null || true
    git -C "$path" log --remotes --format="%aI %H %s" --max-count=20 \
        -- . ":(exclude)_data/recent_commits.yml" \
        | parse_log_lines "$name" "$slug" >> "$RAWFILE"
}

parse_log_lines() {
    name="$1"
    slug="$2"
    awk -v name="$name" -v slug="$slug" '{
        dt  = $1
        sha = $2
        msg = substr($0, length(dt) + length(sha) + 3)
        short = substr(sha, 1, 7)
        url = "https://github.com/" slug "/commit/" sha
        print dt "\t" name "\t" sha "\t" short "\t" url "\t" msg
    }'
}

write_output() {
    {
        printf '# Generiert von scripts/generate-recent-commits.sh\n'
        printf '# Nicht manuell bearbeiten.\n'
        sort -r "$RAWFILE" | head -"$TOP" | format_entries
    } > "$OUTPUT"
}

format_entries() {
    while IFS="	" read -r dt name sha short url msg; do
        format_entry "$dt" "$name" "$sha" "$short" "$url" "$msg"
    done
}

format_entry() {
    dt="$1" name="$2" sha="$3" short="$4" url="$5"
    msg=$(printf '%s' "$6" | sed "s/'/'\\''/g")
    printf -- '- repo: %s\n' "$name"
    printf    '  sha: %s\n' "$sha"
    printf    '  short_sha: %s\n' "$short"
    printf    '  datetime: "%s"\n' "$dt"
    printf    '  github_url: "%s"\n' "$url"
    printf    "  message: '%s'\n" "$msg"
}

main
