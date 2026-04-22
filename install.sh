#!/bin/bash
set -e

SKILLS_DIR="$HOME/.claude/skills"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS=(audit-site create-website frontend-design seo)

mkdir -p "$SKILLS_DIR"

echo "Installing skills into $SKILLS_DIR"
echo ""

for skill in "${SKILLS[@]}"; do
  if [ -d "$SKILLS_DIR/$skill" ]; then
    echo "  $skill — already exists, overwriting"
    rm -rf "$SKILLS_DIR/$skill"
  else
    echo "  $skill — installing"
  fi
  cp -R "$REPO_DIR/$skill" "$SKILLS_DIR/$skill"
done

echo ""
echo "Done. Restart Claude Code to load the skills."
echo "Then try: /create-website"
