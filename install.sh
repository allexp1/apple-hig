#!/usr/bin/env bash
# Install the apple-hig skill for Claude Code.
#   ./install.sh            -> ~/.claude/skills/apple-hig   (global)
#   ./install.sh --project  -> ./.claude/skills/apple-hig   (this repo/project)
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/apple-hig"

if [[ ! -f "$SRC_DIR/SKILL.md" ]]; then
  echo "error: can't find the skill at $SRC_DIR (expected $SRC_DIR/SKILL.md)" >&2
  exit 1
fi

if [[ "${1:-}" == "--project" ]]; then
  DEST="$(pwd)/.claude/skills"
else
  DEST="$HOME/.claude/skills"
fi

mkdir -p "$DEST"
rm -rf "$DEST/apple-hig"
cp -r "$SRC_DIR" "$DEST/apple-hig"

echo "Installed apple-hig to: $DEST/apple-hig"
echo "Use it in Claude Code with:  /apple-hig"
echo "(or just describe a design task and let it auto-trigger)"
