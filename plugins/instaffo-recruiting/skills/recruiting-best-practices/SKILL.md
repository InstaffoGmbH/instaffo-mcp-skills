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
- **Titles vs. content.** "Lead" or "Senior" in a title means little. Look at what the description says the person did, and for how long. The same goes for "Full Stack": check which side the described work is on. Weigh the latest station most, because it shows what the person does today.
- **Self-ratings are not evidence.** Years per skill in the screening answers are typed in by the candidate. A value just above an automatic reject (for example 1 year when 0 rejects) says nothing. Use the CV text that backs the rating.
- **Maximum on every rating is a red flag.** The top value on every skill, or more years for a skill than the CV shows in total, points to someone who clicks through the screening. Mark it, and check the CV and links harder.
- **Tool names show depth.** When a job needs agentic AI work, autocomplete and chat tools alone (code completion, a chat assistant, "prompt engineering", boilerplate) are basic use, not proof. Look for agents that run tasks, rule files for the agent, parallel work, and review of what the agent produced.
- **Courses are not practice.** A career break filled with courses or certificates shows interest, not hands-on skill. Count hands-on time only. Other profiles (for example a linked professional network) can show breaks that the Instaffo profile hides; ask the user to check.
- **Freelance stations.** Whether long freelance-only work fits depends on the job. Some roles need team experience, some do not. Follow the criteria file. If it says nothing, ask the user once and add the answer to the file.
- **Hands-on time.** Count only the years in roles where the person did the work the job needs. Management, consulting or teaching years do not count toward hands-on seniority.

Quote the dates you counted. "Short stints" without numbers is not evidence.

## Links and side projects

The profile can link to GitHub, a portfolio or other work samples. For technical roles these are often the strongest evidence in the whole application.

- **Always check the links.** Open each link if your tools allow it. Look for recent activity and for own projects that solve a real problem for real users.
- **Ask the user to look too.** List every link in your proposal and ask the user to check it, also when you could open it yourself. Some pages need a login or do not load for agents.
- **Strong work can outweigh a thin CV.** Recent, product-like side projects are a reason to accept a candidate whose CV alone looks weak. Say so in the reason.
- **No link is not a minus.** Many good candidates have no public work. Do not penalize it.

## Location

- **Check the free text.** The profile city and the about-me or CV text can disagree. If the job has a location or work-permit rule and the texts disagree, flag it as a question for the call. Do not guess which one is right.
- **Judge the work, not the place.** Where earlier employers were, or whether this is the first job in a country, is not a criterion. It points to origin, which the AGG protects.

## Chat replies

A missing reply in the Instaffo chat, including to the job greeting, is not a negative signal.

- Candidates miss messages: notifications are off, they apply to many jobs at once, they are on holiday, or they do not check the platform every day.
- Many candidates prefer to answer questions in the screening call instead of in writing.
- `seen_by_candidate: false` means the candidate has not even opened the message. That says nothing about their interest.

So:

- **Never propose to wait for a reply before inviting.** If the profile is strong enough for a call, invite now. The call is where open questions get answered.
- **Never reject for no reply.** Judge the profile.
- **If one question really decides the call** (for example a hard requirement the profile does not show), send one short follow-up in the chat. Do not rely on the first message having been seen. Draft it and get approval first, like every message.
- A short or generic reply is weak evidence, not proof. Weigh it against the CV.
- **Replies written by an AI tool.** Signs: dashes between clauses (—), "not just X, but Y", "the bigger shift is", even tone with no detail. A copied AI answer is low effort, and you cannot tell if it is true. Judge the content: a generic AI reply counts as no evidence, a specific one still counts. Never reject on style alone, because many people use AI to write in a second language.
- **Agent rule files written by the agent.** If a candidate shares a repo, look at who edits `AGENTS.md`, `CLAUDE.md` or similar. History lines in the rules ("the earlier permission is revoked") and edits only inside feature commits suggest the agent maintains its own rules. Ask who owns the file.
- Read every reply before an invite. Flag unusual content (conditions, contradictions with the CV). Grammar and spelling are not signals, they are a proxy for origin. Signs of an AI-written reply are covered below.

## Inviting

- If the candidate asked a question in the chat that nobody answered, do not answer it. Send the invite without an answer and tell the user which question is open, so they can reply themselves (see `instaffo-mcp-basics`, Messages).
- Never answer for the company with claims the user did not make.
- An invite always comes with a stage move. Propose `send_message` and `move_application_stage(stage: "first_interview")` as one step, so one approval covers both. Never leave an invited candidate in `screening`.

## Proposals

- Base each proposal on the CV, the screening answers and any reply that exists.
- Use `unsure` when the gate cannot be judged from the data. Unsure leads to a call or one follow-up question, not to waiting.
- Name what the call must test, so the interviewer can check it.
