# instaffo-mcp-skills

Public skill marketplace for the Instaffo Recruiter MCP. Users are external recruiters at Instaffo customers, not Instaffo staff.

## Using the skills without Claude Code

Skills live in `plugins/instaffo-recruiting/skills/<name>/SKILL.md`. Read `instaffo-mcp-basics` first, then the skill for the task. The agent persona and rules are in `plugins/instaffo-recruiting/agents/scout.md`.

## Structure

```
.claude-plugin/marketplace.json          # Marketplace registry
plugins/instaffo-recruiting/
├── .claude-plugin/plugin.json           # Plugin manifest
├── CHANGELOG.md
├── agents/scout.md
└── skills/<name>/SKILL.md
```

## Rules

- **Public repo.** No internal Instaffo names, URLs, job data, candidate data, or customer data. Examples use invented people.
- **Tool-agnostic.** Refer to MCP tools by their bare name (`list_applications`), never with a client prefix like `mcp__...`. No dependency on one meeting, calendar, or transcript tool.
- **Write safety.** Every skill that writes to Instaffo drafts first and waits for explicit approval.
- **Version bump.** Any change under `plugins/<name>/` bumps the version in both `plugins/<name>/.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`. Add a line to the plugin's `CHANGELOG.md`.
- **README.** Every user-invocable skill, agent and plugin is listed in `README.md`. CI checks it.

## Validation

```bash
claude plugin validate .
for plugin in plugins/*/; do claude plugin validate "$plugin"; done
./scripts/lint-readme.sh
./scripts/lint-versions.sh
```
