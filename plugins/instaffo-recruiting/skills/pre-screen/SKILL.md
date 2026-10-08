---
name: pre-screen
description: "Evaluates new Instaffo applications for one job against its criteria file and proposes accept, reject, or unsure for each, with reasons. Use when the user says 'pre-screen', 'go through new applications', 'triage the inbox', or 'who should I invite'."
user-invocable: true
---

# Pre-screen

## Steps

1. Load `recruiting/<job-slug>/criteria.md`. If it is missing, run `/define-criteria` first. Follow `recruiting-best-practices` for CV shape and chat replies.
2. `list_applications(job_id, stage: ["application"])`. Page through until `meta.total` is reached. Include untriaged rows (`stage: null`).
3. For each application, `get_application` and `get_screening`. Score against the criteria:
   - **Gate**: pass, fail, or unclear from the CV
   - Each must-have: 1 (missing), 2 (partial), 3 (clear evidence)
   - Hard facts from `hard_facts` and `screening_questions`
   - Red flags found
   - Links in the profile (GitHub, portfolio): open them and note recent activity and own projects (see `recruiting-best-practices`, Links and side projects)
   - Instaffo `fit_analysis.score` as a second opinion only, never as the decision
4. Quote the CV line behind each score. No quote means score 1 or "unclear". Self-rated skill years in the screening answers are not a quote.
5. Present one table, sorted by recommendation:

| Candidate | Gate | Must-haves | Hard facts | Red flags | Proposal |
|---|---|---|---|---|---|

6. Below the table, one line per candidate with the reason. List every profile link and ask the user to check it before they decide.
7. Ask the user which proposals to apply. Apply each one with `screen_application` only after a yes. Rejections send no chat message unless the user gives one. Accepts post the job greeting, so draft no first message (see `instaffo-mcp-basics`, Greeting).

## Rules

- Unclear gate is `unsure`, not `reject`. The call is where it gets tested.
- No chat reply is never a reason to wait or reject. Propose a call, or one follow-up message if a single answer decides it.
- Do not penalize missing data the profile never asks for.
- When the user decides differently from a proposal, ask why. Add the reason to the criteria file as a must-have or red flag, so the next pre-screen matches. Ask before you write it.
- Do not use age, gender, origin, religion, disability, or family status, or anything that points to them (photo, name, graduation year as an age proxy). This is required by the AGG (German anti-discrimination law).
