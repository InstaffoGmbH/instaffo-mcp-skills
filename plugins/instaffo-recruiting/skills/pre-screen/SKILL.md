---
name: pre-screen
description: "Evaluates new Instaffo applications for one job against its criteria file and proposes accept, reject, or unsure for each, with reasons. Use when the user says 'pre-screen', 'go through new applications', 'triage the inbox', or 'who should I invite'."
user-invocable: true
---

# Pre-screen

## Steps

1. Load `recruiting/<job-slug>/criteria.md`. If it is missing, run `/define-criteria` first. Follow `recruiting-best-practices` for CV shape and chat replies.
2. `list_applications(job_id, stage: ["screening"])`. Page through until `meta.total` is reached. On older jobs, also check the unfiltered list for legacy `stage: null` rows. `null` is not the normal state of a new application.
3. For each application, `get_application` and `get_screening`. If `chat_locked` is false, also read `list_messages` and download each attachment through its `url`. Score against the criteria:
   - **Gate**: pass, fail, or unclear from the CV
   - Each must-have: 1 (missing), 2 (partial), 3 (clear evidence)
   - Hard facts from `hard_facts` and `screening_questions`
   - Red flags found
   - Links in the profile (GitHub, portfolio): open them and note recent activity and own projects (see `recruiting-best-practices`, Links and side projects)
   - The Instaffo AI screening (`fit_tier` and per-requirement results, or the older score) as a second opinion only, never as the decision. See `instaffo-mcp-basics`, AI screening
4. Quote the CV line behind each score. No quote means score 1 or "unclear". Self-rated skill years in the screening answers are not a quote.
5. Present one table, sorted by recommendation:

| Candidate | Gate | Must-haves | Hard facts | Red flags | Proposal |
|---|---|---|---|---|---|

6. Below the table, one line per candidate with the reason. List every profile link and ask the user to check it before they decide.
7. Ask the user which proposals to apply. Apply each one only after a yes. Reject with `screen_application`. Add no chat message to a rejection unless the user gives one. If required documents are missing and the chat is open, draft a `send_message` request. Keep the application in `screening` until the documents are complete. Then accept it into `shortlist`. With mutual interest, the chat stays locked until that accept. The accept then posts the job greeting. Draft no first message (see `instaffo-mcp-basics`, Greeting).

## Rules

- Unclear gate is `unsure`, not `reject`. The call is where it gets tested.
- Never reject for no chat reply. Propose a call or one follow-up message. If the user requires documents before `shortlist`, request them once and wait in `screening`.
- Do not penalize missing data the profile never asks for.
- When the user decides differently from a proposal, ask why. Add the reason to the criteria file as a must-have or red flag, so the next pre-screen matches. Ask before you write it.
- Do not use age, gender, origin, religion, disability, or family status, or anything that points to them (photo, name, graduation year as an age proxy). This is required by the AGG (German anti-discrimination law).
