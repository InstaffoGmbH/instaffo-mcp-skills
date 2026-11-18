---
name: prep-interview
description: "Prepares a candidate-specific interview guide from the Instaffo profile, chat, and job criteria: red/yellow/plus flags, questions by priority, decision rules, and a short CV. Use when the user says 'prepare my interview', 'prep the call with X', or 'interview notes for today's candidates'."
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

Call <day HH:MM-HH:MM>. <call language>. <salary>, <location>, notice <notice>. [LinkedIn](<url>), [GitHub](<url>)

# Flags

**Red**

- **<claim that can fail the gate>.** <evidence: short quote or dates>

**Yellow**

- **<gap, short stints, never senior, empty GitHub, ...>.** <evidence>

**Plus**

- **<strength>.** <evidence>

# Questions

1. **<gate>**: "<question asking for one real, recent example>" Then: "<follow-up>" **Red**: <answer that fails>
2. ...
N-1. Only if time: "<lower-signal question>"
N. Their questions. Next steps

# Decision

- **<next step>**: <conditions>
- **Reject**: <conditions>
- <which yellows are minuses only>

# CV

- **<Company>** <from>-<to> (<duration>), <title>. <one-line note>
- <education>, <old gaps>

# Call notes

# Interview feedback
```

## Rules

- Every flag comes from a real gap, contradiction, or unproven claim in this candidate's data. No generic items.
- Flags come first, sorted into Red, Yellow and Plus. Red is only what can fail the gate. No notice period (can start now) is a plus, never a flag.
- Questions are numbered by priority, gate first. Every question that can fail gets a **Red** line. No intro or framing question, no stop points, no minute plan. Lower-signal questions are marked "Only if time".
- No tables. The CV goes last, one bullet per station.
- Questions ask for one concrete recent example, never opinions or hypotheticals.
- Quote the candidate's own words when you challenge a claim.
- Mark dates or numbers that do not add up (short stints, salary above range).
- Check every fact in the file against the raw data before you save it.
- Do not ask what the screening answers already settle. Salary inside the range and the notice period need no question. Ask only when a value is outside the criteria.
- Open with the first real question, not "any questions for me?". Questions from the candidate go to the end, where the interviewer's explanations also belong.
