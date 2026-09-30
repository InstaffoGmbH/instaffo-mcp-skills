---
name: write-note
description: "Drafts an internal Instaffo team note with a verdict for one application from the call notes, and posts it after approval. Use when the user says 'write the note', 'post it to Instaffo', 'add a note for X', or after /analyze-interview."
user-invocable: true
---

# Write note

## Steps

1. Read the call notes in `recruiting/<job-slug>/<date> <Name>.md`. With no call notes, ask what the note should say.
2. `list_notes` on the application. Match the style of earlier notes by the same user.
3. Draft in this structure and show it with the planned `reaction` and `reaction_reasons`:

```
Screening call <DD.MM> (<interviewer>, <N> min)

Background
- <2-3 facts>

<Gate topic>
- <evidence, with quotes>

Mindset / other criteria: <one line each>
Not covered: <items for the next round>
Situation: <salary, notice, location, languages>

Decision: <verdict>. <one-line reason>
```

4. Post with `create_note` only after the user approves. Convert to HTML (`<p>`, `<strong>`, `<ul><li>`). Leave `notify_responsibles` off unless asked.
5. Report the result. Do not reject or move the candidate as part of this skill.

## Rules

- Colleagues read the note without context. No internal abbreviations, no interviewer feedback.
- Facts only from the transcript, profile, or chat.
