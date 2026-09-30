---
name: analyze-interview
description: "Analyzes an interview transcript against the prep file and job criteria: call notes, a recommendation, and feedback on the interviewer (talk share, leading questions, missed follow-ups). Use when the user shares a transcript, says 'transcript is ready', 'analyze the call', or 'how did the interview go'."
user-invocable: true
---

# Analyze interview

## Input

A transcript as pasted text or a file path. Any tool works (Gemini, Teams, Zoom, tl;dv, Otter). If a Google Drive or meeting tool is available, you may fetch it there.

Auto-generated summaries skip details and invent agreement. Read the transcript itself, all of it.

## Steps

1. Load the prep file `recruiting/<job-slug>/<date> <Name>.md` and `criteria.md`.
2. Read the full transcript. An empty or very short transcript means the call failed. Say so and stop.
3. Count words per speaker for the talk share. Target for the interviewer: 20-30%.
4. Append to the prep file:

```markdown
# Call notes (<HH:MM>, <N> min)

- <finding per "what to check" item, with the candidate's words>
- Not asked: <prep items the call skipped>
- **Recommendation: <next step | reject | unsure>.** <reason tied to the gate and must-haves>

# Interview feedback

- <talk share>% talk share. Target 20-30%
- <leading questions: quote the question and the "yes, exactly" answer>
- <weak answers without a follow-up, and the follow-up that was missing>
- <where the interviewer explained their own view before hearing the candidate's>
- Good: <questions that exposed real signal>
```

5. Show the recommendation in 3-5 lines. Offer `/write-note` to post it to Instaffo.
6. If the same interviewer pattern shows up in 3 or more calls, add it to `recruiting/interviewer-feedback.md`.

## Rules

- Separate what the candidate said from what the interviewer suggested. A "yes" to a leading question is not evidence.
- "We" answers do not prove personal work. Mark them.
- Quote, do not paraphrase, for anything that drives the verdict.
