#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

errors=0

# Check user-invocable skills are listed in README
for skill_file in plugins/*/skills/*/SKILL.md; do
  plugin=$(echo "$skill_file" | cut -d/ -f2)
  skill=$(grep -m1 '^name:' "$skill_file" | sed 's/^name: *//')

  # Skip non-user-invocable skills (auto-loaded)
  if grep -q '^user-invocable: false' "$skill_file"; then
    continue
  fi

  if ! grep -q "/$skill" README.md; then
    echo "MISSING skill in README: /$skill (from $plugin)"
    errors=$((errors + 1))
  fi
done

# Check agents are listed in README
for agent_file in plugins/*/agents/*.md; do
  agent=$(basename "$agent_file" .md)
  plugin=$(echo "$agent_file" | cut -d/ -f2)

  if ! grep -q "$agent" README.md; then
    echo "MISSING agent in README: $agent (from $plugin)"
    errors=$((errors + 1))
  fi
done

# Check plugins are listed in README
for plugin_dir in plugins/*/; do
  plugin=$(basename "$plugin_dir")

  if ! grep -q "$plugin" README.md; then
    echo "MISSING plugin in README: $plugin"
    errors=$((errors + 1))
  fi
done

if [ "$errors" -gt 0 ]; then
  echo ""
  echo "$errors item(s) missing from README.md"
  exit 1
else
  echo "README is up to date."
fi
