# instaffo-mcp-skills

Skills and agents for recruiters who work with the [Instaffo](https://instaffo.com) MCP server. They turn the MCP tools into complete recruiting workflows: criteria, pre-screening, interview prep, transcript analysis and team notes.

Every write action (chat messages, notes, accepts, rejects, stage moves) is drafted first and runs only after you approve it.

## Setup

### Claude Code

```bash
claude plugin marketplace add InstaffoGmbH/instaffo-mcp-skills
claude plugin install --user instaffo-recruiting@instaffo-mcp-skills
```

The plugin brings the Instaffo MCP server (`https://app.instaffo.com/mcp`). Run `/mcp` once and log in with your Instaffo recruiter account.

### Other tools (Codex, Cursor, Gemini CLI, ...)

The skills use the open `SKILL.md` format.

1. Add the MCP server `https://app.instaffo.com/mcp` (HTTP, OAuth) to your tool.
2. Copy or symlink `plugins/instaffo-recruiting/skills/*` into your tool's skills folder, for example `~/.codex/skills/` or `.cursor/skills/`.
3. Tools without skill support: point them to [AGENTS.md](AGENTS.md).

## Plugins

### instaffo-recruiting

**Agent:**

- `scout` - Scout, the recruiting agent. Give it a whole task ("prepare today's interviews", "go through new applications") and it picks the skills

**Skills:**

- `/define-criteria` - Interview you once per job and write `criteria.md`: gate, must-haves, red flags, hard facts
- `/pre-screen` - Score new applications against the criteria and propose accept, reject or unsure
- `/prep-interview` - Candidate-specific interview guide from CV, chat and criteria
- `/analyze-interview` - Transcript → call notes, recommendation, and feedback on how you interviewed
- `/write-note` - Draft the team note with a verdict and post it to Instaffo
- `instaffo-mcp-basics` - Auto-loaded: write safety and MCP traps

## Working files

Skills keep their state in `recruiting/<job-slug>/` in your current folder:

```
recruiting/
├── interviewer-feedback.md
└── senior-product-engineer/
    ├── criteria.md
    └── 2026-09-30 Jane Doe.md
```

This folder holds candidate data. Keep it out of public repositories.

## Typical day

```
/pre-screen                    → triage new applications
/prep-interview                → guides for today's calls
/analyze-interview <transcript>
/write-note                    → post the verdict to Instaffo
```

## Contributing

See [AGENTS.md](AGENTS.md).

## License

MIT
