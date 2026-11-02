---
name: instaffo-mcp-basics
description: "Rules and traps for the Instaffo Recruiter MCP tools (list_jobs, list_applications, get_application, get_screening, list_messages, notes, stage moves, rejections, feedback requests, recommendations). Auto-loads before any call to an Instaffo MCP tool, and whenever a recruiting skill reads or writes Instaffo data."
user-invocable: false
---

# Instaffo MCP basics

## Write safety (strict)

These tools change what candidates or colleagues see. Draft first, show the draft, and call the tool only after the user says yes to that exact draft:

- `send_message`: the candidate is notified at once
- `screen_application`: `accept` posts the job greeting in the chat (see Greeting), `reject` concludes the application and notifies the candidate at once
- `move_application_stage`
- `reject_application`: rejects after triage. By default the candidate sees the rejection after 3 business days, and the user can still take it back in Instaffo until then. Set `delayed: false` only when the user asks for an immediate rejection
- `create_note`, `update_note`, `delete_note` (delete cannot be undone)
- `request_feedback`, and `create_note` with `reviewer_ids`: every person asked gets an email and can then see the candidate's data
- `invite_recommendation`: the talent gets the invite by email and in the app
- `reject_recommendation`: the talent is not notified, but the recommendation is gone for the whole team

Approval covers one action. "Post the note" does not approve a rejection. The one exception: approving an invite to a call also approves moving the candidate to `first_interview`. Set `notify_responsibles` only when the user asks for it.

## Messages

- **Never answer a candidate's question on your own.** When a candidate asks something in the chat, leave the answer out of your draft and tell the user which question is open. Answer only when the user gives you the answer, or when it is plainly in the user's own earlier messages to that candidate. An answer speaks for the company, so it always needs the user's words.
- **Use the user's current template.** When the user says "the usual message", read their most recent message of that kind in another chat with `list_messages` and copy it. Templates change over time, so do not copy from older chats or write your own version. If tool output is shortened or unreadable, ask the user for the text instead of guessing.
- **"The usual message" is not approval of your text.** Show the exact text before the first send in a session, unless the user gave you the full text.

## Reading data

- Chain IDs: `list_jobs` → job `uuid` → `list_applications(job_id)` → application `uuid` → everything else.
- Filter `list_applications` by `stage` on older jobs, or you page through hundreds of rejected rows. `meta.total` tells you if the list is partial.
- `list_messages` returns `invalid_stage` for untriaged applications. Accept them with `screen_application` first, which only the user may approve.
- `candidate.email` and `phone` are null until the recruiter unlocks contact details in the panel.
- `data_archived: true` means the profile was purged. Say so, do not guess.
- `talent_feed: true` means the recruiter sourced the candidate. The candidate did not apply, so expect less context in the chat.

## AI screening

`get_screening` returns the AI screening in one of two forms. Read the one that is present:

- `screening_fit_analysis`: one result per job requirement (`match`, `partial`, `no_match`, with reason and evidence) and an overall `fit_tier` (`good`, `partial`, `weak`). When it is present, ignore `fit_analysis`.
- `fit_analysis`: a single score from 0 to 100.

Null results or a null `fit_tier` mean "not screened yet", never a score of 0. `list_applications` also returns `fit_tier`, so you can rank a job's applications without calling `get_screening` for each one. `hard_facts` (location, language, salary) is a separate check that does not use AI.

The AI screening is a second opinion. It never replaces the user's judgment against the criteria.

## CV

- `candidate.has_cv_document` tells you whether the candidate uploaded a CV. `applied_with_cv` only says whether they attached it to this application, so `false` does not mean "no CV".
- The parsed CV is in `get_application`. The CV file itself is a download link in the CV answer of `get_screening`. The link expires after one hour; call `get_screening` again for a fresh one.
- The CV file and linked profiles can be newer than the parsed profile. Check them before you write down a gap or a missing skill.

## Greeting

Each job has a greeting. Accepting with `screen_application` posts it as the first chat message. In `list_messages` it is the first message, with `uuid: null`.

- Do not draft or send your own first message on accept. Use the `message` parameter only for something the greeting does not cover.
- A good greeting asks only what the screening questions do not cover. Example: how the candidate's way of working with AI tools changed, or one concrete example from their work.
- Check the greeting every time you see it. If it asks for salary expectation, CV, start date, notice period, location or similar hard facts, tell the user at once. These belong in the job's screening questions, where Instaffo collects them in a structured way (`get_screening` shows them). Suggest moving them there.
- No reply to the greeting is not a red flag. See `recruiting-best-practices`.

## Notes

- Write notes as plain text. A blank line starts a new paragraph. No Markdown and no HTML formatting.
- Record the verdict in `reaction` (`yes`, `not_sure`, `no`) with `reaction_reasons`, not only in the text. Reasons apply to `no` and `not_sure` only.
- You can edit or delete only the user's own notes.

## Feedback from colleagues

- `list_reviewers` shows who can be asked about an application: colleagues with an Instaffo account (`type: staff`) and external reviewers the company invited before (`type: external`). It also shows whether each one was already asked and has answered.
- Two ways to ask: mention colleagues in a note with `create_note(reviewer_ids)` (staff only), or send a request with `request_feedback`, which also works for external email addresses.
- A colleague who is asked joins the job's hiring team. Say so in the draft, so the user knows who gets access.
- Answers arrive as notes. Read them with `list_notes`.

## Recommendations

Instaffo's matching agent suggests talents for a job. They did not apply.

- `list_recommendations(job_id)` lists the open ones, best first, with the agent's reasoning and the AI screening. `get_recommendation` shows the full profile.
- Profiles are anonymous: no name, contact data, CV file or photo. Do not try to identify the person.
- `invite_recommendation` sends an invite with a message. The talent has 7 days to answer. Links, email addresses and phone numbers in the message are refused. A job can send only a limited number of invites per day.
- When the talent accepts, the recommendation becomes an application: `recommendation_status` turns `applied`, and `application_id` works with all application tools.
- `reject_recommendation` removes it. Pass the user's reason as `feedback`; it helps Instaffo improve future recommendations.
- Only `open` recommendations can be invited or rejected. An inactive job has none.

## What the MCP cannot do

- No job description. Job criteria come from the user (see `/define-criteria`).
- No hire. Give the user the application `url` for the panel.
- No withdrawing an invite. The user does that in the panel.
- No attachments. `documents` lists file names only.
- No product docs. For how a feature or setting works, use `help-center`.

## Language levels

`languages[].rating` values (`A2`, `B2`, `C1`, `C2`) are buckets, not exact CEFR levels. `C2` also covers native speakers, `A2` also covers A1. Use the company panel labels in notes: `A2` basic, `B2` conversational, `C1` fluent, `C2` business fluent. Never write a code as if it were a test result.

Judge the level the job needs, never whether someone is a native speaker. Requiring or preferring native speakers is discrimination by origin under the AGG.

## Personal data

Candidate data is personal data under GDPR. Keep local files inside the user's working folder. Do not paste profiles into other services.

- **Humans decide.** Every accept, reject and verdict is the user's decision. Your proposal is input, never an automated decision (GDPR Art. 22).
- **Retention.** Files in `recruiting/` are only needed while the process runs. Remind the user to delete a candidate's files once the process is closed and the company's retention period has passed.
