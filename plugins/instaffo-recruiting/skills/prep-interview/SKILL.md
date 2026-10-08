---
name: prep-interview
description: "Prepares a candidate-specific interview guide from the Instaffo profile, chat, and job criteria: CV summary, what to check, a timed question plan, and decision rules. Use when the user says 'prepare my interview', 'prep the call with X', or 'interview notes for today's candidates'."
user-invocable: true
---

# Prep interview

## Steps

1. Find the candidate: the user names them, or read today's calls from the user's calendar if a calendar tool is available. Match names to `list_applications` rows.
2. Load `recruiting/<job-slug>/criteria.md`. If it is missing, run `/define-criteria` first.
3. Read `get_application`, `get_screening`, `list_messages` and `list_notes`. Read every CV station and every chat message in full. Check the greeting for hard-fact questions (see `instaffo-mcp-basics`, Greeting).
4. Read the last 2-3 files in `recruiting/<job-slug>/` for the style the user accepted, and `interviewer-feedback.md` if it exists.
5. Write `recruiting/<job-slug>/<YYYY-MM-DD> <Name>.md` with the template below.

## Template

```markdown
---
source: <application url>
---

Call <HH:MM-HH:MM>.

# History

- **<Company>** (<from - to>, <duration>): <title>. <1-3 facts that matter for the criteria>
- <education>, <salary vs. range>, <notice>, <location>, <languages>

<chat reply summary in 1-2 lines>

# What to check

1. **<gap or claim>.** <why it matters, which criterion>
2. **Upside:** <strengths>

# <N> minutes

## 0-2: Intro
## <m-n>: <topic>

- "<question asking for one real, recent example>"
- Red: <answer that fails>

## <m-n>: Their questions

# Decision

- <conditions>: next step
- <conditions>: reject
```

## Rules

- Every "what to check" item comes from a real gap, contradiction, or unproven claim in this candidate's data. No generic items.
- Test the gate first and give it the most time. Add a stop point: "Red: ... Stop at minute N".
- Questions ask for one concrete recent example, never opinions or hypotheticals.
- Quote the candidate's own words when you challenge a claim.
- Mark dates or numbers that do not add up (short stints, notice "none" while employed, salary above range).
- Check every fact in the file against the raw data before you save it.
- Do not ask what the screening answers already settle. Salary inside the range and the notice period need no question. Ask only when a value is outside the criteria.
- Open with the first real question, not "any questions for me?". Questions from the candidate go to the end, where the interviewer's explanations also belong.
