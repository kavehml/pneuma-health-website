#!/usr/bin/env bash
# Run once from this folder after: gh auth login
set -euo pipefail
cd "$(dirname "$0")"

REPO_NAME="${1:-pneuma-health-website}"

if ! gh auth status &>/dev/null; then
  echo "Not logged in to GitHub."
  echo "Run this first and finish in your browser:"
  echo "  gh auth login --hostname github.com --git-protocol https --web"
  exit 1
fi

if git remote get-url origin &>/dev/null; then
  echo "Remote 'origin' already set. Pushing..."
  git push -u origin main
else
  echo "Creating GitHub repo '$REPO_NAME' and pushing..."
  gh repo create "$REPO_NAME" --public --source=. --remote=origin --push \
    --description "Pneuma Health — static website"
fi

OWNER="$(gh api user -q .login)"
echo ""
echo "If Pages is not on yet: GitHub → repo → Settings → Pages → Deploy from branch → main → / (root)"
echo "Live URL (after the first Pages build, usually under a minute):"
echo "  https://${OWNER}.github.io/${REPO_NAME}/"
