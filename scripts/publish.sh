#!/usr/bin/env bash
# Publishes this package to npm, so that `npx apple-hig` works.
#
#   npm login                 # once
#   bash scripts/publish.sh   # extra arguments go to `npm publish`
#
# With two-factor auth on the npm account, the publish needs your approval:
#   - in a terminal window, npm asks for it itself;
#   - from an agent shell or a script, this opens npm's approval page in your
#     browser and waits for you to approve it there (needs python3);
#   - or pass the current code from your authenticator app: --otp=<code>.
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

HAS_OTP=0
for arg in "$@"; do
  [[ "$arg" == --otp* ]] && HAS_OTP=1
done

if [[ -t 0 && -t 1 ]] || (( HAS_OTP )) || ! command -v python3 >/dev/null 2>&1; then
  PUBLISH=(npm publish --access public "$@")
else
  # No terminal here, so npm would stop with EOTP instead of offering approval
  # in the browser. Run it on a pseudo-terminal and open the page it prints.
  PUBLISH=(python3 scripts/npm_approve.py npm publish --access public "$@")
fi

if ! "${PUBLISH[@]}"; then
  cat >&2 <<'MSG'

npm did not publish. If it needed a one-time password (EOTP), either:
  - run this again and approve the page that opens in your browser, or
  - pass the current 6-digit code from your authenticator app's npm entry
    (it changes about every 30 seconds):  bash scripts/publish.sh --otp=<code>
MSG
  exit 1
fi

echo
echo "Published. Check it with:  npx apple-hig --dry-run"
