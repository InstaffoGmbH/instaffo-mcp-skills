---
name: pre-screen
description: "Evaluates new Instaffo applications for one job against its criteria file and proposes accept, reject, or unsure for each, with reasons. Use when the user says 'pre-screen', 'go through new applications', 'triage the inbox', or 'who should I invite'."
user-invocable: true
---

# Pre-screen

## Steps

1. Load `recruiting/<job-slug>/criteria.md`. If it is missing, run `/define-criteria` first.
2. `list_applications(job_id, stage: ["application"])`. Page through until `meta.total` is reached. Include untriaged rows (`stage: null`).
3. For each application, `get_application` and `get_screening`. Score against the criteria:
   - **Gate**: pass, fail, or unclear from the CV
   - Each must-have: 1 (missing), 2 (partial), 3 (clear evidence)
   - Hard facts from `hard_facts` and `screening_questions`
   - Red flags found
   - Instaffo `fit_analysis.score` as a second opinion only, never as the decision
4. Quote the CV line behind each score. No quote means score 1 or "unclear".
5. Present one table, sorted by recommendation:

| Candidate | Gate | Must-haves | Hard facts | Red flags | Proposal |
|---|---|---|---|---|---|

6. Below the table, one line per candidate with the reason.
7. Ask the user which proposals to apply. Apply each one with `screen_application` only after a yes. Rejections send no chat message unless the user gives one.

## Rules

- Unclear gate is `unsure`, not `reject`. The call is where it gets tested.
- Do not penalize missing data the profile never asks for.
- Do not use age, gender, origin, religion, disability, or family status, or anything that points to them (photo, name, graduation year as an age proxy). This is required by the AGG (German anti-discrimination law).
