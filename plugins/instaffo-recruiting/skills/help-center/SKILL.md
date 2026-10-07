---
name: help-center
description: "Answers how a feature works on Instaffo (jobs, applications, chat, talent feed, team roles, billing, settings, the MCP itself) from the public Instaffo Help Center, with the source link. Use when the user asks 'how does X work on Instaffo', 'where do I find X', 'can Instaffo do X', or when a recruiting task needs product behavior the MCP tools do not show."
---

# Instaffo Help Center

The Help Center is public and has Markdown endpoints. No login, no setup. Fetch with any web fetch tool or `curl`.

## Endpoints

| What | URL |
|---|---|
| Employer index (EN) | `https://employer-help.instaffo.com/en.md` |
| Employer index (DE) | `https://employer-help.instaffo.com/de.md` |
| One article | article URL + `.md` |
| Full-text feed (JSON) | `https://employer-help.instaffo.com/en/feed.json` (or `/de/`) |
| Talent index | `https://talent-help.instaffo.com/de.md` (or `/en.md`) |

The employer Help Center is for recruiters. Use the talent Help Center only when the question is what the candidate sees or does.

## Steps

1. Fetch the employer index in the user's language. It lists every article by category with its URL.
2. Pick the one to three articles whose titles match the question. Fetch each as Markdown (URL + `.md`).
3. No title matches: fetch the JSON feed and search `articleBody` for the question's keywords. Each item has `url`, `headline` and `dateModified`.
4. Answer in two to six sentences from the article text only. Quote steps as a list. End with the article title and URL.

## Rules

- Never invent a feature, setting or URL. If no article covers it, say so and give the index URL.
- Fetch fresh every time. Articles change.
- `dateModified` older than 18 months: say the article may be outdated and ask the user to check the app.
- The Help Center describes the web app. When a step needs the panel, give the user the steps. The MCP tools cannot click through settings.
