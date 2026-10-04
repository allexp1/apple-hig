#!/usr/bin/env bash
# Checks the skill and rebuilds what is derived from it. Run after any edit:
#
#   bash scripts/build.sh           # check, then rebuild the hash and the package
#   bash scripts/build.sh --check   # check only, write nothing
#
# Checks: the SKILL.md frontmatter (name, version, description length), that
# the version matches package.json and has a CHANGELOG.md entry, and that every
# reference file SKILL.md points at exists.
# Rebuilds: apple-hig/.living/ORIGINAL.sha256 and dist/apple-hig.skill.

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

CHECK_ONLY=0
[[ "${1:-}" == "--check" ]] && CHECK_ONLY=1

SKILL_MD="apple-hig/SKILL.md"
HASH_FILE="apple-hig/.living/ORIGINAL.sha256"
DIST="dist/apple-hig.skill"

fail() { echo "error: $*" >&2; exit 1; }

sha256_of() {
  if command -v shasum >/dev/null 2>&1; then
    shasum -a 256 "$1" | awk '{print $1}'
  else
    sha256sum "$1" | awk '{print $1}'
  fi
}

[[ -f "$SKILL_MD" ]] || fail "$SKILL_MD not found"

# Frontmatter: the first block between --- lines must hold name, version, and
# a description of at most 1024 characters.
FRONT="$(awk '/^---[[:space:]]*$/ {n++; next} n==1 {print} n>=2 {exit}' "$SKILL_MD")"
NAME="$(printf '%s\n' "$FRONT" | awk -F': *' '/^name:/ {print $2; exit}')"
SKILL_VERSION="$(printf '%s\n' "$FRONT" | awk -F'"' '/^version:/ {print $2; exit}')"
DESC="$(printf '%s\n' "$FRONT" | sed -n 's/^description: //p')"
DESC_LEN="$(printf '%s' "$DESC" | wc -m | tr -d ' ')"

[[ "$NAME" == "apple-hig" ]] || fail "frontmatter name is '$NAME', expected apple-hig"
[[ -n "$SKILL_VERSION" ]] || fail "no quoted version in the SKILL.md frontmatter"
(( DESC_LEN > 0 )) || fail "no description in the SKILL.md frontmatter"
(( DESC_LEN <= 1024 )) || fail "description is $DESC_LEN characters; the limit is 1024"

PKG_VERSION="$(sed -n 's/^  "version": "\(.*\)",$/\1/p' package.json)"
[[ "$PKG_VERSION" == "$SKILL_VERSION" ]] \
  || fail "version mismatch: SKILL.md $SKILL_VERSION, package.json $PKG_VERSION"

grep -q "^## $SKILL_VERSION " CHANGELOG.md \
  || fail "CHANGELOG.md has no entry for $SKILL_VERSION"

# Every reference file that SKILL.md points at must exist.
for ref in $(grep -o 'references/[a-z-]*\.md' "$SKILL_MD" | sort -u); do
  [[ -f "apple-hig/$ref" ]] || fail "SKILL.md mentions $ref, which does not exist"
done

if (( CHECK_ONLY )); then
  [[ "$(cat "$HASH_FILE" 2>/dev/null)" == "$(sha256_of "$SKILL_MD")" ]] \
    || fail "$HASH_FILE is out of date; run 'bash scripts/build.sh'"
  [[ -f "$DIST" ]] || fail "$DIST is missing; run 'bash scripts/build.sh'"
  unzip -p "$DIST" apple-hig/SKILL.md | cmp -s - "$SKILL_MD" \
    || fail "$DIST is out of date; run 'bash scripts/build.sh'"
  echo "apple-hig $SKILL_VERSION: checks passed"
  exit 0
fi

sha256_of "$SKILL_MD" > "$HASH_FILE"

mkdir -p dist
rm -f "$DIST"
zip -q -r -X "$DIST" apple-hig -x '*.DS_Store' '*/__pycache__/*'

echo "apple-hig $SKILL_VERSION"
echo "  description: $DESC_LEN / 1024 characters"
echo "  hash:        $(cat "$HASH_FILE")"
echo "  package:     $DIST ($(unzip -l "$DIST" | tail -1 | awk '{print $2}') entries)"
