#!/usr/bin/env bash
# Publishes this package to npm, so that `npx apple-hig` works.
#
#   npm login                 # once
#   bash scripts/publish.sh   # extra arguments go to `npm publish`
#
# Bump the version in apple-hig/SKILL.md and package.json first; npm refuses
# to publish a version that already exists.

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

if ! npm whoami >/dev/null 2>&1; then
  echo "Not logged in to npm. Run 'npm login', then run this script again." >&2
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "The working tree has uncommitted changes. Commit them first, so the" >&2
  echo "published package matches the repository." >&2
  exit 1
fi

bash scripts/build.sh --check
node bin/install.js --dry-run >/dev/null

VERSION="$(sed -n 's/^  "version": "\(.*\)",$/\1/p' package.json)"
echo "Publishing apple-hig $VERSION as $(npm whoami)"
npm publish --access public "$@"

echo
echo "Published. Check it with:  npx apple-hig --dry-run"
