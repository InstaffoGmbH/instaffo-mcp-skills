#!/usr/bin/env bash
set -euo pipefail

# Checks that every plugin's own manifest version matches its entry in the
# marketplace registry. Version drift between these two files means
# `claude plugin update` won't re-fetch and consumers won't see changes.

cd "$(git rev-parse --show-toplevel)"

MARKETPLACE="./.claude-plugin/marketplace.json"

errors=0

for manifest in plugins/*/.claude-plugin/plugin.json; do
  name=$(jq -r '.name' "$manifest")
  plugin_version=$(jq -r '.version' "$manifest")
  marketplace_version=$(jq -r --arg n "$name" \
    '.plugins[] | select(.name == $n) | .version' "$MARKETPLACE")

  if [ -z "$marketplace_version" ] || [ "$marketplace_version" = "null" ]; then
    echo "MISSING plugin in marketplace.json: $name"
    errors=$((errors + 1))
    continue
  fi

  if [ "$plugin_version" != "$marketplace_version" ]; then
    echo "VERSION MISMATCH: $name — plugin.json=$plugin_version marketplace.json=$marketplace_version"
    errors=$((errors + 1))
  fi
done

for source in $(jq -r '.plugins[].source' "$MARKETPLACE"); do
  if [ ! -f "$source/.claude-plugin/plugin.json" ]; then
    echo "STALE marketplace.json entry: $source has no plugin manifest"
    errors=$((errors + 1))
  fi
done

if [ "$errors" -gt 0 ]; then
  echo ""
  echo "$errors version mismatch(es). Bump the version in BOTH plugins/<name>/.claude-plugin/plugin.json and .claude-plugin/marketplace.json so they match."
  exit 1
else
  echo "All plugin versions are aligned with marketplace.json."
fi
