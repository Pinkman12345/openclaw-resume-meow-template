#!/usr/bin/env bash
set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Repo root: $REPO_ROOT"

SRC_IDENTITY="$REPO_ROOT/openclaw_workspace/IDENTITY.md"
SRC_SKILL_DIR="$REPO_ROOT/openclaw_workspace/skills/resume-meow"

TARGET_ROOT="$HOME/.openclaw/workspace"
TARGET_SKILL_DIR="$TARGET_ROOT/skills"

echo "Checking source files..."

test -f "$SRC_IDENTITY"
test -d "$SRC_SKILL_DIR"

echo "Preparing target workspace..."

mkdir -p "$TARGET_SKILL_DIR"

# backup identity
if [ -f "$TARGET_ROOT/IDENTITY.md" ]; then
  cp "$TARGET_ROOT/IDENTITY.md" "$TARGET_ROOT/IDENTITY.md.bak.$(date +%Y%m%d_%H%M%S)"
fi

# backup skill
if [ -d "$TARGET_SKILL_DIR/resume-meow" ]; then
  cp -r "$TARGET_SKILL_DIR/resume-meow" "$TARGET_SKILL_DIR/resume-meow.bak.$(date +%Y%m%d_%H%M%S)"
fi

echo "Installing identity..."
cp "$SRC_IDENTITY" "$TARGET_ROOT/IDENTITY.md"

echo "Installing skill..."
mkdir -p "$TARGET_SKILL_DIR"
cp -r "$SRC_SKILL_DIR" "$TARGET_SKILL_DIR/"

echo "DONE ✔ resume-meow installed"
echo "Next:"
echo "1. Open OpenClaw Chat"
echo "2. Reload identity"
echo "3. Run local test"

