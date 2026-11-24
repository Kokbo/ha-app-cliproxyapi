#!/usr/bin/env bash
# Bump the add-on patch version in config.yaml and add a CHANGELOG.md entry.
#
# Home Assistant only offers an update (and rebuilds the add-on on the user's
# device) when `version` changes, so every change to what the add-on builds
# needs a version bump to reach installed add-ons.
#
# Usage: bump-addon-version.sh "<changelog line>"
#   The line is added as a "- " bullet under a new "## X.Y.Z" header.
#   Prints the new version on stdout. Does not commit.
#
# Environment:
#   REPO_ROOT  repo checkout to edit (default: git toplevel)
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-$(git rev-parse --show-toplevel)}"
CONFIG="$REPO_ROOT/cliproxyapi/config.yaml"
CHANGELOG="$REPO_ROOT/cliproxyapi/CHANGELOG.md"

die() { echo "::error::$*" >&2; exit 1; }

[ "$#" -eq 1 ] && [ -n "$1" ] || die "usage: $0 \"<changelog line>\""
entry_line="- $1"

version="$(sed -nE 's/^version: "?([0-9]+\.[0-9]+\.[0-9]+)"?$/\1/p' "$CONFIG")"
[ -n "$version" ] || die "$CONFIG: no 'version: \"X.Y.Z\"' line"
IFS=. read -r major minor patch <<< "$version"
new_version="$major.$minor.$((patch + 1))"

NEW_LINE="version: \"$new_version\"" awk '
    /^version: / { print ENVIRON["NEW_LINE"]; next } { print }
' "$CONFIG" > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"
grep -qxF "version: \"$new_version\"" "$CONFIG" || die "$CONFIG: version not updated"

entry_header="## $new_version"
head -n1 "$CHANGELOG" | grep -qxF '# Changelog' || die "$CHANGELOG: first line must be '# Changelog'"
{
    head -n1 "$CHANGELOG"
    printf '\n%s\n\n%s\n' "$entry_header" "$entry_line"
    tail -n +2 "$CHANGELOG"
} > "$CHANGELOG.tmp" && mv "$CHANGELOG.tmp" "$CHANGELOG"
grep -qxF -- "$entry_header" "$CHANGELOG" || die "$CHANGELOG: entry header missing after edit"
grep -qxF -- "$entry_line" "$CHANGELOG" || die "$CHANGELOG: entry line missing after edit"

echo "$new_version"
