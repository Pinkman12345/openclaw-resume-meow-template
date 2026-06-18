#!/usr/bin/env bash
set -e

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "===== OpenClaw Resume Meow Template Env Check ====="
echo "Repo root: $REPO_ROOT"
echo ""

echo "===== 1. Check openclaw command ====="
if command -v openclaw >/dev/null 2>&1; then
  echo "OK: openclaw found at $(command -v openclaw)"
else
  echo "WARN: openclaw command not found"
fi

echo ""
echo "===== 2. Check workspace ====="
if [ -d "$HOME/.openclaw/workspace" ]; then
  echo "OK: ~/.openclaw/workspace exists"
else
  echo "FAIL: ~/.openclaw/workspace does not exist"
fi

if [ -d "$HOME/.openclaw/workspace/skills" ]; then
  echo "OK: ~/.openclaw/workspace/skills exists"
else
  echo "WARN: ~/.openclaw/workspace/skills does not exist"
fi

echo ""
echo "===== 3. Check template files ====="
required_files=(
  "$REPO_ROOT/openclaw_workspace/IDENTITY.md"
  "$REPO_ROOT/openclaw_workspace/skills/resume-meow/_meta.json"
  "$REPO_ROOT/openclaw_workspace/skills/resume-meow/SKILL.md"
  "$REPO_ROOT/openclaw_workspace/skills/resume-meow/skill-card.md"
  "$REPO_ROOT/openclaw_workspace/skills/resume-meow/ACCEPTANCE.md"
  "$REPO_ROOT/platform/profile.example.json"
  "$REPO_ROOT/platform/cron_message.md"
  "$REPO_ROOT/README.md"
)

missing=0
for file in "${required_files[@]}"; do
  if [ -f "$file" ]; then
    echo "OK: ${file#$REPO_ROOT/}"
  else
    echo "FAIL: missing ${file#$REPO_ROOT/}"
    missing=1
  fi
done

echo ""
echo "===== 4. Check sensitive runtime files ====="
risky_files=(
  "$REPO_ROOT/openclaw.json"
  "$REPO_ROOT/resume_meow_profile_response.json"
  "$REPO_ROOT/.env"
)

risk=0
for file in "${risky_files[@]}"; do
  if [ -e "$file" ]; then
    echo "WARN: risky file exists: ${file#$REPO_ROOT/}"
    risk=1
  fi
done

if [ "$risk" -eq 0 ]; then
  echo "OK: no risky runtime files found"
fi

echo ""
echo "===== Result ====="
if [ "$missing" -eq 0 ]; then
  echo "PASS: template files are complete"
else
  echo "FAIL: some template files are missing"
  exit 1
fi

if [ "$risk" -eq 0 ]; then
  echo "PASS: no obvious sensitive runtime files found"
else
  echo "WARN: please remove risky files before git commit"
fi

echo ""
echo "Next:"
echo "1. Run: bash scripts/01_install_workspace_files.sh"
echo "2. Open OpenClaw Chat"
echo "3. Ask it to read IDENTITY.md and fix identity as 简历喵"
echo "4. Run local ability test"
