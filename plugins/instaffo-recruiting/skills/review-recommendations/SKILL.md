---
name: review-recommendations
description: "Goes through the talents Instaffo's matching agent recommended for one job, judges each against the criteria file, and proposes invite or reject, with a draft invite message. Use when the user says 'check the recommendations', 'who did the agent suggest', 'go through the suggested talents', or 'whom should I invite to apply'. Not for people who already applied: that is pre-screen."
user-invocable: true
---

# Review recommendations

Recommended talents did not apply. An invite asks them to apply for the job. Follow `instaffo-mcp-basics` (Recommendations) and `recruiting-best-practices`.

## Steps

1. Load `recruiting/<job-slug>/criteria.md`. If it is missing, run `/define-criteria` first.
2. `list_recommendations(job_id)`. No rows on an inactive job: tell the user and stop.
3. For each recommendation, `get_recommendation`. Judge it like an application in `/pre-screen`: gate, must-haves with a quote from the profile, hard facts, red flags. The agent's reasoning and the AI screening are a second opinion only.
4. Present the results (see Output) and ask which proposals to apply.
5. For the invites, draft one message and show it. Use the user's earlier invite text if they have one. Keep it short: why this job fits this talent's background, and what happens next. The placeholder `[Talent first name]` (German: `[Talent Vorname]`) is filled in for each talent. No links, email addresses or phone numbers.
6. Apply each decision only after a yes: `invite_recommendation` with the approved message, or `reject_recommendation` with the user's reason as `feedback`.
7. Report what was sent. If the daily invite limit is reached, list the invites that are still open and suggest sending them tomorrow.

## Output

One table, sorted by proposal. Profiles are anonymous, so refer to each talent by number and current role. Mark talents with `previously_contacted: true`.

| #   | Current role | Gate | Must-haves | Hard facts | Red flags | Proposal |
| --- | ------------ | ---- | ---------- | ---------- | --------- | -------- |

Below the table, one line per talent with the reason.

## Rules

- `unsure` is a valid proposal. Leave those open; the user decides.
- An invite is the company's first contact with the talent. Never send one without approval of the exact text.
- Ask for the reason when the user rejects. A reason that repeats is a criterion: propose to add it to the criteria file.
- Do not use age, gender, origin, religion, disability or family status, or anything that points to them. This is required by the AGG.
