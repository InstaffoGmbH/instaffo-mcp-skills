# instaffo-mcp-skills

Skills and agents for recruiters who work with the [Instaffo](https://instaffo.com) MCP server. They turn the MCP tools into complete recruiting workflows: criteria, pre-screening, interview prep, transcript analysis and team notes.

Every write action (chat messages, notes, accepts, rejects, stage moves) is drafted first and runs only after you approve it.

> [!IMPORTANT]
> **Beta access only.** The Instaffo MCP is currently available to selected Instaffo customers. Skills and tool behavior can change without notice. To request access or send feedback, email [nikolai@instaffo.com](mailto:nikolai@instaffo.com).

## Requirements

- An Instaffo recruiter account with MCP beta access
- An AI tool with MCP support: Claude Code, Claude Desktop, Codex, Cursor, or similar

## Setup

### 1. Connect the Instaffo MCP

Add the server once in your tool. Skip this if it is already connected.

- URL: `https://app.instaffo.com/mcp`
- Transport: HTTP, login with your Instaffo recruiter account (OAuth)

Claude Code:

```bash
claude mcp add --transport http --scope user instaffo https://app.instaffo.com/mcp
```

Then run `/mcp` in Claude Code and log in.

### 2. Install the skills

Claude Code:

```bash
claude plugin marketplace add InstaffoGmbH/instaffo-mcp-skills
claude plugin install instaffo-recruiting@instaffo-mcp-skills
```

Restart Claude Code after the install.

Other tools (Codex, Cursor, Gemini CLI, ...): the skills use the open `SKILL.md` format.

1. Copy or symlink `plugins/instaffo-recruiting/skills/*` into your tool's skills folder, for example `~/.codex/skills/` or `.cursor/skills/`.
2. Tools without skill support: point them to [AGENTS.md](AGENTS.md).

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
- `/help-center` - Answer "how does X work on Instaffo" from the public Help Center, with the source link
- `instaffo-mcp-basics` - Auto-loaded: write safety and MCP traps
- `recruiting-best-practices` - Auto-loaded: reading CV shape (linearity, job hopping, gaps) and handling missing chat replies

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

## Feedback

Bugs, ideas and access requests: [nikolai@instaffo.com](mailto:nikolai@instaffo.com).

## Contributing

See [AGENTS.md](AGENTS.md).

## License

MIT
