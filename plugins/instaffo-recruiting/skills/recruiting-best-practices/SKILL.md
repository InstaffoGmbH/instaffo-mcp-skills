---
name: recruiting-best-practices
description: "How to read a CV and a candidate chat before deciding on a call: career linearity, job hopping, gaps, and why a missing chat reply is not a reason to wait or reject. Auto-loads whenever a recruiting skill judges a candidate, proposes accept, reject or unsure, or decides whether to invite someone."
user-invocable: false
---

# Recruiting best practices

## Reading the CV

Look at the shape of the career before the keywords.

- **Linearity.** A strong CV shows a clear line: stations that build on each other, with growing scope. Role, domain or stack can change, but each move should make sense from the one before.
- **Station length.** Count the months of every station. Two years or more per station is normal. One short station is not a problem. A pattern is: three or more stations under 18 months in a row.
- **Job hopping.** Short stations close together are a red flag. Mark them and ask about them in the call. Do not reject on them alone when the gate looks strong.
- **Gaps.** Count the months since the last station ended. Over 12 months is worth one neutral question in the call ("What did you do since X?"). Never guess the reason and never reject on a gap alone: parental leave, care or illness are common reasons, and treating them as negative is discrimination under the AGG.
- **Overlaps.** Two full-time stations at the same time in different places do not add up. Mark it.
- **Verify before you write it down.** The parsed Instaffo profile is sometimes outdated or parsed wrong. Before a gap, an overlap or a missing skill goes into a note, ask the user to check the CV file or the linked profile, which the MCP does not return.
- **Tailored is not fake.** A profile that mirrors your job ad may be AI-polished for your application. Call it tailored. Call it not credible only when facts contradict each other (dates, places, titles).
- **Titles vs. content.** "Lead" or "Senior" in a title means little. Look at what the description says the person did, and for how long.
- **Hands-on time.** Count only the years in roles where the person did the work the job needs. Management, consulting or teaching years do not count toward hands-on seniority.

Quote the dates you counted. "Short stints" without numbers is not evidence.

## Chat replies

A missing reply in the Instaffo chat is not a negative signal.

- Candidates miss messages: notifications are off, they apply to many jobs at once, they are on holiday, or they do not check the platform every day.
- Many candidates prefer to answer questions in the screening call instead of in writing.
- `seen_by_candidate: false` means the candidate has not even opened the message. That says nothing about their interest.

So:

- **Never propose to wait for a reply before inviting.** If the profile is strong enough for a call, invite now. The call is where open questions get answered.
- **Never reject for no reply.** Judge the profile.
- **If one question really decides the call** (for example a hard requirement the profile does not show), send one short follow-up in the chat. Do not rely on the first message having been seen. Draft it and get approval first, like every message.
- A short or generic reply is weak evidence, not proof. Weigh it against the CV.
- Read every reply before an invite. Flag unusual content (conditions, contradictions with the CV). Grammar, spelling and writing style are not signals, they are a proxy for origin and let the user decide.

## Inviting

- If the candidate asked a question in the chat that nobody answered, answer it in one or two sentences above the invite text. Only use facts the user gave you.
- Never answer for the company with claims the user did not make.
- An invite always comes with a stage move. Propose `send_message` and `move_application_stage(stage: "first_interview")` as one step, so one approval covers both. Never leave an invited candidate in `screening`.

## Proposals

- Base each proposal on the CV, the screening answers and any reply that exists.
- Use `unsure` when the gate cannot be judged from the data. Unsure leads to a call or one follow-up question, not to waiting.
- Name what the call must test, so the interviewer can check it.
